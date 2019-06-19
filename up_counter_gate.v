`include "dff.v"
module up_counter(clk,rst,count);
input clk,rst;
output [2:0] count;
wire [2:0] count_b;

assign count_b=~count;

and g1(n1, count[2],count_b[1]);
and g2(n2, count[2],count_b[0]);
and g3(n3, count_b[2],count[1], count[0]);
or g4(n4,n1,n2,n3);
xor g5(n5, count[1], count[0]);

dff g6(clk,rst,n4,count[2]);
dff g7(clk,rst,n5,count[1]);
dff g8(clk,rst,count_b[0],count[0]);



endmodule
