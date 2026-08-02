module tb;

    reg a, b, c;
    wire w, x, y, z;

    top_module uut(
        .a(a),
        .b(b),
        .c(c),
        .w(w),
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin

        $dumpfile("output.vcd");
        $dumpvars(0,tb);

        //Testcase 1:
        a = 0; b = 0; c = 0;
        #10;

        //Testcase 2:
        a = 1; b = 0; c = 1;
        #10;

        //Testcase 3:
        a = 0; b = 1; c = 0;
        #10;

        $finish;

    end

endmodule