$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
Import-Module (Join-Path $scriptPath 'modules\ImportLibraries.psm1')

Import-Libraries $scriptPath

Add-Type -AssemblyName System.Windows.Forms
$Form = New-Object system.Windows.Forms.Form
$Form.Text = "PowerShell Form"
$Form.Width = 300
$Form.Height = 200

    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Point(100,60)
    $Button.Size = New-Object System.Drawing.Size(100,20)
    $Button.Text = "ToFolder"

    $Button.Add_Click({
        # Replace 'path_to_your_script.ps1' with the path to your PowerShell script
        & (Join-Path $scriptPath 'modules\tofolder.ps1')
    })
    $Form.Controls.Add($Button)


    $Button2 = New-Object System.Windows.Forms.Button
    $Button2.Location = New-Object System.Drawing.Point(100,90)
    $Button2.Size = New-Object System.Drawing.Size(100,20)
    $Button2.Text = "Multiple Folder"

    $Button2.Add_Click({
        # Replace 'path_to_your_other_script.ps1' with the path to your other PowerShell script
        & (Join-Path $scriptPath 'modules\Create-Folder.ps1')
    })
    $Form.Controls.Add($Button2)

$Form.ShowDialog()
