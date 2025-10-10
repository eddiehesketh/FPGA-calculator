module subtraction #(parameter n = 6)(input logic[n - 1 : 0] b1, b2, output logic[n - 1 : 0] result);

    logic [n - 1 : 0] s2;


    addition b2_negation(.b1(~b2), .b2({{(n-1){1'b0}}, 1'b1}), .result(s2));
    addition main_addition(.b1(b1), .b2(s2), .result(result));

endmodule