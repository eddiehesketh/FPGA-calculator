module segment_display( input logic[1 : 0] digit,
                        input logic is_negative,
                        input logic is_dec,
                        input logic [5 : 0] display_value,
                        output logic[6 : 0] segments);

    logic [6 : 0] first_hex, second_hex;

    hex_display first_hex_disp(.val(display_value[3 : 0]), .segments(first_hex));
    hex_display second_hex_hex_disp(.val({2'b00, display_value[5 : 4]}), .segments(second_hex));

    always_comb begin
        case (state)
            2'd0: segments = hex_low;
            2'd1: segments = hex_high;
            2'd2: segments = is_negative ? 7'b011_1111 : 7'b111_1111;
            default: segments = 7'b111_1111;
        endcase
    end


endmodule