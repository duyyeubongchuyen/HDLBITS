module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
);

    wire [3:0] Q0, Q1, Q2;

    bcdcount counter0(.clk(clk), .reset(reset), .enable(c_enable[0]), .Q(Q0));
    bcdcount counter1(.clk(clk), .reset(reset), .enable(c_enable[1]), .Q(Q1));
    bcdcount counter2(.clk(clk), .reset(reset), .enable(c_enable[2]), .Q(Q2));

    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (Q0==4'b1001) && c_enable[0];
    assign c_enable[2] = (Q1==4'b1001) && c_enable[1];
    assign OneHertz = (Q2==4'b1001) && c_enable[2];

endmodule

module bcdcount (
    input clk,
    input reset,
    input enable,
    output reg[3:0] Q
);

  always @(posedge clk) begin
    if(reset) Q <= 4'd0;
    else begin
        if(enable) begin
            if(Q == 4'd9) Q <= Q + 4'd7;
            else Q <= Q + 4'd1;
        end
        else Q <= Q;
    end
  end

endmodule