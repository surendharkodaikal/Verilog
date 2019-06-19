module seq(x,clk,rst,z);
input clk,rst,x;
output reg z;
parameter A=0,B=1,C=2,D=3;
reg [1:0] ps,ns;
always@(posedge clk or posedge rst) 
	if(rst) ps<=A;
	else ps<=ns;
always@(ps,x) 
	case(ps)
	A:begin
	       z=x?0:0;
       	       ns=x?B:A;	       
	  end
	B:begin
	        z=x?0:0;
       	       ns=x?C:A;		
	  end
	C:begin
	        z=x?0:0;
       	       ns=x?D:A;		
	  end
	D:begin
	        z=x?1:0;
       	       ns=x?D:A;		
	  end

endcase
endmodule
