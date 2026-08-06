module f_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

endmodule

module top_module (
    input [99:0] a, b,
    input cin,
    output reg [99:0] cout,
    output reg [99:0] sum
);

    wire a0 = a[0];
    wire b0 = b[0];

    genvar i;
    wire sum0;
    wire cout0;

    f_adder inst0(
        .a(a0),
        .b(b0),
        .cin(cin),
        .sum(sum0),
        .cout(cout0)
    );

    always @(*) begin
        sum[0] = sum0;
        cout[0] = cout0;
    end

    generate

        for(i = 1; i < 100 ; i = i + 1) begin : f_adder_gen
            wire f_adder_sum;
            wire f_adder_cout;

            f_adder inst(
                .a(a[i]),
                .b(b[i]),
                .cin(cout[i-1]),
                .sum(f_adder_sum),
                .cout(f_adder_cout)
            );

            always @(*) begin
                sum[i] = f_adder_sum;
                cout[i] = f_adder_cout;
            end
        end

    endgenerate

endmodule
    
