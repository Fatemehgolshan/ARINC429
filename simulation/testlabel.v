`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:18:00 01/28/2018
// Design Name:   Label_Check
// Module Name:   C:/Users/Shahla/Desktop/proje/fateme_golshan/testlabel.v
// Project Name:  fateme_golshan
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Label_Check
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testlabel;

	// Inputs
	reg Clk;
	reg Wr;
	reg Rd;
	reg [7:0] Label_adr;
	reg [7:0] Label_in;

	// Outputs
	wire Label_out;

	// Instantiate the Unit Under Test (UUT)
	Label_Check uut (
		.Clk(Clk), 
		.Wr(Wr), 
		.Rd(Rd), 
		.Label_adr(Label_adr), 
		.Label_in(Label_in), 
		.Label_out(Label_out)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Wr = 1;
		Rd = 0;
		Label_adr = 5;
		Label_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
			always
	#20.834 Clk = !Clk;
	
	initial
	begin
	#50
	Label_in <= 5;
	Rd <= 1;
	end
      
endmodule

