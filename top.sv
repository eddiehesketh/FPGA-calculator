`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2025 16:14:22
// Design Name: 
// Module Name: top
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


module top (
    input   logic           clk,
    input   logic [4 : 0]   sw,
    input   logic           btnL,
    input   logic           btnU,
    input   logic           btnD,
    output  logic [6 : 0]   seg,
    output  logic [3 : 0]   an
);
                

    logic [5 : 0] input1;
    logic [5 : 0] input2;
    logic [5 : 0] add_res;
    logic [5 : 0] sub_res;
    logic [5 : 0] res;
    logic [5 : 0] display_value;
    logic [3 : 0] switch_input;
    
    logic en1;
    logic en2;
    logic en3;
    logic add_or_sub;
    logic is_dec;
    logic is_negative;
    logic show_negative;
    
    assign add_or_sub = sw[4];
    assign switch_input = sw[3 : 0];
    


    state_selector selection(
        .clk(clk), 
        .reset(btnL), 
        .progress(btnU), 
        .en1(en1), 
        .en2(en2), 
        .en3(en3)
    );
    
    system_select number_system(
        .clk(clk), 
        .signal(btnD), 
        .is_dec(is_dec)
    );
    
    input_select operand1_selection(
        .clk(clk), 
        .en(en1), 
        .reset(btnL), 
        .switch_input(switch_input), 
        .operand(input1)
    );
    
    input_select operand2_selection(
        .clk(clk), 
        .en(en2), 
        .reset(btnL), 
        .switch_input(switch_input), 
        .operand(input2)
    );

    addition addition_compute(
        .b1(input1), 
        .b2(input2), 
        .result(add_res)
    );
    
    subtraction subtraction_compute(
        .b1(input1), 
        .b2(input2), 
        .result(sub_res)
    );
    
    
    result_selector result_assignment(
        .add_res(add_res), 
        .sub_res(sub_res), 
        .en(add_or_sub), 
        .is_negative(is_negative), 
        .res(res)
    );
    
    selector display_select(
        .en1(en1), 
        .en2(en2), 
        .en3(en3), 
        .is_negative(is_negative), 
        .input_1(input1), 
        .input_2(input2), 
        .input_3(res), 
        .show_negative(show_negative), 
        .res(display_value)
    );

    digit_selector select_digit(
        .clk(clk), 
        .reset(btnL), 
        .digit(an)
    );
    
    segment_display display_number(
        .digit(an), 
        .show_negative(show_negative),
        .is_dec(is_dec), 
        .display_value(display_value), 
        .segments(seg)
    );
    



endmodule