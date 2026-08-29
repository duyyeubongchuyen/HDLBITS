module any_edge_detect (
    input clk,
    input in,
    output reg out
);

    reg in_rev;

    always @(posedge clk) begin
        in_rev <= in;
    end

    always @(posedge clk) begin
        if(in ^ in_rev) out <= 1;
        else out <= 0;
    end

endmodule

module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);

    genvar i;
    generate
        for(i = 0 ; i < 8 ; i = i + 1) begin : ed_gen
            any_edge_detect aed (
                .clk(clk),
                .in(in[i]),
                .out(anyedge[i])
            );
        end
    endgenerate

endmodule