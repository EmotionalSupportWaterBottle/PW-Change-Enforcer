############################################################################################################################################

### FOR ETHICAL USE ONLY ###
### https://github.com/EmotionalSupportWaterBottle ###
### This script will force all users specified in the required CSV file to change their passwords next time they logon ###

############################################################################################################################################

### Make sure to put 'Usernames.csv' in the current working directory ###
### It should list off all the usernames you want to force password resets for ###
### I verified in my own AD lab that this works, but I had to run a gpupdate for my test user to have to change it ###
### So don't expect it to work right away w/o a gpupdate ###

############################################################################################################################################


$csv = ".\Usernames.csv"

if (!(Test-Path $csv)) {
    Write-Host "'Usernames.csv' isn't in the current directory."
    Start-Sleep -Seconds 5
    exit
}

$Users = Get-Content $csv

foreach ($Username in $Users) {
    if ($Username -match "\S") {  ### This ensures any blank lines are skipped ###
        Write-Host "Forcing $Username to change their password at next logon..."

        ### This try block will attempt to change the user's AD profile so their password will expire, and forces their password change ###
        try {            
            Set-ADUser -Identity $Username -PasswordNeverExpires $false -ErrorAction Stop
            Set-ADUser -Identity $Username -ChangePasswordAtLogon $true -ErrorAction Stop
            Write-Host "Successfully updated $Username"
        } catch {
            Write-Host "Error updating $Username $_"
        }
    } else {
        Write-Host "Skipping empty line in the file."
    }
}
