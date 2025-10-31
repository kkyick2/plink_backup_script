# plink backup script

- Use plink ssh to devices and execute commands

## How to start ?

---

Step to use plink backup script:

0/ unzip the files

1/ edit cmd_cmd_xxxx.txt or create a new txt file for show commands

2/ edit iplist.csv or create new csv files for input inventory and login

```bat
::edit csv below format
:: username,password,hostname,ip,port,cmdfile,outsuffix
```

3/ run 00_1st_ssh_login.bat one time, to trust ssh key in putty

4/ run 01_config_backup.bat to execute, a output folder will be generated for results

```bat
:: Batch
set BATCH=empf_n_sample_check
set INFILE=config\%BATCH%.csv
```

## Remark for plink version

---

- https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
- plink.exe: version 0.77.0.0 (1997-2022)
- plink_0.7.exe: version 0.70.0.0 (1997-2017) <- use this plink.exe if device ssh key is too old

## Project File structure

---

- config/connect_login.bat : do not edit
- config/connect_login_1st.bat : do not edit
- config/plink.exe : do not edit, tool for login
- cmd/xxx : put your command txt in this folder
- config/iplist.csv : set up for inventory and login
- 00_1st_ssh_login.bat : execute for 1st time login
- 01_config_backup.bat : execute for show cmd script

## update by jackyyick

- 20230614
