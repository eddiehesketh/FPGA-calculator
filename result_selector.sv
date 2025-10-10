module result_selector #(parameter n = 6) (
                                            input logic[n - 1 : 0] add_res, 
                                            input logic [n - 1 : 0] sub_res, 
                                            input logic             en, 
                                            output logic            is_negative,
                                            output logic [n - 1 : 0] res);

    logic [n - 1 : 0] intr;
    logic [n - 1 : 0] abs_value;

    always_comb begin
        case (en) 
            1'b0: intr = add_res;
            1'b1: intr = sub_res;
        endcase
    end

    addition pos_version(.b1(~intr), .b2({{(n-1){1'b0}}, 1'b1}), .result(abs_value));


    always_comb begin

        if (intr[n - 1]) begin
            res = abs_value;
            is_negative = 1'b1;
        end else begin
            res = intr;
            is_negative = 1'b0;
        end
    end

endmodule