module PC (
    clock,
    reset,
    EntradaPC,
    EscPC,
    SaidaPC
);
    input wire clock;
    input wire reset;
    input wire [7:0] EntradaPC;
    input wire EscPC;
    output reg [7:0] SaidaPC;

    initial begin
    	SaidaPC = 8'b00000000;
    end

    always @(posedge clock) begin
        if (EscPC == 0) begin
            SaidaPC = SaidaPC;
        end
        else if (EscPC==1) begin
            SaidaPC = EntradaPC;
        end
    end

endmodule