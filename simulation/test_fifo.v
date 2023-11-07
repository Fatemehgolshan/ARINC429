`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:41:29 02/09/2018
// Design Name:   FiFo
// Module Name:   C:/Users/FatemE/Desktop/New folder/New folder/proje/TST_UAR/test_fifo.v
// Project Name:  TST_UAR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FiFo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_fifo;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] din;
	reg wr_en;
	reg rd_en;

	// Outputs
	wire [31:0] dout;
	wire full;
	wire almost_full;
	wire empty;
	wire almost_empty;

	// Instantiate the Unit Under Test (UUT)
	FiFo uut (
		.clk(clk), 
		.rst(rst), 
		.din(din), 
		.wr_en(wr_en), 
		.rd_en(rd_en), 
		.dout(dout), 
		.full(full), 
		.almost_full(almost_full), 
		.empty(empty), 
		.almost_empty(almost_empty)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		din = 0;
		wr_en = 0;
		rd_en = 0;
	end
	
	
   always  #20.834 clk <= ~clk;

		initial
		begin
		din <= 32'hABFFDECC;
		wr_en <= 1;
		#100
		din <= 32'hABFFAACF;
		#10
		rd_en <= 1;
		end	  
endmodule

