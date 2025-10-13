`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2025 16:14:22
// Design Name: 
// Module Name: digit_selector
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

module digit_selector(input logic clk, 
                        input logic reset,
                        output logic[3 : 0] digit);

    logic [18 : 0] timer;


    typedef enum logic [1 : 0] {S1, S2, S3} statetype;
    statetype state, nextstate;

    always_ff @(posedge clk, posedge reset) begin
        if (reset) begin
            timer <= 0;
            state <= S1;
        end
        else if (timer == 19'd499999) begin
            state <= nextstate;
            timer <= 0;
        end
        else begin
            timer <= timer + 1;
        end
    end


    always_comb begin

        nextstate = state;

        case (state) 
            S1: nextstate = S2;
            S2: nextstate = S3;
            S3: nextstate = S1;

        endcase
    end
    
    always_comb begin
        case (state) 
            S1: digit = 4'b1110;  // Active low: turns on first display
            S2: digit = 4'b1101;  // Active low: turns on second display
            S3: digit = 4'b1011;  // Active low: turns on third display
            default: digit = 4'b1111; // All off
        endcase
    end



endmodule