module top_module (
    input [3:0] in,
    output reg [1:0] pos
);

    always@ (*) begin
        if(in == 4'd0 || in[0] == 1) begin
            pos = 4'd0;
        end else begin
            if(in[1] == 1) begin
                pos = 4'd1;
            end else begin
                if(in[2] == 1) begin
                    pos = 4'd2;
                end else begin
                    if(in[3] == 1) pos = 4'd3;
                end
            end
        end
    end

endmodule