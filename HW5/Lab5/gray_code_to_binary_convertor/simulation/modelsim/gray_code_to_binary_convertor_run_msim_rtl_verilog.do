transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Repos/ECE-111/Quartus-Projects/HW5/Lab5/gray_code_to_binary_convertor {C:/Repos/ECE-111/Quartus-Projects/HW5/Lab5/gray_code_to_binary_convertor/gray_code_to_binary_convertor.sv}

