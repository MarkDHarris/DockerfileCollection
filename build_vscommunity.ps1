$start = [DateTime]::Now


Set-Location -Path "C:\CODE\DockerSamples\vscommunity\"
docker image build -t vs2017/community --no-cache -m 2GB .


$stop = [DateTime]::Now
$elapsed = $stop - $start

Write-Host
Write-Host $elapsed
Write-Host