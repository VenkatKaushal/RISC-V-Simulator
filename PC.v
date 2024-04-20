module PC (
    input [31:0] pc_in,
    input enable,
    output reg [31:0] pc_out
);

    always @(posedge enable or posedge pc_in)
    begin
        if (enable)
            pc_out <= pc_in;
    end

endmodule