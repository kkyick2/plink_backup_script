:: start connect_login.bat <1> <2> <3> <4> <5> <6> <7>
:: <1>: username
:: <2>: password
:: <3>: IP address
:: <4>: port number
:: <5>: cmd file name
:: <6>: output folder name1 (output)
:: <7>: output file name
:: ===============================================
FOR /F "skip=1 tokens=1-5 delims=," %%a in (iplist.csv) do (
  start connect_login_1st.bat %%a %%b %%d %%e
)
pause
::  exit