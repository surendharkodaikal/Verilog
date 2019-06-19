vlog up_counter.v
vlog tb_up_counter.v
vsim -novopt work.tb
do counter.do
run -all 
