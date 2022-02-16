//RTL Model for Linear Feedback Shift Register
module lfsr
#(parameter N = 4) // Number of bits for LFSR
(
  input logic clk, reset, load_seed,
  input logic[N-1:0] seed_data,
  output logic lfsr_done,
  output logic[N-1:0] lfsr_data
);

logic[N-1:0] shift_reg;
logic[N-1:0] temp_seed_data;




always_ff@(posedge clk, negedge reset)
begin
	if(reset == 0) begin
		shift_reg <= 0;
	end
	
	else if(load_seed == 1) begin
		shift_reg <= seed_data;
		temp_seed_data <= seed_data;
	end
	
	else begin
	
		case(N)
			2 : begin
					shift_reg[0] <= shift_reg[1] ^ shift_reg[0];
				 end
			3 : begin
					shift_reg[0] <= shift_reg[2] ^ shift_reg[1];
				 end
			4 : begin
					shift_reg[0] <= shift_reg[3] ^ shift_reg[2];
				 end
			5 : begin
					shift_reg[0] <= shift_reg[4] ^ shift_reg[2];
				 end
			6 : begin
					shift_reg[0] <= shift_reg[5] ^ shift_reg[4];
				 end
			7 : begin
					shift_reg[0] <= shift_reg[6] ^ shift_reg[5];
				 end
			8 : begin
					shift_reg[0] <= shift_reg[7] ^ shift_reg[5] ^ shift_reg[4] ^ shift_reg[3];
				 end
			default : shift_reg[0] <= 1'b0;
		endcase
		
		
		for (int i=0; i<N-1; i++) begin
			shift_reg[i+1] <= shift_reg[i];
		end
	end

end

always_comb begin
	lfsr_data <= shift_reg;
	
	if (shift_reg === temp_seed_data) begin
		lfsr_done <= 1'b1;
	end else begin
		lfsr_done <= 1'b0;
	end
	
end


//student to add implementation for LFSR code 
 
endmodule: lfsr