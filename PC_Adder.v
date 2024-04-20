module PC_Adder (
    input [31:0] pc_in,
    input enable,
    output reg [31:0] pc_out
);

    always @(*) begin
        if (enable)
            pc_out = pc_in + 4;
        else
            pc_out = pc_in;
    end

endmodule