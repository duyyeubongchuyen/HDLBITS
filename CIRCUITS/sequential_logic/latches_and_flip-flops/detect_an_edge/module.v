module edge_detect_module (
    input clk,
    input reg in,
    output reg out
);

    reg in_prev;

    always @(posedge clk) begin
        in_prev <= in;
    end

    always @(posedge clk) begin
        if(in && ~in_prev) out <= 1; //in tích cạnh lên 
        else out <= 0;
    end

endmodule 

module top_module (
    input clk,
    input reg [7:0] in,
    output reg [7:0] pedge
);

    genvar i;
    generate
        for(i = 0 ;i < 8; i = i + 1) begin : d_gen
            edge_detect_module edm1(
                .clk(clk),
                .in(in[i]),
                .out(pedge[i])
            );
        end
    endgenerate

endmodule
