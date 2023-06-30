module somador(entradaPc, saidaPc);
 input [7:0] entradaPc;
 output reg [7:0] saidaPc;


 always @(*) begin
   saidaPc = entradaPc + 8'b00000001;
 end
endmodule

module somadorFinal(entradaPc, saidaPc);
 input [7:0] entradaPc;
 output reg [7:0] saidaPc;


 always @(entradaPc) begin
   saidaPc = entradaPc + 8'b00000001;
 end
endmodule