module sync_debounce(
    input clk,
    input reset,
    input noisy,
    output reg clean
);

reg sync0;
reg sync1;

always @(posedge clk) begin

    if(reset) begin
        sync0 <= 0;
        sync1 <= 0;
        clean <= 0;
    end

    else begin
        sync0 <= noisy;
        sync1 <= sync0;
        clean <= sync1;
    end

end

endmodule