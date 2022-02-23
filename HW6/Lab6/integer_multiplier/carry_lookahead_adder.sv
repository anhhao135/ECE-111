//`include "fulladder.sv"
module carry_lookahead_adder#(parameter N=4)(
  input logic[N-1:0] A, B,
  input logic CIN,
  output logic[N:0] result
);


logic[N:0] l_carry;

assign l_carry[0] = CIN;
assign result[N] = l_carry[N];

genvar i;

generate

	for(i=0; i<N; i++) begin: fa_loop
	
		fulladder fa_inst(
			.a(A[i]),
			.b(B[i]),
			.cin(l_carry[i]),
			.sum(result[i]),
			.cout());
			
	end: fa_loop
	
	for(i=1; i<N+1; i++) begin: cla_loop
		assign l_carry[i] = (A[i-1] & B[i-1]) | (A[i-1] | B[i-1]) & l_carry[i-1];
	end: cla_loop
	
endgenerate



 // Add code for carry lookahead adder 
  
endmodule: carry_lookahead_adder

