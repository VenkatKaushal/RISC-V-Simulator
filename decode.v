module decode(
    input wire [31:0] instr, // 32-bit instruction input
    output reg [4:0] rd,     // Destination register
    output reg [4:0] rs1,
    output reg [4:0] rs2,    // Source register 1
    output reg [11:0] immed,   // 12-bit immediate value
    output reg [3:0]alu_op        // ALU operation control signal
);

    // RISC-V opcode for addi instruction
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
    always @(instr) begin
        // Check if the instruction is an addi
        if (instr[6:0] == ADD_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            rs2 <= instr[24:20];     // bits [31:20] contain the immediate value
            immed <= 12'b0;
            alu_op <= 4'd1;          // Set the ALU operation to addition (example)
        end 
        else if (instr[6:0] == SUB_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            rs2 <= instr[24:20];     // bits [31:20] contain the immediate value
            immed <= 12'b0;
            alu_op <= 4'd2;
        end
        else if (instr[6:0] == XOR_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            rs2 <= instr[24:20];     // bits [31:20] contain the immediate value
            immed <= 12'b0;
            alu_op <= 4'd3;
        end
        else if (instr[6:0] == OR_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            rs2 <= instr[24:20];     // bits [31:20] contain the immediate value
            immed <= 12'b0;
            alu_op <= 4'd4;
        end
        else if (instr[6:0] == AND_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            rs2 <= instr[24:20];     // bits [31:20] contain the immediate value
            immed <= 12'b0;
            alu_op <= 4'd5;
        end
        else if (instr[6:0] == SLL_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            rs2 <= instr[24:20];     // bits [31:20] contain the immediate value
            immed <= 12'b0;
            alu_op <= 4'd6;
        end
        else if (instr[6:0] == SRL_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            rs2 <= instr[24:20];     // bits [31:20] contain the immediate value
            immed <= 12'b0;
            alu_op <= 4'd7;
        end
        else if (instr[6:0] == SRA_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            rs2 <= instr[24:20];     // bits [31:20] contain the immediate value
            immed <= 12'b0;
            alu_op <= 4'd8;
        end
        else if (instr[6:0] == SLT_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            rs2 <= instr[24:20];     // bits [31:20] contain the immediate value
            immed <= 12'b0;
            alu_op <= 4'd9;
        end
        else if (instr[6:0] == SLTU_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            rs2 <= instr[24:20];     // bits [31:20] contain the immediate value
            immed <= 12'b0;
            alu_op <= 4'd10;
        end
        else if (instr[6:0] == LW_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            immed <= instr[31:20];  // bits [31:20] contain the immediate value
            rs2 <= 5'b0;   
            alu_op <= 4'd11;
        end
        else if (instr[6:0] == SW_OPCODE) begin
            rd <= instr[11:7];       // bits [11:7] contain the rd field
            rs1 <= instr[19:15];     // bits [19:15] contain the rs1 field
            rs2 <= instr[24:20];
            immed <= {instr[31:25] + instr[11:7]};   // bits [31:20] contain the immediate value
            alu_op <= 4'd12;
        end
        else begin
            // For other instructions, set default values or handle other cases
            rd <= 5'b0;
            rs1 <= 5'b0;
            immed <= 12'b0;
            alu_op <= 1'b0;
        end
    end

endmodule