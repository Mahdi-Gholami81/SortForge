# Get the current script path
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Import the Module files
Import-Module (Join-Path $scriptPath 'OpenFolderDialog.psm1')

# Define the JSON file paths
$configPath = Join-Path -Path $scriptPath -ChildPath '../json/folder-config.json'

# Import the JSON files
$foldersconfigJson = Get-Content -Path $configPath | ConvertFrom-Json

#choose folder
$folderPath = Open-FolderDialog

# Create the folders
foreach ($folder in $foldersconfigJson.folders) {
    $path = Join-Path -Path $folderPath -ChildPath $folder
    New-Item -ItemType Directory -Force -Path $path
}
