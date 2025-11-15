# Define helper function to get current time for folder/file names
function Get-DateStamp {
    $now = Get-Date -Format "yyyyMMdd_hhmm"
    return $now
}
# batch list
$CSVFILES = "lab_lhk2_fw"

# Process both batches in turn
foreach ($BATCH in $CSVFILES) {
    $INFILE = "config\$BATCH.csv"
    $DATESTAMP = Get-DateStamp
    $FILESTAMP = "${BATCH}_${DATESTAMP}"

    if (Test-Path $INFILE) {
        $lines = Get-Content $INFILE | Select-Object -Skip 1
        foreach ($line in $lines) {
            $fields = $line -split ','
            if ($fields.Count -ge 7) {
                $username = $fields[0]
                $password = $fields[1]
                $hostname = $fields[2]
                $ip       = $fields[3]
                $port     = $fields[4]
                $cmdfile  = $fields[5]
                $outsuffix= $fields[6]

                $cmdFilePath = "cmd\$cmdfile.txt"
                $outFileName = "${hostname}_$outsuffix.txt"
                & "$PSScriptRoot\config\connect_login.ps1" $username $password $ip $port $cmdFilePath $FILESTAMP $outFileName
            }
        }
        Start-Sleep -Seconds 10
    } else {
        Write-Host "File not found: $INFILE"
    }
}
