module fadd ( 
    input a, b, cin,
    output cout, sum
);

    wire p = a ^ b;
    assign sum = p ^ cin;
    assign cout = (p & cin) | (a & b);

endmodule

module top_module(
    input [2:0] a, b,
    input cin,
    output [2:0] sum,
    output [2:0] cout
);

    wire [3:0] cout_temp;
    assign cout_temp[0] = cin;
    assign cout = cout_temp[3:1];

    genvar i;
    generate
        for(i=0;i<3;i = i + 1) begin : fadd_gen
            fadd inst (
                .a(a[i]),
                .b(b[i]),
                .cin(cout_temp[i]),
                .cout(cout_temp[i+1]),
                .sum(sum[i])
            );
        end
    endgenerate

endmodule