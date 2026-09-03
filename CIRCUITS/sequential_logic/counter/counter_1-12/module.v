module top_module (
    input clk,
    input reset,
    input enable,
    output reg [3:0] Q,
    output c_enable,
    output c_load,
    output c_d
);

    count4 c0 (
        .clk(clk),
        .enable(reset | enable),
        .load(enable),
        .d(Q),
        .Q(Q)
    );

    assign c_load = enable;
    assign c_enable = reset | enable;
    assign c_d =  Q;

endmodule


module count4(
    input clk,
    input enable, // mạch về 1
    input load, // cho phép chuyển qua cho Q
    input [3:0] d,
    output reg[3:0] Q
);
    always @(posedge clk) begin
        if(load) begin
            if(enable) Q <= 4'd1;
            else Q <= Q + 1;
        end
        else Q <= Q;
    end

endmodule
