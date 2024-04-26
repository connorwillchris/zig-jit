pub const Register = enum(u5) {
    x0,
    x1,
    x2,
    x3,
    x4,
    x5,
    x6,
    x7,
    x8,
    x9,
    x10,
    x11,
    x12,
    x13,
    x14,
    x15,
    x16,
    x17,
    x18,
    x19,
    x20,
    x21,
    x22,
    x23,
    x24,
    x25,
    x26,
    x27,
    x28,
    x29,
    x30,
    x31,

    pub fn encode(self: Register) u5 {
        return switch (@intFromEnum(self)) {
            @intFromEnum(Register.x0)...@intFromEnum(Register.x31) => @as(u5, @intCast(@intFromEnum(self) - @intFromEnum(Register.x0))),
            //else => unreachable,
        };
    }
};

pub const RegisterABI = enum(u5) {
    zero,
};
