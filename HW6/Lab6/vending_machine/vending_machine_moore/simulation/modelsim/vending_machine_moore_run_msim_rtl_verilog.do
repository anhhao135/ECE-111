transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Repos/ECE-111/HW6/Lab6/vending_machine/vending_machine_moore {C:/Repos/ECE-111/HW6/Lab6/vending_machine/vending_machine_moore/vending_machine_moore.sv}

