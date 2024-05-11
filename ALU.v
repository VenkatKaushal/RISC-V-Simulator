module alu(
    input wire [31:0] a,          
    input wire [31:0] b,          
    input wire [3:0] alu_control, 
    input wire alu_enable,
    output reg [31:0] result,     
    output reg zero,              
    output reg [31:0] mem_address, 
    output reg mem_read = 1'b0,
    output reg mem_write = 1'b0,
    output reg reg_write
);

    
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


    wire [31:0] add_result;
    adder add_inst(.a(a), .b(b), .sum(add_result));

    
    wire [31:0] sub_result;
    subtractor sub_inst(.a(a), .b(b), .difference(sub_result));

    
    always @(alu_enable) begin
        if(alu_enable == 1'b1) begin
            
            case (alu_control)
                ALU_ADD: begin
                    result = add_result; 
                    $monitor("I am in AL");
                    reg_write = 1'b1;

                end
                ALU_SUB: begin
                    result = sub_result; 
                    reg_write = 1'b1;
                end
                ALU_AND: begin result = a & b; reg_write = 1'b1;end         
                ALU_OR:  begin result = a | b; reg_write = 1'b1;end        
                ALU_XOR: begin result = a ^ b; reg_write = 1'b1;end       
                ALU_SLL: begin result = a << b; reg_write = 1'b1;end       
                ALU_SRL: begin result = a >> b; reg_write = 1'b1;end       
                ALU_SRA: begin result = $signed(a) >>> b; reg_write = 1'b1;end 
                ALU_SLT: begin result = (a < b) ? 1 : 0; reg_write = 1'b1;end
                ALU_SLTU: begin result = (a < b) ? 1 : 0; reg_write = 1'b1;end 
                ALU_LW: begin
                    
                    result = a + b;
                    mem_address = result; 
                    mem_read = 1'b1;
                    reg_write = 1'b1;
                end
                ALU_SW: begin
                    result = a + b;
                    mem_address = result;
                    mem_write = 1'b1; 
                end
                default: begin
                    result = 32'b0;          
                    mem_address = 32'b0;    
                end
            endcase
        end
        
        zero = (result == 32'b0);
    end

endmodule
