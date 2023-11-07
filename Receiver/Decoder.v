`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:16:39 08/22/2017 
// Design Name: 
// Module Name:    Decoder 
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
module Decoder(input Clk,
					 input High,
					 input Low,
					 output reg [31:0] Out,
					 output reg valid,
					input speed
    );

reg [1:0] High_reg;
reg [1:0] Low_reg;

reg decode_h = 0;
reg decode_l = 0;

reg [8:0] high_cnt = 0;
reg [8:0] low_cnt = 0;

reg [4:0] tmp_high;
reg [4:0] tmp_low;

reg [3:0] flg_h = 0;
reg [3:0] flg_l = 0;

reg [31:0] out_r;

reg dis_reg = 0;

reg [5:0] cnt_v = 0;

//reg speed = 1;

reg busy_l = 0;
reg busy_h = 0;
reg busy = 0;
 reg flg = 0;

reg [3:0] cnt_v_h = 0;
reg [3:0] cnt_v_l = 0;


//reg [3:0] next_state;
//reg [3:0] state = 1;
//localparam[3:0] 
//IDLE = 4'b0000,
//GNT0 = 4'b0001,
//GNT1 = 4'b0010,
//GNT2 = 4'b0011,
//GNT3 = 4'b0100,
//GNT4 = 4'b0101,
//GNT5 = 4'b0110,
//GNT6 = 4'b0111,
//GNT7 = 4'b1000;
//


//always@(posedge Clk)
//begin
//	if(Control_reg_en)
//	speed <= Control_Reg;
//end

initial
begin
//valid <= 0;
end
	always@(posedge Clk)//decode high
	begin
	 High_reg[0] <= High;
	 High_reg[1] <= High_reg[0];
	end

	always@(posedge Clk) //decode low
	begin
	 Low_reg[0] <= Low;
	 Low_reg[1] <= Low_reg[0];
	end


	always@(posedge Clk )
	begin
			valid <= 0 ;
			
		 if(dis_reg == 0)
		 begin
		 
		 if(High_reg == 2'b01)//rising edge of High signal
		 decode_h <= 1;
		
		if( Low_reg == 2'b01)//rising edge of Low signal
		 decode_l <= 1;
		 end

			if(speed == 1)//100Khz
			begin
				 if(decode_h == 1) 
			begin
			busy_h <= 1;
			dis_reg <= 1;
			high_cnt <= high_cnt + 1;
			if(flg_h == 0)
			begin
				if(high_cnt == 37)
				begin
				tmp_high <= {tmp_high[3:0],High};
				high_cnt <= 0;
				flg_h <= flg_h + 1;
				end
			end
			else
			begin
				if(high_cnt == 38)
				begin
					if(flg_h == 2)
					begin
					flg_h <= flg_h + 1;
					high_cnt <= 0;
					end
					else
					begin
					tmp_high <= {tmp_high[3:0],High};
					high_cnt <= 0;
					flg_h <= flg_h + 1;
					end
				end
			end
			if(flg_h == 6)
				begin
				flg_h <= 0;	
				dis_reg <= 0;
				decode_h <= 0;
				if(tmp_high == 5'b11000)
					begin
					out_r <= {1,out_r[31:1]};
					cnt_v <= cnt_v + 1;
					end
				end
			end
		else busy_h <= 0;
				if(cnt_v == 32)
					begin
					busy_h <=1;
					high_cnt <= high_cnt + 1;
					if(high_cnt == 37)
					begin
					if(flg_h == 2)
						begin
						flg_h <= flg_h + 1;
						end
					else
						begin
						tmp_high <= {tmp_high[3:0],High};
						high_cnt <= 0;
						flg_h <= flg_h + 1;
						end
					end
					if(flg_h == 6)
						begin
						flg_h <= 0;
						decode_h <= 0;
						if(tmp_high == 5'b00000)
						cnt_v_h <= cnt_v_h + 1;
					end
			end	
			end
			
			
			if(speed == 1)//100Khz
		 begin
			 if(decode_l == 1) 
			begin
			busy_l <= 1;
			dis_reg <= 1;
			low_cnt <= low_cnt + 1;
			if(flg_l == 0)
			begin
				if(low_cnt == 37)
				begin
				tmp_low <= {tmp_low[3:0],Low};
				low_cnt <= 0;
				flg_l <= flg_l + 1;
				end
			end
			else
			begin
				if(low_cnt == 38)
				begin
					if(flg_l == 2)
					begin
					flg_l <= flg_l + 1;
					low_cnt <= 0;
					end
					else
					begin
					tmp_low <= {tmp_low[3:0],Low};
					low_cnt <= 0;
					flg_l <= flg_l + 1;
					end
				end
			end
			if(flg_l == 6)
				begin
				flg_l <= 0;	
				dis_reg <= 0;
				decode_l <= 0;
				if(tmp_low == 5'b11000)
					begin
					out_r <= {0,out_r[31:1]};
					cnt_v <= cnt_v + 1;
					end
				end
			end
			
		 busy_l <= 0;
		 
				if(cnt_v == 32)
					begin
					busy_l <= 1;
					low_cnt <= low_cnt + 1;
					if(low_cnt == 37)
					begin
					if(flg_l == 2)
						begin
						flg_l <= flg_l + 1;
						end
					else
						begin
						tmp_low <= {tmp_low[3:0],Low};
						low_cnt <= 0;
						flg_l <= flg_l + 1;
						end
					end
					if(flg_l == 6)
						begin
						flg_l <= 0;
						decode_l <= 0;
						if(tmp_low == 5'b00000)
						cnt_v_l <= cnt_v_l + 1;
					end
			end	
	end	


		if(speed == 0)//100Khz
			begin
			if(decode_h == 1) 
			begin
			busy_h <= 1;
			dis_reg <= 1;
			high_cnt <= high_cnt + 1;
			if(flg_h == 0)
			begin
				if(high_cnt == 317)
				begin
				tmp_high <= {tmp_high[3:0],High};
				high_cnt <= 0;
				flg_h <= flg_h + 1;
				end
			end
			else
			begin
				if(high_cnt == 317)
				begin
					if(flg_h == 2)
					begin
					flg_h <= flg_h + 1;
					high_cnt <= 0;
					end
					else
					begin
					tmp_high <= {tmp_high[3:0],High};
					high_cnt <= 0;
					flg_h <= flg_h + 1;
					end
				end
			end
			if(flg_h == 6)
				begin
				flg_h <= 0;	
				dis_reg <= 0;
				decode_h <= 0;
				if(tmp_high == 5'b11000)
					begin
					out_r <= {1,out_r[31:1]};
					cnt_v <= cnt_v + 1;
					end
				end
			end
		else busy_h <= 0;
				if(cnt_v == 32)
					begin
					busy_h <=1;
					high_cnt <= high_cnt + 1;
					if(high_cnt == 317)
					begin
					if(flg_h == 2)
						begin
						flg_h <= flg_h + 1;
						end
					else
						begin
						tmp_high <= {tmp_high[3:0],High};
						high_cnt <= 0;
						flg_h <= flg_h + 1;
						end
					end
					if(flg_h == 6)
						begin
						flg_h <= 0;
						decode_h <= 0;
						if(tmp_high == 5'b00000)
						cnt_v_h <= cnt_v_h + 1;
					end
			end	
			end
			
			
			if(speed == 0)//100Khz
		 begin
			 if(decode_l == 1) 
			begin
			busy_l <= 1;
			dis_reg <= 1;
			low_cnt <= low_cnt + 1;
			if(flg_l == 0)
			begin
				if(low_cnt == 317)
				begin
				tmp_low <= {tmp_low[3:0],Low};
				low_cnt <= 0;
				flg_l <= flg_l + 1;
				end
			end
			else
			begin
				if(low_cnt == 317)
				begin
					if(flg_l == 2)
					begin
					flg_l <= flg_l + 1;
					low_cnt <= 0;
					end
					else
					begin
					tmp_low <= {tmp_low[3:0],Low};
					low_cnt <= 0;
					flg_l <= flg_l + 1;
					end
				end
			end
			if(flg_l == 6)
				begin
				flg_l <= 0;	
				dis_reg <= 0;
				decode_l <= 0;
				if(tmp_low == 5'b11000)
					begin
					out_r <= {0,out_r[31:1]};
					cnt_v <= cnt_v + 1;
					end
				end
			end
			
		 busy_l <= 0;
		 
				if(cnt_v == 32)
					begin
					busy_l <= 1;
					low_cnt <= low_cnt + 1;
					if(low_cnt == 317)
					begin
					if(flg_l == 2)
						begin
						flg_l <= flg_l + 1;
						end
					else
						begin
						tmp_low <= {tmp_low[3:0],Low};
						low_cnt <= 0;
						flg_l <= flg_l + 1;
						end
					end
					if(flg_l == 6)
						begin
						flg_l <= 0;
						decode_l <= 0;
						if(tmp_low == 5'b00000)
						cnt_v_l <= cnt_v_l + 1;
					end
			end	
	end	


	if(cnt_v_h == 4  && cnt_v_l == 4)
		begin
		flg <= 1;
		cnt_v_l <= 0;
		cnt_v_h <= 0;
		cnt_v <= 0;
		end
		if(flg)
		valid <= 1;
		if(valid)
			begin
			Out <= out_r;
			busy_l <= 0;
			busy_l <= 0;
			flg <= 0;
		//	valid <= 1;
			end
end

endmodule
