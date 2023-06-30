module Computador;

    reg Clock, reset;
    wire [7:0] LeEndereco;
    wire [7:0] Instrucao;
    wire [7:0] Endereco;
    wire [7:0] EscreveDado;
    wire EscMem, LerMem;
    wire [7:0] LeDado;

    nRisc processador (
        .Clock(Clock),
        .reset(reset),
        .Instrucao(Instrucao),
        .SaidaPCLeEndereco(LeEndereco),
        .LeDado(LeDado),
        .Data2(Endereco),
        .Data1(EscreveDado),
        .EscMem(EscMem),
        .LerMem(LerMem)
    );

    instructions_memory MemI (
        .clock(Clock),
        .endereco(LeEndereco),
        .instrucao(Instrucao)
    );

    //module memoria de_dados (clock, EscMem, LerMem, endereco, escreveDado, leDado):
    data_memory MemD (
        .clock(Clock),
        .memWrite(EscMem),
        .memRead(LerMem),
        .endereco(Endereco),
        .escreveDado(EscreveDado),
        .leDado(LeDado)
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
      // $monitor("Time=%0d Clock=%b EntradaPC=%b SaidaPC=%d EscPC=%b Instrucao=%b",
      //       $time, Clock, processador.EntradaPC, processador.SaidaPCLeEndereco, processador.EscPC, Instrucao[7:5]);
        $monitor("Time=%0d Clock=%b SaidaPC=%d Instrucao=%b EscRegBanco=%b WriteDataBanco=%b RegWriteBanco=%b Dado1Banco=%b Dado2Banco=%b reg[6]=%d reg[5]=%d reg[4]=%d reg[3]=%d reg[2]=%d reg[1]=%d reg[0], Beqz=%b RegFonte=%b ULAOp=%b EscMem=%b ULAFonte=%b LerMem=%b SelDest=%b Ji=%b EscReg=%b EscPC=%b",
            $time, Clock, processador.SaidaPCLeEndereco, processador.Instrucao[7:5], processador.BancoReg.EscReg,processador.BancoReg.WriteData,processador.BancoReg.RegWrite, processador.BancoReg.Data1, processador.BancoReg.Data2, processador.BancoReg.RF[6], processador.BancoReg.RF[5],processador.BancoReg.RF[4],processador.BancoReg.RF[3],processador.BancoReg.RF[2],processador.BancoReg.RF[1],processador.BancoReg.RF[0], processador.controle.Beqz, processador.controle.RegFonte, processador.controle.ULAOp, processador.controle.EscMem,processador.controle.ULAFonte, processador.controle.LerMem, processador.controle.SelDest, processador.controle.Ji, processador.controle.EscReg, processador.controle.EscPC);
    end

endmodule