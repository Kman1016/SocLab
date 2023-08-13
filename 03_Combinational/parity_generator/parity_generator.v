`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2023 10:42:48 AM
// Design Name: 
// Module Name: parity_generator
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


module parity_generator
#(
    parameter Width = 16
)(
    input [Width-1:0]a,
    output reg parity
    );
    reg [Width-1:0] i;
    reg [Width-1-1:0] bf;
    always @(*) begin
        bf[0] = a[0] ^ a[1];
        for (i = 2; i < Width; i = i + 1)
            bf[i-1] = bf[i-2] ^ a[i];
        parity = bf[Width-1-1];
    end
        
endmodule
