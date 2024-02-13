param(
    [string]$dir = "./"
)

if (!(Test-Path -PathType Container $dir)) {
    New-Item -ItemType Directory -Path $dir
}

$dt = Get-Date -Format "yyMMdd"

$log_path = "$dir/$dt.log"

$char = if (Test-Path $log_path) {
    $last_char = Get-Content -Path $log_path -Tail 1
    $last_char = ([int][char]$last_char)
    $last_char = $last_char + 1
    [char]$last_char
} else {
    "a"
}

powercfg.exe /batteryreport /output "$dir/battery-report-$dt-$char.html"

Add-Content $log_path $char