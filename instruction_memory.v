module instruction_memory(
    input wire [31:0] addr, // Address input
    output reg [31:0] instr // Instruction output
);

    // Define the size of the memory, e.g., 256 instructions of 32 bits
    parameter MEM_DEPTH = 30;
    reg [31:0] memory_array [0:MEM_DEPTH-1];

    initial begin
        memory_array[0] = 32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[1] = 32'b00100000000010010000000000110111; //addi $t1, $zero, 55
        memory_array[2] = 32'b00000001000010011000000000100100; //and $s0, $t0, $t1
        memory_array[3] = 32'b00000001000010011000000000100101; //or $s0, $t0, $t1
        memory_array[4] = 32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[5] = 32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[6] = 32'b00000001000010011000100000100000; //add $s1, $t0, $t1
        memory_array[7] = 32'b00000001000010011001000000100010; //sub $s2, $t0, $t1
        memory_array[8] = 32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[9] = 32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[10]= 32'b00110010001100100000000001001000; //andi $s2, $s1, 48
        memory_array[11] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[12] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[13] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[14] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[15] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[16] =32'b00000010001000001001000000100000; //add $s2, $s1, $0
        memory_array[17] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[18] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[19] =32'b00100000000010010000000000000000; //addi $t1, $0, 0
        memory_array[20] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[21] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[22] =32'b00100000000010010000000000000001; //addi $t1, $0, 1
        memory_array[23] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[24] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[25] =32'b00100000000010010000000000000010; //addi $t1, $0, 2
        memory_array[26] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[27] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
        memory_array[28] =32'b00100000000010010000000000000011; //addi $t1, $0, 3
        memory_array[29] =32'b00100000000010000000000000100000; //addi $t0, $zero, 32
    end

    // Read the instruction from memory
    always @(addr) begin
        instr = memory_array[addr]; // Assuming word-aligned addresses
    end

endmodule