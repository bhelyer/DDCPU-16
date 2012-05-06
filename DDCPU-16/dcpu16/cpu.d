/// Specification: http://pastebin.com/raw.php?i=Q4JvQvnM
/// 1.7. Is it final yet? Please let it be final now.
module dcpu16.cpu;

import std.array;

import dcpu16.hardware;


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
    bool onFire;  /// Are we on fire? (Go slower, change RAM randomly).
    ushort[] interruptQueue;  /// If length > 256, then we catch fire.

    protected bool mTriggerInterrupts = true;
    protected IHardware[] mDevices;

    invariant()
    {
        assert(memory.length == MEMORY_SIZE);
    }

    /// Construct a new CPU instance.
    this()
    {
        memory = new ushort[MEMORY_SIZE];
    }

    void reset() @safe
    {
        A = B = C = X = Y = Z = I = J = 0;
        PC = 0;
        SP = 0;
        EX = 0;
        IA = 0;
        memory[] = 0;
        cycleCount = 0;
        onFire = false;
        interruptQueue.length = 0;
        mTriggerInterrupts = true;

        foreach (device; mDevices) {
            device.reset();
        }
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
            onFire = interruptQueue.length > 256;
            if (onFire) {
                burn();
            }

            if (mTriggerInterrupts && interruptQueue.length > 0) {
                ushort message = interruptQueue.front;
                interruptQueue.popFront();
                interrupt(message);
            }

            Instruction instruction = decode(memory[PC++]);
            long cc = cycleCount;
            execute(instruction);
            remainingCycles -= cast(int) (cycleCount - cc);
        }
        return remainingCycles + cycles;
    }

    final void interrupt(ushort message) @safe
    {
        if (!mTriggerInterrupts) {
            interruptQueue ~= message;
        } else if (IA != 0) {
            mTriggerInterrupts = false;
            memory[--SP] = PC;
            memory[--SP] = A;
            PC = IA;
            A = message;
        }
    }

    final void register(IHardware device) @safe
    {
        device.attach(this);
        mDevices ~= device;
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
            case HCF:
                onFire = true;
                break;
            case INT:
                interrupt(a.v);
                break;
            case IAG:
                if (a.p) *a.p = IA;
                break;
            case IAS:
                IA = a.v;
                break;
            case RFI:
                mTriggerInterrupts = true;
                A = memory[SP++];
                PC = memory[SP++];
                break;
            case IAQ:
                mTriggerInterrupts = a.v == 0;
                break;
            case HWN:
                if (a.p) *a.p = cast(ushort) mDevices.length;
                break;
            case HWQ:
                if (a.v > mDevices.length) {
                    break;
                }
                mDevices[a.v].query();
                break;
            case HWI:
                if (a.v > mDevices.length) {
                    break;
                }
                mDevices[a.v].interrupt();
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
        case MDI:
            if (b.p) {
                if (a.v == 0) *b.p = 0;
                else *b.p = cast(short) b.v % cast(short) a.v;
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
            condition(() => b.v < a.v);
            break;
        case IFU:
            condition(() => cast(short) b.v < cast(short) a.v);
            break;
        case IFB:
            condition(() => (b.v & a.v) != 0);
            break;
        case IFC:
            condition(() => (b.v & a.v) == 0);
            break;
        case ADX:
            if (b.p) *b.p = cast(ushort) (b.v + a.v + EX);
            if (b.v + a.v + EX > ushort.max) {
                EX = 0x0001;
            } else {
                EX = 0;
            }
            break;
        case SBX:
            if (b.p) *b.p = cast(ushort) (b.v - a.v + EX);
            if (b.v - a.v + EX < 0) {
                EX = 0xFFFF;
            } else {
                EX = 0;
            }
            break;
        case STI:
            if (b.p) *b.p = a.v;
            I++;
            J++;
            break;
        case STD:
            if (b.p) *b.p = a.v;
            I--;
            J--;
            break;
        default:
            assert(false);
        }
    }

    protected final Word read(in Instruction.Value location, bool inA) @safe
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

    protected final void burn() @trusted
    {
        import std.random;
        assert(onFire);
        cycleCount += uniform(10, 100);
        if (uniform(0, 100) == 42) {
            memory[uniform(0, $)] += uniform(-1000, 1000);
        }
    }

    /// Advance the PC based on v, without touching SP or anything else. because that would be silly.
    protected final void advance(in Instruction.Value v) @safe
    {
        // Newlines are for the weak.
        if (v >= Instruction.Value.LDPCA && v <= Instruction.Value.LDPCJ || v == Instruction.Value.PICK || v == Instruction.Value.NXT || v == Instruction.Value.LDNXT) {
            PC++;
        }
    }

    /// Advance the PC past the given instruction.
    protected final void skip(ref const Instruction i) @safe
    {
        cycleCount++;

        if (i.opcode != Instruction.Opcode.Special) {
            advance(i.a);
            advance(i.b);
        } else {
            advance(i.a);
        }

        if (i.opcode >= Instruction.Opcode.IFB && i.opcode <= Instruction.Opcode.IFU) {
            Instruction i2 = decode(memory[PC++]);
            skip(i2);
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
        MDI,
        AND,
        BOR,
        XOR,
        SHR,
        ASR,
        SHL,
        IFB,
        IFC,
        IFE,
        IFN,
        IFG,
        IFA,
        IFL,
        IFU,
        Reserved1,
        Reserved2,
        ADX,
        SBX,
        Reserved3,
        Reserved4,
        STI,
        STD
    }

    static assert(Opcode.STD == 0x1f);

    enum SpecialOpcode : ubyte
    {
        JSR = 0x01,
        HCF = 0x07,
        INT = 0x08,
        IAG = 0x09,
        IAS = 0x0a,
        RFI = 0x0b,
        IAQ = 0x0c,
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

    string toString() @trusted
    {
        import std.string;
        static string valToString(Value v) { if (v >= Value.LITERAL) { return format("0x%04X", v - 21); } else { return valuestrings[v]; } }
        string opstr = opcode == Opcode.Special ? specialOpstrings[special] : opstrings[opcode];
        string astr  = valToString(a);
        string bstr  = valToString(b);
        return format("%s %s, %s", opstr, bstr, astr);
    }
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
    3,   // MDI
    1,   // AND
    1,   // BOR
    1,   // XOR
    1,   // SHR
    1,   // ASR
    1,   // SHL
    2,   // IFB
    2,   // IFC
    2,   // IFE
    2,   // IFN
    2,   // IFG
    2,   // IFA
    2,   // IFL
    2,   // IFU
   -1, -1,
    3,   // ADX
    3,   // SBX
   -1, -1,
    2,   // STI
    2,   // STD
];

immutable string[Instruction.Opcode.max+1] opstrings = [
    "",   // NonBasic
    "SET",   // SET
    "ADD",   // ADD
    "SUB",   // SUB
    "MUL",   // MUL
    "MLI",   // MLI
    "DIV",   // DIV
    "DVI",   // DVI
    "MOD",   // MOD
    "MDI",   // MDI
    "AND",   // AND
    "BOR",   // BOR
    "XOR",   // XOR
    "SHR",   // SHR
    "ASR",   // ASR
    "SHL",   // SHL
    "IFB",   // IFB
    "IFC",   // IFC
    "IFE",   // IFE
    "IFN",   // IFN
    "IFG",   // IFG
    "IFA",   // IFA
    "IFL",   // IFL
    "IFU",   // IFU
    "", "",
    "ADX",   // ADX
    "SBX",   // SBX
    "", "",
    "STI",   // STI
    "STD",   // STD
];


immutable int[Instruction.SpecialOpcode.max+1] specialOpcycles = [
    -1,
    3,  // JSR
    -1, -1, -1, -1, -1,
    9,  // HCF
    4,  // INT
    1,  // IAG
    1,  // IAS
    3,  // RFI
    2,  // IAQ
    -1, -1, -1,
    2,  // HWN
    4,  // HWQ
    4,  // HWI
];

immutable string[Instruction.SpecialOpcode.max+1] specialOpstrings = [
    "",
    "JSR",  // JSR
    "", "", "", "", "",
    "HCF",  // HCF
    "INT",  // INT
    "IAG",  // IAG
    "IAS",  // IAS
    "RFI",  // RFI
    "IAQ",  // IAQ
    "", "", "",
    "HWN",  // HWN
    "HWQ",  // HWQ
    "HWI",  // HWI
];

immutable string[Instruction.Value.max+1] valuestrings = [
    "A", "B", "C", "X", "Y", "Z", "I", "J",
    "[A]", "[B]", "[C]", "[X]", "[Y]", "[Z]", "[I]", "[J]",
    "[A + %s]", "[B + %s]", "[C + %s]", "[X + %s]", "[Y + %s]", "[Z + %s]", "[I + %s]", "[J + %s]",
    "%s",
    "PEEK %s",
    "PICK %s",
    "SP",
    "PC",
    "EX",
    "[%s]",
    "%s",
    "%s"
];
