
# Turn firewall off
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False

$adapters = Get-WmiObject Win32_NetworkAdapterConfiguration
$adapters | ForEach-Object {$_.SetDNSServerSearchOrder("10.0.0.9")}
# same IP from Vagrantfile

$username = "vagrant"
$Password = ConvertTo-SecureString -AsPlainText $"vagrant" -Force

$creds = New-Object System.Management.Automation.PSCredential $username, $Password

Add-Computer -DomainName auror.local -credential $creds

# here instead of making administrator account and adding to forest, we have to add the domain account to client machine
net localgroup "Administrators" auror\adam /add


Invoke-WebRequest "https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7B54F57FFD-74FC-1893-0382-7FAF868089E4%7D%26lang%3Den%26browser%3D0%26usagestats%3D0%26appname%3DGoogle%2520Chrome%26needsadmin%3Dtrue%26ap%3Dx64-stable-statsdef_0%26brand%3DGCEA/dl/chrome/install/googlechromestandaloneenterprise64.msi" `
-OutFile $env:USERPROFILE\Downloads\GoogleChromeEnt.msi

Start-Process -FilePath $env:USERPROFILE\Downloads\GoogleChromeEnt.msi -ArgumentList "/quiet /install"



 

