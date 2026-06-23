`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2026 23:34:08
// Design Name: 
// Module Name: multiplier _1
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


module multiplier_1(
        input  [2:0] D,     
        output reg [3:0] P 
    );
        always @(D) 
        begin
            case(D)
                3'b000 : P = 4'b0000; 
                3'b001 : P = 4'b0010; 
                3'b010 : P = 4'b0100; 
                3'b011 : P = 4'b0110; 
                3'b100 : P = 4'b1000; 
                3'b101 : P = 4'b1010; 
                3'b110 : P = 4'b1100; 
                3'b111 : P = 4'b1110; 
                default: P = 4'b0000;
            endcase
        end
    endmodule
