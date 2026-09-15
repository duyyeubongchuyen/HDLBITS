module top_module (
    input clk,
    input reset,
    output [31:0] q
);
    wire tap_32 = 1'b0 ^ q[0];
    wire tap_22 = q[22] ^ q[0];
    wire tap_2 = q[2] ^ q[0];
    wire tap_1 = q[1] ^ q[0];

    always @(posedge clk) begin
        if(reset) q <= 32'h1;
        else begin
            q <= {tap_32, q[31:23], tap_22, q[21:3], tap_2, tap_1};
        end
    end

endmodule