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

exeName := "csgo.exe"
we := "ahk_exe " . (exeName)
sleepTime := 3000000

loop {
    Sleep(300)
    if WinExist(we) {
        SetTimer(() => CloseWindow(we), -sleepTime)
        Sleep(sleepTime + 1000)
    }
}

CloseWindow(we) {
    if WinExist(we) {
        WinKill
    }
}
