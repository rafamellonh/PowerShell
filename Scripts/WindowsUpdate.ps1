# Install Module Windows Update
Find-Module -Name PSWindowsUpdate | install-module

# Get an update per KB
Get-WindowsUpdate | Where-Object {$_.KB -like "*602*"}

# Install an update per KB
Install-WindowsUpdate -KB KB2267602

# Install all updates
Install-WindowsUpdate

