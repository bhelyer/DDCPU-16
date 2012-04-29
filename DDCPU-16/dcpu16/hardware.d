module dcpu16.hardware;

import dcpu16.cpu;


interface IHardware
{
    /// Called by the CPU when this hardware device is registered.
    void attach(CPU cpu) @safe;

    /// Reset the hardware to an initial state.
    void reset() @safe;

    /// Called by the CPU when this hardware is the target of an HWQ op.
    void query() @safe;

    /// Called by the CPU when this hardware is the target of an HWI op.
    void interrupt() @safe;
}
