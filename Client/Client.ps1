
# Turn firewall off
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False

$chromepath = $env:USERPROFILE + "\Downloads\GoogleChrome.exe"
Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" `
-OutFile $chromepath

Start-Process -FilePath $chromepath -ArgumentList "/install"

# Set DNS address to client
Set-DnsClientServerAddress -InterfaceIndex (Get-NetAdapter).InterfaceIndex -ServerAddresses "10.0.0.9"
# same IP from Server Vagrantfile

$username = "Vagrant"
$Password = ConvertTo-SecureString -AsPlainText "vagrant" -Force

$creds = New-Object System.Management.Automation.PSCredential $username, $Password

Add-Computer -DomainName auror.local -credential $creds

# here instead of making administrator account and adding to forest, we have to add the domain account to client machine
net localgroup "Administrators" auror\Adam /add
