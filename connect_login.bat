:: start connect_login.bat <1> <2> <3> <4> <5> <6> <7>
:: <1>: username
:: <2>: password
:: <3>: IP address
:: <4>: port number
:: <5>: cmd file name
:: <6>: output folder name1 (output)
:: <7>: output file name
:: ===============================================
SET USERNAME=%1
SET PASSWORD=%2
SET IPADDR=%3
SET PORT=%4
SET CMDFILE=%5
:: create folders
SET OUTDIR1=%6
if not exist %OUTDIR1% mkdir %OUTDIR1%
:: ready output filename
SET OUTNAME=%7
SET OUTPATH=%OUTDIR1%/%OUTNAME%

:: (option1) use this line for first time connect
::echo y | plink.exe -ssh %USERNAME%@%IPADDR% -P %PORT% -pw %PASSWORD% exit

:: (option2) use this line for normal use
plink -v -ssh %USERNAME%@%IPADDR% -P %PORT% -pw %PASSWORD% -batch < %CMDFILE% > %OUTPATH%


exit

