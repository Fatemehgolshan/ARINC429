`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:24:31 08/06/2017 
// Design Name: 
// Module Name:    Label_Check 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Label_Check(
	 input Clk,
	 input Wr,
	 input Rd,
    input [7:0] Label_adr,//write
	 input [7:0] Label_in,//read
    output reg Label_out
    );


reg [255:0] Labels ;
reg [10:0] cnt_l = 0;


always@(posedge Clk)
begin
		Label_out <= 0;
		
		if(Wr)
		Labels[Label_adr] <= 1;
		
		if(Rd)
		begin
				if(Labels[Label_in] == 1)
				begin
				Label_out <= 1;
				end
		end
end

endmodule