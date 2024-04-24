module alu_mux(
    input wire [31:0] input0, // First input option for the MUX
    input wire [31:0] input1, // Second input option for the MUX
    input wire select,        // Select signal to choose between input0 and input1
    output wire [31:0] out,    // Output of the MUX
    input reg clk
);

    // Assign the output based on the select signal
    
    assign out = select ? input1 : input0;
    

endmodule