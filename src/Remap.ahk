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
XButton2::^c
XButton1::^v
; Vim ?
+!h::Left
+!j::Up
+!k::Down
+!l::Right

; fuck the keyboard
!b::g
!s::q
