module addition (input logic[3 : 0] b1, b2, output logic[4 : 0] result);

     logic c_in;

     c_in = 0;

     result[0] = b1[0] ^ b2[0] ^ c_in;
     c_in = (b1[0] & b2[0]) | (b1[0] & c_in) | (b2[0] & c_in);

     result[1] = b1[1] ^ b2[1] ^ c_in;
     c_in = (b1[1] & b2[1]) | (b1[1] & c_in) | (b2[1] & c_in);

     result[2] = b1[2] ^ b2[2] ^ c_in;
     c_in = (b1[2] & b2[2]) | (b1[2] & c_in) | (b2[2] & c_in);

     result[3] = b1[3] ^ b2[3] ^ c_in;
     result[4] = (b1[3] & b2[3]) | (b1[3] & c_in) | (b2[3] & c_in);

endmodule