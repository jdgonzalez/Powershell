$cred = Get-Credential
write-host $cred.Password.ToString()
write-host $cred.UserName.ToString()

