module alu(
    input wire [31:0] a,          // First operand
    input wire [31:0] b,          // Second operand
    input wire [3:0] alu_control, // ALU control signal
    input wire alu_enable,
    output reg [31:0] result,     // Result of the operation
    output reg zero,              // Zero flag
    output reg [31:0] mem_address, // Memory address for store operation
    output reg mem_read = 1'b0,
    output reg mem_write = 1'b0,
    output reg reg_write
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
    always @(alu_enable) begin
        if(alu_enable == 1'b1) begin
            
            case (alu_control)
                ALU_ADD: begin
                    result = add_result; // Output addition result
                    $monitor("I am in AL");
                    reg_write = 1'b1;

                end
                ALU_SUB: begin
                    result = sub_result; // Output subtraction result
                    reg_write = 1'b1;
                end
                ALU_AND: begin result = a & b; reg_write = 1'b1;end         // Bitwise AND
                ALU_OR:  begin result = a | b; reg_write = 1'b1;end         // Bitwise OR
                ALU_XOR: begin result = a ^ b; reg_write = 1'b1;end        // Bitwise XOR
                ALU_SLL: begin result = a << b; reg_write = 1'b1;end        // Shift Left Logical
                ALU_SRL: begin result = a >> b; reg_write = 1'b1;end        // Shift Right Logical
                ALU_SRA: begin result = $signed(a) >>> b; reg_write = 1'b1;end // Shift Right Arithmetic
                ALU_SLT: begin result = (a < b) ? 1 : 0; reg_write = 1'b1;end // Set Less Than (signed)
                ALU_SLTU: begin result = (a < b) ? 1 : 0; reg_write = 1'b1;end // Set Less Than Unsigned (unsigned)
                ALU_LW: begin
                    // LW operation: Calculate memory address by adding offset to base address
                    result = a + b;
                    mem_address = result; // Set memory address for load operation
                    mem_read = 1'b1;
                    reg_write = 1'b1;
                end
                ALU_SW: begin
                    // SW operation: Calculate memory address by adding offset to base address
                    result = a + b;
                    mem_address = result;
                    mem_write = 1'b1; // Set memory address for store operation
                end
                default: begin
                    result = 32'b0;          // Default case
                    mem_address = 32'b0;     // Default case for memory address
                end
            endcase
        end

        // Set the zero flag if the result is zero
        zero = (result == 32'b0);
    end

endmodule
