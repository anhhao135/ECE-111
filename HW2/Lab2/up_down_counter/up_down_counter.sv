// 4-bit up and down counter RTL code
module up_down_counter    // Module start declaration
 // Parameter declaration, count signal width set to '4'  
 #(parameter WIDTH=4)  
 ( 
    input logic clk,
    input logic clear, 
    input logic select,
    output logic[WIDTH-1:0] count_value
 );

 // Local variable declaration
 logic[WIDTH-1:0] up_count_value, down_count_value; 

 
 up_counter #(.WIDTH(4)) up_counter_instance(
  .clk(clk),
  .clear(clear),
  .count(up_count_value)
 );
 
 down_counter #(.WIDTH(4)) down_counter_instance(
  .clk(clk),
  .clear(clear),
  .count(down_count_value)
 );
 
 mux_2x1 #(.WIDTH(4)) mux_2x1_instance(
  .in0(up_count_value),
  .in1(down_count_value),
  .sel(select),
  .out(count_value)
 );

endmodule: up_down_counter  // Module end declaration