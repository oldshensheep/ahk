$loc = Get-Location
New-Item -Path "out" -ItemType Directory
Get-ChildItem -Path ./src/* -Include *.ahk | ForEach-Object -Process {
    $eString = "./file4make/Compiler/ahk2exe.exe /in $($_)  /out $loc/out/$($_.Name).exe"
    Invoke-Expression $eString
    Write-Host($eString)
}
