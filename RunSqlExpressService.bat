@echo off
chcp 65001
title Вкл./выкл. SQL Express Service
cls

for /F "tokens=3 delims=: " %%H in ('sc query "MSSQL$SQLEXPRESS" ^| findstr "        STATE"') do (
    :: Служба запущена
    if /I "%%H" EQU "RUNNING" (
        net stop MSSQL$SQLEXPRESS
        goto :break
    )
    :: Служба приостановлена
    if /I "%%H" EQU "PAUSED" (
        net continue MSSQL$SQLEXPRESS
        goto :break
    )
    :: Служба остановлена
    if /I "%%H" EQU "STOPPED" (
        net start MSSQL$SQLEXPRESS
        goto :break
    )
)
:break
pause
