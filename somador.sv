module somador(entradaPc, saidaPc);
 input [7:0] entradaPc;
 output reg [7:0] saidaPc;


 always @(*) begin
   saidaPc = entradaPc + 8'b00000001;
 end
endmodule

module somadorFinal(entradaSomaMais1, entradamuxJi, saidaPc);
 input [7:0] entradaSomaMais1;
 input [7:0] entradamuxJi;
 output reg [7:0] saidaPc;


 always @(*) begin
   saidaPc = entradaSomaMais1 + entradamuxJi;
 end
endmodule