module alu(
    input wire [31:0] a,          // First operand
    input wire [31:0] b,          // Second operand
    input wire [3:0] alu_control, // ALU control signal
    output reg [31:0] result,     // Result of the operation
    output reg zero,              // Zero flag
    output reg [31:0] mem_address // Memory address for store operation
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

    // Addition module
    wire [31:0] add_result;
    adder add_inst(.a(a), .b(b), .sum(add_result));

    // Subtraction module
    wire [31:0] sub_result;
    subtractor sub_inst(.a(a), .b(b), .difference(sub_result));

    // Perform the operation based on the alu_control signal
    always @(*) begin
        case (alu_control)
            ALU_ADD: begin
                result = add_result; // Output addition result
            end
            ALU_SUB: begin
                result = sub_result; // Output subtraction result
            end
            ALU_AND: result = a & b;          // Bitwise AND
            ALU_OR:  result = a | b;          // Bitwise OR
            ALU_XOR: result = a ^ b;          // Bitwise XOR
            ALU_SLL: result = a << b;         // Shift Left Logical
            ALU_SRL: result = a >> b;         // Shift Right Logical
            ALU_SRA: result = $signed(a) >>> b; // Shift Right Arithmetic
            ALU_SLT: result = (a < b) ? 1 : 0; // Set Less Than (signed)
            ALU_SLTU: result = (a < b) ? 1 : 0; // Set Less Than Unsigned (unsigned)
            ALU_LW: begin
                // LW operation: Calculate memory address by adding offset to base address
                result = a + b;
                mem_address = result; // Set memory address for load operation
            end
            ALU_SW: begin
                // SW operation: Calculate memory address by adding offset to base address
                result = a + b;
                mem_address = result; // Set memory address for store operation
            end
            default: begin
                result = 32'b0;          // Default case
                mem_address = 32'b0;     // Default case for memory address
            end
        endcase

        // Set the zero flag if the result is zero
        zero = (result == 32'b0);
    end


    module adder(
        input [31:0] a,
        input [31:0] b,
        output [31:0] sum
    );
        wire [31:0] carry;
        
        assign sum = a ^ b ^ carry;
        assign carry = (a & b) | (a & carry) | (b & carry);
    endmodule

    module subtractor(
        input [31:0] a,
        input [31:0] b,
        output [31:0] difference
    );
        wire [31:0] borrow;
        
        assign difference = a ^ b ^ borrow;
        assign borrow = (~a & b) | ((~a | b) & borrow);
    endmodule

endmodule
