# plink script
* Use plink ssh to devices and execute commands

## How to start ?
---
Step to use plink backup script:

1/ Prepare a txt file for show command and put in cmd folder

2/ Prepare device inventory and login information in iplist.csv

Username,Password,Hostname,Manangment IP,Port number,Script

3/ run 00_1st_ssh_login.bat one time, to trust ssh key in putty

4/ run 01_config_backup.bat, run this bat to start execute cmd on the devices in iplist.csv, a output folder will be created

## Remark for plink version
---
* https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
* plink.exe: version 0.77.0.0 (1997-2022)
* plink_0.7.exe: version 0.70.0.0 (1997-2017) <- use this plink.exe if device ssh key is too old


## Project File structure
---
cmd/xxx              : put your command txt in this folder
iplist.csv           : set up for inventory and login
00_1st_ssh_login.bat : execute for 1st time login
01_config_backup.bat : execute for backup config
connect_login.bat    : no need to touch
connect_login_1st.bat: no need to touch
plink.exe            : cmd tool for login to device, no need to touch

## update by jackyy
20230614