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
            remainingCycles--;
            execute(instruction);
        }
    }

    /**
     * Execute an instruction.
     * Increments cycleCount with cycles consumed.
     */
    protected final void execute(ref const Instruction instruction) @safe
    {
        cycleCount += cycles(instruction);
        final switch (instruction.opcode) with (Instruction.Opcode) {
        case NonBasic:
        case SET:
        case ADD:
        case SUB:
        case MUL:
        case DIV:
        case MOD:
        case SHL:
        case SHR:
        case AND:
        case BOR:
        case XOR:
        case IFE:
        case IFN:
        case IFG:
        case IFB:
            break;
        }
    }

    /** 
     * Assign val to location. 
     * "If any instruction tries to assign a literal value, 
     *  the assignment fails silently."
     */
    protected final void assign(ref const Instruction.Value location, ushort val) pure @safe
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
        case Value.LDA: memory[A] = val; break;
        case Value.LDB: memory[B] = val; break;
        case Value.LDC: memory[C] = val; break;
        case Value.LDX: memory[X] = val; break;
        case Value.LDY: memory[Y] = val; break;
        case Value.LDZ: memory[Z] = val; break;
        case Value.LDI: memory[I] = val; break;
        case Value.LDJ: memory[J] = val; break;
        case Value.LDPCA: memory[memory[PC++] + A] = val; break;
        case Value.LDPCB: memory[memory[PC++] + B] = val; break;
        case Value.LDPCC: memory[memory[PC++] + C] = val; break;
        case Value.LDPCX: memory[memory[PC++] + X] = val; break;
        case Value.LDPCY: memory[memory[PC++] + Y] = val; break;
        case Value.LDPCZ: memory[memory[PC++] + Z] = val; break;
        case Value.LDPCI: memory[memory[PC++] + I] = val; break;
        case Value.LDPCJ: memory[memory[PC++] + J] = val; break;
        case Value.POP: memory[SP++] = val; break;
        case Value.PEEK: memory[SP] = val; break;
        case Value.PUSH: memory[--SP] = val; break;
        case Value.LDNXT: memory[PC++] = val; break; 
        default:
            // Assigning to literal location, ignore.
            break;
        }
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
