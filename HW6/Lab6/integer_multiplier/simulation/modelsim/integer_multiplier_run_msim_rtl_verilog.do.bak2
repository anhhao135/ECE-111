transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Repos/ECE-111/HW6/Lab6/integer_multiplier {C:/Repos/ECE-111/HW6/Lab6/integer_multiplier/fulladder.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/HW6/Lab6/integer_multiplier {C:/Repos/ECE-111/HW6/Lab6/integer_multiplier/carry_lookahead_adder.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/HW6/Lab6/integer_multiplier {C:/Repos/ECE-111/HW6/Lab6/integer_multiplier/integer_multiplier.sv}

