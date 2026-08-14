module module_A (
    input x, y,
    output z
);

    assign z = (x ^ y) & x;

endmodule

module module_B (
    input x, y,
    output z
);

    assign z = ~ ( x ^ y);

endmodule

module top_module (
    input x, y,
    output z
);

    wire x0, x1, x2, x3, y0, y1, y2, y3;
    assign {x0, x1, x2, x3, y0, y1, y2, y3} = {{4{x}}, {4{y}}};
    wire z0, z1, z2, z3;

    module_A IA1(
        .x(x0),
        .y(y0),
        .z(z0)
    );

    module_A IB1 (
        .x(x1),
        .y(y1),
        .z(z1)
    );

    module_B IA2 (
        .x(x2),
        .y(y2),
        .z(z2)
    );

    module_B IB2 (
        .x(x3),
        .y(y3),
        .z(z3)
    );

    assign z = (z0 | z1) ^ (z2 & z3); 

endmodule
