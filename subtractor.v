module subtractor(
    input [31:0] a,
    input [31:0] b,
    output [31:0] difference
);
    wire [31:0] borrow;
    
    assign difference = a ^ b ^ borrow;
    assign borrow = (~a & b) | ((~a | b) & borrow);
endmodule