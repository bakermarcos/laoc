`include "pc.sv"
`include "somador.sv"
`include "ula.sv"
`include "and.sv"
`include "banco_registradores.sv"
`include "concatenador.sv"
`include "controle.sv"
`include "data_memory.sv"
`include "extensor_sinal.sv"
`include "instructions_memory.sv"
`include "mux.sv"

module nRisc (
    Clock,
    reset,
    Instrucao,
    SaidaPCLeEndereco,
    LeDado,
    Data2,
    Data1,
    EscMem,
    LerMem,
);
    input Clock, reset;
    output [7:0] SaidaPCLeEndereco;
    input [7:0] Instrucao;
    input [7:0] LeDado;
    wire [7:0] Pcmais1;
    reg escrevePC = 1;

    // TODO: verificar VARIÁVEL
    wire [2:0] wire_dado_concatenado;
    wire [2:0] wire_LeReg1, wire_LeReg2, wire_EscreveReg;

    // TODO: verificar VARIÁVEL aonde vai exatamente
    wire [7:0] WriteData;

    // sinas controle
    wire Beqz, RegFonte, SelDest, Ji, EscReg, EscPC;
    output wire EscMem, LerMem;
    wire [1:0] ULAOp, ULAFonte;


    output wire [7:0] Data1, Data2;

    // TODO: verificar VARIÁVEL
    wire [7:0] DadoExtendido, PC_Extendido;
    wire Zero;
    wire [7:0] Entrada1Ula, Entrada2Ula, Resultado;
    // TODO: verificar VARIÁVEL wire_mux6
    wire wire_saida_and;
    wire [7:0] EntradaPC, saidaMuxJi, wire_muxBeqz;

    //module PC (clock, reset, EntradaPC, EscPC, SaidaPC):;
    PC pc(Clock, reset, Pcmais1, EscPC, SaidaPCLeEndereco);
    somador soma(SaidaPCLeEndereco, Pcmais1);

    // Concatenador (Entrada, Saida)
    // concat concatenador(Instrucao[2:0], wire_dado_concatenado);

    // Mux (Dado0, Dado1, Sinal, Saida):
    mux223 muxRegEsc(Instrucao[4:3], Instrucao[2:0], SelDest, wire_EscreveReg);
    //module ExtensorDeSinal (Entrada, Saida)
    extensor_numeros extensor(Instrucao[1:0], DadoExtendido);

    // Mux3 (Dado0, Dado1, Dado2, Sinal, Saida):
    mux38 muxUla1(DadoExtendido, 8'b00000000, Data2, ULAFonte, Entrada1Ula);

    // Controle (Opcode, ULAOp, Beqz, RegFonte, EscMem, ULAFonte, LerMem, SelDest, Ji, EscReg, EscPC)
    unidade_controle controle(Instrucao[7:5], ULAOp, Beqz, RegFonte, EscMem, ULAFonte, LerMem, SelDest, Ji, EscReg, EscPC);

    // module registerBox (Read1, Read2, EscReg, WriteData, wire_EscreveReg, Data1, Data2, clock, reset);
    registerBox BancoReg(
        Instrucao[2:0],
        Instrucao[4:3],
        EscReg,
        WriteData,
        wire_EscreveReg,
        Data1,
        Data2,
        Clock
    );

    //module Ula(Dadol, Dado2, ULAOp, Zero, Resultado):
    ula ula(Entrada1Ula, Data2, ULAOp, Zero, Resultado);

    mux28 muxRegMemUla(Resultado, LeDado, RegFonte, WriteData);

    mux28 muxBeqz(DadoExtendido, 8'b00000000, wire_saida_and, wire_muxBeqz);

    AND porta_and(Zero, Beqz, wire_saida_and);
    
    extensor_PC extensorPC(Instrucao[4:0], PC_Extendido);
    mux28 muxJi(PC_Extendido, wire_muxBeqz, Ji, saidaMuxJi);

    somador somaPC(saidaMuxJi, EntradaPC);

endmodule