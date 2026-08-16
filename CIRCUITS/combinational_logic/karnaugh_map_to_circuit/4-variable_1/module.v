module top_module (
    input a, b, c, d,
    output out
);

    assign out = ~(a|d) | ~(b|c) | a&c&d | (~a)&b&c;

endmodule