const std = @import("std");
const riscv = @import("arch/riscv.zig");
const register = riscv.Register;

pub fn main() !void {
    std.debug.print("REGISTER: {d}\n", .{
        register.encode(register.x7),
    });
}
