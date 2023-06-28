module nRisc (
    Clock,
    reset,
    Instrucao,
    LeEndereco,
    LeDado,
    Data3,
    Datal,
    MemWrite,
    MemRead
);
    input Clock, reset;
    output [7:0] LeEndereco;
    input [7:0] Instrucao;
    input [7:0] LeDado;
    wire [7:0] Pcmaisl;
    wire [2:0] wire_dado_concatenado;
    wire [2:0] wire_LeRegl, wire_LeReg2, wire_EscreveReg;
    reg [2:0] reg_sete = 3'b111;
    wire [7:0] WriteData;
    // sinas controle
    wire BegorBne, MentoReg, ULASrc, Slt, Branch, RegWrite, PcWrite;
    output wire MemWrite, MemRead;
    wire [1:0] ULAOP;
    wire [7:0] Data2;
    output wire [7:0] Datal, Data3;
    wire [7:0] DadoExtendido;
    wire Zero;
    wire [7:0] Entrada2Ula, Resultado;
    wire wire_mux6, wire_saida_and;
    wire [7:0] EntradaPC;
    // module PC (clock, reset, EntradaPC, PCWrite, SaidaPC):;
    PC pc(Clock, reset, EntradaPC, PcWrite, LeEndereco);
    Somador soma(LeEndereco, Pcmaisl);

    // Concatenador (Entrada, Saida)
    Concatenador concatenador(Instrucao[l:0], wire_dado_concatenado);

    // Mux (Dado0, Dadol, Sinal, Saida):
    Mux muxl(Instrucao[4:2], reg_sete, Branch, wire_LeRegl);

    Mux mux2(wire_dado_concatenado, Instrucao([4:2], Branch, wire_LeReg2));
    Mux mux3(Instrucao[4:2], reg_sete, Slt, wire_EscreveReq);

    // module ExtensorDeSinal (Entrada, Saida)
    ExtensorDeSinal extensor(Instrucao[l:0], DadoExtendido);
    Mux2 mux4(Data2, DadoExtendido, ULASrc, Entrada2Ula);

    // Controle (Opcode, BegOrBne, MentoReg, ULAOp, MemWrite, ULASrc, MemRead, Slt, Branch, RegWrite, PcWrite)
    Controle controle(Instrucao[7:5], BeqgqOrBne, MentoReg, ULAOp, MemWrite, ULASrc, MemRead, S1t, Branch, RegWrite, PcWrite);

    // module registerfile (Readl, Read2, Read3, WriteReg, WriteData, RegWrite, Datal, Data2, Data3, clock);
    registerfile BancoReg(
        wire_LeRegl,
        wire_LeReg2,
        wire_dado_concatenado,
        wire_EscreveReg,
        WriteData,
        RegWrite,
        Datal,
        Data2,
        Data3,
        Clock
    );

    // module Ula(Dadol, Dado2, UlaCp, Zero, Resultado):
    Ula ula(Datal, Entrada2Ula, ULACp, Zero, Resultado);

    Mux2 mux5(Resultado, LeDado, MentoReg, WriteData);
    Mux3 mux6(~Zero, Zero, BeqOrBne, wire_mux6);

    AND porta_and(wire_muxé, Branch, wire_saida_and);

    Mux2 mux7(Pcmaisl, LeDado, wire_saida_and, EntradaPC);

endmodule;
