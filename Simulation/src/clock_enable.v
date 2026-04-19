module clock_enable(
    input clk,
    input reset,
    output reg enable_1hz
);

reg [3:0] count;

always @(posedge clk) begin
    if(reset) begin
        count <= 0;
        enable_1hz <= 0;
    end
    else if(count == 10) begin
        count <= 0;
        enable_1hz <= 1;
    end
    else begin
        count <= count + 1;
        enable_1hz <= 0;
    end
end

endmodule