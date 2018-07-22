$start = [DateTime]::Now


Set-Location -Path "C:\CODE\DockerSamples\build_tools_v1\"
docker image build -t vs2017/buildtools --no-cache -m 2GB .


$stop = [DateTime]::Now
$elapsed = $stop - $start

Write-Host
Write-Host $elapsed
Write-Host