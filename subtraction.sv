module subtraction #(parameter n = 4)(input logic[n - 1 : 0] b1, b2, output logic[n : 0] result);

    logic [n : 0] s1, s2;

    assign s1 = {1'b0, b1};

    addition #(n + 1) b2_negation(.b1({1'b0, ~b2}), .b2({{n{1'b0}}, 1'b1}), .result(s2));
    addition #(n + 1) main_addition(.b1(s1), .b2(s2), .result(result));

endmodule