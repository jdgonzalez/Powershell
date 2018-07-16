Clear-Host

#Step 1 - Invoking the web request, making first contact with the site.
$site = "http://singervehicledesign.com/wp-content/uploads/2018/07/"
$site
Write-Host "Attempting to call website." -ForegroundColor Green
$page=Invoke-WebRequest -Uri $site

#Step 2 - Create directory for files to be downloaded into]
if (-not (test-path C:\scrape))
    {
        New-Item -Path C:\scrape -ItemType directory
        Write-Host "Directory has been created." -ForegroundColor Green
    }

#Step 3 - List all images from page and download them into newly created directory
$images = $page.Links | Where-Object {($_.innerText -like '*.jpg') -and ($_.innerText -notlike '*x*.jpg')} | Select-Object innerText
if ($images.Count -gt 0)
{
    @($images.innerText).foreach({
    $fileName = $_ | Split-Path -Leaf
    $download = $site + $fileName
    Write-Host "Downloading image file $download"
    Invoke-WebRequest -Uri $download -OutFile "C:\scrape\$fileName"
    Write-Host 'Image download complete'
    Clear-Variable filename
    })
}
else
{
    write-warning "Nothing to parse"
}

#Found on Spiceworks: https://community.spiceworks.com/topic/2062121-scraping-images-with-invoke-webrequest?utm_source=copy_paste&utm_campaign=growth