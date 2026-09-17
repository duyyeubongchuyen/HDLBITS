module top_module (
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q
);

    genvar i;
    genvar j;

    generate
        for(i = 0; i < 16; i = i + 1) begin : row
            for(j = 0 ; j < 16 ; j = j + 1) begin : col
                one_bit_module inst(
                    .load(load),
                    .data(data[i*16 + j]),
                    .clk(clk),
                    //left = ((j - 1 + 16) % 16);
                    //rigt = ((j + 1) % 16);
                    //up = ((i - 1 + 16) % 16);
                    //down = ((i + 1) % 16);
                    .neighbours_0(q[((i - 1 + 16)%16)*16 + ((j - 1 + 16) % 16)]),
                    .neighbours_1(q[((i - 1 + 16) % 16)*16 + j]),
                    .neighbours_2(q[((i - 1 + 16) % 16)*16 + ((j + 1) % 16)]),
                    .neighbours_3(q[i*16 + ((j - 1 + 16) % 16)]),
                    .neighbours_5(q[i*16 + ((j + 1) % 16)]),
                    .neighbours_6(q[((i + 1) % 16)*16 + ((j - 1 + 16) % 16)]),
                    .neighbours_7(q[((i + 1) % 16)*16 + j]),
                    .neighbours_8(q[((i + 1) % 16)*16 + ((j + 1) % 16)]),
                    .q(q[i * 16 + j])
                );
            end
        end
    endgenerate

endmodule
   
module one_bit_module(
    input clk,
    input load,
    input data,
    input neighbours_0, //[2:0] Ở trên, [4:3] ở giữa, 7:5 ở dưới
    input neighbours_1,
    input neighbours_2,
    input neighbours_3,
    input neighbours_5,
    input neighbours_6,
    input neighbours_7,
    input neighbours_8,
    output reg q
);

    wire[3:0] sum = neighbours_8 + neighbours_7 + neighbours_6 + neighbours_5 + neighbours_3 + neighbours_2 + neighbours_1 + neighbours_0;

    always @(posedge clk) begin
        if(load) q <= data;
        else begin
            if (sum == 3'd2) q <= q;
            else if (sum == 3'd3) q <= 1'b1;
            else q <= 1'b0;
        end
    end

endmodule

// BẢN CẢI TIẾN : PHÂN TẦN LƯU TRỮ RIÊNG, LOGIC RIÊNG

module top_module (
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q
);

    genvar i, j;

    wire [255:0] q_next;

    generate
        for(i = 0 ; i < 16 ; i = i + 1) begin : row
            for(j = 0 ; j < 16 ; j = j + 1) begin : col
                one_bit_logic inst (
                    .q_current(q[i*16 + j]),
                    .neighbours_0(q[((i - 1 + 16)%16)*16 + ((j - 1 + 16) % 16)]),
                    .neighbours_1(q[((i - 1 + 16) % 16)*16 + j]),
                    .neighbours_2(q[((i - 1 + 16) % 16)*16 + ((j + 1) % 16)]),
                    .neighbours_3(q[i*16 + ((j - 1 + 16) % 16)]),
                    .neighbours_5(q[i*16 + ((j + 1) % 16)]),
                    .neighbours_6(q[((i + 1) % 16)*16 + ((j - 1 + 16) % 16)]),
                    .neighbours_7(q[((i + 1) % 16)*16 + j]),
                    .neighbours_8(q[((i + 1) % 16)*16 + ((j + 1) % 16)]),
                    .q_next(q_next[i*16+ j])
                );
            end
        end
    endgenerate

    always @(posedge clk) begin
        if(load) q <= data;
        else q <= q_next;
    end

endmodule

module one_bit_logic (
    input q_current,
    input neighbours_0, neighbours_1, neighbours_2,
    input neighbours_3, neighbours_5,
    input neighbours_6, neighbours_7, neighbours_8,
    output q_next
);

    wire [3:0] sum = {3'b0, neighbours_8} + {3'b0, neighbours_7} + {3'b0, neighbours_6} + {3'b0, neighbours_5} + {3'b0, neighbours_3} + {3'b0, neighbours_2} + {3'b0, neighbours_1} + {3'b0, neighbours_0};

    assign q_next = (sum == 4'd3) || (sum == 4'd2 && q_current);
    
endmodule