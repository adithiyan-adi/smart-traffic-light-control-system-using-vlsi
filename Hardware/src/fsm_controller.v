module fsm_controller(

    input clk,
    input reset,
    input enable_1hz,
    input timeout,

    input emergency_N,
    input emergency_E,
    input emergency_S,
    input emergency_W,

    input [7:0] green_N,
    input [7:0] green_E,
    input [7:0] green_S,
    input [7:0] green_W,

    output reg [2:0] state,
    output reg load,
    output reg [7:0] timer_value
);

parameter ALL_RED = 0;
parameter N_G = 1;
parameter N_Y = 2;
parameter E_G = 3;
parameter E_Y = 4;
parameter S_G = 5;
parameter S_Y = 6;
parameter W_G = 7;

parameter YELLOW = 3;

reg [2:0] next_state;

always @(*) begin

next_state = state;

case(state)

ALL_RED: next_state = N_G;

N_G:
if(emergency_E || emergency_S || emergency_W || timeout)
next_state = N_Y;

N_Y:
if(timeout)
begin
if(emergency_E) next_state = E_G;
else if(emergency_S) next_state = S_G;
else if(emergency_W) next_state = W_G;
else next_state = E_G;
end

E_G:
if(emergency_N || emergency_S || emergency_W || timeout)
next_state = E_Y;

E_Y:
if(timeout)
begin
if(emergency_N) next_state = N_G;
else if(emergency_S) next_state = S_G;
else if(emergency_W) next_state = W_G;
else next_state = S_G;
end

S_G:
if(emergency_N || emergency_E || emergency_W || timeout)
next_state = S_Y;

S_Y:
if(timeout)
begin
if(emergency_N) next_state = N_G;
else if(emergency_E) next_state = E_G;
else if(emergency_W) next_state = W_G;
else next_state = W_G;
end

W_G:
if(emergency_N || emergency_E || emergency_S || timeout)
next_state = ALL_RED;

default:
next_state = ALL_RED;

endcase

end

always @(posedge clk) begin
if(reset)
state <= ALL_RED;
else if(enable_1hz)
state <= next_state;
end

always @(*) begin

case(next_state)

N_G: timer_value = green_N;
N_Y: timer_value = YELLOW;

E_G: timer_value = green_E;
E_Y: timer_value = YELLOW;

S_G: timer_value = green_S;
S_Y: timer_value = YELLOW;

W_G: timer_value = green_W;

default: timer_value = 5;

endcase

end

always @(posedge clk) begin

if(reset)
load <= 1;
else if(enable_1hz && state!=next_state)
load <= 1;
else
load <= 0;

end

endmodule