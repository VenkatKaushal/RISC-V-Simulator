module single_cycle(
    input wire clk
);

reg [31:0] pc_in = 32'b0;
reg pc_enable = 1'b0;
wire [31:0] pc_out;

reg [31:0] temp_pc_in;
reg pc_adder_enable = 1'b0;
wire [31:0] temp_pc_out;

wire [31:0] addr;
reg instr_enable = 1'b0;
wire [31:0] instr_out;

wire [31:0] instr_in;
wire [4:0] rd_out, rs1_out, rs2_out;
wire [11:0] immed_out;
wire [3:0] alu_op;
reg decode_enable = 1'b0;

reg register_enable= 1'b0;
reg write_enable = 1'b0;
wire [4:0] rd_in, rs1_in, rs2_in;
wire [31:0] reg_data;
wire [31:0]read_data1, read_data2;

wire [31:0] imm_data;
reg immed_enable = 1'b0;

wire [31:0] alu_result;
reg reg_data_select = 1'b0;
reg imm_data_select = 1'b0;
wire [31:0] alu_input_a, alu_input_b;
reg alu_mux_enable= 1'b0;


reg alu_enable = 1'b0;


PC uut1(pc_in, pc_enable, pc_out);

PC_Adder uut2(temp_pc_in, pc_adder_enable, temp_pc_out); 

instruction_memory uut3(addr, instr_out, instr_enable); 

decode uut4(instr_in, rd_out, rs1_out, rs2_out, immed_out, alu_op, decode_enable); 

register_file uut5(register_enable, write_enable, rs1_in, rs2_in, rd_in, reg_data, read_data1, read_data2);

immediate_block uut6(instr_in, imm_data, immed_enable);

alu_input_muxes uut7(reg_data, imm_data, alu_result, reg_data_select, imm_data_select, alu_input_a, alu_input_b, alu_mux_enable);


always @(posedge clk) begin
    pc_enable = 1'b1;
    #5 temp_pc_in = pc_out;
    pc_adder_enable = 1'b1;
    #5 pc_in = temp_pc_out;
end


always @(negedge clk)
begin
pc_enable = 1'b0;
pc_adder_enable = 1'b0;
instr_enable = 1'b0;
decode_enable = 1'b0;
register_enable= 1'b0;
write_enable = 1'b0;
alu_mux_enable= 1'b0;
alu_enable = 1'b0;
immed_enable = 1'b0;
reg_data_select = 1'b0;
imm_data_select = 1'b0;
end

endmodule