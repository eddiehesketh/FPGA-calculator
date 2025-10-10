module result_selector #(parameter n = 6) (
                                            input logic[n - 1 : 0] add_res, 
                                            input logic [n - 1 : 0] sub_res, 
                                            input logic             en, 
                                            output logic [n - 1 : 0] res);

    always_comb begin
        case (en) 
            1'b0: res = add_res;
            1'b1: res = sub_res;
        endcase
    end





endmodule