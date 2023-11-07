`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:36:59 01/03/2018
// Design Name:   RECModule
// Module Name:   C:/Users/Shahla/Desktop/proje/fateme_golshan/test_rec.v
// Project Name:  fateme_golshan
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RECModule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_rec;

	// Inputs
	reg Clk;
	reg Clr;
	reg High;
	reg Low;
	reg Tx;

	// Bidirs
	wire Rx;
	wire [31:0] out_fifo;

	// Instantiate the Unit Under Test (UUT)
	RECModule uut (
		.Clk(Clk), 
		.out_fifo(out_fifo),
		.Clr(Clr), 
		.High(High), 
		.Low(Low), 
		.Tx(Tx), 
		.Rx(Rx)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Clr = 0;
		High = 0;
		Low = 0;
		Tx = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
		always
	#20.834 Clk = !Clk;
	
	initial
	begin
	
	#20.84 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 Low <= 1;
	#5000.16 Low <= 0;
	
	#5000.16 High <= 1;//
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;//
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 Low <= 1;
	#5000.16 Low <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 Low <= 1;
	#5000.16 Low <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;//
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;//
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
	
	#5000.16 Low <= 1;
	#5000.16 Low <= 0;
	
	#5000.16 Low <= 1;
	#5000.16 Low <= 0;
	
	#5000.16 High <= 1;
	#5000.16 High <= 0;
////	
//	//#100000
////	
////	
////	//////////////
//   #1000000 High <= 1;
//	#5000.16 High	<= 0;
//	
//	#5000.16 Low <= 1;
//	#5000.16 Low <= 0;
//	
//	#5000.16 High <= 1;//
//	#5000.16 High <= 0;
//	
//	#5000.16 Low <= 1;
//	#5000.16 Low <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 Low <= 1;
//	#5000.16 Low <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 Low <= 1;
//	#5000.16 Low <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;//
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;//
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
//	
//	#5000.16 Low <= 1;
//	#5000.16 Low <= 0;
//	
//	#5000.16 Low <= 1;
//	#5000.16 Low <= 0;
//	
//	#5000.16 Low <= 1;
//	#5000.16 Low <= 0;
//	
//	#5000.16 High <= 1;
//	#5000.16 High <= 0;
	end
		
endmodule

