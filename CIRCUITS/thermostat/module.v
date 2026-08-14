module top_module (
    input too_cold, too_hot, mode, fan_on,
    output heater, aircon, fan
);

    wire too_code_and_mode = too_cold & mode;
    wire too_hot_and_neg_mode = too_hot & (~mode);
    assign heater = too_cole_and_mode;
    assign aircon = too_hot_and_neg_mode;
    assign fan = fan_on | (too_cold_and_mode ^ too_hot_and_neg_mode);

endmodule