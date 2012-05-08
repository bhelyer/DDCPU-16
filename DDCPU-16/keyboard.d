/// Specification: http://dcpu.com/highnerd/rc_1/keyboard.txt
module keyboard;
version (none){  // Disabled for the moment.

import std.array;
import std.ascii : toLower, toUpper;

import siege.siege;

import dcpu16.cpu;
import dcpu16.hardware;

class Keyboard : Entity, IHardware
{
    CPU cpu;
    ushort[] buffer;
    bool interruptsEnabled = false;
    ushort imessage;  // message to send if interrupts are enabled.
    /// The DCPU-16 generic keyboard keycodes press state.
    bool[ushort] pressedKeys;
    bool[dchar] pressedChars;

    /// Called by the CPU when this hardware device is registered.
    void attach(CPU cpu) @safe
    {
        this.cpu = cpu;
    }

    void reset() @safe
    {
        buffer.length = 0;
        interruptsEnabled = false;
        imessage = 0;
        foreach (k, v; pressedKeys) pressedKeys.remove(k);
        foreach (k, v; pressedChars) pressedChars.remove(k);
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
        case 1:
            if (buffer.length == 0) {
                cpu.C = 0;
            } else {
                cpu.C = buffer.back;
                buffer.popBack();
            }
            break;
        case 2:
            if (auto p = cpu.B in pressedKeys) {
                cpu.C = *p ? 1 : 0;
            } else {
                cpu.C = 0;
            }
            break;
        case 3:
            interruptsEnabled = cpu.B != 0;
            imessage = cpu.B;
            break;
        default:
            break;
        }
    }

    override void evKeyboardKeyPress(uint kc)
    {
        ushort dk = cast(ushort) toLower(siegeToKeyboard(kc));

        if (dk >= 0x20 && dk <= 0x7F) {
            if (pressedKeys.get(0x90, false)) {
                // If shift is being held, transform the character.
                dk = shiftTransform(dk);
            }
            pressedChars[dk] = true;
        }
        
        pressedKeys[dk] = true;
        if (interruptsEnabled) {
            buffer ~= dk;
            cpu.interrupt(imessage);
        }
    }

    override void evKeyboardKeyRelease(uint kc)
    {
        ushort dk = cast(ushort) toLower(siegeToKeyboard(kc));
        
        if (dk >= 0x20 && dk <= 0x7F) {
            if (pressedChars.get(shiftTransform(dk), false)) {
                dk = shiftTransform(dk);
            }
            pressedChars[dk] = false;
        }

        pressedKeys[dk] = false;
        if (interruptsEnabled) {
            buffer ~= dk;
            cpu.interrupt(imessage);
        }
    }
}

ushort shiftTransform(ushort k)
{
    if (k >= 'a' && k <= 'z') {
        return cast(ushort) toUpper(k);
    }

    switch (k) {
    case '1': return '!';
    case '2': return '@';
    case '3': return '#';
    case '4': return '$';
    case '5': return '%';
    case '6': return '^';
    case '7': return '&';
    case '8': return '*';
    case '9': return '(';
    case '0': return ')';
    case '-': return '_';
    case '=': return '+';
    case '[': return '{';
    case ']': return '}';
    case ':': return ';';
    case '\'': return '"';
    case ',': return '<';
    case '.': return '>';
    case '/': return '?';
    case '\\': return '|';
    case '`': return '~';
    default: return k;
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

}