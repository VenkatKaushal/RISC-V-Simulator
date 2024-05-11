module data_memory #(
    parameter DATA_WIDTH = 32, 
    parameter ADDR_WIDTH = 32, 
    parameter MEM_DEPTH = 1 << ADDR_WIDTH 
)(
    input wire clk,                          
    input wire mem_read,                     
    input wire mem_write,                    
    input wire [ADDR_WIDTH-1:0] address,     
    input wire [DATA_WIDTH-1:0] write_data, 
    output reg [DATA_WIDTH-1:0] read_data   
);

   
    reg [DATA_WIDTH-1:0] memory [0:MEM_DEPTH-1];

    always @(posedge clk) begin
       
        if (mem_write) begin
            memory[address] <= write_data;
        end
        if (mem_read) begin
            read_data <= memory[address];
        end
    end

endmodule