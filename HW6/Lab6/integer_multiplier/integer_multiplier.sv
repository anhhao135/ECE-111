`timescale 1ns/1ps
// `include "carry_lookahead_adder.sv"

module integer_multiplier // Module start declaration
#(parameter N=4) // Parameter declaration
(
  input clock, reset, start,
  input logic[N-1:0] multiplicand, multiplier,
  output logic[(2*N):0] product, 
  output logic done
);

// Count variable for ADD/SHIFT stages
logic [$clog2(N)-1:0] count;

// Register to load multiplicand value
logic[N-1:0] load_reg;

// Register to store Adder sum and multipiler
logic[(2*N):0] shift_reg;

// wires to connect with carry lookahead adder
logic[N-1:0] add_operand1, add_operand2;
logic[N:0] sum;

// next_state encoding and next_state variable
enum logic[2:0]{
  IDLE             = 3'b000,
  INITIALIZE       = 3'b001,
  TEST             = 3'b010,
  ADD              = 3'b011,
  SHIFT_AND_COUNT  = 3'b100,
  DONE             = 3'b101
} next_state;


// Instantiate N-bit carry lookahead adder 
// Pass add_operand1, add_operand2 and sum
// Tie CIN to '0'
carry_lookahead_adder #(.N(N)) adder_inst( 
	.A(add_operand1),
	.B(add_operand2),
	.CIN(1'b0),
	.result(sum)
);


// Control FSM for Integer Multiplier
// Use Single always block FSM approach
// Use *only* non-blocking assignment statements within always block
always_ff@(posedge clock, posedge reset) begin
 if(reset) begin
   count <= 0;
   next_state <= IDLE;
   load_reg <= 0;
   shift_reg <= 0;
 end
 else begin
    case(next_state)
	 
       IDLE: begin
		 
			if (!start) begin
				next_state <= IDLE;
			end
			else begin
				next_state <= INITIALIZE;
			end
		 
       end
		 
		 
       INITIALIZE: begin
			count <= 0;
         shift_reg <= {1'b0, {N{1'b0}}, multiplier};
			next_state <= TEST;
			
       end

        // Check shift register LSB and based on that perform ADD/Shift operation
        // if LSB='1' then perform ADD followed by Right Shift by 1
        // if LSB='0' then perform Right Shift by 1
		 TEST: begin
			if(shift_reg[0] == 1'b1) begin
			
				add_operand1 <= multiplicand;
				add_operand2 <= shift_reg[(2*N)-1:N];
				next_state <= ADD;
				
		   end
		   else begin
				add_operand1 <= 0;
				add_operand2 <= shift_reg[(2*N)-1:N];
				next_state <= SHIFT_AND_COUNT;
         end
		 end
		 
		 
		 ADD: begin
			shift_reg <= {sum, shift_reg[N-1:0]};
			next_state <= SHIFT_AND_COUNT;
		 
		 end
		 
		 
		 SHIFT_AND_COUNT: begin
		 
			if (count == N-1) begin
				shift_reg <= shift_reg >> 1;
				next_state <= DONE;
			end
			else begin
				shift_reg <= shift_reg >> 1;
				count <= count + 1;
				next_state <= TEST;
			end
		 
		 end

		 
		 DONE: begin
		 
			next_state <= IDLE;
		 
		 end
		 
		 
    endcase
 end
end

// Generate done=1 when FSM reaches DONE state
assign done = (next_state == DONE) ? 1 : 0;

// Generate Product in DONE state by loading shift_reg value to it
assign product = (next_state == DONE) ? shift_reg : 0;

endmodule: integer_multiplier

