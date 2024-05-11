module decode(
    input wire [31:0] instr, 
    output reg [4:0] rd,     
    output reg [4:0] rs1,    
    output reg [4:0] rs2,    
    output reg [11:0] immed, 
    output reg [3:0] alu_op, 
    input reg clk,               
    output reg write_enable
);

    
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
    parameter ADDI_OPCODE = 7'b0001101;

    
    always @(posedge clk) begin
       
        rd = 5'b0;
        rs1 = 5'b0;
        rs2 = 5'b0;
        immed = 12'b0;
        alu_op = 4'b0;

       
        case (instr[6:0])
            ADD_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd1; 
                write_enable = 1'b1;
            end
            SUB_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd2; 
                write_enable = 1'b1;
            end
            XOR_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd3;
                write_enable = 1'b1;
            end
            OR_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd4; 
                write_enable = 1'b1;
            end
            AND_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd5;
                write_enable = 1'b1;
            end
            SLL_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd6; 
                write_enable = 1'b1;
            end
            SRL_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd7; 
                write_enable = 1'b1;
            end
            SRA_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd8; 
                write_enable = 1'b1;
            end
            SLT_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd9; 
                write_enable = 1'b1;
            end
            SLTU_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                alu_op = 4'd10; 
                write_enable = 1'b1;
            end
            LW_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                immed = instr[31:20];
                alu_op = 4'd11; 
                write_enable = 1'b1;
            end
            SW_OPCODE: begin
                rs1 = instr[19:15];
                rs2 = instr[24:20];
                immed = {instr[31:25], instr[11:7]};
                alu_op = 4'd12;
                write_enable = 1'b1;
            end
            ADDI_OPCODE: begin
                rd = instr[11:7];
                rs1 = instr[19:15];
                immed = instr[31:20];
                alu_op = 4'd1;
                write_enable = 1'b1;
            end
        endcase
    end

endmodule
