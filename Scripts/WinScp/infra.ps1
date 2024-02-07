New-Item -ItemType Directory -Path (Join-Path -Path "C:\" -ChildPath "files")
New-Item -ItemType Directory -Path (Join-Path -Path "C:\files" -ChildPath "logs")
New-Item -ItemType Directory -Path (Join-Path -Path "C:\files" -ChildPath "scripts")
New-Item -ItemType Directory -Path (Join-Path -Path "C:\files" -ChildPath "temp")


#Move the files to the scripts folder

# WinSCP.ps1
# SendEmail.ps1
