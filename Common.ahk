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

; RCTRL+Down 窗口最小化 / 还原
>^Down:: {
    static lt := ""	;存储上次最小化的窗口
    if (lt = "") {
        lt := WinExist("A")
    }
    MinMax := WinGetMinMax(lt)
    if (MinMax = -1) {
        WinRestore(lt)
        WinActivate(lt)
        lt := ""
    } else {
        WinMinimize(lt)
    }
}

; RCTRL+RALT+Up设置窗口透明度
>^>!Up:: {
    Transparent := WinGetTransparent("A")
    if (Transparent = "") {
        WinSetTransparent(200, "A")
    } else {
        WinSetTransparent(255, "A")
        WinSetTransparent("off", "A")
    }
}
; RCTRL+0 切换暗黑模式
>^0:: {
    static ThemePath := "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
    TestValue := RegRead(ThemePath, "AppsUseLightTheme")
    RegWrite(!TestValue, "REG_DWORD", ThemePath, "AppsUseLightTheme")
}

>!Numpad0:: {
    if (ProcessExist("AIMP.exe")) {
        lt := ProcessExist("AIMP.exe")
    }
    MinMax := WinGetMinMax(lt)
    if (MinMax = -1) {
        WinRestore(lt)
        WinActivate(lt)
    } else {
        WinMinimize(lt)
    }
}