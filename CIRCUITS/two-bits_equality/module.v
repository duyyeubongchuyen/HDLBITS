module top_module (
    input [1:0] A,
    input [1:0] B,
    output z
);

    wire a0_xor_b0 = A[0] ^ B[0];
    wire a1_xor_b1 = A[1] ^ B[1];
    assign z = ~(a0_xor_b0 | a1_xor_b1);

endmodule