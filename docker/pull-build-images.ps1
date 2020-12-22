Write-Host "Pulling base images..." -ForegroundColor Green

$configuration = docker-compose -f docker-compose.yml config
$images = @()

# Find images to pull in the docker-compose configuration
foreach ($line in $configuration) {
  if ($line -match "(BUILD_IMAGE|BASE_IMAGE|_ASSETS):\s*([^\s]*)") {
    $images += $Matches.2
  }
}

# Pull images
$images | Select-Object -Unique | ForEach-Object {
  $tag = $_
  docker image pull $tag
  $LASTEXITCODE -ne 0 | Where-Object { $_ } | ForEach-Object { throw "Failed." }
  Write-Host ("External image '{0}' is latest." -f $tag) -ForegroundColor Green
}

Write-Host "External images are up to date." -ForegroundColor Green
