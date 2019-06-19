`include "light.v"
module tb;
reg clk;
wire [2:0] light;

cyclic_light dut(clk,light);

initial begin
	clk=0;
	forever #5 clk=~clk;

end

initial begin
	$monitor($time,"RGY=%b",light);
end
initial begin

	#100 $finish;
end
endmodule
