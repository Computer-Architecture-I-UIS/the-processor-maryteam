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
	IF_salida :="b0000000_00010_00100_010_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 5.U) {
	IF_salida :="b0000000_00100_00011_000_00010_0110011".U
	}
	
	io.instrucc := IF_salida
	

	
	
}

/*

  when (io.addr_IF === 0.U){
	IF_salida := "b000000000001_00000_000_00010_0010011".U
	}
	.elsewhen (io.addr_IF === 1.U) {
	IF_salida :="b000000000000_00000_000_00011_0010011".U
	}
	.elsewhen (io.addr_IF === 2.U) {
	IF_salida :="b000000000000_00000_000_00100_0010011".U
	}
	.elsewhen (io.addr_IF === 3.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 4.U) {
	IF_salida :="b0000000_00000_00010_000_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 5.U) {
	IF_salida :="b0000000_00000_00100_000_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 6.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 7.U) {
	IF_salida :="b0000000_00000_00010_000_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 8.U) {
	IF_salida :="b0000000_00000_00100_000_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 9.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 10.U) {
	IF_salida :="b0000000_00000_00010_000_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 11.U) {
	IF_salida :="b0000000_00000_00100_000_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 12.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 13.U) {
	IF_salida :="b0000000_00000_00010_000_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 14.U) {
	IF_salida :="b0000000_00000_00100_000_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 15.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 16.U) {
	IF_salida :="b0000000_00000_00010_000_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 17.U) {
	IF_salida :="b0000000_00000_00100_000_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 18.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 10.U) {
	IF_salida :="b0000000_00000_00010_000_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 11.U) {
	IF_salida :="b0000000_00000_00100_000_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 12.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 13.U) {
	IF_salida :="b0000000_00000_00010_000_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 14.U) {
	IF_salida :="b0000000_00000_00100_000_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 15.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 16.U) {
	IF_salida :="b0000000_00000_00010_000_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 17.U) {
	IF_salida :="b0000000_00000_00100_000_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 18.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 19.U) {
	IF_salida :="b0000000_00000_00010_000_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 20.U) {
	IF_salida :="b0000000_00000_00100_000_00010_0110011".U
	}
	.elsewhen (io.addr_IF === 21.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 22.U) {
	IF_salida :="b0000000_00000_00010_000_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 23.U) {
	IF_salida :="b0000000_00000_00100_000_00010_0110011".U
	}
  .elsewhen (io.addr_IF === 24.U) {
	IF_salida :="b0000000_00011_00010_000_00100_0110011".U
	}
	.elsewhen (io.addr_IF === 25.U) {
	IF_salida :="b0000000_00000_00010_000_00011_0110011".U
	}
	.elsewhen (io.addr_IF === 26.U) {
	IF_salida :="b0000000_00000_00100_000_00010_0110011".U
	}

IF_salida := MuxLookup(io.addr_IF, 0.U,
          Array(0.U -> "b000000000001_00000_000_00010_0010011".U, 
				1.U -> "b000000000000_00000_000_00011_0010011".U,
				2.U -> "b000000000000_00000_000_00100_0010011".U,
				
			    3.U -> "b0000000_00011_00010_000_00100_0110011".U,
			    4.U -> "b0000000_00000_00010_000_00011_0110011".U,
			    5.U -> "b0000000_00000_00100_000_00010_0110011".U,
				
			    6.U -> "b0000000_00011_00010_000_00100_0110011".U,
			    7.U -> "b0000000_00000_00010_000_00011_0110011".U,
			    8.U -> "b0000000_00000_00100_000_00010_0110011".U,
				
			    9.U -> "b0000000_00011_00010_000_00100_0110011".U,
			   10.U -> "b0000000_00000_00010_000_00011_0110011".U,
			   11.U -> "b0000000_00000_00100_000_00010_0110011".U,
			   
			   12.U -> "b0000000_00011_00010_000_00100_0110011".U,
			   13.U -> "b0000000_00000_00010_000_00011_0110011".U,
			   14.U -> "b0000000_00000_00100_000_00010_0110011".U,
			   
			   15.U -> "b0000000_00011_00010_000_00100_0110011".U,
			   16.U -> "b0000000_00000_00010_000_00011_0110011".U,
			   17.U -> "b0000000_00000_00100_000_00010_0110011".U,
			   
			   18.U -> "b0000000_00011_00010_000_00100_0110011".U,
			   19.U -> "b0000000_00000_00010_000_00011_0110011".U,
			   20.U -> "b0000000_00000_00100_000_00010_0110011".U,
			   
			   21.U -> "b0000000_00011_00010_000_00100_0110011".U,
			   22.U -> "b0000000_00000_00010_000_00011_0110011".U,
			   23.U -> "b0000000_00000_00100_000_00010_0110011".U,
			   
			   24.U -> "b0000000_00011_00010_000_00100_0110011".U,
			   25.U -> "b0000000_00000_00010_000_00011_0110011".U,
			   26.U -> "b0000000_00000_00100_000_00010_0110011".U,
			   
			   27.U -> "b0000000_00011_00010_000_00100_0110011".U,
			   28.U -> "b0000000_00000_00010_000_00011_0110011".U,
			   29.U -> "b0000000_00000_00100_000_00010_0110011".U))
			   
			   */
