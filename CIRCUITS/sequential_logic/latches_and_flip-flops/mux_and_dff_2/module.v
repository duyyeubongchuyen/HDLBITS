module mux (
    input s,
    input d0, d1,
    output reg y
);

    always @(*) begin
        if(s) y = d1;
        else y = d0;
    end

endmodule

module dff (
    input clk,
    input d,
    output q, neg_q
);

    always @(posedge clk) begin
        q <= d;
        neg_q <= ~d;
    end

endmodule

module top_module (
    input clk,
    input w , R, E, L,
    output Q
);

    wire dff_out = Q;
    wire dff_in;
    wire mux0_out;

    mux mux0 (
        .s(E),
        .d0(dff_out),
        .d1(w),
        .y(mux0_out)
    );

    mux mux1 (
        .s(L),
        .d0(mux0_out),
        .d1(R),
        .y(dff_in)
    );

    dff dff0 (
        .clk(clk),
        .d(dff_in),
        .q(Q),
        .neg_q()
    );

endmodule