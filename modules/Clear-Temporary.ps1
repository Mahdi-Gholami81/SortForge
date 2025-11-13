$report = @()
$files = Get-ChildItem -Path $env:TEMP -Recurse -ErrorAction SilentlyContinue
$total = $files.Count
$i = 0

foreach ($file in $files) {
    $i++
    Remove-Item $file.FullName -Force -Recurse -ErrorAction SilentlyContinue
    Write-Progress -Activity "Deleting files from %temp%..." -Status "$i out of $total deleted" -PercentComplete ($i / $total * 100)
    $report += "Deleted file: $($file.FullName)"
}

$choice = Read-Host "Do you want to empty the Recycle Bin as well? (y/n)"
if ($choice -eq "y") {
    $recycleBinFiles = Get-ChildItem -Path 'shell:RecycleBinFolder' -Force -Recurse -ErrorAction SilentlyContinue
    foreach ($file in $recycleBinFiles) {
        Remove-Item $file.FullName -Force -Recurse -ErrorAction SilentlyContinue
        $report += "Deleted file from Recycle Bin: $($file.FullName)"
    }
    Write-Host "Recycle Bin has been emptied."
} else {
    Write-Host "Recycle Bin was not emptied."
}

$report | Out-File "$PSScriptRoot\..\reports\deletion_report.txt"
Write-Host "Deletion report has been saved to reports folder."
