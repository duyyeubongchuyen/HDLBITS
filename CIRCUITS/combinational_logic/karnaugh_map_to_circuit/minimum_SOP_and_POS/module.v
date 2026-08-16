module top_module (
    input a, b, c, d,
    output out_sop,
    output out_pos
);

    assign out_sop = c&d | ~a&~b&c;
    assign out_pos = c&(~a|b)&(~b|d);

endmodule