$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
Import-Module (Join-Path $scriptPath 'Progress.psm1')

# Current files and folders location
$source = [Environment]::GetFolderPath("Desktop")

# Create a new folder on the Desktop
$newFolder = Join-Path -Path $source -ChildPath "NewFolder"
New-Item -ItemType Directory -Force -Path $newFolder

# Get all files and folders from the source
$items = Get-ChildItem -Path $source

# Loop through each file or folder to move them
for ($i = 0; $i -lt $items.Count; $i++) {
    # Move the current file or folder to the new folder
    Move-Item -Path $items[$i].FullName -Destination $newFolder

    # Display the progress bar
    Show-ProgressBar -current ($i + 1) -total $items.Count
}

# Target location where you want to move the new folder
$destination = "D:\New folder (2)"

# Move the newly created folder to the specified destination
Move-Item -Path $newFolder -Destination $destination
