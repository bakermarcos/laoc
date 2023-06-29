module nRisc (
    Clock,
    reset,
    Instrucao,
    SaidaPCLeEndereco,
    LeDado,
    Data2,
    Data1,
    EscMem,
    LerMem
);
    input Clock, reset;
    output [7:0] SaidaPCLeEndereco;
    input [7:0] Instrucao;
    input [7:0] LeDado;
    wire [7:0] Pcmais1;

    // TODO: verificar VARIÁVEL
    wire [2:0] wire_dado_concatenado;
    wire [2:0] wire_LeReg1, wire_LeReg2, wire_EscreveReg;
    // TODO: verificar VARIÁVEL
    // reg [2:0] reg_set = 3'b111;

    // TODO: verificar VARIÁVEL aonde vai exatamente
    wire [7:0] WriteData;

    // sinas controle
    wire Beqz, RegFonte, ULAFonte, SelDest, Ji, EscReg, EscPC;
    output wire EscMem, LerMem;
    wire [1:0] ULAOp;
    output wire [7:0] Data1, Data2;

    // TODO: verificar VARIÁVEL
    wire [7:0] DadoExtendido;
    wire Zero;
    wire [7:0] Entrada1Ula, Entrada2Ula, Resultado;
    // TODO: verificar VARIÁVEL wire_mux6
    wire wire_mux6, wire_saida_and;
    wire [7:0] EntradaPC;

    //module PC (clock, reset, EntradaPC, EscPC, SaidaPC):;
    PC pc(Clock, reset, EntradaPC, EscPC, SaidaPCLeEndereco);
    somador soma(SaidaPCLeEndereco, Pcmais1);

    // Concatenador (Entrada, Saida)
    concat concatenador(Instrucao[2:0], wire_dado_concatenado);

    // Mux (Dado0, Dado1, Sinal, Saida):
    mux2 muxRegEsc(Instrucao[4:1], Instrucao[2:0], EscReg, wire_EscreveReq);
    //module ExtensorDeSinal (Entrada, Saida)
    ExtensorDeSinal extensor(Instrucao[1:0], DadoExtendido);

    // Mux3 (Dado0, Dado1, Dado2, Sinal, Saida):
    mux3 muxUla1(DadoExtendido, 2'b00, Data2, ULAFonte, Entrada1Ula);

    // Mux (Dado0, Dadol, Sinal, Saida):
    mux2 muxEscMem(Data1, Data2, SelDest, WriteData);

    // Controle (Opcode, ULAOp, Beqz, RegFonte, EscMem, ULAFonte, LerMem, SelDest, Ji, EscReg, EscPC)
    unidade_controle controle(Instrucao[7:5], ULAOp, Beqz, RegFonte, EscMem, ULAFonte, LerMem, SelDest, Ji, EscReg, EscPC);

    // module registerBox (Readl, Read2, EscReg, WriteData, wire_EscreveReg, Data1, Data2, clock, reset);
    registerBox BancoReg(
        wire_LeRegl,
        wire_LeReg2,
        EscReg,
        WriteData,
        wire_EscreveReg,
        Data1,
        Data2,
        Clock,
        reset
    );

    //module Ula(Dadol, Dado2, ULAOp, Zero, Resultado):
    Ula ula(Entrada1Ula, Data2, ULAOp, Zero, Resultado);

    mux2 muxBeqz(DadoExtendido, 2'b00, wire_saida_and, WriteData);

    AND porta_and(wire_muxé, Ji, wire_saida_and);

    mux2 muxJi(Pcmais1, LeDado, Ji, EntradaPC);

endmodule;
