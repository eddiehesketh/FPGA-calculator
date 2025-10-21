`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2025 15:31:00
// Design Name: 
// Module Name: selector
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


module selector(
    input logic         en1,
    input logic         en2,
    input logic         en3,
    input logic         is_negative,
    input logic [5 : 0] input_1,
    input logic [5 : 0] input_2,
    input logic [5 : 0] input_3,
    output logic        show_negative,
    output logic [5 : 0] res
);

    
    always_comb begin
        res = en1 ? input_1 : (en2 ? input_2 : input_3);
        show_negative = en3 ? is_negative : 1'b0;
    end
    
endmodule
