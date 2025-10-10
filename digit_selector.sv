module digit_selector(input logic clk, 
                        input logic reset, 
                        input logic is_negative,
                        input logic is_dec,
                        input logic [5 : 0] display_value,
                        output logic[1 : 0] digit);

    logic [18 : 0] timer;


    typedef enum logic [1 : 0] {S1, S2, S3} statetype;
    statetype state, nextstate;

    always_ff @(posedge clk, posedge reset) begin
        if (reset) begin
            timer <= 0;
            state <= S1;
        end
        else if (timer == 19'd499999) begin
            state <= nextstate;
            timer <= 0;
        end
        else begin
            timer <= timer + 1;
        end
    end


    always_comb begin

        nextstate = state;

        case (state) 
            S1: nextstate = S2;
            S2: nextstate = S3;
            S3: nextstate = S1;

        endcase
    end



    assign digit = state;


endmodule