module top_module (
    input a, b, cin,
    output cout, sum
);

    wire p = a ^ b;
    assign sum = p ^ cin;
    assign cout = (cin & p) | (a & b);

endmodule 