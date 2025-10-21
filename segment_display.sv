`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2025 16:14:22
// Design Name: 
// Module Name: segment_display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module segment_display(
    input   logic [3 : 0]   digit,
    input   logic           show_negative,
    input   logic           is_dec,
    input   logic [5 : 0]   display_value,
    output  logic [6 : 0]   segments
);

    logic [6 : 0] first_hex;
    logic [6 : 0] second_hex;
    logic [6 : 0] first_dec;
    logic [6 : 0] second_dec;

    hex_display both_hex_disp(
        .val(display_value), 
        .segments1(first_hex), 
        .segments2(second_hex)
    );
    
    decimal_display both_dec_disp(
        .val(display_value), 
        .segments1(first_dec), 
        .segments2(second_dec)
    );

    always_comb begin
        case (digit)
            4'b1110: segments = is_dec ? first_dec : first_hex;
            4'b1101: segments = is_dec ? second_dec : second_hex;
            4'b1011: segments = show_negative ? 7'b011_1111 : 7'b111_1111;
            default: segments = 7'b111_1111;
        endcase
    end


endmodule