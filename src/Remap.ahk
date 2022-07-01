#Include lib/default.ahk
#Include lib/requestAdmin.ahk

; https://wyagd001.github.io/v2/docs/KeyList.htm
; #Win ^Ctrl +Shift !Alt
; <左侧按键 >右侧按键 放在左侧

; RALT+Left 上一首
>!Left::Media_Prev
; RALT+Right 下一首
>!Right::Media_Next

; CV攻城狮 分别对应鼠标左边的上下按键

; 鼠标上侧键::^c
; 双击鼠标上侧键 -> Win+B (打开任务栏)，在开启隐藏任务栏时常常使用。
XButton2::
{
    if (ThisHotkey = A_PriorHotkey){
        if (A_TimeSincePriorHotkey < 250){ 
            Send "#b"
        }
    }else{
        Send "^c"
    }
}
; 鼠标下侧键::^c
XButton1::^v

; Vim ?
+!h::Left
+!j::Up
+!k::Down
+!l::Right

; fuck the keyboard
!b::g
!s::q
