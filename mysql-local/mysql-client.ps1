$root = Split-Path -Parent $PSScriptRoot
$mysql = Join-Path $root "mysql-9.6.0-winx64\bin\mysql.exe"

& $mysql --defaults-file="$PSScriptRoot\my.ini" @args
