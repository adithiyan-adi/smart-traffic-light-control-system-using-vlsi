module density_analyzer(
    input [2:0] density,
    output reg [7:0] green_time
);

parameter BASE = 10;
parameter K = 5;
parameter MAX_GREEN = 60;

always @(*) begin

    green_time = BASE + (density * K);

    if(green_time > MAX_GREEN)
        green_time = MAX_GREEN;

end

endmodule