module concat (
 input [1:0] Entrada,
 output reg [2:0] Saida
);
 always @(*)
 begin
   Saida[2] = 0;
   Saida[1] = Entrada[1];
   Saida[0] = Entrada[0];
 end
endmodule