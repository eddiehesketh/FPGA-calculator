module selector #(parameter n = 4)(input logic clk, en, input logic[n - 1 : 0] input_s, output logic[n - 1 : 0] result);

always_ff @(posedge clk) begin
    if (en) result <= input_s;
end

endmodule