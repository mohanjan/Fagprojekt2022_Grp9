vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr -mfcu \
"../../../../project_with_chisel_file.gen/sources_1/ip/xadc_wiz_0/xadc_wiz_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

