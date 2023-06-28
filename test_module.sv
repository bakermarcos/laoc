module Computador;

    reg Clock, reset;

    wire [7:0] LeEndereco;
    wire [7:0] Instrucao;
    wire [7:0] Endereco;
    wire [7:0] EscreveDado;
    wire MemWrite, MemRead;
    wire [7:0] LeDado;

    nRisc processador (
        .Clock(Clock),
        .reset(reset),
        .Instrucao(Instrucao),
        .LeEndereco(LeEndereco),
        .LeDado(LeDado),
        .Endereco(Endereco),
        .EscreveDado(EscreveDado),
        .MemWrite(MemWrite),
        .MemRead(MemRead)
    );

    //module memoria de_dados (clock, memWrite, memRead, endereco, escreveDado, leDado):
    memoria de dados MemD (
        .Clock(Clock),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .Endereco(Endereco),
        .EscreveDado(EscreveDado),
        .LeDado(LeDado)
    );

    integer i;

    initial begin
        Clock = 0;
        reset = 1;
        forever begin
            #1;
            Clock = ~Clock;
        end
    end

    initial begin
        $monitor("Time=%0d Clock=%b SaidaPC=%d Instrucao=%b Maior ($S3)=%d",
            $time, Clock, processador.LeEndereco, processador.Instrucao[7:5], processador.BancoReg.RF[6]);
    end

endmodule
