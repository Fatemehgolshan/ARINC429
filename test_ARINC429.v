`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:48:30 01/31/2018
// Design Name:   arinc429
// Module Name:   C:/Users/Shahla/Desktop/proje/test_arinc/tst.v
// Project Name:  test_arinc
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: arinc429
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tst;

	// Inputs
	reg Clk;
	reg [31:0] data_in;
	reg Tx;

	// Outputs
	wire [31:0] Out;
	wire valid;

	// Bidirs
	wire Rx;

	// Instantiate the Unit Under Test (UUT)
	arinc429 uut (
		.Clk(Clk), 
		.Out(Out), 
		.valid(valid), 
		.data_in(data_in), 
		.Tx(Tx), 
		.Rx(Rx)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		data_in = 0;
		Tx = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
    
		always
	#20.834 Clk = !Clk;
	
	initial
	begin
	data_in <= 32'hABDCABAB;
	
	end
	 
endmodule

