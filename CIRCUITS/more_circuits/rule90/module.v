module top_module (
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q
);

    wire[513:0] q_shift_left = {q[511:0], 2'b00};
    wire[513:0] q_shift_right = {2'b00, q[511:0]};

    always @(posedge clk) begin
        if(load) begin
            q <= data;
        end
        else q <= q_shift_left[512:1] ^ q_shift_right[512:1];
    end

endmodule