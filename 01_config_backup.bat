:: start connect_login.bat <1> <2> <3> <4> <5> <6> <7>
:: <1>: username
:: <2>: password
:: <3>: IP address
:: <4>: port number
:: <5>: cmd file name
:: <6>: output folder name1 (output)
:: <7>: output file name
:: ===============================================
SET BATCH=output

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "FILESTAMP=%BATCH%_%YYYY%%MM%%DD%_%HH%%Min%"



FOR /F "skip=1 tokens=1-6 delims=," %%a in (iplist.csv) do (
 start connect_login.bat %%a %%b %%d %%e cmd\%%f.txt %FILESTAMP% %%c.txt
 timeout 1
 )

exit