module bcd_fadd (
    input [3:0] a, b,
    input cin,
    output cout,
    output [3:0] sum
);

    wire [4:0] dec_sum = a + b + cin;
    assign {cout,sum} = (dec_sum > 4'd9) ? (dec_sum + 4'd6) : dec_sum;

endmodule

module top_module (
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum
);

    wire [4:0] cin_vec;
    assign cin_vec[0] = cin;
    assign cout = cin_vec[4];

    genvar i;
    generate
        for(i = 0 ; i < 4 ; i = i + 1) begin : bcd_gen
            bcd_fadd inst (
                .a(a[i*4 + 3 : i*4]),
                .b(b[i*4 + 3 : i*4]),
                .cin(cin_vec[i]),
                .cout(cin_vec[i+1]),
                .sum(sum[i*4 + 3 : i*4])
            );
        end
    endgenerate

endmodule