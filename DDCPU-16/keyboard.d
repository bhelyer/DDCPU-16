/// Specification: http://dcpu.com/highnerd/rc_1/keyboard.txt
module keyboard;

import siege.siege;

import dcpu16.cpu;
import dcpu16.hardware;

class Keyboard : Entity, IHardware
{
    CPU cpu;
    ushort[] buffer;
    bool interruptsEnabled = false;

    /// Called by the CPU when this hardware device is registered.
    void attach(CPU cpu) @safe
    {
        this.cpu = cpu;
    }

    /// Called by the CPU when this hardware is the target of an HWQ op.
    void query() @safe
    {
        cpu.A = 0x7406;
        cpu.B = 0x30CF;
        cpu.C = 0x1;
        cpu.X = 0;
        cpu.Y = 0;
    }

    /// Called by the CPU when this hardware is the target of an HWI op.
    void interrupt() @trusted
    {
        switch (cpu.A) {
        case 0:
            buffer.length = 0;
            break;
        case 2:
            cpu.C = keyboard.press(keyboardToSiege(cpu.B));
            break;
        case 3:
            interruptsEnabled = cpu.B != 0;
            break;
        default:
            break;
        }
    }

    /** 
    * Returns: true if the hardware wants to trigger the interrupt handler.
    * Params:
    *   message = the message to give the interrupt handler.
    *             ignored if there's no pending interrupt.
    */
    bool pendingInterrupt(out ushort message) @safe
    {
        if (!interruptsEnabled) {
            return false;
        }
        return false;
    }
}

ushort siegeToKeyboard(uint kc)
{
    if (kc >= 0x20 && kc <= 0x7f) {
        return cast(ushort) kc;
    }
    switch (kc) {
    case SG_KEYBOARD_KEY_BACKSPACE: return 0x10;
    case SG_KEYBOARD_KEY_ENTER: return 0x11;
    case SG_KEYBOARD_KEY_INSERT: return 0x12;
    case SG_KEYBOARD_KEY_DELETE: return 0x13;
    case SG_KEYBOARD_KEY_UP: return 0x80;
    case SG_KEYBOARD_KEY_DOWN: return 0x81;
    case SG_KEYBOARD_KEY_LEFT: return 0x82;
    case SG_KEYBOARD_KEY_RIGHT: return 0x83;
    case SG_KEYBOARD_KEY_LSHIFT:
    case SG_KEYBOARD_KEY_RSHIFT: return 0x90;
    case SG_KEYBOARD_KEY_LCTRL:
    case SG_KEYBOARD_KEY_RCTRL: return 0x91;
    default:
        return 0;
    }
}

uint keyboardToSiege(ushort kc)
{
    if (kc >= 0x20 && kc <= 0x7f) {
        return kc;
    }

    switch (kc) {
    case 0x10: return SG_KEYBOARD_KEY_BACKSPACE;
    case 0x11: return SG_KEYBOARD_KEY_ENTER;
    case 0x12: return SG_KEYBOARD_KEY_INSERT;
    case 0x13: return SG_KEYBOARD_KEY_DELETE;
    case 0x80: return SG_KEYBOARD_KEY_UP;
    case 0x81: return SG_KEYBOARD_KEY_DOWN;
    case 0x82: return SG_KEYBOARD_KEY_LEFT;
    case 0x83: return SG_KEYBOARD_KEY_RIGHT;
    case 0x90: return SG_KEYBOARD_KEY_LSHIFT;
    case 0x91: return SG_KEYBOARD_KEY_LCTRL;
    default: return 0;
    }
}
