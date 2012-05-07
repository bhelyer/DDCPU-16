module util;

import std.file : read;

ushort[] loadBinary(string path, bool littleEndian = true) @trusted
{
	auto words = cast(ushort[]) read(path);
	nativeToBigEndian(words, littleEndian);
	return words;
}

void nativeToBigEndian(ushort[] words, bool littleEndian = true) @safe
{
	if (littleEndian)
		return;

	foreach (ref w; words)
		w = cast(ushort)((w << 8) | (w >> 8));
}
