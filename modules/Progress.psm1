# Create a module named ProgressBarModule
New-Module -Name "ProgressBarModule" -ScriptBlock {

    # Define the Show-ProgressBar function
    function Show-ProgressBar {
        param (
            [Parameter(Mandatory=$true)] [int] $current,
            [Parameter(Mandatory=$true)] [int] $total
        )

        # Prepare a hashtable for the progress display
        $progress = @{
            Activity = "Progress..."
            Status = "Progress:"
            PercentComplete = ($current / $total) * 100
        }

        # Display the progress bar
        Write-Progress @progress
    }

    # Export the function so it can be used outside the module
    Export-ModuleMember -Function Show-ProgressBar
} | Import-Module
