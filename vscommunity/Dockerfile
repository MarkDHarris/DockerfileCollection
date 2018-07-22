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
#           docker image build -t vs2017/community -m 2GB .
#
# References: 
#            https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio
#            https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community
#
# NOTE: this build takes ~01:56:17.6201326 hrs on a surface book 2 15" with 16 GB RAM
#       and results in an image size of 23.6GB
#

# Use the latest Windows Server Core image 
FROM microsoft/windowsservercore:latest


# Download the tools 
SHELL ["cmd", "/S", "/C"]
ADD "https://aka.ms/vs/15/release/vs_community.exe" "C:\TEMP\vs_community.exe"
ADD "https://dist.nuget.org/win-x86-commandline/v4.7.0/nuget.exe" "C:\TEMP\nuget.exe"


# Install VS 2017 community 
RUN C:\TEMP\vs_community.exe --includeRecommended --includeOptional --quiet --nocache --norestart --wait \
    --add Microsoft.VisualStudio.Workload.Azure \
    --add Microsoft.VisualStudio.Workload.ManagedDesktop \
    --add Microsoft.VisualStudio.Workload.NetCoreTools \
    --add Microsoft.VisualStudio.Workload.NetWeb \
    || IF "%ERRORLEVEL%"=="3010" EXIT 0

    
# Install SSDT NuGet
RUN "C:\TEMP\nuget.exe" install Microsoft.Data.Tools.Msbuild -Version 10.0.61804.210


# Install Chocolatey
ENV chocolateyUseWindowsCompression = false

SHELL ["powershell.exe", "-ExecutionPolicy", "Bypass", "-Command"]
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); \
    [System.Environment]::SetEnvironmentVariable('PATH', "\"${env:PATH};%ALLUSERSPROFILE%\chocolatey\bin\"", 'Machine'); \
    choco feature enable -n allowGlobalConfirmation;


# Install git tools with chocolatey
RUN choco install git -y \
    git-lfs -y \
    git-credential-manager-for-windows -y


# Launch VS2017 developer command prompt when started
SHELL ["cmd", "/S", "/C"]
ENTRYPOINT [ "CMD", "/k", "C:/Program Files (x86)/Microsoft Visual Studio/2017/Community/Common7/Tools/VsDevCmd.bat" ]