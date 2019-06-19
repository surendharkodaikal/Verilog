vlog memory.v
vlog tb_memory.v
vsim -novopt work.tb +testname=test_fd_wr_bd_rd
do wave_memory.do
run -all

