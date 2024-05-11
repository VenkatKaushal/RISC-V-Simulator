module alu_mux(
    input wire [31:0] input0, 
    input wire [31:0] input1, 
    input wire select,        
    output reg [31:0] out,    
    input reg clk
);

    
    always @(clk)
    begin
        out = select ? input1 : input0;
    end

endmodule