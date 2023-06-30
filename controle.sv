module unidade_controle(
 input [2:0] Opcode,
 output reg [1:0] ULAOp,
 output reg Beqz,
 output reg RegFonte,
 output reg EscMem,
 output reg [1:0] ULAFonte,
 output reg LerMem,
 output reg SelDest,
 output reg Ji,
 output reg EscReg,
 output reg EscPC
);
  initial begin
    Beqz = 1'b0;
    RegFonte = 1'b0;
    ULAOp = 3'b00;
    EscMem = 1'b0;
    ULAFonte = 2'b00;
    LerMem = 1'b0;
    SelDest = 1'b0;
    Ji = 1'b0;
    EscReg = 1'b0;
    EscPC = 1'b1;
  end
  always @(*) begin
   case(Opcode)
     3'b000: begin
       Beqz = 1'b0;
       RegFonte = 1'b0;
       ULAOp = 3'b10;
       EscMem = 1'b0;
       ULAFonte = 2'b00;
       LerMem = 1'b0;
       SelDest = 1'b0;
       Ji = 1'b0;
       EscReg = 1'b1;
       EscPC = 1'b1;
     end
     3'b001: begin
       Beqz = 1'b0;
       RegFonte = 1'b0;
       ULAOp = 3'b00;
       EscMem = 1'b0;
       ULAFonte = 2'b00;
       LerMem = 1'b1;
       SelDest = 1'b0;
       Ji = 1'b0;
       EscReg = 1'b1;
       EscPC = 1'b1;
     end
     3'b010: begin
       Beqz = 1'b0;
       RegFonte = 1'b0;
       ULAOp = 2'b00;
       EscMem = 1'b1;
       ULAFonte = 2'b00;
       LerMem = 1'b0;
       SelDest = 1'b1;
       Ji = 1'b0;
       EscReg = 1'b0;
       EscPC = 1'b1;
     end
     3'b011: begin
       Beqz = 1'b1;
       RegFonte = 1'b0;
       ULAOp = 3'b00;
       EscMem = 1'b0;
       ULAFonte = 2'b00;
       LerMem = 1'b0;
       SelDest = 1'b0;
       Ji = 1'b0;
       EscReg = 1'b0;
       EscPC = 1'b1;
     end
     3'b100: begin
       Beqz = 1'b0;
       RegFonte = 1'b0;
       ULAOp = 3'b11;
       EscMem = 1'b0;
       ULAFonte = 2'b01;
       LerMem = 1'b0;
       SelDest = 1'b0;
       Ji = 1'b0;
       EscReg = 1'b1;
       EscPC = 1'b1;
     end
     3'b101: begin
       Beqz = 1'b0;
       RegFonte = 1'b0;
       ULAOp = 3'b00;
       EscMem = 1'b0;
       ULAFonte = 2'b00;
       LerMem = 1'b0;
       SelDest = 1'b0;
       Ji = 1'b1;
       EscReg = 1'b0;
       EscPC = 1'b1;
     end
     3'b110: begin
       Beqz = 1'b0;
       RegFonte = 1'b0;
       ULAOp = 3'b01;
       EscMem = 1'b0;
       ULAFonte = 2'b00;
       LerMem = 1'b0;
       SelDest = 1'b0;
       Ji = 1'b0;
       EscReg = 1'b1;
       EscPC = 1'b1;
     end
     3'b111: begin
       Beqz = 1'b0;
       RegFonte = 1'b0;
       ULAOp = 3'b00;
       EscMem = 1'b0;
       ULAFonte = 2'b00;
       LerMem = 1'b0;
       SelDest = 1'b0;
       Ji = 1'b0;
       EscReg = 1'b0;
       EscPC = 1'b0;
     end
   endcase
 end
 endmodule