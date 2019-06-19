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
output reg [NUM_MEMS*WIDTH-1:0] rdata;

memory mem_inst0(clk,rst,addr,wr_rd,wdata[WIDTH-1:0], rdata[WIDTH-1:0],valid[0], ready[0]);
memory mem_inst0(clk,rst,addr,wr_rd,wdata[2*WIDTH-1:1*WIDTH ], rdata[2*WIDTH-1:1*WIDTH],valid[1], ready[1]);
memory mem_inst0(clk,rst,addr,wr_rd,wdata[3*WIDTH-1:2*WIDTH ], rdata[3*WIDTH-1:2*WIDTH],valid[2], ready[2]);
memory mem_inst0(clk,rst,addr,wr_rd,wdata[4*WIDTH-1:3*WIDTH ], rdata[4*WIDTH-1:3*WIDTH],valid[3], ready[3]);
memory mem_inst0(clk,rst,addr,wr_rd,wdata[5*WIDTH-1:4*WIDTH ], rdata[5*WIDTH-1:4*WIDTH],valid[4], ready[4]);
memory mem_inst0(clk,rst,addr,wr_rd,wdata[6*WIDTH-1:5*WIDTH ], rdata[6*WIDTH-1:5*WIDTH],valid[5], ready[5]);
memory mem_inst0(clk,rst,addr,wr_rd,wdata[7*WIDTH-1:6*WIDTH ], rdata[7*WIDTH-1:6*WIDTH],valid[6], ready[6]);
memory mem_inst0(clk,rst,addr,wr_rd,wdata[8*WIDTH-1:7*WIDTH ], rdata[8*WIDTH-1:7*WIDTH],valid[7], ready[7]);

endmodule

