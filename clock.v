module top;
parameter TP=10;
reg clk;
real tp;
real freq;
initial begin
	$value$plusargs("freq=%d",freq);
	tp=(10**8)/(freq*10**6);
	clk=0;
	forever #(TP/2.0) clk=~clk;
end 

initial begin
	#400;
	$finish;
end

endmodule

