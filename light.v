module cyclic(clk,light);
input clk;
output reg[2:0]light;
reg [1:0]state;
parameter s0=00, s1=01, s2=2;
parameter red=100, green=010, yellow=001;
always@(posedge clk)

	case(state)
	begin
		s0: state<=s1;
		s1: state<=s2;
		s2: state<=s1;
		default: state<=s0;
	end
	endcase
always@(state)
	case(state)
	begin
		s0: light=red;
		s1: light=green;
		s2: light=yellow;
	end
	endcase

endmodule
