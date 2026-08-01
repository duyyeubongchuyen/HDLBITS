module my_dff (  // D flip-flop positive edge triggered
    input clk,
    input d,
    output reg q
);

    always @(posedge clk) begin
        q <= d;
    end

endmodule 