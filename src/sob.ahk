#Include lib/default.ahk
#Include lib/requestAdmin.ahk

; 创建一个这个文件的快捷方式放到 %AppData%\Microsoft\Windows\Start Menu\Programs\Startup 下，开机时会启动sob.txt里的脚本。
StartUpList := FileOpen("sob.txt", "r")
While (StartUpList.AtEOF = 0)
    Run '*RunAs "' A_AhkPath '" "' StartUpList.ReadLine() '"'
StartUpList.Close()
