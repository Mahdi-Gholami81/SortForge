$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

Import-Module (Join-Path $scriptPath 'OpenFolderDialog.psm1')
Import-Module (Join-Path $scriptPath 'InvokeFileProcessing.psm1')


$folderPath = Open-FolderDialog
Invoke-FileProcessing $folderPath
