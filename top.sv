module top (    input logic clk, 
                input logic [4 : 0] sw, 
                input logic btnL,
                input logic btnU,
                input logic btnD,
                output logic [6 : 0] seg,
                output logic [2 : 0] an

                );
    logic [5 : 0] input1, input2, add_res, sub_res, res;
    logic [3 : 0] switch_input;
    logic en1, en2, en3, add_or_sub;
    assign add_or_sub = sw[4];
    assign switch_input = sw[3 : 0];

    state_selector selection(.clk(clk), .reset(btnL), .progress(btnU), .en1(en1), .en2(en2), .en3(en3));

    input_select operand1_selection(.clk(clk), .en(en1), .reset(btnL), .switch_input(switch_input), .operand(input1));
    input_select operand2_selection(.clk(clk), .en(en2), .reset(btnL), .switch_input(switch_input), .operand(input2));
    result_selector result_assignment(.add_res(add_res), .sub_res(sub_res), .en(add_or_sub), .res(res));

    addition addition_compute(.b1(input1), .b2(input2), .result(add_res));
    subtraction subtraction_compute(.b1(input1), .b2(input2), .result(sub_res));


endmodule