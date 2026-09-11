module bcd_count_0 ( // hàng giây hàng phúc
    input clk,
    input ena,
    input reset,
    output reg [3:0] Q
);

    always @(posedge clk) begin
        if(reset) Q <= 4'd0;
        else begin
            if(ena) begin
                if(Q == 4'd9) Q <= Q + 4'd7;
                else Q <= Q + 4'd1;
            end
            else Q <= Q;
        end
    end

endmodule

module bcd_count_1 ( // hàng chục giây hàng chục phút
    input clk,
    input ena,
    input reset,
    output reg [3:0] Q
);

    always @(posedge clk) begin
        if(reset) Q <= 4'd0;
        else begin
            if(ena) begin
                if(Q == 4'd5) Q <= Q + 4'd11;
                else Q <= Q + 4'd1;
            end
            else Q <= Q;
        end
    end

endmodule

module minute_and_second_count (
    input clk,
    input ena,
    input reset,
    output reg [7:0] Q
);

    wire [1:0] enable;
    assign enable[0] = ena;
    assign enable[1] = enable[0] && (Q[3:0] == 4'd9);


    bcd_count_0 counter0 (
        .clk(clk),
        .ena(enable[0]),
        .reset(reset),
        .Q(Q[3:0])
    );

    bcd_count_1 counter1 (
        .clk(clk),
        .ena(enable[1]),
        .reset(reset || (enable[1] && (Q[7:4] == 4'd5))),
        .Q(Q[7:4])
    );
    
endmodule

module hour_bcd_count (
    input clk,
    input ena,
    input reset,
    output reg [7:0] Q
);

    always @(posedge clk) begin
        if(reset) Q <= 8'b00010010;
        else begin
            if(ena) begin
                if(Q == 8'b00010010) Q <= 8'b00000001;
                else if(Q[3:0] == 4'd9) Q <= 8'b00010000;
                else Q[3:0] <= Q[3:0] + 4'd1;
            end
            else Q <= Q;
        end
    end 
    
endmodule

module pm_bcd_count (
    input clk,
    input ena,
    input reset,
    output reg Q
);

    always @(posedge clk) begin
        if(reset) Q <= 1'b0;
        else begin
            if(ena) Q <= Q + 1'b1;
            else Q<=Q;
        end
    end

endmodule

module top_module (
    input clk,
    input reset,
    input ena,
    output reg pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss
);
    
    wire enable[3:0];
    assign enable[0] = ena;
    assign enable[1] = enable[0] && (ss[7:0] == 8'b01011001);
    assign enable[2] = enable[1] && (mm[7:0] == 8'b01011001);
    assign enable[3] = enable[2] && (hh[7:0] == 8'b00010001);

    minute_and_second_count second_counter (
        .clk(clk),
        .reset(reset),
        .ena(enable[0]),
        .Q(ss)
    );

    minute_and_second_count minute_counter (
        .clk(clk),
        .reset(reset),
        .ena(enable[1]),
        .Q(mm)
    );

    hour_bcd_count hour_counter (
        .clk(clk),
        .reset(reset),
        .ena(enable[2]),
        .Q(hh)
    );

    pm_bcd_count pm_counter (
        .clk(clk),
        .reset(reset),
        .ena(enable[3]),
        .Q(pm)
    );

endmodule


//