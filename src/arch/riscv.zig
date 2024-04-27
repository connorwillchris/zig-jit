// NOTE: fp is the same as s0.
/// Register for the Riscv series of processors.
pub const Register = enum(u5) {
    zero,
    ra,
    sp,
    gp,
    tp,
    t0,
    t1,
    t2,
    fp,
    s1,
    a0,
    a1,
    a2,
    a3,
    a4,
    a5,
    a6,
    a7,
    s2,
    s3,
    s4,
    s5,
    s6,
    s7,
    s8,
    s9,
    s10,
    s11,
    t3,
    t4,
    t5,
    t6,

    //pub fn encode(self: Register) u5 { return switch (@intFromEnum(self)) { @intFromEnum(Register.zero)...@intFromEnum(Register.t6) => @as(u5, @intCast(@intFromEnum(self) - @intFromEnum(Register.zero))), }; }
};

pub const InstructionTypeR = packed struct {
    opcode: u7,
    rd: Register,
    func3: u3,
    rs1: Register,
    rs2: Register,
    func7: u7,

    const opcode = 0b0110011;

    pub fn bitCast(self: InstructionTypeR) u32 {
        return @bitCast(self);
    }
};

pub const InstructionTypeI = packed struct {
    opcode: u7,
    rd: Register,
    func3: u3,
    rs1: Register,
    imm12: i12,

    pub fn bitCast(self: InstructionTypeR) u32 {
        return @bitCast(self);
    }
};

/// Addition instruction: `ADD rd, rs1, rs2`.
pub fn instructionAdd(rd: Register, rs1: Register, rs2: Register) u32 {
    return InstructionTypeR.bitCast(.{
        .func7 = 0,
        .func3 = 0x0,
        .rs2 = rs2,
        .rs1 = rs1,
        .rd = rd,
        .opcode = InstructionTypeR.opcode,
    });
}

/// Subtraction instruction: `SUB rd, rs1, rs2`.
pub fn instructionSub(rd: Register, rs1: Register, rs2: Register) u32 {
    return InstructionTypeR.bitCast(.{
        .func7 = 0x20, // 0x20
        .func3 = 0x0, // 0x0
        .rs2 = rs2,
        .rs1 = rs1,
        .rd = rd,
        .opcode = InstructionTypeR.opcode,
    });
}

pub fn instructionXor(rd: Register, rs1: Register, rs2: Register) u32 {
    return InstructionTypeR.bitCast(.{
        .func7 = 0,
        .func3 = 0x4,
        .rs2 = rs2,
        .rs1 = rs1,
        .rd = rd,
        .opcode = InstructionTypeR.opcode,
    });
}

pub fn instructionOr(rd: Register, rs1: Register, rs2: Register) u32 {
    return InstructionTypeR.bitCast(.{
        .func7 = 0,
        .func3 = 0x6,
        .rs2 = rs2,
        .rs1 = rs1,
        .rd = rd,
        .opcode = InstructionTypeR.opcode,
    });
}

pub fn instructionAnd(rd: Register, rs1: Register, rs2: Register) u32 {
    return InstructionTypeR.bitCast(.{
        .func7 = 0,
        .func3 = 0x7,
        .rs2 = rs2,
        .rs1 = rs1,
        .rd = rd,
        .opcode = InstructionTypeR.opcode,
    });
}

pub fn instructionSll(rd: Register, rs1: Register, rs2: Register) u32 {
    return InstructionTypeR.bitCast(.{
        .func7 = 0x1,
        .func3 = 0,
        .rs2 = rs2,
        .rs1 = rs1,
        .rd = rd,
        .opcode = InstructionTypeR.opcode,
    });
}

pub fn instructionSrl(rd: Register, rs1: Register, rs2: Register) u32 {
    return InstructionTypeR.bitCast(.{
        .func7 = 0,
        .func3 = 0x5,
        .rs2 = rs2,
        .rs1 = rs1,
        .rd = rd,
        .opcode = InstructionTypeR.opcode,
    });
}

pub fn instructionSra(rd: Register, rs1: Register, rs2: Register) u32 {
    return InstructionTypeR.bitCast(.{
        .func7 = 0x20,
        .func3 = 0x5,
        .rs2 = rs2,
        .rs1 = rs1,
        .rd = rd,
        .opcode = InstructionTypeR.opcode,
    });
}
