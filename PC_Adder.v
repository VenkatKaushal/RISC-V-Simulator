module PC_Adder (
    input reg [31:0] pc_in,
    input reg enable,
    output reg [31:0] pc_out
);

    always @(posedge enable) begin
        pc_out = pc_in + 4;
    end

endmodule