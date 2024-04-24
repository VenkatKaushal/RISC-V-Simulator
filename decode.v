module decode(
    input wire [31:0] instr, // 32-bit instruction input
    output reg [4:0] rd,     // Destination register
    output reg [4:0] rs1,    // Source register 1
    output reg [4:0] rs2,    // Source register 2
    output reg [11:0] immed, // Immediate value
    output reg [3:0] alu_op, // ALU operation control signal
    input reg clk               // Clock signal
);

    // RISC-V opcode definitions
    parameter ADD_OPCODE = 7'b0000001;
    parameter SUB_OPCODE = 7'b0000010;
    parameter XOR_OPCODE = 7'b0000011;
    parameter OR_OPCODE = 7'b0000100;
    parameter AND_OPCODE = 7'b0000101;
    parameter SLL_OPCODE = 7'b0000110;
    parameter SRL_OPCODE = 7'b0000111;
    parameter SRA_OPCODE = 7'b0001000;
    parameter SLT_OPCODE = 7'b0001001;
    parameter SLTU_OPCODE = 7'b0001010;
    parameter LW_OPCODE = 7'b0001011;
    parameter SW_OPCODE = 7'b0001100;

    // Decode the instruction
    always @(posedge clk) begin
        // Default values
        rd = 5'b0;
        rs1 = 5'b0;
        rs2 = 5'b0;
        immed = 12'b0;
        alu_op = 4'b0;

        // Extract opcode
        case (instr[6:0])
            ADD_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd1; // Addition
            end
            SUB_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd2; // Subtraction
            end
            XOR_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd3; // XOR
            end
            OR_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd4; // OR
            end
            AND_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd5; // AND
            end
            SLL_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd6; // Shift Left Logical
            end
            SRL_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd7; // Shift Right Logical
            end
            SRA_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd8; // Shift Right Arithmetic
            end
            SLT_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd9; // Set Less Than (signed)
            end
            SLTU_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd10; // Set Less Than Unsigned (unsigned)
            end
            LW_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                immed = instr[31:20];
                alu_op = 4'd11; // Load Word
            end
            SW_OPCODE: begin
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                immed = {instr[31:25], instr[11:7]};
                alu_op = 4'd12; // Store Word
            end
        endcase
    end

endmodule
