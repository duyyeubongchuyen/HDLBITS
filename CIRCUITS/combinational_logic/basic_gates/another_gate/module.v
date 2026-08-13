module top_module (
    input in1, in2,
    output out
);

    wire n_in2 = ~in2;
    assign out = in1 & n_in2;

endmodule