<#
JoinToDomain
By Ricardo Esparza
V1: 01/17/2019

This script is designed to join a workstation to the domain through powershell.
#>
$Join = Read-Host ("Would you like to add this computer to the domain? " + "Enter Y/N")
if ($Join -eq "Y" -or $Join -eq "y")
{
    Write-Host ("Computer is being added to the domain. Please enter proper credentials.")
    Add-Computer -DomainName #enterdomainnamehere
}

else {
    Write-Host ("Computer will not be joined to domain. Now Exiting...")
    exit
}

$Restart = Read-Host ("Would you like to restart the computer?" + " Enter Y/N")
if ($Restart -eq "Y" -or $Restart -eq "y")
{
    Write-Host ("Computer will now restart")
    Restart-Computer -Force
}

else {
    Write-Host ("The computer has been added to the domain but will need to be restarted manually to take effect." + " Now Exiting...")
    exit
}
