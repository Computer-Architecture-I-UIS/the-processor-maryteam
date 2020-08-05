package PProcesador

import chisel3._
import chisel3.util._

class decode_Bundle extends Bundle {	

	val EX_mux3 = UInt(1.W)
	val EX_ALU  = UInt(5.W)

}



class controldeco extends Module
{
	val io = IO(new Bundle {

		val cmd = Input(UInt(6.W))
		val out	= Output(new decode_Bundle)
		//val EX_MUL = UInt(3.W)
		//val EX_MUL_en = UInt(1.W)
		
	})
	
	val Inst 		= Instructions
	val alu 		= ALU_Codes
	
	val control = Wire(new decode_Bundle)
	
	control.EX_mux3 := 0.U			//ALUSrc = reg2
	control.EX_ALU  := alu.nop2
	
	io.out:=control
	
	switch(io.cmd)
	{
		  
	////////////////////  SHIFT  ////////////////////
		  
		  is(Inst.sll){         
				control.EX_mux3 := 1.U			//ALUSrc = reg2
				control.EX_ALU  := alu.sll
		  }

		  is(Inst.slli){         		
				control.EX_mux3 := 0.U			//ALUSrc = imm
				control.EX_ALU  := alu.sll
		  }
		  
		  is(Inst.srl){         		
				control.EX_mux3 := 1.U			//ALUSrc = reg2
				control.EX_ALU  := alu.srl
		  }

		  is(Inst.srli){         	
				control.EX_mux3 := 0.U			//ALUSrc = imm
				control.EX_ALU  := alu.srl
		  }
		 
		  is(Inst.sra){         
				control.EX_mux3 := 1.U			//ALUSrc
				control.EX_ALU  := alu.sra
		  }

		  is(Inst.srai){         
				control.EX_mux3 := 0.U			//ALUSrc
				control.EX_ALU  := alu.sra
		  }

	//////////////////  ARITHMETIC  //////////////////
		  
		  is(Inst.add){         		
				control.EX_mux3 := 1.U			//ALUSrc
				control.EX_ALU  := alu.add
		  }

		  is(Inst.addi){         	
				control.EX_mux3 := 0.U			//ALUSrc
				control.EX_ALU  := alu.add
		  }

		  is(Inst.sub){         
				control.EX_mux3 := 1.U			// ALUSrc (reg2 vs imm)
				control.EX_ALU  := alu.sub
		  }

		  is(Inst.lui){         		
				control.EX_mux3 := 0.U			// ALUSrc (reg2 vs imm)
				control.EX_ALU  := alu.nop2
		  }

	////////////////////  LOGICAL  ////////////////////

		  is(Inst.xor){         
				control.EX_mux3 := 1.U			//ALUSrc
				control.EX_ALU  := alu.xor
		  }

		  is(Inst.xori){         			
				control.EX_mux3 := 0.U			//ALUSrc
				control.EX_ALU  := alu.xor
		  }

		  is(Inst.or){         	
				control.EX_mux3 := 1.U			//ALUSrc
				control.EX_ALU  := alu.or
		  }

		  is(Inst.ori){         			
				control.EX_mux3 := 0.U			//ALUSrc
				control.EX_ALU  := alu.or
		  }

		  is(Inst.and){         
				control.EX_mux3 := 1.U			//ALUSrc
				control.EX_ALU  := alu.and
		  }

		  is(Inst.andi){         
				control.EX_mux3 := 0.U			//ALUSrc
				control.EX_ALU  := alu.and
		  }

	//////////////////  COMPARE  //////////////////

		  is(Inst.slt){         	
				control.EX_mux3 := 1.U			// reg2 vs imm
				control.EX_ALU  := alu.slt
		  }

		  is(Inst.slti){         			
				control.EX_mux3 := 0.U			// reg2 vs imm
				control.EX_ALU  := alu.slt
		  }

		  is(Inst.sltu){         			
				control.EX_mux3 := 1.U			// reg2 vs imm
				control.EX_ALU  := alu.sltu
		  }

		  is(Inst.sltiu){         		
				control.EX_mux3 := 0.U			// reg2 vs imm
				control.EX_ALU  := alu.sltu
		  }
	}
	
	
}
