`timescale 10ns/10ps
module top;
parameter TP=10;
reg clk;
real freq;
real tp;
real jitter_factor;
real tp_jitter;
integer jitter;
realtime cur_pos_edge_time;
realtime prev_pos_edge_time;
real tp_wave;
real freq_wave;
reg with_jitter;
initial begin
	$value$plusargs("freq=%d",freq);
	$value$plusargs("jitter=%d",jitter);
	$value$plusargs("with_jitter=%d",with_jitter);

		tp=(10**8)/(freq*10**6);
		clk=0;
	forever begin
			if(with_jitter == 1) begin
			jitter_factor=$urandom_range(100-jitter,100+jitter)/100.0;				      tp_jitter=tp*jitter_factor;
			#(tp_jitter/2.0) clk=~clk; 
				end
	if(with_jitter == 0)begin
		#(tp/2.0) clk=~clk; 
		end
	end
end

initial begin
	#200;
	$finish;
end 

always@(posedge clk) begin
	prev_pos_edge_time=cur_pos_edge_time;
	cur_pos_edge_time=$realtime;
	tp_wave=cur_pos_edge_time-prev_pos_edge_time;
	freq_wave=(1*10**8)/(tp_wave*10**6);
	$display("freq_wave=%f",freq_wave);
end
endmodule

