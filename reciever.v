`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:42 01/17/2018 
// Design Name: 
// Module Name:    tst_uart 
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
module reciever(input clr,
    input clk,
    input Tx,
    inout Rx,
	 output reg[7:0] rxData_tmp
    );
reg [7:0] Label;
 
 reg [7:0] txData;
 reg newTxData;
 wire txBusy;
 wire [7:0] rxData;
 wire newRxData;
 //reg tmp_newrx;
 reg [1:0]new_rxdata;
 reg [11:0] baudFreq = 4;
 reg [15:0] baudLimit = 621;
 wire baudClk;
 wire [7:0] Label_out;
 
 reg [3:0] Status_reg = 0;
 
 //fifo
//wire [31:0] wire_out_fifo;
wire /*full,*/empty;
reg status_en;

wire parity_out; //output Partity_Check
wire label_check; //output Label_Check


reg data_type_en = 0;
reg Label_en = 0;
reg Control_reg_en = 0;
reg fpga_2_pc = 0;

reg flg ;
reg cnt_s = 0;
reg [2:0] cnt = 0;
reg [3:0]cnt_u = 0;
reg flg_f  = 0;
reg flg_s = 0;

 always@(posedge clk)
 begin
		new_rxdata[0] <= newRxData;
		new_rxdata[1] <= new_rxdata[0];
 end
 
 always@(posedge clk)
begin
	if(new_rxdata == 2'b01)
	begin
		rxData_tmp <= rxData;
	end
	
	if(!txBusy)
	begin
	newTxData <= 1;
	txData <= 8'h11;
	flg <= 1;
	end
	if(flg)
		begin
		newTxData <= 0;
		end
end



uartTop u1(clr,clk,Tx,Rx,txData,newTxData,txBusy,rxData,newRxData,baudFreq,baudLimit,baudClk);

endmodule
