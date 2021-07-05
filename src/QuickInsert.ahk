#SingleInstance Force

; https://wyagd001.github.io/v2/docs/Hotstrings.htm
; Hotstring EndChars -()[]{}:;'"/\,.?!`n `t

; replace '/sheep' with oldshensheep for input
:*:/sheep::oldshensheep
; dynamically replace inputting
:*:/date::
{
    SendInput FormatTime()
}
:*:/paste::
{
    SendText A_Clipboard
}