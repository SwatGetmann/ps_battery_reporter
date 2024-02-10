$dt = Get-Date -Format "yyMMdd"

$char = if (Test-Path ".\$dt.log")
{
    $last_char = Get-Content -Path ".\$dt.log" -Tail 1
    $last_char = ([int][char]$last_char)
    $last_char = $last_char + 1
    [char]$last_char
}
else
{
    "a"
}

powercfg.exe /batteryreport /output "battery-report-$dt-$char.html"

Add-Content ".\$dt.log" $char