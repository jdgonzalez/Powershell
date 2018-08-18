$a = start-process "C:\windows\Microsoft.NET\Framework64\v4.0.30319\RegAsm.exe" -ArgumentList "/u test.dll" -NoNewWindow -PassThru -Wait -RedirectStandardError registererror.txt
if ($a.ExitCode -ne 0)
    {
        $ErrorFromFile = Get-Content .\registererror.txt
        write-host $ErrorFromFile -ForegroundColor Red
        remove-item .\registererror.txt
    }
