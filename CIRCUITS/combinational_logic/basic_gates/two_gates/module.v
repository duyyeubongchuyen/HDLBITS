module top_module (
    input in1, in2 ,in3,
    output out
);

    wire in1_xnor_in2 = ~(in1 ^ in2);
    assign out = in1_xnor_in2 ^ in3;

endmodule