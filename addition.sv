module addition #(parameter n = 4;) (input logic[n - 1 : 0] b1, b2, output logic[n : 0] result);

    logic c_in;

    always_comb begin

        c_in = 0;

        for (int i = 0; i < n; i++) begin
            result[i] = b1[i] ^ b2[i] ^ c_in;
            c_in = (b1[i] & b2[i]) | (b1[i] & c_in) | (b2[i] & c_in);
        end

        result[n] = c_in;
        
    end


endmodule