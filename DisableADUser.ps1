#DisableADUser
#By:Ricardo Esparza


Import-Module ActiveDirectory
#Below are Variables Defined
$SamAccountName = Read-Host -Prompt ("What is the User Account? Format: flllll")
$ADGroups = Get-ADPrincipalGroupMembership -Identity $SamAccountName | Where-Object {$_.Name -ne 'Domain Users'}
$Confirm = Read-Host -Prompt ("Are you sure you want to disable user $SamAccountName ? (Y/N)")

#This executes the Variables

$SamAccountName
$Confirm
$ADGroups

If 
    ( $Confirm -eq 'Y' -or $Confirm -eq 'y' -and $ADgroups -eq $null)
{
    Disable-ADAccount $SamAccountName
    Write-Host ('Account has been disabled and was not member of any groups.')
}

else 
{
    Disable-ADAccount $SamAccountName
    Remove-ADPrincipalGroupMembership -Identity $SamAccountName -MemberOf $ADgroups 
    
    Write-Host ( ' Account has been disabled and group membership was removed.' + ' Now exiting...')
    exit
}

