module data_memory (
    clock,
    memWrite,
    memRead,
    endereco,
    escreveDado,
    leDado
);
    input clock, memWrite, memRead;
    input [7:0] endereco, escreveDado;
    output reg [7:0] leDado;
    reg [7:0] MEMD [255:0];

    // Vetor contido na memória 0 a 6 {1,2,3,6,4,5,7}
    initial begin
        MEMD[0] = 8'b00000001;
        MEMD[1] = 8'b00000010;
        MEMD[2] = 8'b00000011;
        MEMD[3] = 8'b00000100;
        MEMD[4] = 8'b00000101;
        MEMD[5] = 8'b00000110;
        MEMD[6] = 8'b00000111;
        MEMD[7] = 8'b00001101;
        MEMD[9] = 8'b00011011;
    end

    // Leitura
    always @(negedge clock) begin
        if (memRead) begin
            leDado = MEMD[endereco];
        end
    end

    // Escrita
    always @(posedge clock) begin
        if (memWrite) begin
            MEMD[endereco] = escreveDado;
        end
    end
endmodule