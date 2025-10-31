:: start connect_login.bat <1> <2> <3> <4> <5> <6> <7>
:: <1>: username
:: <2>: password
:: <3>: IP address
:: <4>: port number
:: <5>: cmd file name
:: <6>: output folder name1 (output)
:: <7>: output file name
::
:: read config\device.csv
:: username,password,hostname,ip,port,cmdfile,outsuffix
:: a        b        c        d   e    f       g
::
::===============================================
:: Datetime folder
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

::=====================================================================
:: Batch
set BATCH=empf_n_sample_check
set INFILE=config\%BATCH%.csv

set "FILESTAMP=%BATCH%_%YYYY%%MM%%DD%_%HH%%Min%"
FOR /F "skip=1 tokens=1-7 delims=," %%a in (%INFILE%) do (
 start config\connect_login.bat %%a %%b %%d %%e cmd\%%f.txt %FILESTAMP% %%c_%%g.txt
 )
::=====================================================================
exit