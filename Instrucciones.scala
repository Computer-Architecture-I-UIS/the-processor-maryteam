package PProcesador
import chisel3._
import chisel3.util._


class Instrucciones extends Module
{
	val io = IO(new Bundle {
		val addr_IF = Input(UInt(5.W))
		val instrucc = Output(UInt(32.W))
	})
	
	val IF_salida = RegInit(0.U(32.W))
	
	/*
	Programa :
	
	0. x2 <- 1 
	1. x3 <- 3 
	2. x4 <- 0
	
	3. add x4, x2,x3 sumamos 	=4
	4. slt x3, x4,x2  x4<x2     =0
	5. add x2, x3,x4             =9

	*/
	
	
  when (io.addr_IF === 0.U){
	IF_salida := "b000000000001_00000_000_00010_0010011".U
	}
	.elsewhen (io.addr_IF === 1.U) {
	IF_salida :="b000000000011_00000_000_00011_0010011".U
	}
	.elsewhen (io.addr_IF === 2.U) {
	IF_salida :="b000000000000_00000_000_00100_0010011".U
	}
	.elsewhen (io.addr_IF === 3.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 4.U) {
	IF_salida :="b0000000_00010_00100_010_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 5.U) {
	IF_salida :="b0000000_00100_00011_000_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 6.U) {
	IF_salida :="b0000000_00011_00010_001_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 7.U) {
	IF_salida :="b0000000_00100_00011_111_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 8.U) {
	IF_salida :="b0000000_00100_00011_100_00101_0110011".U
	}
	.elsewhen (io.addr_IF === 9.U) {
	IF_salida :="b0000000_00100_00011_000_00010_0110011".U
	}
	
	io.instrucc := IF_salida
	

	
	
}

