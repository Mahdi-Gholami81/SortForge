function Invoke-FileProcessing($folderPath) {
    $files = Get-ChildItem $folderPath -File
    foreach ($file in $files) {
        $newFolderName = $file.BaseName
        $newFolderName = $newFolderName.Replace("www.Downloadha.com", "")
        $newFolderName = $newFolderName.Replace("Downloadha.com", "")
        $newFolderName = $newFolderName.Replace("Downloadha.ir", "")
        $fileNameParts = $newFolderName.Split([char[]]" .-", [StringSplitOptions]::RemoveEmptyEntries)
        $newFolderName = ""
        foreach ($part in $fileNameParts) {
            if ($part.StartsWith("part") -or $part.StartsWith(".part")) {
                break
            }
            if ($part.EndsWith(".com") -or $part.EndsWith(".ir") -or $part.EndsWith(".net") -or $part.EndsWith(".org")) {
                continue
            }
            if ($part.StartsWith("V") -or $part.StartsWith("v")) {
                $versionParts = $part.Split(".")
                if ($versionParts.Length -gt 1) {
                    $newFolderName += "$($versionParts[0]).$($versionParts[1])"
                    if ($versionParts.Length -gt 2) {
                        $newFolderName += ".$($versionParts[2])"
                    }
                    $newFolderName += " "
                } else {
                    $newFolderName += "$part."
                }
            } else {
                $newFolderName += "$part "
            }                     
        }
        $newFolderName = $newFolderName.TrimEnd()
        while ($newFolderName.EndsWith("_")) {
            $newFolderName = $newFolderName.Substring(0, $newFolderName.Length - 1)
        }
        if ($newFolderName.EndsWith(" V")) {
            $newFolderName = $newFolderName.Substring(0, $newFolderName.Length - 2) + "."
        }
        if ($newFolderName.EndsWith(".")) {
            $newFolderName = $newFolderName.Substring(0, $newFolderName.Length - 1)
        }
        while ($newFolderName.EndsWith("(") -or $newFolderName.EndsWith(")")) {
            $newFolderName = $newFolderName.Substring(0, $newFolderName.Length - 1)
        }
        if ($newFolderName.EndsWith(" ")) {
            $newFolderName = $newFolderName.Substring(0, $newFolderName.Length - 1)
        }
        if ($newFolderName.EndsWith(".")) {
            $newFolderName = $newFolderName.Substring(0, $newFolderName.Length - 1)
        }
        $newFolderPath = Join-Path $folderPath $newFolderName
        New-Item -ItemType Directory -Force -Path $newFolderPath
        Move-Item $file.FullName $newFolderPath
    }
}
Export-ModuleMember -Function Invoke-FileProcessing