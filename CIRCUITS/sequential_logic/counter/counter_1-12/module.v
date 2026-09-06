module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);

    assign c_load = reset || (Q == 4'd12 && enable);
    assign c_enable = enable;
    assign c_d =  4'd1;

    count4 c0 (
        .clk(clk),
        .enable(c_enable),
        .load(c_load),
        .d(c_d),
        .Q(Q)
    );

endmodule


module count4(
    input clk,
    input enable, // cho phép thực hiện phép cộng 
    input load, // ép Q về một giá trị nào đó
    input [3:0] d,
    output reg[3:0] Q
);
    always @(posedge clk) begin
        if(load) Q <= d;
        else begin
            if(enable) Q <= Q + 1;
            else Q <= Q;
        end
    end

endmodule
