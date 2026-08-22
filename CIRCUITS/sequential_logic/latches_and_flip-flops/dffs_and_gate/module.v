module dff (
    input clk,
    input d,
    input set,
    input clr,
    output reg q
);

    always @(posedge clk or posedge set or posedge clr) begin
        if(set) q <= 1;
        else if(clr) q <= 0;
        else q <= d;
    end

endmodule

module top_module (
    input clk,
    input x,
    output z
);
    wire Q0, Q1, Q2;

    dff dff0 (.clk(clk), .d(x ^ Q0), .set(), .clr(), .q(Q0),);
    dff dff1 (.clk(clk), .d(x & ~Q1), .set(), .clr(), .q(Q1),);
    dff dff2 (.clk(clk), .d(x | ~Q2), .set(), .clr(), .q(Q2),);

    assign z = ~(Q0 | Q1 | Q2);

endmodule


