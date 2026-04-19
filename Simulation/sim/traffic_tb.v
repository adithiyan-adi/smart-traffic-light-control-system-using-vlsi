`timescale 1ns/1ps

module traffic_tb;

reg clk;
reg reset;

reg [2:0] density_N;
reg [2:0] density_E;
reg [2:0] density_S;
reg [2:0] density_W;

reg btn_N;
reg btn_E;
reg btn_S;
reg btn_W;

wire [2:0] N_light;
wire [2:0] E_light;
wire [2:0] S_light;
wire [2:0] W_light;

wire [6:0] seg;
wire [1:0] an;


initial clk = 0;
always #5 clk = ~clk;


traffic_top uut(

clk,
reset,

density_N,
density_E,
density_S,
density_W,

btn_N,
btn_E,
btn_S,
btn_W,

N_light,
E_light,
S_light,
W_light,

seg,
an

);


initial begin

reset = 1;

density_N = 2;
density_E = 1;
density_S = 0;
density_W = 3;

btn_N = 0;
btn_E = 0;
btn_S = 0;
btn_W = 0;

#50;
reset = 0;


#200;
btn_E = 1;
#20;
btn_E = 0;


#400;
btn_S = 1;
#20;
btn_S = 0;


#2000;
$stop;

end

endmodule