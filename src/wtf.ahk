#SingleInstance Force
CoordMode "Mouse"

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run '*RunAs "' A_ScriptFullPath '" /restart'
        else
            Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
    }
    ExitApp
}

^!0::ExitApp
^!9:: Pause - 1

k := SysGet(78)
l := SysGet(79)
While (1) {
    x := Random(0, k)
    y := Random(0, l)
    MouseMove(x, y)
    Sleep(10)
}