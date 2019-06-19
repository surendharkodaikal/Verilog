//`include "up_counter.v"
`include "up_counter_gate.v"
module tb;
reg clk,rst;
//wire [3:0] count;
wire [2:0] count;
up_counter dut(clk,rst,count);
initial
	begin
		clk=0;
		forever #5 clk=~clk;
	end
initial
	begin
		rst=1;
		#20;
		rst=0;
		#200;
		$finish;
	end
endmodule
