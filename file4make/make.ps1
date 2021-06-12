$loc = Get-Location
New-Item -Path "out" -ItemType Directory
Get-ChildItem -Path ./src/* -File | ForEach-Object -Process {
    if ($_.Name.EndsWith(".ahk")) {
        $eString = "./file4make/Compiler/ahk2exe.exe /compress 2 /ahk ./file4make/AutoHotkey64.exe /in $($_)  /out $loc/out/$($_.Name).exe"
        Invoke-Expression $eString
        Write-Host($eString)
    }
    else {
        Copy-Item $($_) $loc/out/$($_.Name)
    }
}
