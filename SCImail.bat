set "SCImailversion=18"
set newmail=0
set clock=0
call clock.bat

set "couldnotupdate=false"

set key1=16
set key2=128

set "useraddress=noconf"
set "pdrive=P:\"

:start
if exist "config.txt" (
 for /f "tokens=1-4 delims=;" %%a in (config.txt ) do ( 
 set "useraddress=%%a"
 set "key1=%%b"
 set "key2=%%c" 
 set "pdrive=%%d"
 )
)

set "useraddress=%useraddress:~0,6%             "
set "useraddress=%useraddress:~0,13%"

set newmail=0

for /f %%l in (mymail.txt) do ( call :countnew )

echo off
cls
set "vism=%newmail%      "
set "vism=%vism:~0,6%"
::width=62 (60 usable) height=16 (14 usable)
if not exist "config.txt" ( echo CONFIGURATION NEEDED )
if "%couldnotupdate%"=="true" ( echo COULD NOT CHECK FOR UPDATES )
if "%couldnotupdate%"=="uptodate" ( echo NO NEW VERSIONS AVAILABLE )
echo +------------------------------------------------------------+
echo '                         SCImail alpha-1.15                 '
echo '                                                            '
echo '    R - check for new mail          User ID: %useraddress%  '
echo '        and synchronize             New mail: %vism%        '
echo '                                                            '
echo '    I - inbox                             U - check updates '
echo '    T - trash                                               '
echo '                                                            '
echo '    S - write and send mail                                 '
echo '                                                            '
echo '    C - configure SCImail                 X - exit SCImail  '
echo '                                                            '
echo '    Synchronization automatic every 300 seconds             '
echo '                                                            '
echo +------------------------------------------------------------+

choice /C risctux /N /D r /T 300 

if %ERRORLEVEL% == 1 (
call data_sync.bat
call decrypt_mail.bat
goto start
)

if %ERRORLEVEL% == 2 (
call browse_mail.bat
goto start
)

if %ERRORLEVEL% == 3 (
call send_mail.bat
goto start
)

if %ERRORLEVEL% == 4 (
call configure_scimail.bat
)

if %ERRORLEVEL% == 5 (
call browse_trash.bat
)

if %ERRORLEVEL% == 6 (
call scimail_updater.bat
)

if %ERRORLEVEL% == 7 (
goto lastline
)

set "couldnotupdate=false"

goto start

:countnew
set /a newmail=%newmail%+1
goto lastline

:lastline