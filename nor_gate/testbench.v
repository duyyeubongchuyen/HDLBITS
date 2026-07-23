module tb;

    reg a;
    reg b;
    wire out;

    top_module uut (
        .a(a),
        .b(b),
        .out(out)
    );

    initial begin

        $dumpfile ("output.vcd");
        $dumpvars(0, tb);

        //Test case 1:
        a = 0; b = 0;
        #10;

        //Testcase 2:
        a = 0; b = 1;
        #10;

        //Testcase 3:
        a = 1; b = 0;
        #10;

        //Testcase 4:
        a = 1; b = 1;
        #10;

        $finish;

    end

endmodule

    