#SingleInstance Force

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if not A_IsCompiled	;BUG a136 bug
            Run '*RunAs "' A_ScriptFullPath '" /restart'
        else
            Run '*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"'
    }
    ExitApp
}

StartUpList := FileOpen("sob.txt", "r")
While (StartUpList.AtEOF = 0)
    Run '*RunAs "' A_AhkPath '" "' StartUpList.ReadLine() '"'
StartUpList.Close()