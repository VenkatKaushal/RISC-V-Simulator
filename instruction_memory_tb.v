module instruction_memory_tb;

    // Testbench uses a 32-bit address
    reg [31:0] addr;
    // The instruction is a 32-bit output
    wire [31:0] instr;

    // Instantiate the instruction_memory module
    instruction_memory uut (
        .addr(addr),
        .instr(instr)
    );

    // Test sequence
    initial begin
        // Initialize address
        addr = 0;
        
        // Wait for 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        addr = 32'h4; // Test the second instruction
        #10; // Wait 10 ns
        addr = 32'h8; // Test the third instruction
        #10; // Wait 10 ns
        // ... and so on for other addresses and test cases
        
        // Finish the simulation
        $finish;
    end

    // Monitor changes in address and instruction
    initial begin
        $monitor("Time = %d ns, Address = %h, Instruction = %h", $time, addr, instr);
    end

endmodule