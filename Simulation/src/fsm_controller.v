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


//------------------------------------------------
// STATE ENCODING
//------------------------------------------------

parameter ALL_RED = 3'd0;
parameter N_G     = 3'd1;
parameter N_Y     = 3'd2;
parameter E_G     = 3'd3;
parameter E_Y     = 3'd4;
parameter S_G     = 3'd5;
parameter S_Y     = 3'd6;
parameter W_G     = 3'd7;

parameter YELLOW  = 2;

reg [2:0] next_state;


//------------------------------------------------
// NEXT STATE LOGIC
//------------------------------------------------

always @(*) begin

    next_state = state;

    case(state)

        //------------------------------------------------
        // ALL RED → start cycle
        //------------------------------------------------

        ALL_RED:
            next_state = N_G;


        //------------------------------------------------
        // NORTH GREEN
        //------------------------------------------------

        N_G:
            if(emergency_E)       next_state = N_Y;
            else if(emergency_S)  next_state = N_Y;
            else if(emergency_W)  next_state = N_Y;
            else if(timeout)      next_state = N_Y;
            else                  next_state = N_G;


        //------------------------------------------------
        // NORTH YELLOW
        //------------------------------------------------

        N_Y:
begin
    if(timeout)
    begin
        if(emergency_E)
            next_state = E_G;
        else if(emergency_S)
            next_state = S_G;
        else if(emergency_W)
            next_state = W_G;
        else
            next_state = E_G;   // normal sequence
    end
    else
        next_state = N_Y;
end

        //------------------------------------------------
        // EAST GREEN
        //------------------------------------------------

        E_G:
            if(emergency_N)       next_state = E_Y;
            else if(emergency_S)  next_state = E_Y;
            else if(emergency_W)  next_state = E_Y;
            else if(timeout)      next_state = E_Y;
            else                  next_state = E_G;


        //------------------------------------------------
        // EAST YELLOW
        //------------------------------------------------

        E_Y:
            if(timeout) begin
                if(emergency_N)       next_state = N_G;
                else if(emergency_S)  next_state = S_G;
                else if(emergency_W)  next_state = W_G;
                else                  next_state = S_G;
            end
            else
                next_state = E_Y;


        //------------------------------------------------
        // SOUTH GREEN
        //------------------------------------------------

        S_G:
            if(emergency_N)       next_state = S_Y;
            else if(emergency_E)  next_state = S_Y;
            else if(emergency_W)  next_state = S_Y;
            else if(timeout)      next_state = S_Y;
            else                  next_state = S_G;


        //------------------------------------------------
        // SOUTH YELLOW
        //------------------------------------------------

        S_Y:
            if(timeout) begin
                if(emergency_N)       next_state = N_G;
                else if(emergency_E)  next_state = E_G;
                else if(emergency_W)  next_state = W_G;
                else                  next_state = W_G;
            end
            else
                next_state = S_Y;


        //------------------------------------------------
        // WEST GREEN
        //------------------------------------------------

        W_G:
            if(emergency_N)       next_state = N_Y;
            else if(emergency_E)  next_state = N_Y;
            else if(emergency_S)  next_state = N_Y;
            else if(timeout)      next_state = ALL_RED;
            else                  next_state = W_G;


        default:
            next_state = ALL_RED;

    endcase

end



//------------------------------------------------
// STATE REGISTER
//------------------------------------------------

always @(posedge clk or posedge reset) begin

    if(reset)
        state <= ALL_RED;

    else if(enable_1hz)
        state <= next_state;

end



//------------------------------------------------
// TIMER VALUE SELECTION
//------------------------------------------------

always @(*) begin

    case(next_state)

        N_G: timer_value = green_N;
        N_Y: timer_value = YELLOW;

        E_G: timer_value = green_E;
        E_Y: timer_value = YELLOW;

        S_G: timer_value = green_S;
        S_Y: timer_value = YELLOW;

        W_G: timer_value = green_W;

        default: timer_value = 3;

    endcase

end



//------------------------------------------------
// LOAD SIGNAL (LOAD TIMER ON STATE CHANGE)
//------------------------------------------------

always @(posedge clk or posedge reset) begin

    if(reset)
        load <= 1;

    else if(enable_1hz && (state != next_state))
        load <= 1;

    else
        load <= 0;

end

endmodule