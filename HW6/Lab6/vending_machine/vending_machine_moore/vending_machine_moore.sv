// Vending Machine RTL Code
module vending_machine_moore( 
 input logic clk, rstn,  
 input logic N, D,
 output logic open);
 
 // state variables and state encoding parameters
 parameter[1:0] CENTS_0=2'b00, CENTS_5=2'b01, CENTS_10=2'b10, CENTS_15=2'b11;
 logic[1:0] present_state, next_state; 

 // Sequential Logic for present state
 always_ff@(posedge clk) begin
  if (!rstn) begin
  
	present_state <= CENTS_0;

  end 
  else begin
  
	present_state <= next_state;
  
  end
 end


 // Combination Logic for Next State and Output
 always_comb begin 
 
	case(present_state)
	
	
		CENTS_0:begin
		
			open = 0;
		
			if (D==1) begin
				next_state = CENTS_10;
			end
			
			else if (N==1) begin
				next_state = CENTS_5;
			end
			
			else begin
				next_state = CENTS_0;
			end
			
		end
		
		
		CENTS_5:begin
		
			open = 0;
		
			if (D==1) begin
				next_state = CENTS_15;
			end
			
			else if (N==1) begin
				next_state = CENTS_10;
			end
			
			else begin
				next_state = CENTS_5;
			end
			
		end
			
			
		CENTS_10:begin
		
			open = 0;
		
			if (D==1) begin
				next_state = CENTS_15;
			end
			
			else if (N==1) begin
				next_state = CENTS_15;
			end
			
			else begin
				next_state = CENTS_10;
			end
			
		end
			
			
		CENTS_15:begin
		
			open = 1;
		
			if (rstn) begin
				next_state = CENTS_15;
			end
			
			else begin
				next_state = CENTS_0;
			end
		
		end
		
		
		default:begin
		
			next_state = CENTS_0;
			open = 0;
			
		end
		
	
	endcase

 end
endmodule: vending_machine_moore

