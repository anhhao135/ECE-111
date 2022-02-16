// 2to4 Decoder behavioral level code
module decoder(
 input  logic[1:0] sel,
 output logic[3:0] out
);
 always @(sel or out)
  begin
   case (sel)
    2'b00 : out = 4'b0001;
	 2'b01 : out = 4'b0100;
	 2'b10 : out = 4'b0010;
	 2'b11 : out = 4'b1000;
	 default: out = 4'bZZZZ;

   endcase
  end
endmodule