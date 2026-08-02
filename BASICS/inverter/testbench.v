module tb;

    reg in;
    wire out;

    top_module uut (
        .in(in),
        .out(out)
    );

    initial begin

        $dumpfile ("output.vcd");
        $dumpvars(0, tb);

        //Testcase 1:
        in = 0;
        #10;

        //Testcase 2:
        in = 1;
        #10;

        $finish;

    end

endmodule