module dcpu16.cpu;


/**
 * Holds the state of a DCPU-16 instance.
 */
class CPU
{
    enum MEMORY_SIZE = 0x10000;
    ushort A, B, C, X, Y, Z, I, J;  /// General purpose registers.
    ushort PC;  /// Program counter.
    ushort SP;  /// Stack pointer.
    ushort O;  /// Overflow.
    ushort[] memory;  /// 0x10000 words of memory.
    long cycleCount;  /// How many cycles the CPU has run.

    invariant()
    {
        assert(memory.length == MEMORY_SIZE);
    }

    /// Construct a new CPU instance.
    this()
    {
        memory = new ushort[MEMORY_SIZE];
    }

    /**
     * Load a series of words into memory starting at address 0x0.
     * Params:
     *   code = the stuff to load into memory.
     * Throws: Exception if there's not enough room to load.
     */
    final void load(in ushort[] code) @safe
    {
        if (code.length > MEMORY_SIZE) {
            throw new Exception("not enough memory to perform CPU.load().");
        }
        memory[0 .. code.length] = code;
    }

    /**
     * Run the CPU for a certain number of cycles.
     */
    final void run(in int cycles) @safe
    {
        int remainingCycles = cycles;
        while (remainingCycles > 0) {
            Instruction instruction = decode(memory[PC++]);
            long cc = cycleCount;
            execute(instruction);
            remainingCycles -= cast(int) (cycleCount - cc);
        }
    }

    /**
     * Execute an instruction.
     * Increments cycleCount with cycles consumed.
     */
    protected final void execute(ref const Instruction instruction) @safe
    {
        if (instruction.opcode != Instruction.Opcode.NonBasic) cycleCount += cycles(instruction);
        bool ald, bld;
        ushort a = read(instruction.a);
        ushort b = read(instruction.b);
        final switch (instruction.opcode) with (Instruction.Opcode) {
        case NonBasic:
            assert(instruction.nonbasic == Instruction.Opcode.NonBasic);
            cycleCount += 2 + cycles(instruction.a) + cycles(instruction.b);
            memory[--SP] = PC;
            PC = A;
            break;
        case SET:
            write(instruction.a, a, b);
            break;
        case ADD:
            write(instruction.a, a, cast(ushort) (a + b));
            if (a + b > ushort.max) O = 0x0001;
            else O = 0;
            break;
        case SUB:
            write(instruction.a, a, cast(ushort) (a - b));
            if (a - b > ushort.max) O = 0xFFFF;
            else O = 0;
            break;
        case MUL:
            write(instruction.a, a, cast(ushort) (a * b));
            O = ((a * b) >> 16) & 0xFFFF;
            break;
        case DIV:
            if (b != 0) {
                write(instruction.a, a, cast(ushort) (a / b));
                O = ((a << 16) / b) & 0xFFFF;
            } else {
                write(instruction.a, a, 0);
                O = 0;
            }
            break;
        case MOD:
            if (b == 0) write(instruction.a, a, 0);
            else write(instruction.a, a, a % b);
            break;
        case SHL:
            write(instruction.a, a, cast(ushort) (a << b));
            O = ((a << b) >> 16) & 0xFFFF;
            break;
        case SHR:
            write(instruction.a, a, cast(ushort) (a >> b));
            O = ((a << 16) >> b) & 0xFFFF;
            break;
        case AND:
            write(instruction.a, a, cast(ushort) (a & b));
            break;
        case BOR:
            write(instruction.a, a, cast(ushort) (a | b));
            break;
        case XOR:
            write(instruction.a, a, cast(ushort) (a ^ b));
            break;
        case IFE:
            if (a == b) {
                Instruction i = decode(memory[PC++]);
                execute(i);
            } else {
                cycleCount++;
            }
            break;
        case IFN:
            if (a != b) {
                Instruction i = decode(memory[PC++]);
                execute(i);
            } else {
                cycleCount++;
            }
            break;
        case IFG:
            if (a > b) {
                Instruction i = decode(memory[PC++]);
                execute(i);
            } else {
                cycleCount++;
            }
            break;
        case IFB:
            if ((a & b) != 0) {
                Instruction i = decode(memory[PC++]);
                execute(i);
            } else {
                cycleCount++;
            }
            break;
        }
    }

    /**
     * Write val to location.
     * Params:
     *   location = the Value of where we're writing to.
     *   p = the value return by calling read on the location.
     *   val = the value to write.
     * Notes: if location is a literal, it is ignored.
     * See: read
     */
    protected final void write(in Instruction.Value location, in ushort p, in ushort val) @safe
    {
        switch (location) with (Instruction) {
        case Value.A: A = val; break;
        case Value.B: B = val; break;
        case Value.C: C = val; break;
        case Value.X: X = val; break;
        case Value.Y: Y = val; break;
        case Value.Z: Z = val; break;
        case Value.I: I = val; break;
        case Value.J: J = val; break;
        case Value.LDA: memory[p] = val; break;
        case Value.LDB: memory[p] = val; break;
        case Value.LDC: memory[p] = val; break;
        case Value.LDX: memory[p] = val; break;
        case Value.LDY: memory[p] = val; break;
        case Value.LDZ: memory[p] = val; break;
        case Value.LDI: memory[p] = val; break;
        case Value.LDJ: memory[p] = val; break;
        case Value.LDPCA: memory[p] = val; break;
        case Value.LDPCB: memory[p] = val; break;
        case Value.LDPCC: memory[p] = val; break;
        case Value.LDPCX: memory[p] = val; break;
        case Value.LDPCY: memory[p] = val; break;
        case Value.LDPCZ: memory[p] = val; break;
        case Value.LDPCI: memory[p] = val; break;
        case Value.LDPCJ: memory[p] = val; break;
        case Value.POP: memory[p] = val; break;
        case Value.PEEK: memory[p] = val; break;
        case Value.PUSH: memory[p] = val; break;
        case Value.SP: SP = val; break;
        case Value.PC: PC = val; break;
        case Value.O: O = val; break;
        case Value.LDNXT: memory[p] = val; break;
        default: break;
        }
    }

    /**
     * Read word at location.
     * If the value uses indirection, the last layer is not performed --
     * that's left up to write.
     * See: write
     */
    protected final ushort read(in Instruction.Value location) pure @safe
    {
        switch (location) with (Instruction) {
        case Value.A: return A;
        case Value.B: return B;
        case Value.C: return C;
        case Value.X: return X;
        case Value.Y: return Y;
        case Value.Z: return Z;
        case Value.I: return I;
        case Value.J: return J;
        case Value.LDA: return A;
        case Value.LDB: return B;
        case Value.LDC: return C;
        case Value.LDX: return X;
        case Value.LDY: return Y;
        case Value.LDZ: return Z;
        case Value.LDI: return I;
        case Value.LDJ: return J;
        case Value.LDPCA: return cast(ushort) (memory[PC++] + A);
        case Value.LDPCB: return cast(ushort) (memory[PC++] + B);
        case Value.LDPCC: return cast(ushort) (memory[PC++] + C);
        case Value.LDPCX: return cast(ushort) (memory[PC++] + X);
        case Value.LDPCY: return cast(ushort) (memory[PC++] + Y);
        case Value.LDPCZ: return cast(ushort) (memory[PC++] + Z);
        case Value.LDPCI: return cast(ushort) (memory[PC++] + I);
        case Value.LDPCJ: return cast(ushort) (memory[PC++] + J);
        case Value.POP: return SP++;
        case Value.PEEK: return SP;
        case Value.PUSH: return --SP;
        case Value.SP: return SP;
        case Value.PC: return PC;
        case Value.O: return O;
        case Value.LDNXT: return memory[PC++];
        case Value.NXT: return PC++;
        default:
            assert(location >= Value.LITERAL);
            return location - Value.LITERAL;
        }
        // Never reached.
    }
}

private:

/// Convert word 'op' into an Instruction.
Instruction decode(ushort op) pure @safe
{
    Instruction instruction;

    instruction.opcode = cast(Instruction.Opcode) (op & 0b000000_000000_1111);
    if (instruction.opcode == Instruction.Opcode.NonBasic) {
        if (((op & 0b000000_111111_0000) >> 4) != 0x01) {
            throw new Exception("no support for any non-basic opcode except for JSR.");
        }
        instruction.nonbasic = Instruction.NonBasicOpcode.JSR;
    } else {
        ushort a = (op & 0b000000_111111_0000) >> 4;
        instruction.a = cast(Instruction.Value) a;
    }

    ushort b = (op & 0b111111_000000_0000) >> 10;
    instruction.b = cast(Instruction.Value) b;

    return instruction;
}

immutable int[Instruction.Opcode.max+1] opcycles = [
   -1,   // NonBasic
    1,   // SET
    2,   // ADD
    2,   // SUB
    2,   // MUL
    3,   // DIV
    3,   // MOD
    2,   // SHL
    2,   // SHR
    1,   // AND
    1,   // BOR
    1,   // XOR
    2,   // IFE
    2,   // IFN
    2,   // IFG
    2,   // IFB
];

/// How many cycles does val take to look up?
int cycles(in Instruction.Value val) pure @safe
{
    return ((val > 0x10 && val <= 0x17) || val == 0x1E || val == 0x1F) ? 1 : 0;
}

/// How many cycles will instruction take (not counting failed IF ops)?
int cycles(ref const Instruction instruction) pure @safe
{
    return opcycles[instruction.opcode] + cycles(instruction.a) + cycles(instruction.b);
}

/**
 * Represents a single DCPU-16 instruction.
 */
struct Instruction
{
    enum Opcode : ubyte
    {
        NonBasic = 0x0,
        SET,
        ADD,
        SUB,
        MUL,
        DIV,
        MOD,
        SHL,
        SHR,
        AND,
        BOR,
        XOR,
        IFE,
        IFN,
        IFG,
        IFB
    }

    enum NonBasicOpcode : ubyte
    {
        JSR = 0x01
    }

    enum Value : ubyte
    {
        A = 0x0,  // register
        B,
        C,
        X,
        Y,
        Z,
        I,
        J,
        LDA,  // [register]
        LDB,
        LDC,
        LDX,
        LDY,
        LDZ,
        LDI,
        LDJ,
        LDPCA,  // [next word + register]
        LDPCB,
        LDPCC,
        LDPCX,
        LDPCY,
        LDPCZ,
        LDPCI,
        LDPCJ,
        POP,
        PEEK,
        PUSH,
        SP,
        PC,
        O,
        LDNXT,  // [next word]
        NXT,  // next word (literal)
        LITERAL  // literal value
    }

    static assert(Value.LITERAL == 0x20);

    Opcode opcode;  /// The opcode of the instruction.
    NonBasicOpcode nonbasic;  /// If opcode is NonBasic, then this is filled in.
    Value a;  /// First value evaluated.
    Value b;  /// Second value evaluated.
}
