module clock_enable(
    input clk,
    input reset,
    output reg enable_1hz
);

reg [26:0] counter;

always @(posedge clk) begin
    if(reset) begin
        counter <= 0;
        enable_1hz <= 0;
    end
    else if(counter == 100000000-1) begin
        counter <= 0;
        enable_1hz <= 1;
    end
    else begin
        counter <= counter + 1;
        enable_1hz <= 0;
    end
end

endmodule