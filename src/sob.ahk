#SingleInstance Force

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

StartUpList := FileOpen("sob.txt", "r")
While (StartUpList.AtEOF = 0)
    Run('*RunAs "D:\Portable\install\AutoHotkey\AutoHotkeyU64.exe"' StartUpList.ReadLine())
StartUpList.Close()