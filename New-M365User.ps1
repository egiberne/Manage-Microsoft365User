<#
.SYNOPSIS
Create a new user account in Microsoft 365 using Microsoft Graph PowerShell module.

.DESCRIPTION
This snippet script installs the Microsoft Graph PowerShell module, imports the module, connects to the Microsoft Graph with the necessary permissions, and creates a new user account in Microsoft 365.

.PARAMETER UserPrincipalName
The User Principal Name (UPN) of the new user account.

.PARAMETER DisplayName
The display name of the new user account.

.EXAMPLE
.\New-M365User.ps1 -UserPrincipalName "FN.LN@domaine" -DisplayName "First Name Last Name"
Creates a new user account in Microsoft 365 with the specified User Principal Name and display name.

.ROLE
User administrator

.COMPONENT
Microsoft Graph PowerShell module

.LINK
https://learn.microsoft.com/en-gb/training/modules/manage-accounts-licenses-microsoft-365/3-create-user-accounts-microsoft-365
#>

# Prevent from running the script without the required permissions
#Requires -RunAsAdministrator
# Prevent from running the script without Microsoft Graph PowerShell module
#Requires -Modules Microsoft.Graph
# Prevent from running the script without the required version of PowerShell
#Requires -Version 5.1

# Install the Microsoft Graph PowerShell module
Install-Module -Name Microsoft.Graph 

# Import the Microsoft Graph PowerShell module
Import-Module -Name Microsoft.Graph


# Enter the User Principal Name and Display Name for the new user account
$UserPrincipalName = Read-Host -Prompt "Enter the User Principal Name (UPN) for the new user account"

# Enter the Display Name for the new user account
$DisplayName = Read-Host -Prompt "Enter the Display Name for the new user account"

# Enter the Mail Nick Name for the new user account
$MailNickName = Read-Host -Prompt "Enter the Mail Nick Name for the new user account"

# Read the password for the new user account
$Password = Read-Host -Prompt "Enter the password for the new user account" -AsSecureString
$PasswordProfile = @{ Password = $Password }

# Connect to the Microsoft Graph with the necessary permissions to create users in Microsoft 365
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Create a new user account in Microsoft 365 using Microsoft Graph PowerShell
New-MgUser -UserPrincipalName $UserPrincipalName -DisplayName $DisplayName -PasswordProfile $PasswordProfile -MailNickName $MailNickName -AccountEnabled 
