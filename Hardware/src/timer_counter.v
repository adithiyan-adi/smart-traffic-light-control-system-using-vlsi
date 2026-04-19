module timer_counter(
    input clk,
    input reset,
    input enable_1hz,
    input load,
    input [7:0] load_value,
    output reg [7:0] count,
    output timeout
);

assign timeout = (count==0);

always @(posedge clk) begin

if(reset)
count <= 0;

else if(load)
count <= load_value;

else if(enable_1hz && count>0)
count <= count - 1;

end

endmodule