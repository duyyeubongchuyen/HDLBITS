//CÁCH 1;

// module fadd (
//     input a, b, cin,
//     output cout, sum
// );

//     wire p = a ^ b;
//     assign sum = p ^ cin;
//     assign cout = (cin & p) | (a & b);

// endmodule

// module top_module (
//     input [7:0] a,
//     input [7:0] b,
//     output [7:0] s,
//     output overflow
// );

//     wire [8:0] cin;
//     assign cin[0] = 0;
//     assign overflow = cin[8] ^ cin[7];

//     genvar i;
//     generate
//         for(i = 0 ;i < 8 ;i = i + 1 ) begin : fadd_gen
//             fadd inst(
//                 .a(a[i]),
//                 .b(b[i]),
//                 .cin(cin[i]),
//                 .cout(cin[i+1]),
//                 .sum(s[i])
//             );
//         end
//     endgenerate


// endmodule

//CÁCH 2
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);

    assign s = a + b;
    assign overflow = (a[7] == b[7]) && (s[7] != a[7]);

endmodule