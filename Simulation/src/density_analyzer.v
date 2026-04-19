module density_analyzer(
    input [2:0] density,
    output reg [7:0] green_time
);

parameter BASE = 3;
parameter K = 1;
parameter MAX_GREEN = 7;

always @(*) begin
    green_time = BASE + (density * K);

    if(green_time > MAX_GREEN)
        green_time = MAX_GREEN;
end

endmodule