transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Repos/ECE-111/Quartus-Projects/HW1/Lab1 {C:/Repos/ECE-111/Quartus-Projects/HW1/Lab1/fulladder_behavioral.sv}

