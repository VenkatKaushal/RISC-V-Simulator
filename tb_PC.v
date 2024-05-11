module tb_PC;

    reg [31:0] pc_in;
    reg enable;
    wire [31:0] pc_out;

    
    PC uut_PC (
        .pc_in(pc_in),
        .enable(enable),
        .pc_out(pc_out)
    );

   
    initial begin
        enable = 0;
        pc_in = 0;
        
        
        #100;
        enable = 0;
        $display("Test case 1: Enable is low, PC_Adder should not increment pc_out");
        $monitor("Time=%0t, pc_out=%d", $time, pc_out);
        
        
        #100;
        enable = 1;
        $display("Test case 2: Enable is high, PC_Adder should increment pc_out");
        $monitor("Time=%0t, pc_out=%d", $time, pc_out);
        
        #100;
        enable = 0;
        $display("Test case 3: Enable is low, PC_Adder should not increment pc_out");
        $monitor("Time=%0t, pc_out=%d", $time, pc_out);
        
        
        #100;
        enable = 1;
        $display("Test case 4: Enable is high, PC_Adder should increment pc_out");
        $monitor("Time=%0t, pc_out=%d", $time, pc_out);
        

        #100;
        enable = 0;
        pc_in = 4;
        $display("Test case 3: Enable is low, PC_Adder should not increment pc_out");
        $monitor("Time=%0t, pc_out=%d", $time, pc_out);
        
        
        #100;
        enable = 1;
        $display("Test case 4: Enable is high, PC_Adder should increment pc_out");
        $monitor("Time=%0t, pc_out=%d", $time, pc_out);
    
        #100;
        $finish;
    end

endmodule