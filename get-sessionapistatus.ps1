for ($i=0; $i -lt 2000; $i++)
{
    $status = Invoke-WebRequest -Uri "https://sessionapi.paymetric.com/ping" -InformationAction SilentlyContinue
    if ($status.statusCode -ne "200")
    {
        Write-Host "Error"
        break
    }
}