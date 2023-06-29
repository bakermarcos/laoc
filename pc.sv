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
    output wire [7:0] SaidaPC;
    reg [7:0] PC = 8'b00000000;

    always @(posedge clock) begin
        if (EscPC) begin
            PC = EntradaPC;
        end
    end

    assign SaidaPC = PC;

endmodule