module PC (
    clock,
    reset,
    EntradaPC,
    EscPC,
    SaidaPC
);
    input clock, reset;
    input wire [7:0] EntradaPC;
    input EscPC;
    output reg [7:0] SaidaPC;

    initial begin
    	SaidaPC = 8'b00001010;
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