module top_module (
    input ring, vibrate_mode,
    output ringer, motor
);

    assign ringer = ring & (~vibrate_mode);
    assign motor = ring & vibrate_mode;

endmodule
