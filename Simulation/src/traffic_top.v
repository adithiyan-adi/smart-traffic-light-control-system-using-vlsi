module traffic_top(

    input clk_100mhz,
    input reset,

    input [2:0] density_N,
    input [2:0] density_E,
    input [2:0] density_S,
    input [2:0] density_W,

    input btn_N,
    input btn_E,
    input btn_S,
    input btn_W,

    output [2:0] N_light,
    output [2:0] E_light,
    output [2:0] S_light,
    output [2:0] W_light,

    output [6:0] seg,
    output [1:0] an
);

wire enable_1hz;

clock_enable CE(
    clk_100mhz,
    reset,
    enable_1hz
);


wire emergency_N;
wire emergency_E;
wire emergency_S;
wire emergency_W;

sync_debounce DBN(clk_100mhz, reset, btn_N, emergency_N);
sync_debounce DBE(clk_100mhz, reset, btn_E, emergency_E);
sync_debounce DBS(clk_100mhz, reset, btn_S, emergency_S);
sync_debounce DBW(clk_100mhz, reset, btn_W, emergency_W);


wire [7:0] green_N;
wire [7:0] green_E;
wire [7:0] green_S;
wire [7:0] green_W;

density_analyzer DN(density_N, green_N);
density_analyzer DE(density_E, green_E);
density_analyzer DS(density_S, green_S);
density_analyzer DW(density_W, green_W);


wire [2:0] state;
wire load;
wire [7:0] timer_value;
wire [7:0] count;
wire timeout;

fsm_controller FSM(
    clk_100mhz,
    reset,
    enable_1hz,
    timeout,

    emergency_N,
    emergency_E,
    emergency_S,
    emergency_W,

    green_N,
    green_E,
    green_S,
    green_W,

    state,
    load,
    timer_value
);

timer_counter TC(
    clk_100mhz,
    reset,
    enable_1hz,
    load,
    timer_value,
    count,
    timeout
);


assign N_light = (state==1)?3'b001:(state==2)?3'b010:3'b100;
assign E_light = (state==3)?3'b001:(state==4)?3'b010:3'b100;
assign S_light = (state==5)?3'b001:(state==6)?3'b010:3'b100;
assign W_light = (state==7)?3'b001:3'b100;


seven_segment DISP(
    clk_100mhz,
    count,
    seg,
    an
);

endmodule