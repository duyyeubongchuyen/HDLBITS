module edge_capture(
    input clk,
    input in,
    input reset,
    output reg out
);

    reg in_prev;

    always @(posedge clk) begin
        in_prev <= in;
    end

    always @(posedge clk) begin
        if(!reset && (out || (~in&&in_prev) )) out <= 1; 
        else out <= 0;
    end

endmodule 

module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

    genvar i;

    generate
        for(i = 0 ; i <32 ; i = i + 1) begin : ec_gen
            edge_capture ec0 (
                .clk (clk),
                .in (in[i]),
                .reset(reset),
                .out(out[i])
            );
        end
    endgenerate

endmodule

 