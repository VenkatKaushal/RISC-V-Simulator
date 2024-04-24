module immediate_block(
    input wire [31:0] instruction, // 32-bit instruction input
    output reg [31:0] immediate, // Sign-extended immediate value output
    input reg clk     
);

    // Extract the 12-bit immediate value from bits [31:20]
    // Sign-extend the immediate value to 32 bits
    // by replicating the most significant bit (bit 11)
    always @(posedge clk) begin
        immediate = {{12{instruction[31]}}, instruction[31:20]};
    end

endmodule
