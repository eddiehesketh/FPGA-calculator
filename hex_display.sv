module hex_display(input logic[3 : 0] val,
                   output logic[6 : 0] segments);

    always_comb begin
        case (val)
            4'h0: segments = 7'b100_0000; // 0
            4'h1: segments = 7'b111_1001; // 1
            4'h2: segments = 7'b010_0100; // 2
            4'h3: segments = 7'b011_0000; // 3
            4'h4: segments = 7'b001_1001; // 4
            4'h5: segments = 7'b001_0010; // 5
            4'h6: segments = 7'b000_0010; // 6
            4'h7: segments = 7'b111_1000; // 7
            4'h8: segments = 7'b000_0000; // 8
            4'h9: segments = 7'b001_0000; // 9
            4'hA: segments = 7'b000_1000; // A
            4'hB: segments = 7'b000_0011; // b
            4'hC: segments = 7'b100_0110; // C
            4'hD: segments = 7'b010_0001; // d
            4'hE: segments = 7'b000_0110; // E
            4'hF: segments = 7'b000_1110; // F
            default: segments = 7'b111_1111; // blank / off
        endcase
    end


endmodule