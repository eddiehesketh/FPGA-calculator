`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2025 14:09:26
// Design Name: 
// Module Name: hex_display
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



module hex_display(
    input   logic [5 : 0] val,
    output  logic [6 : 0] segments1,
    output  logic [6 : 0] segments2
);
                        

    always_comb begin
        case (val[3 : 0])
            4'h0: segments1 = 7'b100_0000; // 0
            4'h1: segments1 = 7'b111_1001; // 1
            4'h2: segments1 = 7'b010_0100; // 2
            4'h3: segments1 = 7'b011_0000; // 3
            4'h4: segments1 = 7'b001_1001; // 4
            4'h5: segments1 = 7'b001_0010; // 5
            4'h6: segments1 = 7'b000_0010; // 6
            4'h7: segments1 = 7'b111_1000; // 7
            4'h8: segments1 = 7'b000_0000; // 8
            4'h9: segments1 = 7'b001_0000; // 9
            4'hA: segments1 = 7'b000_1000; // A
            4'hB: segments1 = 7'b000_0011; // b
            4'hC: segments1 = 7'b100_0110; // C
            4'hD: segments1 = 7'b010_0001; // d
            4'hE: segments1 = 7'b000_0110; // E
            4'hF: segments1 = 7'b000_1110; // F
            default: segments1 = 7'b111_1111; // blank / off
        endcase
    end
    
    always_comb begin
        case (val[5 : 4])
            2'h1: segments2 = 7'b111_1001;
            default: segments2 = 7'b111_1111;
        endcase
        
    end
    
        
        
endmodule

