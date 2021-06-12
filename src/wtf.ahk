#SingleInstance Force
CoordMode "Mouse"

#Include lib/requestAdmin.ahk

^!0::ExitApp
^!9:: Pause - 1

k := SysGet(78)
l := SysGet(79)
While (1) {
    x := Random(0, k)
    y := Random(0, l)
    MouseMove(x, y)
    Sleep(10)
}