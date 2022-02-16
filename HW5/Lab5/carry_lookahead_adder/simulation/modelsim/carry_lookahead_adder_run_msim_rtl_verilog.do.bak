transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Repos/ECE-111/Quartus-Projects/HW5/Lab5/carry_lookahead_adder {C:/Repos/ECE-111/Quartus-Projects/HW5/Lab5/carry_lookahead_adder/fulladder.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/Quartus-Projects/HW5/Lab5/carry_lookahead_adder {C:/Repos/ECE-111/Quartus-Projects/HW5/Lab5/carry_lookahead_adder/carry_lookahead_adder.sv}

