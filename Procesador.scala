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

		val rs1 = Output(UInt(32.W))
		val rs2 = Output(UInt(32.W))
		val imm=Output(SInt(32.W))
		val out = Output(UInt(32.W))
		val reset = Input(UInt(1.W))

	})
	
	val nbits: Int=32
	val pc = RegInit(0.U(32.W))
	
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
	pc      := Mux(((io.reset.asBool =/= 1.U) && (pc =/= 3.U))===1.U, pc +1.U, 0.U)
	addr_IF := Mux(((io.reset.asBool =/= 1.U) && (pc =/= 3.U))===1.U, addr_IF, addr_IF+1.U)
	ID.io.wen := Mux(pc === 2.U, 1.U.asBool, 0.U.asBool)
	ID.io.rd := Mux(pc === 2.U, pp, 0.U)
	
	//INSTRUCCIONES
	ID.io.instruction := Instru.io.instrucc
	
	control.io.cmd := ID.io.ctrl.cmd
	ALU.io.sel := control.io.out.EX_ALU
	ALU.io.in1 := ID.io.rs1
	ALU.io.in2 := Mux( control.io.out.EX_mux3===1.U, ID.io.rs2  , ID.io.imm.asUInt)
	pp := ALU.io.out
	io.rs1 := ID.io.rs1
	io.rs2 := ID.io.rs2
	io.imm := ID.io.imm
	io.out := ALU.io.out
}

object ProcesadorMain extends App
{
	chisel3.Driver.execute(args, () => new Procesador)
}

