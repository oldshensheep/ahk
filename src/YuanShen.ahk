#SingleInstance Force
#MaxThreadsPerHotkey 3
CoordMode "Mouse", "Screen"

#Include "lib/requestAdmin.ahk"

; 自动弹琴
; s2fMap:=Map("1","a","2","s","3","d","4","f","5","g","6","h","7","j"," "," ")
; sd:=StrSplit("334554321123322 334554321123211 2231") 欢乐颂
~RAlt:: {
    ; static sd := StrSplit("221 221 221 24 221 221 2456 562121 562121 562121 4 34321 562121 562121 561")
    sd := StrSplit("DDDFGDS AAASDDM NDS NDS NDSAA DSG FDS GFDFGDS ANDS ABSA FDFDA FDFDASA")
    static KeepWinZRunning := false, i := 1	;记录下标
    if KeepWinZRunning
    {
        KeepWinZRunning := false
        return

    }
    KeepWinZRunning := true
    Loop
    {
        if ( not KeepWinZRunning) or ( not WinActive("ahk_exe YuanShen.exe"))
            break
        Send(sd[i])
        Sleep(250)
        i++
        if (i = sd.Length) {
            i := 1
            break
        }
    }
    KeepWinZRunning := false
}

; 刻晴一键飞天
~r:: {
    if (WinActive("ahk_exe YuanShen.exe")) {
        Send("{Alt down}")
        Click "1817 832"
        Click "1690 990"
        Send("{Alt up}")
    }
}
#MaxThreadsPerHotkey 1