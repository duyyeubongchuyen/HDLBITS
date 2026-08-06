module top_module (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [31:0] b_xor_sub = b ^ {32{sub}}; // sub = 1 : bộ trừ
                                           // sub = 0 : bộ cộng
    wire cout;

    add16 inst0 (
        .a(a[15:0]),
        .b(b_xor_sub[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(cout)
    );

    add16 inst1 (
        .a(a[31:16]),
        .b(b_xor_sub[31:16]),
        .cin(cout),
        .sum(sum[31:16]),
        .cout()
    );

endmodule