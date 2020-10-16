$downloadFolder = Join-Path $PWD "download"

if (-not (Test-Path -Path  $downloadFolder -PathType Container)) {
    # create folder
    New-Item -ItemType Directory $downloadFolder
    # download assets to download folder
    az storage file download-batch --account-name dockerassets  --source docker-assets/sales-demo-wdp --destination $downloadFolder
}

Get-ChildItem $downloadFolder -Filter "*scwdp*" -Recurse | ForEach-Object {
    # copt assets to working folders
    Copy-Item $_.FullName -Destination (Join-Path $PWD images\windows\demo-xp-sqldev) -Force
    Copy-Item $_.FullName -Destination (Join-Path $PWD images\windows\demo-xp-standalone) -Force
    Copy-Item $_.FullName -Destination (Join-Path $PWD images\linux\demo-xp-sqldev) -Force
}
