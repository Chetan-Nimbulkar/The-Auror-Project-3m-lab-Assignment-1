# Install AD essencial features and Fileserver
Install-windowsfeature -name AD-Domain-Services -IncludeManagementTools
Install-WindowsFeature -Name FS-FileServer -IncludeAllSubFeature -IncludeManagementTools

# Sever should RDP into client machine
net user Adam Adam@123 /add
net localgroup "Remote Desktop Users" Adam /add


# creating domain and adding current server as domain controller
Import-Module ADDSDeployment

Install-ADDSForest `
-CreateDnsDelegation:$false `
-DomainMode "WinThreshold" `
-DomainName "auror.local" `
-DomainNetbiosName "AUROR" `
-ForestMode "WinThreshold" `
-InstallDns:$true `
-LogPath "C:\Windows\NTDS" `
-DatabasePath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText $'admin123#' -Force) `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true



