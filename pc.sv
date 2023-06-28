module PC (
    clock,
    EntradaPC,
    PCWrite,
    SaidaPC
);
    input wire clock;
    input wire [7:0] EntradaPC;
    input wire PCWrite;
    output wire [7:0] SaidaPC;
    reg [7:0] PC = 8'b00000000;

    always @(posedge clock) begin
        if (PCWrite) begin
            PC = EntradaPC;
        end
    end

    assign SaidaPC = PC;

endmodule