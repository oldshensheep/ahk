#Include lib/default.ahk
#Include lib/requestAdmin.ahk
#Include lib/thirdpart/RegExHotstring.ahk

; https://wyagd001.github.io/v2/docs/Hotstrings.htm
; Hotstring EndChars -()[]{}:;'"/\,.?!`n `t
; https://github.com/8LWXpg/RegExHotstring


RegExHotstring("/seq(\d+)", f, "C")
f(match) {
    i := 1
    v := Integer(match[1])
    Loop v {
        SendText A_Index
    }
}
