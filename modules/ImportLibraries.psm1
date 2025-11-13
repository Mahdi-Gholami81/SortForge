function Import-Libraries($scriptPath) {
    Add-Type -Path (Join-Path $scriptPath 'library\Microsoft.WindowsAPICodePack.dll')
    Add-Type -Path (Join-Path $scriptPath 'library\Microsoft.WindowsAPICodePack.Shell.dll')
}
Export-ModuleMember -Function Import-Libraries