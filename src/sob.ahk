#SingleInstance Force

#Include "lib/requestAdmin.ahk"

StartUpList := FileOpen("sob.txt", "r")
While (StartUpList.AtEOF = 0)
    Run '*RunAs "' A_AhkPath '" "' StartUpList.ReadLine() '"'
StartUpList.Close()