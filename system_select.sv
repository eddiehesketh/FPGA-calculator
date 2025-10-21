`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2025 16:14:22
// Design Name: 
// Module Name: system_select
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


module system_select(
    input   logic clk,
    input   logic signal,
    output  logic is_dec
);

    logic prev_signal;
    logic change_state;
    
    
    typedef enum logic {S0, S1} statetype;
    statetype state = S0;
    statetype nextstate = S1;
    
    assign change_state = prev_signal & (~signal);
     
    always_ff @(posedge clk) begin
        state <= nextstate; 
        prev_signal <= signal;
    end
    
    always_comb begin
        nextstate = state;
        case (state)
            S0: if (change_state) nextstate = S1;
            S1: if (change_state) nextstate = S0;
        endcase
    end
    
    assign is_dec = ~state;
    
endmodule
