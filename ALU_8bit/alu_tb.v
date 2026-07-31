`timescale 1ns/1ps
// =============================================================================
// Self-checking testbench for alu_8bit (combinational core)
// Run with, e.g.: iverilog -o alu_tb alu_8bit.v alu_8bit_tb.v && vvp alu_tb
// =============================================================================
module alu_8bit_tb;

    reg  [7:0] a, b;
    reg  [3:0] opcode;
    wire [7:0] result;
    wire       zero, carry, overflow, negative;

    integer errors = 0;

    alu_8bit dut (
        .a(a), .b(b), .opcode(opcode),
        .result(result), .zero(zero),
        .carry(carry), .overflow(overflow), .negative(negative)
    );

    task check(input [7:0] exp_result, input [127:0] name);
        begin
            #1;
            if (result !== exp_result) begin
                $display("FAIL [%s] opcode=%0d a=%0d b=%0d -> got=%0d exp=%0d",
                          name, opcode, a, b, result, exp_result);
                errors = errors + 1;
            end else begin
                $display("PASS [%s] result=%0d", name, result);
            end
        end
    endtask

    task check_add(input [7:0] exp_result, input exp_carry, input exp_overflow, input [127:0] name);
        begin
            #1;
            if (result !== exp_result || carry !== exp_carry || overflow !== exp_overflow) begin
                $display("FAIL [%s] result=%0d(exp %0d) carry=%b(exp %b) ovf=%b(exp %b)",
                          name, result, exp_result, carry, exp_carry, overflow, exp_overflow);
                errors = errors + 1;
            end else begin
                $display("PASS [%s] result=%0d carry=%b overflow=%b", name, result, carry, overflow);
            end
        end
    endtask

    initial begin
        $dumpfile("alu_8bit_tb.vcd");
        $dumpvars(0, alu_8bit_tb);

        // ---- Logical / basic ops ----
        a = 8'd15; b = 8'd10;
        opcode = 4'h0; check(8'd25,     "ADD");
        opcode = 4'h1; check(8'd5,      "SUB");
        opcode = 4'h2; check(a & b,     "AND");
        opcode = 4'h3; check(a | b,     "OR");
        opcode = 4'h4; check(a ^ b,     "XOR");
        opcode = 4'h5; check(~a,        "NOT");
        opcode = 4'h6; check(~(a & b),  "NAND");
        opcode = 4'h7; check(~(a | b),  "NOR");
        opcode = 4'h8; check(~(a ^ b),  "XNOR");

        // ---- Shifts / rotates ----
        a = 8'h81; b = 8'h01;
        opcode = 4'h9; check(8'h02, "SLL  0x81<<1");
        opcode = 4'hA; check(8'h40, "SRL  0x81>>1");
        opcode = 4'hB; check(8'hC0, "SRA  0x81>>>1 (sign-extend)");

        a = 8'b1000_0001; b = 8'h01;
        opcode = 4'hC; check(8'b0000_0011, "ROL by 1");
        opcode = 4'hD; check(8'b1100_0000, "ROR by 1");

        // ---- Signed compare ----
        a = 8'd5; b = 8'd10;
        opcode = 4'hE; check(8'd1, "SLT 5<10");

        a = 8'd200; b = 8'd10;   // 200 as signed 8-bit = -56, and -56 < 10
        opcode = 4'hE; check(8'd1, "SLT signed(-56)<10");

        // ---- Pass-through ----
        a = 8'hAB; b = 8'h00;
        opcode = 4'hF; check(8'hAB, "PASS A");

        // ---- Arithmetic flags ----
        a = 8'd200; b = 8'd100;  // 300 wraps to 44, unsigned carry, no signed overflow
        opcode = 4'h0; check_add(8'd44, 1'b1, 1'b0, "ADD carry, no overflow");

        a = 8'd127; b = 8'd1;    // max positive + 1 -> signed overflow, no unsigned carry
        opcode = 4'h0; check_add(8'd128, 1'b0, 1'b1, "ADD signed overflow");

        $display("--------------------------------------------------");
        if (errors == 0) $display("ALL TESTS PASSED");
        else              $display("%0d TEST(S) FAILED", errors);
        $display("--------------------------------------------------");

        $finish;
    end

endmodule
