$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$mysqladmin = Join-Path $root "mysql-9.6.0-winx64\bin\mysqladmin.exe"

& $mysqladmin --defaults-file="$PSScriptRoot\my.ini" shutdown
Write-Host "MySQL stopped"
