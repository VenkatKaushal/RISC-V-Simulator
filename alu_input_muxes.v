module alu_input_muxes(
    input wire [31:0] reg_data,     // Data from the register file
    input wire [31:0] imm_data,     // Immediate data
    input wire [31:0] alu_result,   // Result from the ALU (for forwarding)
    input wire reg_data_select,     // Select signal for the first MUX (input A)
    input wire imm_data_select,     // Select signal for the second MUX (input B)
    output wire [31:0] alu_input_a, // First ALU operand
    output wire [31:0] alu_input_b,  // Second ALU operand
    input reg clk
);
    reg mux1_enable;
    reg mux2_enable;
    // Instantiate the first MUX for ALU input A
        alu_mux mux_input_a(
        .input0(reg_data),
        .input1(alu_result), // Assuming a possible forwarding path
        .select(reg_data_select),
        .out(alu_input_a),
        .clk(mux1_enable)
    );

    // Instantiate the second MUX for ALU input B
    alu_mux mux_input_b(
        .input0(reg_data),
        .input1(imm_data),
        .select(imm_data_select),
        .out(alu_input_b),
        .clk(mux2_enable)
    );

    always @(posedge clk)
    begin
        mux1_enable = 1'b1;
        mux2_enable = 1'b1;
    end

endmodule