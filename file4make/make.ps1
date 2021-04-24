Get-ChildItem -Path ./src/* -Include *.ahk | ForEach-Object -Process {
    New-Item -Path "out" -ItemType Directory
    $eString = ".\file4make\Compiler\ahk2exe.exe /in $($_.Name)  /out out/$($_.Name).exe"
    Invoke-Expression $eString
    Write-Host($eString)
} 
