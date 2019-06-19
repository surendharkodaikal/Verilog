onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/DEPTH
add wave -noupdate /tb/WIDTH
add wave -noupdate /tb/ADDR_SIZE
add wave -noupdate /tb/clk
add wave -noupdate /tb/rst
add wave -noupdate /tb/wr_rd
add wave -noupdate /tb/valid
add wave -noupdate /tb/ready
add wave -noupdate /tb/addr
add wave -noupdate /tb/wdata
add wave -noupdate /tb/rdata
add wave -noupdate /tb/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {37 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {748 ns}
