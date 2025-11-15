param(
    [string]$username,
    [string]$password,
    [string]$ipaddr,
    [string]$port,
    [string]$cmdfile,
    [string]$outdir1,
    [string]$outname
)

# Ensure output directory exists
if (-not (Test-Path $outdir1)) {
    New-Item -ItemType Directory -Path $outdir1 | Out-Null
}

$outpath = Join-Path $outdir1 $outname

# Option 1: For first time connect (uncomment if needed)
# "y" | & "config\plink.exe" -ssh "$username@$ipaddr" -P $port -pw $password exit

# Option 2: Normal use
& "config\plink.exe" -v -ssh "$username@$ipaddr" -P $port -pw $password -batch -m $cmdfile > $outpath
