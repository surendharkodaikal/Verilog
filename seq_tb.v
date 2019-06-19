`include "seq.v"
module tb;
reg clk,rst,x;
wire z;
seq dut(x,clk,rst,z);
initial begin
	clk=1'b0;
       	rst=1'b1;
	#15 rst=1'b0;
end
initial
forever #5 clk=~clk;


initial begin
	#12 x=0; #10 x=1; #10 x=1; #10 x=1; #10 x=1; #10 x=1; #10 x=1;
	#10 $finish;
end
endmodule

