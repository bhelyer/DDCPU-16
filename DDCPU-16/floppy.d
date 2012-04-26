module floppy;

import std.math : abs, floor;
import std.stdio : File;

import dcpu16.cpu;
import dcpu16.hardware;

import main : CLOCKSPEED; // shudder

/// Simulates an HIT HMD2043 floppy disk drive.
public class Floppy : IHardware
{
public:
	/// Currently, the disk must be provided at start-up.
	this(string diskPath)
	{
		this.media = File(diskPath, "r+b");
	}

	void attach(CPU cpu) @safe
	{
		this.cpu = cpu;
	}

	void query() @safe
	{
		cpu.A = 0x4cae;
		cpu.B = 0x74fa;
		cpu.C = 0x07c2;
		cpu.X = 0x4948;
		cpu.Y = 0x2154;
	}

	void interrupt() @safe
	{
		switch( cpu.A )
		{
			case QUERY_MEDIA_PRESENT:
				cpu.B = hasMedia ? 1 : 0;
				cpu.A = ERROR_NONE;
				return;

			case QUERY_MEDIA_PARAMETERS:
				if (!hasMedia)
				{
					cpu.A = ERROR_NO_MEDIA;
					return;
				}
				cpu.B = geom.wordsPerSector;
				cpu.C = geom.sectors;
				cpu.A = ERROR_NONE;
				return;

			case QUERY_DEVICE_FLAGS:
				cpu.B = flags;
				cpu.A = ERROR_NONE;
				return;

			case UPDATE_DEVICE_FLAGS:
				flags = cpu.B;
				cpu.A = ERROR_NONE;
				return;

			case QUERY_INTERRUPT_TYPE:
				cpu.B = NONE;
				cpu.A = ERROR_NONE;
				return;

			case SET_INTERRUPT_MESSAGE:
				intMessage = cpu.B;
				cpu.A = ERROR_NONE;
				return;

			case READ_SECTORS:
				if (!blocking)
					return; // TODO

				if (!hasMedia)
				{
					cpu.A = ERROR_NO_MEDIA;
					return;
				}

				for (auto i=0; i<cpu.C; ++i)
				{
					auto sec = cast(ushort)(cpu.B + i);
					if (!(0 <= sec && sec < geom.sectors))
					{
						cpu.A = ERROR_INVALID_SECTOR;
						return;
					}
					cpu.cycleCount += cyclesToSeekTo(sec);
					track = cast(ushort)(sec / geom.sectorsPerTrack);
					cpu.cycleCount += cyclesToReadSector(sec);
					readSector(sec, cast(ushort)(cpu.X + i*geom.wordsPerSector));
				}

				cpu.A = ERROR_NONE;
				return;

			case WRITE_SECTORS:
				if (!blocking)
					return; // TODO

				if (!hasMedia)
				{
					cpu.A = ERROR_NO_MEDIA;
					return;
				}

				for (auto i=0; i<cpu.C; ++i)
				{
					auto sec = cast(ushort)(cpu.B + i);
					if (!(0 <= sec && sec < geom.sectors))
					{
						cpu.A = ERROR_INVALID_SECTOR;
						return;
					}
					cpu.cycleCount += cyclesToSeekTo(sec);
					track = cast(ushort)(sec / geom.sectorsPerTrack);
					cpu.cycleCount += cyclesToReadSector(sec);
					writeSector(sec, cast(ushort)(cpu.X + i*geom.wordsPerSector));
				}

				cpu.A = ERROR_NONE;
				return;

			case QUERY_MEDIA_QUALITY:
				if (!hasMedia)
				{
					cpu.A = ERROR_NO_MEDIA;
					return;
				}

				cpu.B = 0x7FFF;
				cpu.A = ERROR_NONE;
				return;

			default:
				cpu.A = ERROR_INVALID_COMMAND;
				return;
		}
	}

	bool pendingInterrupt(out ushort message) @safe
	{
		return false;
	}

private:
	/// The CPU we're attached to.
	CPU cpu;

	/// The current media.
	File media;

	/// Device flags.
	ushort flags = 0;

	/// Interrupt message.
	ushort intMessage = 0xffff;

	/// Drive properties.
	enum FullStrokeS = 0.200;
	enum SpindleSpinS = 0.200;

	/// Disk properties; these should eventually be read from the
	/// disk file itself.
	DiskGeometry geom = { 80, 18, 1440, 512 };

	/// Current track, for seek timing.
	ushort track = 0;

	bool hasMedia() @property @trusted
	{
		return media.isOpen;
	}

	bool blocking() @property @safe
	{
		return (flags & NON_BLOCKING) == 0;
	}

	long cyclesToSeekTo(ushort newSector) @safe
	{
		auto newTrack = newSector / geom.sectorsPerTrack;
		auto time = abs(newTrack - track) * (FullStrokeS / (geom.tracks - 1));
		return cast(long)time;
	}

	long cyclesToReadSector(ushort sector) @safe
	{
		return cast(long)(CLOCKSPEED * SpindleSpinS / geom.sectorsPerTrack);
	}

	void readSector(ushort sector, ushort buffer) @trusted
	{
		media.seek(sector * geom.wordsPerSector * 2);
		media.rawRead(cpu.memory[buffer..buffer+geom.wordsPerSector]);
	}

	void writeSector(ushort sector, ushort buffer) @trusted
	{
		media.seek(sector * geom.wordsPerSector * 2);
		media.rawWrite(cpu.memory[buffer..buffer+geom.wordsPerSector]);
		media.flush();
	}
}

private enum : ushort
{
	QUERY_MEDIA_PRESENT		= 0x0000,
	QUERY_MEDIA_PARAMETERS	= 0x0001,
	QUERY_DEVICE_FLAGS		= 0x0002,
	UPDATE_DEVICE_FLAGS		= 0x0003,
	QUERY_INTERRUPT_TYPE	= 0x0004,
	SET_INTERRUPT_MESSAGE	= 0x0005,

	READ_SECTORS			= 0x0010,
	WRITE_SECTORS			= 0x0011,

	QUERY_MEDIA_QUALITY		= 0xFFFF,
}

private enum : ushort
{
	NON_BLOCKING			= 0b0000_0000_0000_0001,
	MEDIA_STATUS_INTERRUPT	= 0b0000_0000_0000_0010,
}

private enum : ushort
{
	NONE					= 0x0000,
	MEDIA_STATUS			= 0x0001,
	READ_COMPLETE			= 0x0002,
	WRITE_COMPLETE			= 0x0003,
}

private enum : ushort
{
	ERROR_NONE,
	ERROR_NO_MEDIA,
	ERROR_INVALID_SECTOR,
	ERROR_PENDING,
	ERROR_INVALID_COMMAND,
}

private struct DiskGeometry
{
public:
	ushort tracks, sectorsPerTrack, sectors, wordsPerSector;
}
