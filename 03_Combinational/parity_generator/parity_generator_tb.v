`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2023 01:35:27 AM
// Design Name: 
// Module Name: parity_generator_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module parity_generator_tb
    #(
        parameter Width = 16
    )
    (

    );
    
    reg [Width-1:0] i, j;
    reg gold = 0;
    wire out;
    reg clk;
    
    parity_generator u(.a(i), .parity(out));
    
    
    initial begin
        for (i = 0; i < 2**Width; i = i + 1) begin
            for (j = 0; j < Width; j = j + 1)
                gold = gold ^ i[j];
            # 1;
            if (out != gold) begin
                $display("at %d, golden is %b\n", i, gold);
                $display("at %d, output is %b\n", i, out);
                $finish;
			end
            gold = 0;     
        end
        $display("---- All Pass ----\n");
        $finish;
    end
endmodule
