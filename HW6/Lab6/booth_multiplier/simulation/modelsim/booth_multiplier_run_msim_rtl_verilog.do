transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Repos/ECE-111/HW6/Lab6/booth_multiplier {C:/Repos/ECE-111/HW6/Lab6/booth_multiplier/fulladder.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/HW6/Lab6/booth_multiplier {C:/Repos/ECE-111/HW6/Lab6/booth_multiplier/carry_lookahead_adder.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/HW6/Lab6/booth_multiplier {C:/Repos/ECE-111/HW6/Lab6/booth_multiplier/booth_multiplier.sv}

