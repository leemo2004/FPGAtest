`timescale 1ns / 1ps
module CRC5_RNG(
    input clk,
    input rst,
    input enable,        
    output reg [1:0] rand_out  
);

    reg [4:0] lfsr;  

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            lfsr     <= 5'b10001;  
            rand_out <= 0;
        end else if (enable) begin
            lfsr <= {lfsr[3:0], lfsr[4] ^ lfsr[2]};
            rand_out <= lfsr[1:0];  
        end
    end
endmodule
