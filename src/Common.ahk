#Include lib/default.ahk
#Include lib/requestAdmin.ahk

; https://wyagd001.github.io/v2/docs/KeyList.htm
; #Win ^Ctrl +Shift !Alt
; <左侧按键 >右侧按键 放在左侧

; RCTRL+Up 取反窗口置顶状态
>^Up:: {
    WinSetAlwaysOnTop(-1, "A")
    ToolTip(WinGetProcessName("A"))
    SetTimer(() => ToolTip(), -500)
}

; Win11 已经有这个功能了 按 WIN + 上下左右 可以变换窗口
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

; RCTRL+0 Switch Black/White Theme for Windows 10 System
>^0:: {
    static ThemePath := "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
    TestValue := RegRead(ThemePath, "AppsUseLightTheme")
    RegWrite(!TestValue, "REG_DWORD", ThemePath, "AppsUseLightTheme")
}

; RCTRL+9 Disable Absolute Volume in Windows 10 bluetooth stack. You need to restart your PC for changes to take affect
>^9:: {
    static RegPath := "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Bluetooth\Audio\AVRCP\CT"
    TestValue := RegRead(RegPath, "DisableAbsoluteVolume")
    RegWrite(!TestValue, "REG_DWORD", RegPath, "DisableAbsoluteVolume")
    TestValue := !TestValue
    ToolTip('Set DisableAbsoluteVolume to "' TestValue '"')
    SetTimer(() => ToolTip(), -2500)
}

; LCTRL+LALT+Numpad0 restart explorer
<^<!Numpad0:: {
    RunWait "taskkill /f /IM explorer.exe"
    RunWait "C:\Windows\explorer.exe"
}
