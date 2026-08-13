module top_module (
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different
);

    wire [99:0]both_full = in & (in>>1);
    wire [99:0]any_full = in | (in<<1);

    assign out_both = both_full[98:0];
    assign out_any = any_full[99:1];
    assign out_different = (in ^ {in[0], in[99:1]});

endmodule