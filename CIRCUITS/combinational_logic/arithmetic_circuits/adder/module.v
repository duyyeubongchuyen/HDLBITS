module fadd (
    input a, b, cin,
    output cout, sum
);

    wire p = a ^ b;
    assign sum = p ^ cin;
    assign cout = (cin & p) | (a & b);

endmodule

module top_module (
    input [3:0] x,
    input [3:0] y,
    output [4:0] sum
);

    wire [4:0] ripple_cin;
    assign ripple_cin[0] = 0;
    assign sum[4] = ripple_cin[4];

    genvar i;
    generate
        for(i = 0; i < 4; i = i + 1 ) begin : fadd_gen
            fadd inst (
                .a(x[i]),
                .b(y[i]),
                .cin(ripple_cin[i]),
                .cout(ripple_cin[i+1]),
                .sum(sum[i])
            );
        end
    endgenerate

endmodule