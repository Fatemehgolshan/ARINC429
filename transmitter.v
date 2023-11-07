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
module transmitter(input clr,
    input clk,
    input Tx,
    inout Rx,
	 output encodedOutput_A,
	 output encodedOutput_B
    );

 
 reg [7:0] txData;
 reg newTxData;
 wire txBusy;
 wire [7:0] rxData;
 wire valid;
 wire newRxData;
 reg [1:0]new_rxdata;
 reg [11:0] baudFreq = 4;
 reg [15:0] baudLimit  = 621;
 wire baudClk;
wire led;


reg flg_t = 0;
reg [4:0] cnt_fifo = 7;
 reg data_in_en = 0;
 reg speed = 1;
 reg data_type_en = 0;
 reg load = 0;
 reg Control_reg_en = 0;
wire [31:0] Out;



 reg [2:0] cnt_d = 6;


 reg rst = 0;

 reg [7:0]Control_reg;
 reg control_en = 0;

 wire busy;
 reg [31:0] data_in;
 reg data_load = 0;
	reg [1:0] new_busy;


Encoder_429 e1(clk,
				rst,

			data_in,

			encodedOutput_A,

			encodedOutput_B,

			load,

			speed,

			busy);
	 
 always@(posedge clk)
 begin
		new_rxdata[0] <= newRxData;
		new_rxdata[1] <= new_rxdata[0];
 end
 
  always@(posedge clk)
  begin
		new_busy[0] <= busy;
		new_busy[1] <= new_busy[0];
 end
 
 always@(posedge clk)
 begin

	
	 if(Control_reg == 8'b10000000 && !busy)
	 begin
		 speed <= 1;

	 end
	 if(Control_reg == 8'b01000000 && !busy)
	 begin
		 speed <= 0;

	 end
 end
 

 
 
 always@(posedge clk)
begin

	if(new_rxdata == 2'b01 && !control_en && !data_in_en)
	begin
		if(rxData == 8'hCC)
		begin
		control_en <= 1;
		end
	end
	

	if(new_rxdata == 2'b01/* rising edge of rxdata signal*/ && control_en)
	begin
	
		control_en <= 0;
		Control_reg <= rxData;
	
	end
	
	
	if(new_rxdata == 2'b01 && !data_in_en)
	begin
		if(rxData == 8'hAA)
			begin
			data_in_en <= 1;
			cnt_d <= 0;
			end
	end
	
	if(new_rxdata == 2'b01 && cnt_d == 0)
	begin

		data_in <= {data_in[24:0],rxData};	
		cnt_d <= 1;
		rst <= 0;
	end
	
	if(new_rxdata == 2'b01 && cnt_d == 1)
	begin
		data_in <= {data_in[24:0],rxData};
		cnt_d <= 2;
	end
	
	if(new_rxdata == 2'b01 && cnt_d == 2)
	begin
		data_in <= {data_in[24:0],rxData};
		cnt_d <= 3;
	end
	
	if(new_rxdata == 2'b01 && cnt_d == 3)
	begin
		data_in <= {data_in[24:0],rxData};
    	cnt_d <= 5;
		data_load <= 1;
		data_in_en <= 0;
	end
	
	if(!busy && data_load)
	begin
		load <= 1;
		rst <= 1;
		data_load <= 0;
	end
	
	if(new_busy == 2'b10)
	begin
	rst <= 0;
	load <= 0;
	end
end



uartTop u1(clr,clk,Tx,Rx,txData,newTxData,txBusy,rxData,newRxData,baudFreq,baudLimit,baudClk);

endmodule