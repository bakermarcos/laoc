module registerBox (
    Read1,
    Read2,
    Read3,
    EscReg,
    WriteData,
    RegWrite,
    Data1,
    Data2,
    Data3,
    clock,
);
    input [2:0] Read1, Read2, Read3, EscReg;
    input [7:0] WriteData;
    input RegWrite, clock;
    output reg [7:0] Data1, Data2, Data3;
    reg [7:0] RF [7:0];

    initial begin
        RF[0] = 8'b00000000; // registrador zero
    end

    always @(posedge clock or EscPC) begin
        if (EscPC==1) begin
            if (EscPC != 3'b000) begin
                RF[EscPC] = WriteData;
            end
        end
    end

    assign Data1 = RF[Read1];
    assign Data2 = RF[Read2];
    assign Data3 = RF[Read3];

endmodule