module state_selector(input logic clk, reset, progress, output logic en1, en2, en3);

    typedef enum logic [1 : 0] {S0, S1, S2, S3} statetype;
    statetype state, nextstate;

    always_ff @(posedge clk, posedge reset) begin 
        if (reset) state <= S0;
        else if (clk) state <= nextstate;
    end

    always_comb begin
        nextstate = state;
    
        case (state)
            S0: if (progress) nextstate = S1;
            S1: if (progress) nextstate = S2;
            S2: if (progress) nextstate = S3;
            S3: if (progress) nextstate = S1;
        endcase

    end

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