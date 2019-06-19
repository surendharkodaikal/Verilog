vlog memory_wrapper_generate.v
vlog tb_memory_wrapper_generate.v
vsim -novopt work.tb +testname=test_fd_wr_fd_rd
do wave_memory.do
run -all
