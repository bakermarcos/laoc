module instructions_memory (
    clock,
    endereco,
    instrucao
);
    input clock;
    input wire [7:0] endereco;
    output reg [7:0] instrucao;
    reg [7:0] MEMI [255:0];

    initial begin
        // Alguns valores inicializados apenas para testar a memória
        MEMI[10] = 8'b00000101;
        MEMI[11] = 8'b00000010;
        MEMI[12] = 8'b00000001;
        MEMI[13] = 8'b00011110;
        MEMI[14] = 8'b00011110;
        MEMI[15] = 8'b00001110;
        MEMI[16] = 8'b01101101;
        MEMI[17] = 8'b00111111;
        MEMI[18] = 8'b10001100;
        MEMI[19] = 8'b11011110;
        MEMI[20] = 8'b11011110;
        MEMI[21] = 8'b11001110;
        MEMI[22] = 8'b00001001;
        MEMI[23] = 8'b00001111;
        MEMI[24] = 8'b01111100;
        MEMI[25] = 8'b00001010;
        MEMI[26] = 8'b10100100;
        MEMI[27] = 8'b11100000;    
    end

    always @(negedge clock) begin
        instrucao = MEMI[endereco];
    end
endmodule
