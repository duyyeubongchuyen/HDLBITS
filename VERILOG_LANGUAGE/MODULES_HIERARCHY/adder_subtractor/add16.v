module add16 (
    input [15:0] a,
    inout [15:0] b,
    input cin,
    input [15:0] sum.
    input cout
);

    assign {cout, sum} = a + b + cin;

endmodule