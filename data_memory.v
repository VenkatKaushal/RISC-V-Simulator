module data_memory #(
    parameter DATA_WIDTH = 32, // Width of the data
    parameter ADDR_WIDTH = 10, // Width of the addresses (for a 1024-depth memory)
    parameter MEM_DEPTH = 1 << ADDR_WIDTH // Depth of the memory, 2^ADDR_WIDTH
)(
    input wire clk,                          // Clock signal
    input wire mem_read,                     // Memory read enable
    input wire mem_write,                    // Memory write enable
    input wire [ADDR_WIDTH-1:0] address,     // Memory address
    input wire [DATA_WIDTH-1:0] write_data,  // Data to write
    output reg [DATA_WIDTH-1:0] read_data    // Data read from memory
);

    // Memory array
    reg [DATA_WIDTH-1:0] memory [0:MEM_DEPTH-1];

    // Synchronous read and write operations
    always @(posedge clk) begin
        // Write operation
        if (mem_write) begin
            memory[address] <= write_data;
        end
        // Read operation - registered read for synchronous operation
        if (mem_read) begin
            read_data <= memory[address];
        end
    end

endmodule