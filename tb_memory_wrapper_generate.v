`include "memory_wrapper_generate.v"
module tb;

parameter NUM_MEMS=4;
parameter DEPTH_T=512;
parameter WIDTH=16;
parameter ADDR_SIZE=9;
parameter FD=0;
parameter BD=1;

reg clk,rst,wr_rd;
reg [NUM_MEMS-1:0]valid;
wire [NUM_MEMS-1:0]ready;
reg [ADDR_SIZE-1:0] addr;
reg [NUM_MEMS*WIDTH-1:0] wdata;
wire [NUM_MEMS*WIDTH-1:0] rdata;
integer i;
reg [40*8:1] testcase;

memory_wrapper #(.NUM_MEMS(NUM_MEMS),.DEPTH(DEPTH_T),.WIDTH(WIDTH),.ADDR_SIZE(ADDR_SIZE)) dut(clk,rst,addr,wr_rd,wdata,rdata,valid,ready);

initial begin 
	clk=0;
	forever #5 clk=~clk;
	end

task memory_write(input reg[ADDR_SIZE-1:0] start_addr, input [ADDR_SIZE-1:0] NUM_TFRS, input fd_bd, input reg[40*8:1]file_name);
begin
	if (fd_bd == FD)begin
//write of memory
	for(i=start_addr; i <= start_addr + NUM_TFRS; i=i+1)begin
				@(posedge clk);
				addr=i;
				wdata<=$random;
				wr_rd=1;
				valid={NUM_MEMS*{1'b1}};   //4'b1111  because of 4 memory NUM_MEMS
				wait (ready=={NUM_MEMS*{1'b1}});    //4'b1111
			//	@(posedge clk);
			//	valid=0;
			       end
		@(posedge clk);
		valid=0;
		addr=0;
		wr_rd=0;
		//wait (ready==0);
	end
	else begin
	//	$readmemh(file_name, dut.mem , start_addr , start_addr + NUM_TFRS);

	end
	  
end
endtask

task memory_read(input reg[ADDR_SIZE-1:0] start_addr, input [ADDR_SIZE-1:0] NUM_TFRS, input fd_bd,input reg [40*8:1] file_name);
begin
	if (fd_bd == FD) begin
//read of memory
	
	for(i=start_addr;i<=start_addr+NUM_TFRS;i=i+1)begin
				@(posedge clk);
				addr=i;
				wr_rd=0;
				valid={NUM_MEMS*{1'b1}};
				wait (ready=={NUM_MEMS*{1'b1}});
			//	@(posedge clk);
			//	valid=0;
			       end
		@(posedge clk);
		valid=0;
		addr=0;
		wr_rd=0;
	end
	else begin
	//	$writememb(file_name, dut.mem, start_addr , start_addr + NUM_TFRS);

	end
end
endtask

initial begin
	$value$plusargs("testname=%s",testcase);    // instead of testcase something else can write
	rst=1;
	repeat(2) @(posedge clk);
	rst=0; 
case(testcase)
"test_fd_wr_fd_rd" : begin    // we r giving string name for readable
			memory_write(0,DEPTH_T/2,FD,"dummy.hex");
			memory_read(0,DEPTH_T/2,FD,"dummy.hex");
			memory_write(DEPTH_T*0.75,DEPTH_T*0.25,FD,"dummy.hex");
			memory_read(DEPTH_T*0.75,DEPTH_T*0.25,FD,"dummy.hex");
		//	memory_write(0,DEPTH_T-1,FD,"dummy.hex");
		//	memory_read(0,DEPTH_T-1,FD,"dummy.hex");

	end 
"test_bd_wr_bd_rd" : begin
		memory_write(0,DEPTH_T,BD,"image.hex");
		memory_read(0,(DEPTH_T/2)-1,BD, "image1.bin");
		memory_read(DEPTH_T/2,DEPTH_T/2,BD,"image2.bin");
	//	$readmemh("image.hex", dut.mem , 0 , DEPTH_T-1);
	//	$readmemb("image.bin", dut.mem, 0 , DEPTH_T)
	//	$writememb("image1.bin", dut.mem, 0 , DEPTH_T/2-1);
	//	$writememb("image2.bin", dut.mem, DEPTH_T/2 , DEPTH_T-1);
	end

"test_fd_wr_bd_rd" : begin
		memory_write(0,DEPTH_T-1, FD,"dummy.hex");
		memory_read(0,DEPTH_T-1, BD,"image01.bin");
	//	memory_read(DEPTH_T/2,DEPTH_T/2,BD,"image02.bin");
end

"test_bd_wr_fd_rd" : begin

		memory_write(0,DEPTH_T-1,BD,"image.hex");
		memory_read(0,DEPTH_T-1,FD,"dummy.hex");
end
endcase
		#100;
		$finish;
	end
endmodule 
