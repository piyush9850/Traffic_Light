module TestBench ;

reg clk = 0;
reg rst;

wire [2:0] light_A,light_B;

traffic_light TF(clk,rst,light_A,light_B);

always #5 clk = ~clk;


initial begin

    $dumpfile("traffic.vcd");
    $dumpvars(0,TestBench);    

    $monitor("Time = %0t | light_A = %b | light_B = %b", $time, light_A, light_B);

    rst = 1;
    #20; 
    rst = 0;
    #300;

    $finish;
    
end
endmodule