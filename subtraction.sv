`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2025 16:14:22
// Design Name: 
// Module Name: subtraction
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


module subtraction #(parameter n = 6)(input logic[n - 1 : 0] b1, b2, output logic[n - 1 : 0] result);

    logic [n - 1 : 0] s2;


    addition b2_negation(.b1(~b2), .b2({{(n-1){1'b0}}, 1'b1}), .result(s2));
    addition main_addition(.b1(b1), .b2(s2), .result(result));

endmodule