module dff (
    input clk,
    input d,
    output reg q
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule

module top_module (
    input in,
    input clk,
    output out
);

    wire temp;
    wire in1;

    dff inst0 (
        .clk(clk),
        .d(in1),
        .q(temp)
    );
    
    assign out = temp;
    assign in1 = in ^ temp;

endmodule