const std = @import("std");
const riscv = @import("arch/riscv.zig");

const instruction_type_r = riscv.InstructionTypeR;
const register = riscv.Register;

pub fn main() !void {
    std.debug.print("0x{x}\n", .{riscv.instructionAdd(
        register.ra,
        register.sp,
        register.gp,
    )});
}
