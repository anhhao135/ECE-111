// UART TX CONTROL RTL Code
module uart_tx_control #(parameter NUM_OF_BYTES = 4)
(
  input logic clk, rstn, // clock, synchronous active low reset 
  input logic [7:0] mem_read_data, // input data bytes from memory
  output logic [3:0] mem_read_addr, // address to memory to read input data bytes
  output logic mem_read_enable, // if set to '0', read data bytes from memory
  output logic transmission_done, // set to '1' by FSM when all data bytes are transmitted to receiver
  input logic uart_tx_done, // comes from uart_tx FSM as indication that data byte requested by tx control FSM has been transmissted to uart receiver
  output logic [7:0] uart_tx_data, // data byte sent to uart_tx FSM to transmit serially data to uart_rx
  output logic uart_tx_start // tx control FSM instructs uart_tx FSM to start data byte transmission to uart_rx
);

// Variable to count number of data bytes transmitted
integer j;

// state encoding and state variable
enum logic[2:0]{
  IDLE                = 3'b000,  // IDLE FSM State
  READ                = 3'b001,  // Memory Read FSM State to read input message data byte
  DELAY               = 3'b010,  // Wait for Read data from memory in testbench to be available in tx control FSM
  TRANSMIT            = 3'b011,  // Send data byte to uart_tx FSM and instruct uart_tx FSM to start serial data transmission to uart_rx
  WAIT                = 3'b100   // Waits for tx done from uart_tx FSM which indicates uart_tx has transmitted 1 data byte to uart_rx 
} state;

// FSM with single always block for next state, 
// present state flipflop and output logic 
// Note : use non-blocking assignment statement in always_ff block. 
// Do not have any blocking assignment statements inside alwaya_ff block
always_ff@(posedge clk) begin
 if(!rstn) begin
      mem_read_addr <= 0;
      mem_read_enable <= 0;        
      transmission_done <= 0;
      uart_tx_data <= 0;
      uart_tx_start <= 0;
      state <= IDLE;
      j <= 0;
 end
 else begin
  case(state)
  
     IDLE: begin
       mem_read_addr <= 0;
       mem_read_enable <= 0;       
       transmission_done <= 0;
       uart_tx_data <= 0;
       uart_tx_start <= 0;
       state <= READ;
       j <= 0;
     end
     
     READ: begin
       if(j < NUM_OF_BYTES) begin
			mem_read_addr <= j;
			mem_read_enable <= 1;
			transmission_done <= 0;
			uart_tx_data <= 0;
			uart_tx_start <= 0;
			state <= DELAY;
        
       end
       else begin
		 
			transmission_done <= 1;
			state <= IDLE;
			

       end
     end

     DELAY: begin
      state<=TRANSMIT;
     end

     TRANSMIT: begin
	  
		uart_tx_data <= mem_read_data;
		uart_tx_start <= 1;
		state <= WAIT;

     end
     

     WAIT: begin
       if(uart_tx_done == 1) begin
		 
			j <= j + 1;
			state <= READ;

       end
       else begin
			
			state <= WAIT;

       end
     end

     default: begin
        state <= IDLE;
     end
  endcase
 end
end
endmodule: uart_tx_control


