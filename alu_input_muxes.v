module alu_input_muxes(
    input wire [31:0] read_data1,    
    input wire [31:0] read_data2,
    input wire [31:0] imm_data,     
    input wire [31:0] alu_result,   
    input wire reg_data_select,     
    input wire imm_data_select,     
    input wire mux1_enable,
    input wire mux2_enable,
    output wire [31:0] alu_input_a, 
    output wire [31:0] alu_input_b,  
    input reg clk
);
    
    
    alu_mux mux_input_a(
        .input0(read_data1),
        .input1(alu_result), 
        .select(reg_data_select),
        .out(alu_input_a),
        .clk(mux1_enable)
    );

    
    alu_mux mux_input_b(
        .input0(read_data2),
        .input1(imm_data),
        .select(imm_data_select),
        .out(alu_input_b),
        .clk(mux2_enable)
    );

endmodule