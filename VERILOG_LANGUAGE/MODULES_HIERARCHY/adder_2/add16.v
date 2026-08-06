module add16 ( //Bộ cộng toàn phần 16 bit được tạo thành bởi 16 bộ cộng 1 bit
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);

    wire [15:0] c;

    add1 inst0 (a[0], b[0], cin, sum[0], c[0]);
    add1 inst1 (a[1], b[1], c[0], sum[1], c[1]);
    add1 inst2 (a[2], b[2], c[1], sum[2], c[2]);
    add1 inst3 (a[3], b[3], c[2], sum[3], c[3]);
    add1 inst4 (a[4], b[4], c[3], sum[4], c[4]);
    add1 inst5 (a[5], b[5], c[4], sum[5], c[5]);
    add1 inst6 (a[6], b[6], c[5], sum[6], c[6]);
    add1 inst7 (a[7], b[7], c[6], sum[7], c[7]);
    add1 inst8 (a[8], b[8], c[7], sum[8], c[8]);
    add1 inst9 (a[9], b[9], c[8], sum[9], c[9]);
    add1 inst10 (a[10], b[10], c[9], sum[10], c[10]);
    add1 inst11 (a[11], b[11], c[10], sum[11], c[11]);
    add1 inst12 (a[12], b[12], c[11], sum[12], c[12]);
    add1 inst13 (a[13], b[13], c[12], sum[13], c[13]);
    add1 inst14 (a[14], b[14], c[13], sum[14], c[14]);
    add1 inst15 (a[15], b[15], c[14], sum[15], c[15]);
    
    assign cout = c[15];

endmodule


