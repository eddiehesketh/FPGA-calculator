`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2025 12:36:42
// Design Name: 
// Module Name: decimal_display
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


module decimal_display (
    input   logic [5 : 0] val,
    output  logic [6 : 0] segments1,
    output  logic [6 : 0] segments2    
);
                        

    always_comb begin
        case (val)
            6'd0, 6'd10, 6'd20, 6'd30:  segments1 = 7'b100_0000; // 0
            6'd1, 6'd11, 6'd21:         segments1 = 7'b111_1001; // 1
            6'd2, 6'd12, 6'd22:         segments1 = 7'b010_0100; // 2
            6'd3, 6'd13, 6'd23:         segments1 = 7'b011_0000; // 3
            6'd4, 6'd14, 6'd24:         segments1 = 7'b001_1001; // 4
            6'd5, 6'd15, 6'd25:         segments1 = 7'b001_0010; // 5
            6'd6, 6'd16, 6'd26:         segments1 = 7'b000_0010; // 6
            6'd7, 6'd17, 6'd27:         segments1 = 7'b111_1000; // 7
            6'd8, 6'd18, 6'd28:         segments1 = 7'b000_0000; // 8
            6'd9, 6'd19, 6'd29:         segments1 = 7'b001_0000; // 9
            default:                    segments1 = 7'b111_1111; // blank
        endcase
    end
    
    always_comb begin
        if (val >= 6'd10 && val < 6'd20)
            segments2 = 7'b111_1001;
        else if (val >= 6'd20 && val < 6'd30)
            segments2 = 7'b010_0100;
        else if (val == 6'd30)
            segments2 = 7'b011_0000;
        else 
            segments2 = 7'b111_1111;
    end
    
        
        
endmodule
