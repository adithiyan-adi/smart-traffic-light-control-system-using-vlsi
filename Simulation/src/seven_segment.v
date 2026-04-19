module seven_segment(
    input clk,
    input [7:0] value,
    output reg [6:0] seg,
    output reg [1:0] an
);

reg toggle;
reg [3:0] digit;

always @(posedge clk)
    toggle <= ~toggle;

always @(*) begin

    if(toggle) begin
        digit = value % 10;
        an = 2'b10;
    end
    else begin
        digit = value / 10;
        an = 2'b01;
    end

    case(digit)

        0: seg = 7'b1000000;
        1: seg = 7'b1111001;
        2: seg = 7'b0100100;
        3: seg = 7'b0110000;
        4: seg = 7'b0011001;
        5: seg = 7'b0010010;
        6: seg = 7'b0000010;
        7: seg = 7'b1111000;
        8: seg = 7'b0000000;
        9: seg = 7'b0010000;

        default: seg = 7'b1111111;

    endcase

end

endmodule