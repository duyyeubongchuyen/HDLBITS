module top_module (
    input clk,
    input d,
    output reg q
);

    wire d1, d2;
    reg q1, q2;
    reg prev_q1, prev_q2;

    assign d1 = d;
    assign d2 = d;

    always @(posedge clk) begin
        prev_q1 <= q1;
    end

    always @(negedge clk) begin
        prev_q2 <= q2;
    end

    always @(posedge clk) begin
        q1 <= d1;
    end

    always @(negedge clk) begin
        q2 <= d2;
    end

    always @(*) begin
        if(clk) q <= q1;
        else q <= q2;
    end

endmodule
