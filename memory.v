module memory_wrapper(clk,rst,addr,wr_rd,wdata,rdata,valid,ready);
parameter DEPTH=64;
parameter WIDTH=8;
parameter ADDR_SIZE=6;
input clk,rst,wr_rd,valid;
output reg ready;
input [ADDR_SIZE-1:0] addr;
input [WIDTH-1:0] wdata;
output reg [WIDTH-1:0] rdata;
integer i;

reg [WIDTH-1:0] mem[DEPTH-1:0];

always@(posedge clk) begin
	if(rst==1)begin
		for(i=0;i<DEPTH;i=i+1) begin
			mem[i]=0;
					end
			rdata=0;
			ready=0;
		  end
	else begin
		if(valid==1)begin
			ready=1;
			if(wr_rd==1)begin
			mem[addr]=wdata;
				    end
			else begin
		       rdata=mem[addr];	
		             end
			    end
	 	else begin
			ready=0;
		     end
	      end
			end
endmodule
