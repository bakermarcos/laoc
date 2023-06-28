module extensor_PC(Entrada, Saida_PC);
 input [4:0] Entrada;
 output reg [7:0] Saida_PC;


 always @(*) begin
   if (Entrada[4] == 1'b1) begin
     Saida_PC = {{3{1'b1}}, Entrada[4:0]};
   end
   else begin
     Saida_PC = {{3{1'b0}}, Entrada[4:0]};
   end
 end
endmodule


module extensor_numeros(Entrada, Saida_num);
 input [1:0] Entrada;
 output reg [7:0] Saida_num;


 always @(*) begin
   if (Entrada[1] == 1'b1) begin
     Saida_num = {{6{1'b1}}, Entrada[1:0]};
   end
   else begin
     Saida_num = {{6{1'b0}}, Entrada[1:0]};
   end
 end
endmodule