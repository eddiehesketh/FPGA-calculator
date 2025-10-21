`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2025 16:14:22
// Design Name: 
// Module Name: addition
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


module addition #(parameter n = 6) (
    input   logic[n - 1 : 0] b1, 
    input   logic[n - 1 : 0] b2, 
    output  logic[n - 1 : 0] result
);

    logic c_in;

    always_comb begin
        c_in = 0;
        for (int i = 0; i < n; i++) begin
            result[i] = b1[i] ^ b2[i] ^ c_in;
            c_in = (b1[i] & b2[i]) | (b1[i] & c_in) | (b2[i] & c_in);
        end
        
    end


endmodule