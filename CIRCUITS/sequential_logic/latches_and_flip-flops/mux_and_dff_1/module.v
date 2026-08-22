module mux (
    input s,
    input d0, d1,
    output reg y
);

    always @(*) begin
        if(!s) y = d0;
        else y = d1; 
    end

endmodule

module dff (
    input d, clk,
    output reg q
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule

module top_module (
    input clk,
    input L,
    input r_in,
    input q_in,
    output reg Q
);

    wire dff_in;

    mux inst0 (
        .s(L),
        .d0(q_in),
        .d1(r_in),
        .y(dff_in),
    );

    dff inst1 (
        .d(dff_in),
        .clk(clk),
        .q(Q)
    );

endmodule



