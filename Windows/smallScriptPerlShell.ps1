# Check if Chocolatey is installed
if (Test-Path -Path "$env:ProgramData\chocolatey\choco.exe")
{
    Write-Host "Chocolatey is installed."

    # Check if Strawberry Perl is already installed
    if ((choco list --local-only) -like "*strawberryperl*")
    {
        Write-Host "Strawberry Perl is already installed."
    }
    else
    {
        # Install Strawberry Perl
        choco install strawberryperl -y
        Write-Host "Strawberry Perl has been installed."
    }
}
else
{
    Write-Host "Chocolatey is not installed. Please install Chocolatey first."
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}
