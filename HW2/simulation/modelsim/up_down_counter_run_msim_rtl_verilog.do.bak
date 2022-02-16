transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Repos/ECE-111/Quartus-Projects/HW2/Lab2/up_down_counter {C:/Repos/ECE-111/Quartus-Projects/HW2/Lab2/up_down_counter/up_down_counter.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/Quartus-Projects/HW2/Lab2/up_down_counter {C:/Repos/ECE-111/Quartus-Projects/HW2/Lab2/up_down_counter/up_counter.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/Quartus-Projects/HW2/Lab2/up_down_counter {C:/Repos/ECE-111/Quartus-Projects/HW2/Lab2/up_down_counter/mux_2x1.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/Quartus-Projects/HW2/Lab2/up_down_counter {C:/Repos/ECE-111/Quartus-Projects/HW2/Lab2/up_down_counter/down_counter.sv}

