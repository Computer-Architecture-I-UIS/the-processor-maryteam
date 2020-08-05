package mainProcesador

import chisel3._
import chisel3.util._

class decode_Bundle extends Bundle {	

	val EX_mux3 = UInt(1.W)
	val EX_ALU  = UInt(5.W)

}



class controlData extends Module
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
				
				//control.MEM_DM_write:= 0.U	//MemWrite
				//control.MEM_DM_read := 0.U
				
				//control.WB_mux1 := 0.U  	
				//control.WB_reg_write:= 1.U
		  }

		  is(Inst.slli){         		
				control.EX_mux3 := 0.U			//ALUSrc = imm
				control.EX_ALU  := alu.sll
				
				/*control.MEM_DM_write:= 0.U	//MemWrite
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }
		  
		  is(Inst.srl){         		
				control.EX_mux3 := 1.U			//ALUSrc = reg2
				control.EX_ALU  := alu.srl
				
				/*control.MEM_DM_write:= 0.U	//MemWrite
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.srli){         	
				control.EX_mux3 := 0.U			//ALUSrc = imm
				control.EX_ALU  := alu.srl
				
				/*control.MEM_DM_write:= 0.U	//MemWrite
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }
		 
		  is(Inst.sra){         
				control.EX_mux3 := 1.U			//ALUSrc
				control.EX_ALU  := alu.sra
				
				/*control.MEM_DM_write:= 0.U	//MemWrite
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.srai){         
				control.EX_mux3 := 0.U			//ALUSrc
				control.EX_ALU  := alu.sra
				
				/*control.MEM_DM_write:= 0.U	//MemWrite
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

	//////////////////  ARITHMETIC  //////////////////
		  
		  is(Inst.add){         		
				control.EX_mux3 := 1.U			//ALUSrc
				control.EX_ALU  := alu.add
				
				/*control.MEM_DM_write:= 0.U
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.addi){         	
				control.EX_mux3 := 0.U			//ALUSrc
				control.EX_ALU  := alu.add
				
				/*control.MEM_DM_write:= 0.U
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.sub){         
				control.EX_mux3 := 1.U			// ALUSrc (reg2 vs imm)
				control.EX_ALU  := alu.sub
				
				/*control.MEM_DM_write:= 0.U	
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U 			// MemOut vs ALUOut	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.lui){         		
				control.EX_mux3 := 0.U			// ALUSrc (reg2 vs imm)
				control.EX_ALU  := alu.nop2
				
				/*control.MEM_DM_write:= 0.U	
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  		// MemOut vs ALUOut	
				control.WB_reg_write:= 1.U*/
		  }

		  /*is(Inst.auipc){         
				control.ID_mux1 := 0.U	//=====
				control.ID_mux2 := 0.U 	// PC + imm -> ALU 
				control.ID_mux4 := 0.U 	//=====
				
				control.EX_mux3 := 0.U	
				control.EX_ALU  := alu.nop1
				
				control.MEM_DM_write:= 0.U	
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U	
				control.WB_reg_write:= 1.U
		  }*/

	////////////////////  LOGICAL  ////////////////////

		  is(Inst.xor){         
				control.EX_mux3 := 1.U			//ALUSrc
				control.EX_ALU  := alu.xor
				
				/*control.MEM_DM_write:= 0.U	//MemWrite
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.xori){         			
				control.EX_mux3 := 0.U			//ALUSrc
				control.EX_ALU  := alu.xor
				
				/*control.MEM_DM_write:= 0.U	//MemWrite
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.or){         	
				control.EX_mux3 := 1.U			//ALUSrc
				control.EX_ALU  := alu.or
				
				/*control.MEM_DM_write:= 0.U	//MemWrite
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.ori){         			
				control.EX_mux3 := 0.U			//ALUSrc
				control.EX_ALU  := alu.or
				
				/*control.MEM_DM_write:= 0.U	//MemWrite
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.and){         
				control.EX_mux3 := 1.U			//ALUSrc
				control.EX_ALU  := alu.and
				
				/*control.MEM_DM_write:= 0.U	//MemWrite
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.andi){         
				control.EX_mux3 := 0.U			//ALUSrc
				control.EX_ALU  := alu.and
				
				/*control.MEM_DM_write:= 0.U	//MemWrite
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

	//////////////////  COMPARE  //////////////////

		  is(Inst.slt){         	
				control.EX_mux3 := 1.U			// reg2 vs imm
				control.EX_ALU  := alu.slt
				
				/*control.MEM_DM_write:= 0.U	
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.slti){         			
				control.EX_mux3 := 0.U			// reg2 vs imm
				control.EX_ALU  := alu.slt
				
				/*control.MEM_DM_write:= 0.U	
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.sltu){         			
				control.EX_mux3 := 1.U			// reg2 vs imm
				control.EX_ALU  := alu.sltu
				
				/*control.MEM_DM_write:= 0.U	
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }

		  is(Inst.sltiu){         		
				control.EX_mux3 := 0.U			// reg2 vs imm
				control.EX_ALU  := alu.sltu
				
				/*control.MEM_DM_write:= 0.U	
				control.MEM_DM_read := 0.U
				
				control.WB_mux1 := 0.U  	
				control.WB_reg_write:= 1.U*/
		  }
	}
	
	
}