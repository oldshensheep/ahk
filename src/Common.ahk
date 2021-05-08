#SingleInstance Force

; https://wyagd001.github.io/v2/docs/KeyList.htm
; #Win ^Ctrl +Shift !Alt
; <左侧按键 >右侧按键 放在左侧

; RALT+Left 上一首
>!Left::Media_Prev

; RALT+Right 下一首
>!Right::Media_Next

; CV攻城狮 分别对应鼠标左边的上下按键
XButton2::^c
XButton1::^v

; RCTRL+Up 取反窗口置顶状态
>^Up:: {
    WinSetAlwaysOnTop(-1, "A")
    ToolTip(WinGetProcessName("A"))
    SetTimer(() => ToolTip(), -500)
}

; RCTRL+Down Min/Restore Windows
>^Down:: {
    static lastMinWin := ""
    if (lastMinWin = "") {
        lastMinWin := WinExist("A")
    }
    MinMax := WinGetMinMax(lastMinWin)
    if (MinMax = -1) {
        WinRestore(lastMinWin)
        WinActivate(lastMinWin)
        lastMinWin := ""
    } else {
        WinMinimize(lastMinWin)
    }
}

; RCTRL+RALT+Up Set Windows Transparent
>^>!Up:: {
    Transparent := WinGetTransparent("A")
    if (Transparent = "") {
        WinSetTransparent(225, "A")
    } else {
        WinSetTransparent(255, "A")
        WinSetTransparent("off", "A")
    }
}

; RCTRL+0 Switch Black/White Theme
>^0:: {
    static ThemePath := "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
    TestValue := RegRead(ThemePath, "AppsUseLightTheme")
    RegWrite(!TestValue, "REG_DWORD", ThemePath, "AppsUseLightTheme")
}
