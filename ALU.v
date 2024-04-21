module alu(
    input wire [31:0] a,          // First operand
    input wire [31:0] b,          // Second operand
    input wire [3:0] alu_control, // ALU control signal
    output reg [31:0] result,     // Result of the operation
    output reg zero               // Zero flag
);

    // Define operation codes
    localparam ALU_ADD  = 4'd1;
    localparam ALU_SUB  = 4'd2;
    localparam ALU_XOR  = 4'd3;
    localparam ALU_OR   = 4'd4;
    localparam ALU_AND  = 4'd5;
    localparam ALU_SLL  = 4'd6;
    localparam ALU_SRL  = 4'd7;
    localparam ALU_SRA  = 4'd8;
    localparam ALU_SLT  = 4'd9;
    localparam ALU_SLTU = 4'd10;
    localparam ALU_LW   = 4'd11;
    localparam ALU_SW   = 4'd12;

    // Perform the operation based on the alu_control signal
    always @(*) begin
        case (alu_control)
            ALU_ADD: result = a + b;          // Addition
            ALU_SUB: result = a - b;          // Subtraction
            ALU_AND: result = a & b;          // Bitwise AND
            ALU_OR:  result = a | b;          // Bitwise OR
            ALU_XOR: result = a ^ b;          // Bitwise XOR
            ALU_SLL: result = a << b;
            ALU_SRL: result = a >> b;
            ALU_SRA: result = a >> b;
            ALU_SLT: result = (a < b) ? 1 : 0;
            ALU_SLTU: result = (a < b) ? 1 : 0;
            default: result = 32'b0;          // Default case
        endcase

        // Set the zero flag if the result is zero
        zero = (result == 32'b0);
    end

endmodule