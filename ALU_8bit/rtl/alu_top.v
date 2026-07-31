// =============================================================================
// 8-bit ALU - Synchronous Top Level
// Registers inputs and outputs around the combinational ALU core. Use this
// module as DESIGN_NAME in OpenLane: a purely combinational design has no
// flip-flops for STA/CTS to work with, so wrapping it like this gives the
// flow a clean single clock domain to synthesize, place, and route.
// =============================================================================
module alu_8bit_top (
    input  wire       clk,
    input  wire       rst_n,        // active-low, asynchronous
    input  wire [7:0] a_in,
    input  wire [7:0] b_in,
    input  wire [3:0] opcode_in,
    output reg  [7:0] result_out,
    output reg        zero_out,
    output reg        carry_out,
    output reg        overflow_out,
    output reg        negative_out
);

    reg [7:0] a_r, b_r;
    reg [3:0] opcode_r;

    wire [7:0] alu_result;
    wire       alu_zero, alu_carry, alu_overflow, alu_negative;

    // ---- Input register stage --------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_r      <= 8'h00;
            b_r      <= 8'h00;
            opcode_r <= 4'h0;
        end else begin
            a_r      <= a_in;
            b_r      <= b_in;
            opcode_r <= opcode_in;
        end
    end

    // ---- Combinational ALU core -------------------------------------------
    alu_8bit u_alu (
        .a        (a_r),
        .b        (b_r),
        .opcode   (opcode_r),
        .result   (alu_result),
        .zero     (alu_zero),
        .carry    (alu_carry),
        .overflow (alu_overflow),
        .negative (alu_negative)
    );

    // ---- Output register stage --------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            result_out   <= 8'h00;
            zero_out     <= 1'b0;
            carry_out    <= 1'b0;
            overflow_out <= 1'b0;
            negative_out <= 1'b0;
        end else begin
            result_out   <= alu_result;
            zero_out     <= alu_zero;
            carry_out    <= alu_carry;
            overflow_out <= alu_overflow;
            negative_out <= alu_negative;
        end
    end

endmodule
