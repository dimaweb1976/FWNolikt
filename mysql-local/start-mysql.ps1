$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$mysqld = Join-Path $root "mysql-9.6.0-winx64\bin\mysqld.exe"
$defaults = Join-Path $PSScriptRoot "my.ini"
$pidFile = Join-Path $root "mysql-logs\mysql.pid"

if (Test-Path $pidFile) {
    $pid = Get-Content -LiteralPath $pidFile -ErrorAction SilentlyContinue
    if ($pid -and (Get-Process -Id $pid -ErrorAction SilentlyContinue)) {
        Write-Host "MySQL is already running with PID $pid"
        exit 0
    }
}

Start-Process -FilePath $mysqld -ArgumentList "--defaults-file=$defaults" -WindowStyle Hidden
Write-Host "MySQL starting on 127.0.0.1:3307"
