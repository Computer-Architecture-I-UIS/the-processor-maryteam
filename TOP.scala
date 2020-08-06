package TOP

import chisel3._
import chisel3.util._


class TOP extends Module{
	val io = IO(new Bundle {
		val reset = Input(Bool())
		val out = Output(UInt(32.W))
})

	//Inicialización de otros módulos
	val InstDeco = Module(new InstDeco)
	val ALU = Module(new ALU)
	
	//Creación otros elementos
	val opcode = RegInit(0.U(7.W))
	val RegOfVec = RegInit(VecInit(Seq.fill(32)(0.U(32.W)))) //banco de registros inicializado en 0
	val instruc = RegInit(0.U(32.W))
	val addrI = RegInit(0.U(5.W))  //turno de instrucción
	val pc = RegInit(0.U(32.W))
	val reg_out = RegInit(0.U(32.W))
	
	//Decodificación
	InstDeco.io.instruc := instruc  
	opcode := instruc(6,0) //cuando opcode(5) = 1, se toma ingresa rs2 al ALU
	
	//Operación del ALU
	ALU.io.instruc:= instruc
	ALU.io.in1 := RegOfVec(InstDeco.io.rs1) 
	ALU.io.in2 := Mux(opcode(5)===1.U, RegOfVec(InstDeco.io.rs2), InstDeco.io.imm.asUInt) //multiplexor del ALU
	reg_out := ALU.io.out
	io.out := reg_out
	
	//Contador para la instrucción
	when((io.reset.asBool =/= 1.U) && (pc =/= 3.U)){
	
		pc := pc + 1.U
		
	}	.otherwise{
	
		addrI := addrI + 1.U
		pc := 0.U
		
	}
	
	//condición para guardar en memoria
	when (pc===3.U){ 
		
		RegOfVec(InstDeco.io.rd) := reg_out
		
	} 
	
	
	/*
	Programa :
	
	1. x2 <- 1 
	2. x3 <- 3 
	3. x4 <- 0
	4. add x4, x2,x3 sumamos 	=4
	5. add x3, x4,x2  x4<x2     =5
	6. add x2, x3,x4             =9
	
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

}

object TOPMain extends App
{
	chisel3.Driver.execute(args, () => new TOP)
}






















