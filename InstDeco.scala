/**********************************************************
*	Name:  				InstDeco
*
*	Author: 			Hanssel Norato-Sep 17, 2019.
*
*	Modified by: 	Hanssel Norato-May 20, 2020.											
*																													
* Abstract:	 Principal Instruction decoder also in charge 
of extact immeditate value and operators 
***********************************************************/
package TOP

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

class InstDeco extends Module{
val io = IO(new Bundle {
	val instruc = Input(UInt(32.W))
	val rd = Output(UInt(5.W))
	val rs1 = Output(UInt(5.W))	
	val rs2 = Output(UInt(5.W))
	val imm = Output(SInt(32.W))
	val state= Output(UInt(6.W))
})
	val ins=Instructions
	

	val opcode=Wire(UInt(7.W))
	opcode:=io.instruc(6,0)
	val funct3=Wire(UInt(3.W))
	funct3:=io.instruc(14,12)
	
	val funct7=Wire(UInt(7.W))
	funct7:=io.instruc(31,25)

	io.state:=ins.invalid //default

	io.rd:=io.instruc(11,7)//Mux(io.state===ins.invalid,0.U,io.instruc(11,7))

	
	io.rs1:=io.instruc(19,15)//Mux(io.state===ins.invalid,0.U,io.instruc(19,15))

	io.rs2:=io.instruc(24,20)//Mux(io.state===ins.invalid,0.U,io.instruc(24,20))

	io.imm:=ins.invalid.asSInt //default

	

	switch(opcode)
	{
		is ("h37".U){// U Type
				io.state:=ins.lui
				io.imm:=(Cat(io.instruc(31,12),0.U(12.W))).asSInt		
			}
		is ("h17".U){ //U Type
				io.state:=ins.auipc
				io.imm:=(Cat(io.instruc(31,12),0.U(12.W))).asSInt
			}
		is ("h6f".U){ //J Type

				io.state:=ins.jal
				io.imm:=(Cat(io.instruc(31),io.instruc(19,12),io.instruc(20),io.instruc(30,21),0.U(1.W))).asSInt	//extend sign		
				
			}
		is ("h67".U){// I Type
				io.state:=ins.jalr
				io.imm:=(io.instruc(31,20)).asSInt
			
			}
		is ("h63".U){ //B Type

				io.imm:=(Cat(io.instruc(31),io.instruc(7),io.instruc(30,25),io.instruc(11,8),0.U(1.W))).asSInt
				io.state:=ins.invalid //default		
				switch(funct3)
				{
					is ("h0".U){
						io.state:=ins.beq
						}
					is ("h1".U){
						io.state:=ins.bne
						}
					is ("h4".U){		
						io.state:=ins.blt
						}
					is ("h5".U){		
						io.state:=ins.bge
						}
					is ("h6".U){		
						io.state:=ins.bltu
						}
					is ("h7".U){		
						 io.state:=ins.bgeu
						}
				}
			}
		is ("h3".U){ //I Type
				io.imm:=(io.instruc(31,20)).asSInt
				io.state:=ins.invalid //default
				switch(funct3)
				{
					is ("h0".U){			
						io.state:=ins.lb
						}
					is ("h1".U){
						io.state:=ins.lh
						}
					is ("h2".U){			
						io.state:=ins.lw
						}
					is ("h4".U){			
						io.state:=ins.lbu
						}
					is ("h5".U){			
						io.state:=ins.lhu 
						}
				}
			}
		is ("h23".U){ //S Type
				io.imm:=(Cat(io.instruc(31,25),io.instruc(11,7))).asSInt
				io.state:=ins.invalid //default
				switch(funct3)
				{
					is ("h0".U){			
						io.state:=ins.sb
						}
					is ("h1".U){			
						io.state:=ins.sh
						}
					is ("h2".U){			
						io.state:=ins.sw
						}
				}
			}
		is ("h13".U){//I Type
				io.imm:=(io.instruc(31,20)).asSInt //default 
				io.state:=ins.invalid //default
				switch(funct3)
				{	
					

					is ("h0".U){			
						io.state:=ins.addi
						}
					is ("h2".U){			
						io.state:=ins.slti
						}
					is ("h3".U){			
						io.state:=ins.sltiu
						}
					is ("h4".U){			
						io.state:=ins.xori
						}
					is ("h6".U){			
						io.state:=ins.ori
						}
					is ("h7".U){			
						io.state:=ins.andi
						}
					is ("h1".U){ //sp I
						io.imm:=(io.instruc(24,20)).asSInt		
						io.state:=ins.slli
						}
					is ("h5".U){ //sp I
							io.imm:=(io.instruc(24,20)).asSInt
							io.state:=ins.invalid //default
							switch(funct7)
							{			
								is ("h0".U){
									io.state:=ins.srli
									}
								is ("h20".U){
									io.state:=ins.srai
									}
							}
						}
				}
			}
		is ("h33".U){	//R Type
				io.state:=ins.invalid //default
				switch(funct3)
				{
					is ("h0".U){
							io.state:=ins.invalid //default
							switch(funct7)
							{
							is ("h0".U){
								io.state:=ins.add
								}
							is ("h1".U){					
								io.state:=ins.mul
								}
							is ("h20".U){
								io.state:=ins.sub
								}
							}
						}
					is ("h1".U){
							io.state:=ins.invalid //default
							switch(funct7)
							{
							is ("h0".U){
								io.state:=ins.sll
								}
							is ("h1".U){
								io.state:=ins.mulh
								}
							}					
						}
					is ("h2".U){
							io.state:=ins.invalid //default
							switch(funct7)
							{
							is ("h0".U){
								io.state:=ins.slt
								}
							is ("h1".U){
								io.state:=ins.mulhsu
								}
							}
						}
					is ("h3".U){
							io.state:=ins.invalid //default
							switch(funct7)
							{
							is ("h0".U){
								io.state:=ins.sltu
								}
							is ("h1".U){
								io.state:=ins.mulhu
								}
							}					
						}
					is ("h4".U){			
							
							io.state:=ins.invalid //default
							switch(funct7)
							{
							is ("h0".U){
								io.state:=ins.xor
								}
							is ("h1".U){
								io.state:=ins.div
								}
							}
						}
					is ("h5".U){
							io.state:=ins.invalid //default
							switch(funct7)
							{
							is ("h0".U){
								io.state:=ins.srl
								}
							is ("h1".U){
								io.state:=ins.divu
								}
							is ("h20".U){
								io.state:=ins.sra
								}
							}					
						}
					is ("h6".U){
						
							io.state:=ins.invalid //default
							switch(funct7)
							{
							is ("h0".U){
								io.state:=ins.or
								}
							is ("h1".U){
								io.state:=ins.rem
								}
							}
						}
					is ("h7".U){
						

						
							io.state:=ins.invalid //default
							switch(funct7)
							{
							is ("h0".U){
								io.state:=ins.and
								}
							is ("h1".U){
								io.state:=ins.remu
								}
							}
						}
					
				}			
			}
		is ("h73".U){// I Type
			io.imm:=(Cat(0.U(20.W),io.instruc(31,20))).asSInt
			io.state:=ins.invalid //default
				switch(funct3)
				{
					is ("h0".U){
						io.state:=ins.ebreak
						}	
					is ("h1".U){
						io.state:=ins.csrrw
						}
					is ("h2".U){
						io.state:=ins.csrrs
						}
					is ("h3".U){
						io.state:=ins.csrrc
						}
					is ("h5".U){
						io.state:=ins.csrrwi
						}
					is ("h6".U){
						io.state:=ins.csrrsi
						}
					is ("h7".U){
						io.state:=ins.csrrci
						}

				}
			}
	}

}


/*
object InstDecoMain extends App
{
	chisel3.Driver.execute(args, () => new InstDeco)
}
*/











