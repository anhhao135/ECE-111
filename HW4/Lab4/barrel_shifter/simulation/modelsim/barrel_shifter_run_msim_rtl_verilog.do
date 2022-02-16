transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Repos/ECE-111/Quartus-Projects/HW4/Lab4/barrel_shifter {C:/Repos/ECE-111/Quartus-Projects/HW4/Lab4/barrel_shifter/mux_2x1_behavioral.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/Quartus-Projects/HW4/Lab4/barrel_shifter {C:/Repos/ECE-111/Quartus-Projects/HW4/Lab4/barrel_shifter/barrel_shifter.sv}

