# USAGE NOTES:
# 
# Step 1)
# Docker => Settings => Daemon => Switch from Basic to Advanced
#    Add :
#           "storage-opts": [
#             "size=120GB"
#           ]
#
# Step 2)
#           docker image build -t sqldev -m 2GB .
#
#


FROM microsoft/mssql-server-windows-developer:latest


SHELL ["cmd", "/S", "/C"]
ADD "https://dist.nuget.org/win-x86-commandline/v4.7.0/nuget.exe" "C:\TEMP\nuget.exe"


# Install SSDT NuGet
RUN "C:\TEMP\nuget.exe" install Microsoft.Data.Tools.Msbuild -Version 10.0.61804.210


# Install Chocolatey
ENV chocolateyUseWindowsCompression = false

SHELL ["powershell.exe", "-ExecutionPolicy", "Bypass", "-Command"]

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); \
    [System.Environment]::SetEnvironmentVariable('PATH', "\"${env:PATH};%ALLUSERSPROFILE%\chocolatey\bin\"", 'Machine'); \
    choco feature enable -n allowGlobalConfirmation;
