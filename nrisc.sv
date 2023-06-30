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
    wire [2:0] wire_dado_concatenado;
    wire [2:0] wire_LeReg1, wire_LeReg2, wire_EscreveReg;

    // Escrita de dado no banco de registradores
    wire [7:0] WriteData;

    // sinas controle
    wire Beqz, RegFonte, SelDest, Ji, EscReg, EscPC;
    output wire EscMem, LerMem;
    wire [1:0] ULAOp, ULAFonte;
    output wire [7:0] Data1, Data2;
    wire [7:0] DadoExtendido, PC_Extendido;
    wire Zero;
    wire [7:0] Entrada1Ula, Entrada2Ula, Resultado;
    wire wire_saida_and;
    wire [7:0] EntradaPC, saidaMuxJi, wire_muxBeqz;

    /// Modulo de PC onde aponta o endereço que busca as instruções
    PC pc(Clock, reset, Pcmais1, EscPC, SaidaPCLeEndereco);
    somador soma(SaidaPCLeEndereco, Pcmais1);

    // Concatenador (Entrada, Saida) // Não utilizado
    // concat concatenador(Instrucao[2:0], wire_dado_concatenado);

    // Mux que verifica qual registrador será escrito
    mux223 muxRegEsc(Instrucao[4:3], Instrucao[2:0], SelDest, wire_EscreveReg);

    //module de extensão de sinal para a ULA
    extensor_numeros extensor(Instrucao[1:0], DadoExtendido);

    // Mux de 3 entradas para verificar qual dado será enviado para a ULA
    mux38 muxUla1(DadoExtendido, 8'b00000000, Data2, ULAFonte, Entrada1Ula);

    // Controle (Opcode, ULAOp, Beqz, RegFonte, EscMem, ULAFonte, LerMem, SelDest, Ji, EscReg, EscPC)
    // Controla os módulos
    unidade_controle controle(Instrucao[7:5], ULAOp, Beqz, RegFonte, EscMem, ULAFonte, LerMem, SelDest, Ji, EscReg, EscPC);

    // module de banco de registradores (LeReg1, LeReg2, EscreveReg, WriteData, Data1, Data2, Clock)
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

    //module ULA (Entrada1, Entrada2, ULAOp, Zero, Resultado)
    ula ula(Entrada1Ula, Data1, ULAOp, Zero, Resultado);

    // mux de 2 entradas para verificar qual dado será enviado para o banco de registradores
    mux28 muxRegMemUla(Resultado, LeDado, RegFonte, WriteData);

    // mux para verificar o a função beqz e o endereço de salto
    mux28 muxBeqz(DadoExtendido, 8'b00000000, wire_saida_and, wire_muxBeqz);

    // AND para verificar se o resultado da ULA é zero e acionar o mux de beqz
    AND porta_and(Zero, Beqz, wire_saida_and);
    
    // extensor de sinal para o endereço de salto
    extensor_PC extensorPC(Instrucao[4:0], PC_Extendido);

    // mux para verificar se o endereço de salto será o PC+1 ou o endereço de salto
    mux28 muxJi(PC_Extendido, wire_muxBeqz, Ji, saidaMuxJi);

    // somador de PC com o endereço de salto
    somador somaPC(saidaMuxJi, EntradaPC);

endmodule