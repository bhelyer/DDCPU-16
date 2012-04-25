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
    ushort EX;  /// Extra/Excess.
    ushort IA;  /// Interrupt Address.
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
     * Run the CPU for a number of cycles.
     * The number is a minimum, more cycles may be run than given.
     * Returns: the actual number of cycles ran.
     */
    final int run(in int cycles) @safe
    {
        int remainingCycles = cycles;
        while (remainingCycles > 0) {
            Instruction instruction = decode(memory[PC++]);
            long cc = cycleCount;
            execute(instruction);
            remainingCycles -= cast(int) (cycleCount - cc);
        }
        return remainingCycles + cycles;
    }

    final void interrupt(ushort message) @safe
    {
        if (IA != 0) {
            memory[--SP] = PC;
            memory[--SP] = A;
            PC = IA;
            A = message;
        }
    }

    /**
     * Execute an instruction.
     * Increments cycleCount with cycles consumed.
     */
    protected final void execute(ref const Instruction instruction) @safe
    {
        Word a, b;
        void condition(bool delegate() @safe dg) 
        {
            Instruction i = decode(memory[PC++]);
            if (dg()) {
                execute(i);
            } else {
                skip(i);
                cycleCount++;
            }
        }

        if (instruction.opcode != Instruction.Opcode.Special) {
            a = read(instruction.a, true);
            b = read(instruction.b, false);
        } else {
            a = read(instruction.a, true);
        }
        cycleCount += cycles(instruction);

        switch (instruction.opcode) with (Instruction.Opcode) {
        case Special:
            switch (instruction.special) with (Instruction.SpecialOpcode) {
            case JSR:
                memory[--SP] = PC;
                PC = a.v;
                break;
            case INT:
                interrupt(a.v);
                break;
            case ING:
                if (a.p) *a.p = IA;
                break;
            case INS:
                IA = a.v;
                break;
            case HWN:
                if (a.p) *a.p = 0;
                break;
            case HWQ:
                A = B = C = X = Y = 0;
                break;
            case HWI:
                break;
            default:
                ushort fff = instruction.special;
                assert(false);
            }
            break;
        case SET:
            if (b.p) *b.p = a.v;
            break;
        case ADD:
            if (b.p) *b.p = cast(ushort) (b.v + a.v);
            if (b.v + a.v > ushort.max) EX = 0x0001;
            else EX = 0;
            break;
        case SUB:
            if (b.p) *b.p = cast(ushort) (b.v - a.v);
            if (b.v - a.v < 0) EX = 0xFFFF;
            else EX = 0;
            break;
        case MUL:
            if (b.p) *b.p = cast(ushort) (b.v * a.v);
            EX = ((b.v * a.v) >> 16) & 0xFFFF;
            break;
        case MLI:
            if (b.p) *b.p = cast(ushort) (cast(short) b.v * cast(short) a.v);
            EX = ((b.v * a.v) >> 16) & 0xFFFF;
            break;
        case DIV:
            if (a.v != 0 && b.p) {
                *b.p = cast(ushort) (b.v / a.v);
                EX = ((b.v << 16) / a.v) & 0xFFFF;
            } else if (b.p) {
                *b.p = 0;
                EX = 0;
            } else {
                EX = 0;
            }
            break;
        case DVI:
            if (a.v != 0 && b.p) {
                *b.p = cast(ushort) (cast(short) b.v / cast(short) a.v);
                EX = ((cast(short)b.v << 16) / cast(short) a.v) & 0xFFFF;
            } else if (b.p) {
                *b.p = 0;
                EX = 0;
            } else {
                EX = 0;
            }
            break;
        case MOD:
            if (b.p) {
                if (a.v == 0) *b.p = 0;
                else *b.p = b.v % a.v;
            }
            break;
        case SHL:
            if (b.p) *b.p = cast(ushort) (b.v << a.v);
            EX = ((b.v << a.v) >> 16) & 0xFFFF;
            break;
        case SHR:
            if (b.p) *b.p = cast(ushort) (b.v >>> a.v);
            EX = ((b.v << 16) >> a.v) & 0xFFFF;
            break;
        case ASR:
            if (b.p) *b.p = cast(ushort) (cast(short) b.v >> a.v);
            EX = ((b.v << 16) >>> a.v) & 0xFFFF;
            break;
        case Reserved:
        case AND:
            if (b.p) *b.p = cast(ushort) (b.v & a.v);
            break;
        case BOR:
            if (b.p) *b.p = cast(ushort) (b.v | a.v);
            break;
        case XOR:
            if (b.p) *b.p = cast(ushort) (b.v ^ a.v);
            break;
        case IFE:
            condition(() => b.v == a.v);
            break;
        case IFN:
            condition(() => b.v != a.v);
            break;
        case IFG:
            condition(() => b.v > a.v);
            break;
        case IFA:
            condition(() => cast(short) b.v > cast(short) a.v);
            break;
        case IFL:
            condition(() => b.v > a.v);
            break;
        case IFU:
            condition(() => cast(short) b.v > cast(short) a.v);
            break;
        case IFB:
            condition(() => (b.v & a.v) != 0);
            break;
        case IFC:
            condition(() => (b.v & a.v) == 0);
            break;
        default:
            assert(false);
        }
    }

    protected final Word read(in Instruction.Value location, bool inA) pure @safe
    {
        switch (location) with (Instruction) {
        case Value.A: return Word(A, &A);
        case Value.B: return Word(B, &B);
        case Value.C: return Word(C, &C);
        case Value.X: return Word(X, &X);
        case Value.Y: return Word(Y, &Y);
        case Value.Z: return Word(Z, &Z);
        case Value.I: return Word(I, &I);
        case Value.J: return Word(J, &J);
        case Value.LDA: return Word(memory[A], &memory[A]);
        case Value.LDB: return Word(memory[B], &memory[B]);
        case Value.LDC: return Word(memory[C], &memory[C]);
        case Value.LDX: return Word(memory[X], &memory[X]);
        case Value.LDY: return Word(memory[Y], &memory[Y]);
        case Value.LDZ: return Word(memory[Z], &memory[Z]);
        case Value.LDI: return Word(memory[I], &memory[I]);
        case Value.LDJ: return Word(memory[J], &memory[J]);
        case Value.LDPCA: auto w = Word(memory[memory[PC] + A], &memory[memory[PC] + A]); PC++; return w;
        case Value.LDPCB: auto w = Word(memory[memory[PC] + B], &memory[memory[PC] + B]); PC++; return w;
        case Value.LDPCC: auto w = Word(memory[memory[PC] + C], &memory[memory[PC] + C]); PC++; return w;
        case Value.LDPCX: auto w = Word(memory[memory[PC] + X], &memory[memory[PC] + X]); PC++; return w;
        case Value.LDPCY: auto w = Word(memory[memory[PC] + Y], &memory[memory[PC] + Y]); PC++; return w;
        case Value.LDPCZ: auto w = Word(memory[memory[PC] + Z], &memory[memory[PC] + Z]); PC++; return w;
        case Value.LDPCI: auto w = Word(memory[memory[PC] + I], &memory[memory[PC] + I]); PC++; return w;
        case Value.LDPCJ: auto w = Word(memory[memory[PC] + J], &memory[memory[PC] + J]); PC++; return w;
        case Value.PUSHORPOP:
            if (!inA) {
                // PUSH
                --SP;
                return Word(memory[SP], &memory[SP]);
            } else {
                // POP
                auto w = Word(memory[SP], &memory[SP]);
                SP++;
                return w;
            }
        case Value.PEEK: return Word(memory[SP], &memory[SP]);
        case Value.PICK: auto w = Word(memory[SP + memory[PC]], &memory[SP + memory[PC]]); PC++; return w;
        case Value.SP: return Word(SP, &SP);
        case Value.PC: return Word(PC, &PC);
        case Value.EX: return Word(EX, &EX);
        case Value.LDNXT: auto w = Word(memory[memory[PC]], &memory[memory[PC]]); PC++; return w;
        case Value.NXT: return Word(memory[PC++], null);
        case Value.LITERAL:
        default:
            if (!inA) {
                throw new Exception("Literals can only appear in the A segment of an instruction.");
            }
            return Word(location - 0x21, null);
        }
        // Never reached.
    }

    /// Advance the PC past the given instruction.
    protected final void skip(ref const Instruction i) @safe
    {
        if (i.opcode != Instruction.Opcode.Special) {
            read(i.a, true);
            read(i.b, false);
        } else {
            read(i.a, true);
        }
    }
}

private:

/// A locations value and where to write to if you can write to it.
struct Word
{
    ushort v;
    ushort* p;
}

/// Convert word 'op' into an Instruction.
Instruction decode(ushort op) pure @safe
{
    assert(op != 0);
    Instruction instruction;

    instruction.opcode = cast(Instruction.Opcode) (op & 0b000000_00000_11111);
    instruction.a = cast(Instruction.Value) ((op & 0b111111_00000_00000) >> 10);

    if (instruction.opcode == Instruction.Opcode.Special) {
        instruction.special = cast(Instruction.SpecialOpcode) ((op & 0b000000_11111_00000) >> 5);
        return instruction;
    }

    ushort b = (op & 0b000000_11111_00000) >> 5;
    instruction.b = cast(Instruction.Value) b;
    assert(instruction.b != Instruction.Value.LITERAL);

    return instruction;
}

/// How many cycles does val take to look up?
int cycles(in Instruction.Value val) pure @safe
{
    return ((val > 0x10 && val <= 0x17) || val == 0x1E || val == 0x1F) ? 1 : 0;
}

/// How many cycles will instruction take (not counting failed IF ops)?
int cycles(ref const Instruction instruction) pure @safe
{
    int base;
    if (instruction.opcode == Instruction.Opcode.Special) {
        base = specialOpcycles[instruction.special];
    } else {
        base = opcycles[instruction.opcode];
    }
    return base + cycles(instruction.a) + cycles(instruction.b);
}

/**
 * Represents a single DCPU-16 instruction.
 */
struct Instruction
{
    enum Opcode : ubyte
    {
        Special = 0x0,
        SET,
        ADD,
        SUB,
        MUL,
        MLI,
        DIV,
        DVI,
        MOD,
        AND,
        BOR,
        XOR,
        SHR,
        ASR,
        Reserved,
        SHL,
        IFB,
        IFC,
        IFE,
        IFN,
        IFG,
        IFA,
        IFL,
        IFU
    }

    enum SpecialOpcode : ubyte
    {
        JSR = 0x01,
        INT = 0x08,
        ING = 0x09,
        INS = 0x0a,
        HWN = 0x10,
        HWQ = 0x11,
        HWI = 0x12
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
        LDPCA,  // [register + next word]
        LDPCB,
        LDPCC,
        LDPCX,
        LDPCY,
        LDPCZ,
        LDPCI,
        LDPCJ,
        PUSHORPOP,
        PEEK,
        PICK,
        SP,
        PC,
        EX,
        LDNXT,  // [next word]
        NXT,  // next word (literal)
        LITERAL  // literal value
    }

    static assert(Value.LITERAL == 0x20);

    Opcode opcode;  /// The opcode of the instruction.
    SpecialOpcode special;  /// If opcode is Special, then this is filled in.
    Value a;  /// First value evaluated.
    Value b;  /// Second value evaluated.
}

immutable int[Instruction.Opcode.max+1] opcycles = [
    -1,   // NonBasic
    1,   // SET
    2,   // ADD
    2,   // SUB
    2,   // MUL
    2,   // MLI
    3,   // DIV
    3,   // DVI
    3,   // MOD
    1,   // AND
    1,   // BOR
    1,   // XOR
    2,   // SHR
    2,   // ASR
    2,   // SHL
    -1,   // Reserved
    2,   // IFB
    2,   // IFC
    2,   // IFE
    2,   // IFN
    2,   // IFG
    2,   // IFA
    2,   // IFL
    2,   // IFU
];

immutable int[Instruction.SpecialOpcode.max+1] specialOpcycles = [
    -1,
    3,  // JSR
    -1, -1, -1, -1, -1, -1,
    4,  // INT
    1,  // ING
    1,  // INS
    -1, -1, -1, -1, -1,
    2,  // HWN
    4,  // HWQ
    4,  // HWI
];
