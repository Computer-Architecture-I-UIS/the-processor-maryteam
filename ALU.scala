package ID_MEM

import chisel3._
import chisel3.util._



class ALU extends Module{
	val io = IO(new Bundle {
		val instruc = Input(UInt(32.W))
		val in1 = Input(UInt(32.W))
		val in2 = Input(UInt(32.W))
		val out = Output(UInt(32.W))	
	})
	
	val opcode=Wire(UInt(7.W))
	opcode:=io.instruc(6,0)
	val funct3=Wire(UInt(3.W))
	funct3:=io.instruc(14,12)
	val funct7=Wire(UInt(7.W))
	funct7:=io.instruc(31,25)
	
	
	when(opcode==="h37".U)	{		io.out:=0.U		} //lui
	.elsewhen(opcode==="h17".U)	{		io.out:=0.U		} //auipc
	.elsewhen(opcode==="h13".U)	{
		when(funct3==="h0".U)	{			io.out := io.in1 + io.in2		}//addi
		.elsewhen(funct3==="h2".U)	{			io.out := (io.in1.asSInt < io.in2.asSInt).asUInt			}//slti
		.elsewhen(funct3==="h3".U)	{			io.out := Mux(io.in1 < io.in2, 1.U, 0.U)			}//sltiu
		.elsewhen(funct3==="h4".U)	{			io.out := io.in1 ^ io.in2			}//xori
		.elsewhen(funct3==="h6".U)	{			io.out := io.in1 | io.in2			}//ori
		.elsewhen(funct3==="h7".U)	{			io.out := io.in1 & io.in2			}//andi
		.elsewhen(funct3==="h1".U)	{			io.out := io.in1 << io.in2(4,0)		}//slli
		.elsewhen(funct3==="h5".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 >> io.in2(4,0)				}//srli
			.elsewhen(funct7==="h20".U)	{				when     (io.in1(31) === 0.U){ io.out := io.in1 >> io.in2(4,0) } 
			       
																					.otherwise{ io.out := io.in1 >> io.in2(4,0) | ("hFFFF_FFFF".U << (32.U - io.in2(4,0))) } 																								
																					}//srai 
																					
			.otherwise{						io.out:=0.U						}
			} .otherwise{						io.out:=0.U						}
		}
	.elsewhen(opcode==="h33".U)	{
		when(funct3==="h0".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 + io.in2				}//add
			.elsewhen(funct7==="h20".U)	{				io.out:=io.in1 - io.in2				}//sub 
			.otherwise{						io.out:=0.U						}
			} 
		.elsewhen(funct3==="h1".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 << io.in2(4,0)				} //sll
			.otherwise{						io.out:=0.U					}
			} 
		.elsewhen(funct3==="h2".U)	{
			when(funct7==="h0".U)	{				io.out := (io.in1.asSInt < io.in2.asSInt).asUInt				} //slt
			.otherwise{						io.out:=0.U				  	}
			} 
		.elsewhen(funct3==="h3".U)	{
			when(funct7==="h0".U)	{				io.out := Mux(io.in1 < io.in2, 1.U, 0.U)				} //sltu
			.otherwise{					io.out:=0.U				}
			} 
		.elsewhen(funct3==="h4".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 ^ io.in2				} //xor
			.otherwise{					io.out:=0.U				}
			} 
		.elsewhen(funct3==="h5".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 >> io.in2(4,0)				}//srl
			.elsewhen(funct7==="h20".U)	{				when     (io.in1(31) === 0.U){ io.out := io.in1 >> io.in2(4,0) } 
			       
																					.otherwise{ io.out := io.in1 >> io.in2(4,0) | ("hFFFF_FFFF".U << (32.U - 																						io.in2(4,0))) }				
																					}//sra 
			.otherwise{					io.out:=0.U				}
			} 
		.elsewhen(funct3==="h6".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 | io.in2				}// or
			.otherwise{					io.out:=0.U				}
			}
  	.elsewhen(funct3==="h7".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 & io.in2				} //and
			.otherwise{					io.out:=0.U				}
			} .otherwise{						io.out:=0.U						}
		}.otherwise{					io.out:=0.U				}

	

}


/*
object MEMMain extends App
{
	chisel3.Driver.execute(args, () => new MEM)
}
*/


/*

	when(opcode==="h37".U)	{		io.out:=0.U		} //lui
	.elsewhen(opcode==="h17".U)	{		io.out:=0.U		} //auipc
	.elsewhen(opcode==="h13".U)	{
		when(funct3==="h0".U)	{			io.out := io.in1 + io.in2		}//addi
		.elsewhen(funct3==="h2".U)	{			io.out := (io.in1.asSInt < io.in2.asSInt).asUInt			}//slti
		.elsewhen(funct3==="h3".U)	{			io.out := Mux(io.in1 < io.in2, 1.U, 0.U)			}//sltiu
		.elsewhen(funct3==="h4".U)	{			io.out := io.in1 ^ io.in2			}//xori
		.elsewhen(funct3==="h6".U)	{			io.out := io.in1 | io.in2			}//ori
		.elsewhen(funct3==="h7".U)	{			io.out := io.in1 & io.in2			}//andi
		.elsewhen(funct3==="h1".U)	{			io.out := io.in1 << io.in2(4,0)		}//slli
		.elsewhen(funct3==="h5".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 >> io.in2(4,0)				}//srli
			.elsewhen(funct7==="h20".U)	{				io.out:=0.U/*when     (io.in1(31) === 0.U){ io.out := io.in1 >> io.in2(4,0) } 
			       
																					.otherwise{ io.out := io.in1 >> io.in2(4,0) | ("hFFFF_FFFF".U << (32.U - io.in2(4,0))) } 																								
																					*/}//srai 
																					
			.otherwise{						io.out:=0.U						}
			} .otherwise{						io.out:=0.U						}
		}
	.elsewhen(opcode==="h33".U)	{
		when(funct3==="h0".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 + io.in2				}//add
			.elsewhen(funct7==="h20".U)	{				io.in1 - io.in2				}//sub 
			.otherwise{						io.out:=0.U						}
			} 
		.elsewhen(funct3==="h1".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 << io.in2(4,0)				} //sll
			.otherwise{						io.out:=0.U					}
			} 
		.elsewhen(funct3==="h2".U)	{
			when(funct7==="h0".U)	{				io.out := (io.in1.asSInt < io.in2.asSInt).asUInt				} //slt
			.otherwise{						io.out:=0.U				  	}
			} 
		.elsewhen(funct3==="h3".U)	{
			when(funct7==="h0".U)	{				io.out := Mux(io.in1 < io.in2, 1.U, 0.U)				} //sltu
			.otherwise{					io.out:=0.U				}
			} 
		.elsewhen(funct3==="h4".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 ^ io.in2				} //xor
			.otherwise{					io.out:=0.U				}
			} 
		.elsewhen(funct3==="h5".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 >> io.in2(4,0)				}//srl
			.elsewhen(funct7==="h20".U)	{				io.out:=0.U/*when     (io.in1(31) === 0.U){ io.out := io.in1 >> io.in2(4,0) } 
			       
																					.otherwise{ io.out := io.in1 >> io.in2(4,0) | ("hFFFF_FFFF".U << (32.U - 																						io.in2(4,0))) }				*/
																					}//sra 
			.otherwise{					io.out:=0.U				}
			} 
		.elsewhen(funct3==="h6".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 | io.in2				}// or
			.otherwise{					io.out:=0.U				}
			}
  	.elsewhen(funct3==="h7".U)	{
			when(funct7==="h0".U)	{				io.out := io.in1 & io.in2				} //and
			.otherwise{					io.out:=0.U				}
			} .otherwise{						io.out:=0.U						}
		}.otherwise{					io.out:=0.U				}





	when(opcode==="h37".U)	{		io.check:=10.U		} 
	.elsewhen(opcode==="h17".U)	{		io.check:=11.U		}
	.elsewhen(opcode==="h13".U)	{
		when(funct3==="h0".U)	{			io.check:=8.U			}
		.elsewhen(funct3==="h2".U)	{			io.check:=20.U			}
		.elsewhen(funct3==="h3".U)	{			io.check:=21.U			}
		.elsewhen(funct3==="h4".U)	{			io.check:=13.U			}
		.elsewhen(funct3==="h6".U)	{			io.check:=17.U			}
		.elsewhen(funct3==="h7".U)	{			io.check:=15.U			}
		.elsewhen(funct3==="h1".U)	{			io.check:=2.U			}
		.elsewhen(funct3==="h5".U)	{
			when(funct7==="h0".U)	{				io.check:=4.U				}
			.elsewhen(funct7==="h20".U)	{				io.check:=6.U				} 
			.otherwise{						io.check:=0.U						}
			} .otherwise{						io.check:=0.U						}
		}
	.elsewhen(opcode==="h33".U)	{
		when(funct3==="h0".U)	{
			when(funct7==="h0".U)	{				io.check:=7.U				}
			.elsewhen(funct7==="h20".U)	{				io.check:=9.U				} 
			.otherwise{						io.check:=0.U						}
			} 
		.elsewhen(funct3==="h1".U)	{
			when(funct7==="h0".U)	{				io.check:=1.U				} 
			.otherwise{						io.check:=0.U					}
			} 
		.elsewhen(funct3==="h2".U)	{
			when(funct7==="h0".U)	{				io.check:=18.U				} 
			.otherwise{						io.check:=0.U				  	}
			} 
		.elsewhen(funct3==="h3".U)	{
			when(funct7==="h0".U)	{				io.check:=19.U				} 
			.otherwise{					io.check:=0.U				}
			} 
		.elsewhen(funct3==="h4".U)	{
			when(funct7==="h0".U)	{				io.check:=12.U				} 
			.otherwise{					io.check:=0.U				}
			} 
		.elsewhen(funct3==="h5".U)	{
			when(funct7==="h0".U)	{				io.check:=3.U				}
			.elsewhen(funct7==="h20".U)	{				io.check:=5.U				} 
			.otherwise{					io.check:=0.U				}
			} 
		.elsewhen(funct3==="h6".U)	{
			when(funct7==="h0".U)	{				io.check:=16.U				} 
			.otherwise{					io.check:=0.U				}
			}
  	.elsewhen(funct3==="h7".U)	{
			when(funct7==="h0".U)	{				io.check:=14.U				} 
			.otherwise{					io.check:=0.U				}
			} .otherwise{						io.check:=0.U						}
		}.otherwise{					io.check:=0.U				}





	when(opcode==="h37".U)	{		io.check:=10.U		} 
	.elsewhen(opcode==="h17".U)	{		io.check:=11.U		}
	.elsewhen(opcode==="h13".U)	{
		when(funct3==="h0".U)	{			io.check:=8.U			}
		.elsewhen(funct3==="h2".U)	{			io.check:=20.U			}
		.elsewhen(funct3==="h3".U)	{			io.check:=21.U			}
		.elsewhen(funct3==="h4".U)	{			io.check:=13.U			}
		.elsewhen(funct3==="h6".U)	{			io.check:=17.U			}
		.elsewhen(funct3==="h7".U)	{			io.check:=15.U			}
		.elsewhen(funct3==="h1".U)	{			io.check:=2.U			}
		.elsewhen(funct3==="h5".U)	{
			when(funct7==="h0".U)	{				io.check:=4.U				}
			.elsewhen(funct7==="h20".U)	{				io.check:=6.U				} 
			.otherwise{						io.check:=0.U						}
			}
		}
	.elsewhen(opcode==="h33".U)	{
		when(funct3==="h0".U)	{
			when(funct7==="h0".U)	{				io.check:=7.U				}
			.elsewhen(funct7==="h20".U)	{				io.check:=9.U				} 
			.otherwise{						io.check:=0.U						}
			}
		.elsewhen(funct3==="h1".U)	{
			when(funct7==="h0".U)	{				io.check:=1.U				} 
			.otherwise{						io.check:=0.U					}
			}
		.elsewhen(funct3==="h2".U)	{
			when(funct7==="h0".U)	{				io.check:=18.U				} 
			.otherwise{						io.check:=0.U				  	}
			}
		.elsewhen(funct3==="h3".U)	{
			when(funct7==="h0".U)	{				io.check:=19.U				} 
			.otherwise{					io.check:=0.U				}
			}
		.elsewhen(funct3==="h4".U)	{
			when(funct7==="h0".U)	{				io.check:=12.U				} 
			.otherwise{					io.check:=0.U				}
			}
		.elsewhen(funct3==="h5".U)	{
			when(funct7==="h0".U)	{				io.check:=3.U				}
			.elsewhen(funct7==="h20".U)	{				io.check:=5.U				} 
			.otherwise{					io.check:=0.U				}
			}
		.elsewhen(funct3==="h6".U)	{
			when(funct7==="h0".U)	{				io.check:=16.U				} 
			.otherwise{					io.check:=0.U				}
			}
  	.elsewhen(funct3==="h7".U)	{
			when(funct7==="h0".U)	{				io.check:=14.U				} 
			.otherwise{					io.check:=0.U				}
			}
		}.otherwise{					io.check:=0.U				}








	switch(opcode)
	{
		is ("h37".U){// U Type
				io.check:=10.U
			}
		is ("h17".U){ //U Type
				io.check:=11.U
			}
		is ("h13".U){//I Type
				switch(funct3)
				{	
					

					is ("h0".U){			
						io.check:=8.U
						}
					is ("h2".U){			
						io.check:=20.U
						}
					is ("h3".U){			
						io.check:=21.U
						}
					is ("h4".U){			
						io.check:=13.U
						}
					is ("h6".U){			
						io.check:=17.U
						}
					is ("h7".U){			
						io.check:=15.U
						}
					is ("h1".U){ //sp I
						io.check:=2.U
						}
					is ("h5".U){ //sp I
							switch(funct7)
							{			
								is ("h0".U){
									io.check:=4.U
									}
								is ("h20".U){
									io.check:=6.U
									}
							}
						}
				}
			}
		is ("h33".U){	//R Type
				switch(funct3)
				{
					is ("h0".U){
							switch(funct7)
							{
							is ("h0".U){
								io.check:=7.U
								}
							is ("h20".U){
								io.check:=9.U
								}
							}
						}
					is ("h1".U){
							switch(funct7)
							{
							is ("h0".U){
								io.check:=1.U
								}
							}					
						}
					is ("h2".U){
							switch(funct7)
							{
							is ("h0".U){
								io.check:=18.U
								}
							}
						}
					is ("h3".U){
							switch(funct7)
							{
							is ("h0".U){
								io.check:=19.U
								}
							}					
						}
					is ("h4".U){			
							switch(funct7)
							{
							is ("h0".U){
								io.check:=12.U
								}
							}
						}
					is ("h5".U){
							switch(funct7)
							{
							is ("h0".U){
								io.check:=3.U
								}
							is ("h20".U){
								io.check:=5.U
								}
							}					
						}
					is ("h6".U){
							switch(funct7)
							{
							is ("h0".U){
								io.check:=16.U
								}
							}
						}
					is ("h7".U){
							switch(funct7)
							{
							is ("h0".U){
								io.check:=14.U
								}
							}
						}
					
				}			
			}
			io.check:=0.U
	}
*/





