module dcpu16.hardware;

import dcpu16.cpu;


interface IHardware
{
    /// Called by the CPU when this hardware device is registered.
    void attach(CPU cpu) @safe;

    /// Called by the CPU when this hardware is the target of an HWQ op.
    void query() @safe;

    /// Called by the CPU when this hardware is the target of an HWI op.
    void interrupt() @safe;

    /** 
     * Returns: true if the hardware wants to trigger the interrupt handler.
     * Params:
     *   message = the message to give the interrupt handler.
     *             ignored if there's no pending interrupt.
     */
    bool pendingInterrupt(out ushort message) @safe;
}
