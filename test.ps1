$location = Split-Path $MyInvocation.MyCommand.Path -Parent
& $("$location\" + "..\get-service.ps1")




