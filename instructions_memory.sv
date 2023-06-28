module instructions_memory (
    clock,
    endereco,
    instrucao
);
    input wire clock;
    input wire [7:0] endereco;
    output reg [7:0] instrucao;
    reg [7:0] MEMI [0:255];

    initial begin
        // Alguns valores inicializados apenas para testar a memória
        MEMI[11] = 8'b00011100;
        MEMI[34] = 8'b11100011;
        MEMI[22] = 8'b00000000;
        MEMI[12] = 8'b11100000;
    end

    always @(negedge clock) begin
        instrucao = MEMI[endereco];
    end
endmodule