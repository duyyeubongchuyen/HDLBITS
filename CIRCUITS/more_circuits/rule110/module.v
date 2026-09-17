module  top_module (
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
);

    wire [513:0] q_shift_left = {2'b00, q[511:0]};
    wire [513:0] q_shift_right = {q[511:0], 2'b00};

    always @(posedge clk) begin
        if(load) q <= data;
        else q <= (q ^ q_shift_right[512:1]) | (q & ~q_shift_left[512:1]);
    end
    
    
endmodule 