#SingleInstance Force

#Include "lib/requestAdmin.ahk"

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