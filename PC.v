module PC (
    input reg [31:0] pc_in,
    input enable,
    output reg [31:0] pc_out
);

    always @(posedge enable)
    begin
        pc_out <= pc_in;
    end
endmodule