$url = "https://sessionapi.paymetric.com/ping"
$iternations = 100
for ($i=0; $i -lt $iternations; $i++)
{
    $status = Invoke-WebRequest -Uri $url -InformationAction SilentlyContinue 
    if ($status.statusCode -ne "200")
    {
        Write-Host "Error"
        break
    }
}