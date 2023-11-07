`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:12:59 08/01/2017 
// Design Name: 
// Module Name:    Parity_Check 
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
module Parity_Check(input [31:0] In,output out
    );
wire temp;
wire temp1;
assign temp =(In[0] + In[1] + In[2] + In[3] + In[4] + In[5] + In[6] + In[7] +
				 In[8] + In[9] + In[10] + In[11] + In[12] + In[13] + In[14] + In[15] +
				 In[16] + In[17] + In[18] + In[19] + In[20] + In[21] + In[22] + In[23] + 
				 In[24] + In[25] + In[26] + In[27] + In[28] + In[29] + In[30]) ; 
not(temp1,temp);				 
assign out = 1 ? (temp1 == In[31]) : 0;
endmodule
