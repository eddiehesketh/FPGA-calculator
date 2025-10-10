module input_select #(parameter n = 4) (input logic             clk,
                                        input logic             en,
                                        input logic             reset,
                                        input logic [n - 1 : 0] switch_input,  
                                        output logic [n + 1 : 0] operand)

    always_ff @(posedge clk, posedge reset) begin
        if (reset) begin
            operand <= '0;
        end
        else if (en) begin
            operand <= switch_input;
        end
    end


endmodule