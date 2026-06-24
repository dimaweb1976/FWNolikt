$ErrorActionPreference = "Stop"

$dsn = "fwnolikt_demo"
$base = "HKLM:\Software\ODBC\ODBC.INI"
$driverName = "MySQL ODBC 9.6 Unicode Driver"
$driverPath = "C:\Program Files\MySQL\MySQL Connector ODBC 9.6\myodbc9w.dll"

New-Item -Path "$base\ODBC Data Sources" -Force | Out-Null
New-ItemProperty -Path "$base\ODBC Data Sources" -Name $dsn -Value $driverName -PropertyType String -Force | Out-Null

New-Item -Path "$base\$dsn" -Force | Out-Null
New-ItemProperty -Path "$base\$dsn" -Name "Driver" -Value $driverPath -PropertyType String -Force | Out-Null
New-ItemProperty -Path "$base\$dsn" -Name "DESCRIPTION" -Value "FWNolikt local demo MySQL" -PropertyType String -Force | Out-Null
New-ItemProperty -Path "$base\$dsn" -Name "SERVER" -Value "127.0.0.1" -PropertyType String -Force | Out-Null
New-ItemProperty -Path "$base\$dsn" -Name "PORT" -Value "3307" -PropertyType String -Force | Out-Null
New-ItemProperty -Path "$base\$dsn" -Name "DATABASE" -Value "skladb" -PropertyType String -Force | Out-Null
New-ItemProperty -Path "$base\$dsn" -Name "UID" -Value "fwnolikt" -PropertyType String -Force | Out-Null
New-ItemProperty -Path "$base\$dsn" -Name "PWD" -Value "fwnolikt_demo" -PropertyType String -Force | Out-Null
New-ItemProperty -Path "$base\$dsn" -Name "CHARSET" -Value "utf8mb4" -PropertyType String -Force | Out-Null
New-ItemProperty -Path "$base\$dsn" -Name "OPTION" -Value "3" -PropertyType String -Force | Out-Null

Write-Host "System DSN '$dsn' registered."
