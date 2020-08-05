package PProcesador

import chisel3._
import chisel3.util._

object Instructions{	// Control version
	val numbers=Enum(53)
	//default
	val invalid	= numbers(0)

	// U Type
	val lui  :: auipc :: Nil = numbers.slice(1,3)

	//J Type
	val jal		= numbers(3)
	
	//B Type
	val beq  :: bne :: blt :: bge :: bltu :: bgeu :: Nil =numbers.slice(4,10)

	//S Type
	val sb   :: sh  :: sw  :: Nil= numbers.slice(10,13)

	//I Type
	val jalr ::  lb  :: lh   :: lw   :: lbu    :: lhu   :: addi  :: slti  :: sltiu  :: xori   :: ori    :: Nil = numbers.slice(13,24)
	val andi :: slli :: srli :: srai :: ebreak :: csrrw :: csrrs :: csrrc :: csrrwi :: csrrsi :: csrrci :: Nil = numbers.slice(24,35)


	//R Type
	val add :: mul :: sub :: sll  :: mulh :: slt :: mulhsu :: sltu :: mulhu :: Nil = numbers.slice(35,44)
	val xor :: div :: srl :: divu :: sra  :: or  :: rem    :: and  :: remu  :: Nil = numbers.slice(44,53)
}

class Procesador extends Module
{
	val io = IO(new Bundle {

		//val rd_instru = Output(UInt(32.W))
		val rs1 = Output(UInt(32.W))
		val rs2 = Output(UInt(32.W))
		val imm=Output(SInt(32.W))
		val out = Output(UInt(32.W))
		//val salAlu = Output(UInt(32.W))
		val reset = Input(UInt(1.W))

	})
	
	val nbits: Int=32
	val pc = RegInit(0.U(32.W))
	
	//Instrucciones	

	//val Inst = Instructions//Me va a permitir cargar las instrucciones
	//Decodificacion
	val ID = Module(new ID(nbits))
	val Instru = Module(new Instrucciones())
	val control = Module(new controldeco())
	val ALU= Module(new ALU)
	val addr_IF = RegInit(0.U(5.W))
	val pp = RegInit(0.U(32.W))
	val mem = Mem(32, UInt(32.W))
	//Dirrecion para las instrucciones
	Instru.io.addr_IF := addr_IF
	

	//Counter Program	
	when((io.reset.asBool =/= 1.U) && (pc =/= 3.U))
	{
		pc := pc +1.U
		
	}
	.otherwise
	{
		addr_IF := addr_IF + 1.U
		pc := 0.U
		
	}
	

	when(pc === 2.U)
	{
		ID.io.wen	:= 1.U.asBool
		
		ID.io.rd := pp
	}
	.otherwise 
	{
		ID.io.wen	:= 0.U.asBool
		ID.io.rd := 0.U	
	}
	
	//INSTRUCCIONES
	//io.rd_instru := Instru.io.instrucc
	ID.io.instruction := Instru.io.instrucc
	
	control.io.cmd := ID.io.ctrl.cmd
	ALU.io.sel := control.io.out.EX_ALU
	ALU.io.in1 := ID.io.rs1
	ALU.io.in2 := Mux( control.io.out.EX_mux3===1.U, ID.io.rs2  , ID.io.imm.asUInt)
	pp := ALU.io.out
	//io.salAlu := ALU.io.out
	io.rs1 := ID.io.rs1
	io.rs2 := ID.io.rs2
	io.imm := ID.io.imm
	io.out := ALU.io.out
}

object ProcesadorMain extends App
{
	chisel3.Driver.execute(args, () => new Procesador)
}


/*
package mainProcesador

import chisel3._
import chisel3.util._



class processor extends Module
{
	val io = IO(new Bundle {

		val rd_instru = Output(UInt(32.W))

		val rs1 = Output(UInt(32.W))
		val rs2 = Output(UInt(32.W))
		val imm=Output(SInt(32.W))
		

		val rd_out = Output(UInt(32.W))
		
		
		val salAlu = Output(UInt(32.W))
		
		//Reset
		val rst = Input(UInt(1.W))

	})
	
	val nbits: Int=32
	
	val Alu_rs_2 = Wire(UInt(32.W))
	val Alu_rs_1 = Wire(UInt(32.W))
	
	val pc = RegInit(0.U(32.W))
	
	//Instrucciones	

	val Inst = Instructions//Me va a permitir cargar las instrucciones
	
	//Decodificacion
	val ID = Module(new ID(nbits))//Decodifica las instrucciones y las manda a: 0.Control(Externo) 1.EX (Externo)  y 2.RegFile(INTERNO) 3. DecodeInstruc (INTERNO)
	
	//Instrucciones Cargar
	val Instru = Module(new Instrucciones())//Modulo de la sinstrucciones
	
	//CONTROL
	//val deco = Module(new InstDeco())
	val control = Module(new controlData())//control datos
	
	//EXECUTION
	val ALU= Module(new ALU)
	
	val addr_IF = RegInit(0.U(5.W))//Incrementar los bits para mas instrucciones
	
	val pp = RegInit(0.U(32.W))
	
	
	//INSTRUCCIONES
	io.rd_instru := Instru.io.instrucc
	

	//Decodificacion de las intrucciones
	ID.io.instruction := Instru.io.instrucc
	
	
	io.rd_out:=ID.io.out_rd
	
	
	
	//EX, controlData y ALU
	
	/*
	En el modulo Ex (Se va a implementar aqui):
	1.) Se debe escoger el dato rs2 por medio del multiplexor EX_mux3 de "ControlData", si es verdadero se escoge rs2 sino se escoge el calor imm
	2.) Se debe escoger la operacion de la ALU y cablear las entradas de la ALU
	
	
	*/
	
	control.io.cmd := ID.io.ctrl.cmd
	ALU.io.sel := control.io.out.EX_ALU
	Alu_rs_2:=Mux( control.io.out.EX_mux3===1.U, ID.io.rs2  , ID.io.imm.asUInt)
	Alu_rs_1:=ID.io.rs1
	ALU.io.in1 := Alu_rs_1
	ALU.io.in2 := Alu_rs_2
	pp := ALU.io.out
	io.salAlu := pp
	
	
	
	io.rs1 := ID.io.rs1
	io.rs2 := ID.io.rs2
	io.imm := ID.io.imm

	//Dirrecion para las instrucciones
	Instru.io.addr_IF := addr_IF
	

	//Counter Program	
	when((io.rst.asBool =/= 1.U) && (pc =/= 3.U))
	{
		pc := pc +1.U
		
	}
	.otherwise
	{
		addr_IF := addr_IF + 1.U
		pc := 0.U
		
	}
	

	when(pc === 2.U)
	{
		ID.io.wen	:= 1.U.asBool
		ID.io.rd := pp
	}
	.otherwise 
	{
		ID.io.wen	:= 0.U.asBool
		ID.io.rd := 0.U	
	}
	

}





object processorMain extends App
{
	chisel3.Driver.execute(args, () => new processor)
}

*/