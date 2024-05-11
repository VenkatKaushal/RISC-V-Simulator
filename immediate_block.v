module immediate_block(
    input wire [31:0] instruction, 
    output reg [31:0] immediate, 
    input reg clk     
);

    always @(posedge clk) begin
        immediate = {{12{instruction[31]}}, instruction[31:20]};
    end

endmodule
