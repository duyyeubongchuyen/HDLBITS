module top_module (
    input clk,
    input reset,
    output [3:1] ena,
    output [15:0] q
);

    bcdcount counter0 (.clk(clk), .reset(reset), .enable(1'd1),. q(q[3:0]));
    bcdcount counter1 (.clk(clk), .reset(reset), .enable(ena[1]),. q(q[7:4]));
    bcdcount counter2 (.clk(clk), .reset(reset), .enable(ena[2]),. q(q[11:8]));
    bcdcount counter3 (.clk(clk), .reset(reset), .enable(ena[3]),. q(q[15:12]));

    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (q[7:4] == 4'd9) && (ena[1]);
    assign ena[3] = (q[11:8] == 4'd9) && (ena[2]);

endmodule

module bcdcount (
    input clk,
    input reset,
    input enable,
    output [3:0] q
);

    always @(posedge clk) begin
        if(reset) q <= 4'd0;
        else begin
            if(enable) begin
                if(q == 4'd9) begin
                    q <= q + 4'd7;
                end
                else q <= q + 4'd1;
            end
            else q <= q;
        end
    end

endmodule   