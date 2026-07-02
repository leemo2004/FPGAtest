`timescale 1ns / 1ps
module FSM_tb;

    reg clk;
    reg rst;
    wire [1:0] light;
  
    FSM uut (
        .clk(clk),
        .rst(rst),
        .light(light)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #10;
        rst = 0;
        #500;  
        $finish;
    end

    initial begin
        $monitor("Time=%0t | light=%b (%s)", 
                  $time, light,
                  (light == 2'b00) ? "GREEN" :
                  (light == 2'b01) ? "YELLOW" : "RED");
    end

endmodule
