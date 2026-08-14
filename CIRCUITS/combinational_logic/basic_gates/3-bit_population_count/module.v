module top_module (
    input [2:0] in,
    output [1:0] out
);

    wire p = in[2] ^ in[1];
    assign out[0] = p ^ in[0];
    assign out[1] = (in[0] & p) | (in[2] & in[1]);

endmodule