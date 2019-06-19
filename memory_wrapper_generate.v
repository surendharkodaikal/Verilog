module memory_wrapper(clk,rst,addr,wr_rd,wdata,rdata,valid,ready);

parameter NUM_MEMS=8;
parameter DEPTH=64;
parameter WIDTH=8;
parameter ADDR_SIZE=6;
input clk,rst,wr_rd;
input [NUM_MEMS-1:0] valid;
output [NUM_MEMS-1:0] ready;
input [ADDR_SIZE-1:0] addr;
input [NUM_MEMS*WIDTH-1:0] wdata;
output [NUM_MEMS*WIDTH-1:0] rdata;

generate
genvar i;
for(i=0; i<NUM_MEMS; i=i+1) begin

memory #(.DEPTH(DEPTH),.WIDTH(WIDTH),.ADDR_SIZE(ADDR_SIZE)) mem_inst(clk,rst,addr,wr_rd,wdata[(i+1)*WIDTH-1:i*WIDTH ], rdata[(i+1)*WIDTH-1:i*WIDTH],valid[i], ready[i]);
end

endgenerate
endmodule

