@echo off
chcp 65001
title Вкл./выкл. SQL Express Service

for /F "tokens=3 delims=: " %%H in ('sc query "MSSQL$SQLEXPRESS" ^| findstr "        STATE"') do (
    if /I "%%H" NEQ "RUNNING" (
        net start "MSSQL$SQLEXPRESS"
        goto :break
    )
    else if /I "%%H" NEQ "STOPPED" (
        net  stop "MSSQL$SQLEXPRESS"
        goto :break
    )
)
:break
pause