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
set "YYYY=%DATE:~10,4%"
set "MM=%DATE:~4,2%"
set "DD=%DATE:~7,2%"
set "HH=%TIME:~0,2%"
if "%HH:~0,1%"==" " set "HH=0%HH:~1,1%"
set "Min=%TIME:~3,2%"

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