function Open-FolderDialog() {
    $dialog = New-Object Microsoft.WindowsAPICodePack.Dialogs.CommonOpenFileDialog
    $dialog.IsFolderPicker = $true
    $dialog.Title = "Select a folder"
    if ($dialog.ShowDialog() -eq [Microsoft.WindowsAPICodePack.Dialogs.CommonFileDialogResult]::Ok) {
        return $dialog.FileName
    } else {
        exit
    }
}
Export-ModuleMember -Function Open-FolderDialog