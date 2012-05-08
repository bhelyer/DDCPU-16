module ex;

public class DcpuException : Exception
{
    public this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable next = null)
    {
        super(msg, file, line, next);
    }

    public this(string msg, Throwable next, string file = __FILE__, size_t line = __LINE__)
    {
        super(msg, next, file, line);
    }
}
