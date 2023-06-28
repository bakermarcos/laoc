module somador(entradaPc, saidaPc);
 input [7:0] entradaPc;
 output reg [7:0] saidaPc;


 always @(entradaPc) begin
   saidaPc = entradaPc + 1;
 end
endmodule