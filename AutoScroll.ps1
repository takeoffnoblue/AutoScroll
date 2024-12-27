# Add the .NET Windows Forms assembly
Add-Type -AssemblyName Microsoft.VisualBasic
Add-Type -AssemblyName System.Windows.Forms

# Define the window title of the application
$windowTitle = "Notepad"  # Replace with your application's window title

# Define time interval between key sends
$timeInt = 1 # [seconds]

Write-Host "Time interval set to $timeInt s"

# Activate the application
[Microsoft.VisualBasic.Interaction]::AppActivate($windowTitle)

Write-Host "Application activated. Press CTRL+C to terminate."

# Variable to track which key to send
$isPageDown = $true

# Loop to keep alternating keystrokes until a key is pressed
do {
    try {

        if ($isPageDown) {
            # Send the "Page Down" key
            [System.Windows.Forms.SendKeys]::SendWait("{PGDN}")
        } else {
            # Send the "Page Up" key
            [System.Windows.Forms.SendKeys]::SendWait("{PGUP}")
        }

	# Print activity
	Write-Host "Key pressed"

        # Toggle the key for the next iteration
        $isPageDown = -not $isPageDown

        # Pause between key presses
        Start-Sleep -Seconds $timeInt

    } catch {

        Write-Host "Error occurred: $($_.Exception.Message)"
        break

    }

} until ([System.Console]::KeyAvailable)

Write-Host "Key press detected. Exiting loop." # TODO: not working because ps is not active window during do loop ...

