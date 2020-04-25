set newmail=0
set clock=0
call clock.bat

set key1=16
set key2=16

set "useraddress=%username%00000000000"

:start
if exist "config.txt" (
 for /f "tokens=1-3 delims=;" %%a in (config.txt ) do ( 
 set "useraddress=%%a"
 set "key1=%%b"
 set "key2=%%c" 
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
if not exist "config.txt" ( echo CONFIG NEEDED )
echo +------------------------------------------------------------+
echo '                         SCImail alpha-1.1                  '
echo '                                                            '
echo '    R - check for new mail          User ID: %useraddress%  '
echo '        and synchronize             New mail: %vism%        '
echo '                                                            '
echo '    I - inbox                                               '
echo '                                                            '
echo '    S - write and send mail                                 '
echo '                                                            '
echo '    C - configure SCImail                                   '
echo '                                                            '
echo '                                                            '
echo '    Synchronization automatic every 300 seconds             '
echo '                                                            '
echo +------------------------------------------------------------+

choice /C risc /N /D r /T 300 

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

goto start

:countnew
set /a newmail=%newmail%+1
goto lastline

:lastline