package ID_MEM

import chisel3._
import chisel3.util._


class ID_MEM extends Module{
val io = IO(new Bundle {
	val reset = Input(Bool())
	val out = Output(UInt(32.W))
})
	
	val InstDeco = Module(new InstDeco)
	val ALU = Module(new ALU)
	val opcode = RegInit(0.U(7.W))
	val RegOfVec = RegInit(VecInit(Seq.fill(32)(0.U(32.W))))
	val instruc = RegInit(0.U(32.W))
	val wen = RegInit(0.U(1.W))
	val addrI = RegInit(0.U(5.W))
	val pc = RegInit(0.U(32.W))
	
	
	when((io.reset.asBool =/= 1.U) && (pc =/= 3.U))
	{
		pc := pc + 1.U
		
	}
	.otherwise
	{
		addrI := addrI + 1.U
		pc := 0.U
		
		
	}
	
	when (pc===3.U){ wen:=1.U		} .otherwise {wen:=0.U}
	
	/*
	Programa :
	
	0. x2 <- 1 
	1. x3 <- 3 
	2. x4 <- 0
	3. add x4, x2,x3 sumamos 	=4
	4. add x3, x4,x2  x4<x2     =5
	5. add x2, x3,x4             =9

	*/
	
	
  when (addrI === 1.U){
	instruc := "b000000000001_00000_000_00010_0010011".U
	}
	.elsewhen (addrI === 2.U) {
	instruc :="b000000000011_00000_000_00011_0010011".U
	}
	.elsewhen (addrI === 3.U) {
	instruc :="b000000000000_00000_000_00100_0010011".U
	}
	.elsewhen (addrI === 4.U) {
	instruc :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (addrI === 5.U) {
	instruc :="b0000000_00010_00100_000_00011_0110011".U
	}
	.elsewhen (addrI === 6.U) {
	instruc :="b0000000_00100_00011_000_00010_0110011".U
	}
	

	
	
	InstDeco.io.instruc := instruc  //decodificacion
		opcode := instruc(6,0)
	
	ALU.io.instruc:= instruc
	ALU.io.in1 := RegOfVec(InstDeco.io.rs1)
	ALU.io.in2 := Mux(opcode(5)===1.U, RegOfVec(InstDeco.io.rs2), InstDeco.io.imm.asUInt) 
	
	io.out := ALU.io.out
	
	when (wen===1.U){
												
												RegOfVec(InstDeco.io.rd):=ALU.io.out
										
										}
	/*
	when (io.ren===1.U){
												//ALU
												ALU_out := ALU_in1 + ALU_in2
										
										}
	*/
	



}

object ID_MEMMain extends App
{
	chisel3.Driver.execute(args, () => new ID_MEM)
}






















