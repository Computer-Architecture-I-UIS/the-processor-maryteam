package PProcesador

import chisel3._
import chisel3.util._



class ID_control(val nbits: Int)  extends Bundle {


	val cmd=Output(UInt(6.W)) //could be parametrized?

}



class ID_bundle(val nbits: Int) extends Bundle {
	//registers IO

	val rs1 = Output(UInt(nbits.W))
	val rs2 = Output(UInt(nbits.W))

	val ctrl= new ID_control(nbits)

	//Deco IO
	val instruction=Input(UInt(nbits.W))
	val imm=Output(SInt(nbits.W))

	
	//Write Reg
	val wen				=	Input(Bool())
	val rd				=	Input(UInt(nbits.W))
	val out_rd	=	Output(UInt(nbits.W))

	

}

class ID (val nbits: Int) extends Module{
	
	val io = IO(new ID_bundle(nbits))
 	
	val addr_rs1 = Wire(UInt(log2Ceil(nbits).W))
	val addr_rs2 = Wire(UInt(log2Ceil(nbits).W))
	val addr_rd  = Wire(UInt(log2Ceil(nbits).W))
	val rs1_r=Wire(UInt(nbits.W))
	val rs2_r=Wire(UInt(nbits.W))

	//Instruction decoder
	val deco=Module(new InstDeco)
	
	//write
	//registers file logic

	val regs = Mem(31,UInt(32.W))	
	
	when(io.wen & addr_rd=/=0.U)
	{
		
		regs.write(addr_rd-1.U,io.rd)
		
	}
		
	//reading logic and bypass multiplexers
	val regs_out = Wire(Vec(32 , UInt(nbits.W))) 
		
	regs_out(0):=0.U  //
	for(j <- 1 until 32){		regs_out(j) := regs.read( (j-1).U ) 	}
		
	rs1_r:=Mux( addr_rs1=/=0.U , Mux(addr_rs1===addr_rd & io.wen , io.rd , regs_out(addr_rs1)) , 0.U)
	rs2_r:=Mux( addr_rs2=/=0.U , Mux(addr_rs2===addr_rd & io.wen , io.rd , regs_out(addr_rs2)) , 0.U)
	
	io.out_rd := regs_out(addr_rd)
		
	
	
	deco.io.instruc:=io.instruction
	
	//ID to EX
	io.rs2 := rs2_r
	io.rs1 := rs1_r
	io.imm:=deco.io.imm
	
	//ID to CONTROL
	io.ctrl.cmd:=deco.io.state
	
  
	addr_rs1:=	deco.io.rs1
	addr_rs2:=	deco.io.rs2
	addr_rd	:=	deco.io.rd
	

		
}
