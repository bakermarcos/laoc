module mux1(Dado0, Dado1, Sinal, Saida);
 input [2:0] Dado0, Dado1;
 input Sinal;
 output reg [2:0] Saida;
  always @(Sinal or Dado0 or Dado1)
 begin
   case (Sinal)
     1'b0: Saida = Dado0;
     1'b1: Saida = Dado1;
   endcase
 end
endmodule


module mux2(Dado0, Dado1, Dado2, Sinal, Saida);
 input [2:0] Dado0, Dado1, Dado2;
 input [1:0] Sinal;
 output reg [2:0] Saida;
  always @(Sinal or Dado0 or Dado1 or Dado2)
 begin
   case (Sinal)
     2'b00: Saida = Dado0;
     2'b01: Saida = Dado1;
     2'b10: Saida = Dado2;
   endcase
 end
endmodule

module mux3(Dado0, Dado1, Sinal, Saida);
 input [7:0] Dado0, Dado1;
 input Sinal;
 output reg [7:0] Saida;
  always @(Sinal or Dado0 or Dado1)
 begin
   case (Sinal)
     1'b0: Saida = Dado0;
     1'b1: Saida = Dado1;
   endcase
 end
endmodule


module mux4(Dado0, Dado1, Sinal, Saida);
 input Dado0, Dado1;
 input Sinal;
 output reg Saida;
  always @(Sinal or Dado0 or Dado1)
 begin
   case (Sinal)
     1'b0: Saida = Dado0;
     1'b1: Saida = Dado1;
   endcase
 end
endmodule