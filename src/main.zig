const std = @import("std");
const riscv = @import("arch/riscv.zig");

const Register = riscv.Register;

pub fn main() !void {
    const inst = riscv.instructionSub(Register.ra, Register.sp, Register.gp);
    std.debug.print("0x{X}\n", .{inst});
}
