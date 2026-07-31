// =============================================================================
// 8-bit ALU - Combinational Core
// 16 operations selected by a 4-bit opcode, plus zero/carry/overflow/negative
// flags. Fully synthesizable (Verilog-2001), targeted at Yosys/OpenLane.
// =============================================================================
module alu_8bit (
    input  wire [7:0] a,
    input  wire [7:0] b,
    input  wire [3:0] opcode,
    output reg  [7:0] result,
    output wire       zero,       // result == 0
    output wire       carry,      // carry-out (ADD) / borrow (SUB)
    output wire       overflow,   // signed overflow (ADD/SUB only)
    output wire       negative    // result[7], sign bit of result
);

    // ---- Operation encoding --------------------------------------------------
    localparam [3:0] OP_ADD  = 4'h0,   // a + b
                      OP_SUB  = 4'h1,   // a - b
                      OP_AND  = 4'h2,
                      OP_OR   = 4'h3,
                      OP_XOR  = 4'h4,
                      OP_NOT  = 4'h5,   // ~a
                      OP_NAND = 4'h6,
                      OP_NOR  = 4'h7,
                      OP_XNOR = 4'h8,
                      OP_SLL  = 4'h9,   // logical shift left  by b[2:0]
                      OP_SRL  = 4'hA,   // logical shift right by b[2:0]
                      OP_SRA  = 4'hB,   // arithmetic shift right by b[2:0]
                      OP_ROL  = 4'hC,   // rotate left  by b[2:0]
                      OP_ROR  = 4'hD,   // rotate right by b[2:0]
                      OP_SLT  = 4'hE,   // signed (a < b) ? 1 : 0
                      OP_PASS = 4'hF;   // result = a

    wire [2:0] shamt   = b[2:0];                       // shift/rotate amount 0-7
    wire [8:0] add_ext = {1'b0, a} + {1'b0, b};
    wire [8:0] sub_ext = {1'b0, a} - {1'b0, b};

    reg carry_r, overflow_r;

    always @(*) begin
        result     = 8'h00;      // defaults prevent inferred latches
        carry_r    = 1'b0;
        overflow_r = 1'b0;

        case (opcode)
            OP_ADD: begin
                result     = add_ext[7:0];
                carry_r    = add_ext[8];
                overflow_r = (a[7] == b[7]) && (result[7] != a[7]);
            end
            OP_SUB: begin
                result     = sub_ext[7:0];
                carry_r    = sub_ext[8];                          // borrow
                overflow_r = (a[7] != b[7]) && (result[7] != a[7]);
            end
            OP_AND:  result = a & b;
            OP_OR:   result = a | b;
            OP_XOR:  result = a ^ b;
            OP_NOT:  result = ~a;
            OP_NAND: result = ~(a & b);
            OP_NOR:  result = ~(a | b);
            OP_XNOR: result = ~(a ^ b);
            OP_SLL:  result = a << shamt;
            OP_SRL:  result = a >> shamt;
            OP_SRA:  result = $signed(a) >>> shamt;
            OP_ROL:  result = (a << shamt) | (a >> (4'd8 - shamt));
            OP_ROR:  result = (a >> shamt) | (a << (4'd8 - shamt));
            OP_SLT:  result = ($signed(a) < $signed(b)) ? 8'h01 : 8'h00;
            OP_PASS: result = a;
            default: result = 8'h00;
        endcase
    end

    assign zero     = (result == 8'h00);
    assign carry    = carry_r;
    assign overflow = overflow_r;
    assign negative = result[7];

endmodule
