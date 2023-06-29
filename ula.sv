module ula(Dado1, Dado2, UlaOp, Zero, Resultado);
 input [7:0] Dado1, Dado2;
 input [1:0] UlaOp;
 output reg Zero;
 output reg [7:0] Resultado;
  always @(*) begin
   Zero = 1'b0;
   case (UlaOp)
     2'b10: begin
       Resultado = Dado1 + Dado2;
     end
     2'b00: begin
       if (Dado1 == Dado2) begin
         Zero = 1'b1;
       end
     end
    //  SIP
     2'b11: begin
       if (Dado1[0] == 1'b0) begin
         Resultado = 8'b11111111;
       end
       else begin
         Resultado = 8'b00000000;
       end
     end
     2'b01: begin
       Resultado = Dado1 - Dado2;
     end
   endcase
 end
endmodule