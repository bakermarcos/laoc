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
        MEMI[10] = 8'b00001000;
        MEMI[11] = 8'b00010000;
        MEMI[12] = 8'b00010111;
        MEMI[13] = 8'b00010111;
        MEMI[14] = 8'b00010101;
        MEMI[15] = 8'b00011010;
        MEMI[16] = 8'b00011100;
        MEMI[17] = 8'b00000101;
        MEMI[18] = 8'b01001111;
        MEMI[19] = 8'b00011111;
        MEMI[20] = 8'b00011101;
        MEMI[21] = 8'b00000101;
        MEMI[22] = 8'b01001111;
        MEMI[23] = 8'b00011111;
        MEMI[24] = 8'b00011101;
        MEMI[25] = 8'b00000101;
        MEMI[26] = 8'b01001111;
        MEMI[27] = 8'b00011111;
        MEMI[28] = 8'b00011101;
        MEMI[29] = 8'b00000101;
        MEMI[30] = 8'b01001111;
        MEMI[31] = 8'b00011111;
        MEMI[32] = 8'b00011101;
        MEMI[33] = 8'b00000101;
        MEMI[34] = 8'b01001111;
        MEMI[35] = 8'b00011111;
        MEMI[36] = 8'b00011101;
        MEMI[37] = 8'b00000101;
        MEMI[38] = 8'b01001111;
        MEMI[39] = 8'b00011111;
        MEMI[40] = 8'b00011101;
        MEMI[41] = 8'b00000101;
        MEMI[42] = 8'b01001111;
        MEMI[43] = 8'b11011111;
        MEMI[44] = 8'b11011111;
        MEMI[45] = 8'b11011111;
        MEMI[46] = 8'b11011111;
        MEMI[47] = 8'b11011111;
        MEMI[48] = 8'b11011111;
        MEMI[49] = 8'b11011111;
        MEMI[50] = 8'b11011111;
        MEMI[51] = 8'b00011011;
        MEMI[52] = 8'b00011011;
        MEMI[53] = 8'b00011001;
        MEMI[54] = 8'b01101101;
        MEMI[55] = 8'b00111111;
        MEMI[56] = 8'b10001100;
        MEMI[57] = 8'b11011011;
        MEMI[58] = 8'b11011011;
        MEMI[59] = 8'b11011001;
        MEMI[60] = 8'b00010001;
        MEMI[61] = 8'b00011101;
        MEMI[62] = 8'b01111100;
        MEMI[63] = 8'b00001001;
        MEMI[64] = 8'b10100100;
        MEMI[65] = 8'b11100000;
    end

    always @(negedge clock) begin
        instrucao = MEMI[endereco];
    end
endmodule