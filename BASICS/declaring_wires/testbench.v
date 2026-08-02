module tb;
    reg a, b, c, d;
    wire out, out_n;

    top_module uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out),
        .out_n(out_n)
    );

    initial begin

        $dumpfile ("output.vcd");
        $dumpvars(0, tb);

        //Testcase 1: 
        a = 0; b = 0; c = 0; d = 0;
        #10;

        //Testcase 2:
        a = 0; b = 1; c = 1; d = 0;
        #10;

        //Testcase 3:
        a = 1; b = 1; c = 1; d = 0;
        #10; 

        //Testcase 4:
        a = 0; b  = 1; c = 1; d = 1;
        #10;

        $finish;
    
    end

endmodule