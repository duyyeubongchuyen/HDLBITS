module top_module (
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different
);

    wire a = in[3] & in[2];
    wire b = in[2] & in[1];
    wire c = in[1] & in[0];
    wire x = in[3] | in[2];
    wire y = in[2] | in[1];
    wire z = in[1] | in[0];

    assign out_both = {a, b, c};
    assign out_any = {x, y, z};
    assign out_different = {(in[3]^ in[0]),(in[2] ^ in[3]), (in[1] ^ in[2]), (in[0] ^ in[1])};

endmodule