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
:: Batch
set BATCH=empf_n_sample_check

set INFILE=config\%BATCH%.csv
FOR /F "skip=1 tokens=1-7 delims=," %%a in (%INFILE%) do (
  start config\connect_login_1st.bat %%a %%b %%d %%e
)
pause
::  exit