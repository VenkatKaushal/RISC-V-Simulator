module register_file(
    input reg clk,                    
    input wire write_enable,           
    input wire [4:0] read_reg1,        
    input wire [4:0] read_reg2,        
    input wire [4:0] write_reg,        
    input wire [31:0] write_data,      
    output wire [31:0] read_data1,    
    output wire [31:0] read_data2,
    input reg reset      
);

    
    parameter NUM_REGS = 32;
    reg [31:0] regs [0:NUM_REGS-1];
    

    assign read_data1 = (read_reg1 != 0) ? regs[read_reg1] : 0;
    assign read_data2 = (read_reg2 != 0) ? regs[read_reg2] : 0;

    
    always @(posedge clk) begin
        if (write_enable && (write_reg != 0)) begin
            regs[write_reg] <= write_data;
        end
    end

endmodule