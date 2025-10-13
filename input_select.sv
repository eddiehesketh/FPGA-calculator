`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2025 16:14:22
// Design Name: 
// Module Name: input_select
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



module input_select #(parameter n = 4) (input logic             clk,
                                        input logic             en,
                                        input logic             reset,
                                        input logic [n - 1 : 0] switch_input,  
                                        output logic [n + 1 : 0] operand);

    always_ff @(posedge clk, posedge reset) begin
        if (reset) begin
            operand <= '0;
        end
        else if (en) begin
            operand <= switch_input;
        end
    end


endmodule