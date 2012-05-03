module ui;

version (Windows) {

    import std.conv;
    import std.utf;

    import core.sys.windows.windows;

    extern (Windows) DWORD CommDlgExtendedError();
    enum OFN_FILEMUSTEXIST = 0x001000;

    /**
    * Open an 'open file' dialog at cwd and block until you get a result.
    * Returns: the selected file, or an empty string on cancellation.
    */
    string fileDialog(string cwd)
    { 
        wchar[] buf = new wchar[1024];
        buf[] = 0;

        OPENFILENAMEW ofn;
        ofn.lStructSize = OPENFILENAMEW.sizeof;
        ofn.lpstrFile = buf.ptr;
        ofn.nMaxFile = 1024;
        ofn.lpstrInitialDir = toUTF16z(cwd);
        ofn.Flags = OFN_FILEMUSTEXIST;

        BOOL retval = GetOpenFileNameW(&ofn);
        if (retval == 0) {
            DWORD errorCode = CommDlgExtendedError();
            if (errorCode == 0) {
                // Just a cancel.
                return "";
            }
            throw new Exception("GetOpenFileNameW failure.");
        }

        return to!string(buf);
    }

} else {

    string fileDialog(string cwd)
    {
        return "";
    }

}