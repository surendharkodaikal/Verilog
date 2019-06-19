vlog jitter.v
vsim -novopt work.top +freq=100 +jitter=5 +with_jitter=1 
do wave_jitter1.do
run -all
