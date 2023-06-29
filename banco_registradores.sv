module registerBox (
    Read1,
    Read2,
    WriteReg,
    WriteData,
    RegWrite,
    Data1,
    Data2,
    clock,
    reset
);
    input [2:0] Read1, Read2, WriteReg;
    input [7:0] WriteData;
    input RegWrite, clock, reset;
    output reg [7:0] Data1, Data2;
    reg [7:0] RF [7:0];

    initial begin
        RF[0] = 8'b00000000; // registrador zero
    end

    always @(posedge clock) begin
        if (RegWrite) begin
            if (WriteReg != 3'b000) begin
                RF[WriteReg] = WriteData;
            end
        end
    end

    always @(negedge clock) begin
        Data1 = RF[Read1];
        Data2 = RF[Read2];
    end
endmodule
