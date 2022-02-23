transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Repos/ECE-111/HW7/Lab7/uart_top/uart_tx {C:/Repos/ECE-111/HW7/Lab7/uart_top/uart_tx/uart_tx.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/HW7/Lab7/uart_top/uart_rx {C:/Repos/ECE-111/HW7/Lab7/uart_top/uart_rx/uart_rx.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/HW7/Lab7/uart_top {C:/Repos/ECE-111/HW7/Lab7/uart_top/uart_top.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/HW7/Lab7/uart_control_system {C:/Repos/ECE-111/HW7/Lab7/uart_control_system/uart_tx_control.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/HW7/Lab7/uart_control_system {C:/Repos/ECE-111/HW7/Lab7/uart_control_system/uart_rx_control.sv}
vlog -sv -work work +incdir+C:/Repos/ECE-111/HW7/Lab7/uart_control_system {C:/Repos/ECE-111/HW7/Lab7/uart_control_system/uart_control_system.sv}

