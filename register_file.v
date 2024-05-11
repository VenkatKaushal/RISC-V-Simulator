module register_file(
    input reg clk,                    // Clock input
    input wire write_enable,           // Write enable signal
    input wire [4:0] read_reg1,        // Address of the first register to read
    input wire [4:0] read_reg2,        // Address of the second register to read
    input wire [4:0] write_reg,        // Address of the register to write
    input wire [31:0] write_data,      // Data to write into the register
    output wire [31:0] read_data1,     // Data from the first register read
    output wire [31:0] read_data2,     // Data from the second register read
    input reg reset      
);

    // Define the size of the register file
    parameter NUM_REGS = 32;
    reg [31:0] regs [0:NUM_REGS-1];
    
    // Asynchronous read from the register file
    assign read_data1 = (read_reg1 != 0) ? regs[read_reg1] : 0;
    assign read_data2 = (read_reg2 != 0) ? regs[read_reg2] : 0;

    // Synchronous write to the register file
    always @(posedge clk) begin
        if (write_enable && (write_reg != 0)) begin
            regs[write_reg] <= write_data;
        end
    end

endmodule