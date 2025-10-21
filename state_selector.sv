`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2025 16:14:22
// Design Name: 
// Module Name: state_selector
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

module state_selector (
    input   logic clk, 
    input   logic reset, 
    input   logic progress, 
    output  logic en1, 
    output  logic en2,
    output  logic en3
);


    logic button_pressed; 
    logic previous_signal;
    logic change_state;
    
    typedef enum logic [1 : 0] {S1, S2, S3} statetype;
    
    statetype state;
    statetype nextstate;

    assign button_pressed = progress;

    // detect when button is released
    assign change_state = previous_signal & (~button_pressed);



    always_ff @(posedge clk or posedge reset) begin 
        if (reset) begin
            state <= S1;                
            previous_signal <= 0;
        end else begin
            state <= nextstate;         
            previous_signal <= button_pressed;
        end
    end


    // next state logic, executes whenever state or change state changes, combinational logic
    always_comb begin
        nextstate = state;
    
        case (state)
            S1: if (change_state) nextstate = S2;
            S2: if (change_state) nextstate = S3;
            S3: if (change_state) nextstate = S1;
        endcase
    end

    // whenever state changes, set corresponding enable pin, combinational logic
    always_comb begin

        en1 = 0;
        en2 = 0;
        en3 = 0;

        case (state) 
            S1: en1 = 1;
            S2: en2 = 1;
            S3: en3 = 1;
        endcase

    end


endmodule