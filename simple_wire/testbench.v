module tb;

    reg in;
    wire out;

    top_module uut(
        .in(in),
        .out(out)
    );

    initial begin

        $dumpfile("dump.vcd");
        $dumpvars(0,tb);

        //Testcase 1: in = 0, expect out = 0
        in = 0;
        #10;

        //Testcase 2: in = 1, expect out =1
        in = 1;
        #10;

        $finish;
        
    end

endmodule

