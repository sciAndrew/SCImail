set "SCImailversion=28"
set newmail=0
set clock=0
call clock.bat

set "couldnotupdate=false"

set key1=16
set key2=128

set "useraddress=noconf"
set "pdrive=P:\"

set "notify=silent"

:start
if exist "config.txt" (
 for /f "tokens=1-5 delims=;" %%a in (config.txt ) do ( 
 set "useraddress=%%a"
 set "key1=%%b"
 set "key2=%%c" 
 set "pdrive=%%d"
 set "notify=%%e"
 )
)

set "useraddress=%useraddress:~0,6%             "
set "useraddress=%useraddress:~0,13%"

set newmail=0

for /f %%l in (mymail.txt) do ( call :countnew )

if "%notify%"=="notify" (
	if %newmail% gtr 0 ( msg %username% "%newmail% NEW MAIL" )
)

echo off
cls
set "vism=%newmail%      "
set "vism=%vism:~0,6%"
::width=62 (60 usable) height=16 (14 usable)
if not exist "config.txt" ( echo CONFIGURATION NEEDED )
if "%couldnotupdate%"=="true" ( echo COULD NOT UPDATE )
if "%couldnotupdate%"=="uptodate" ( echo NO NEW VERSIONS AVAILABLE )
echo +------------------------------------------------------------+
echo '                        SCImail alpha-1.24                  '
echo '                                                            '
echo '   R - check for new mail          User ID: %useraddress%   '
echo '       and synchronize             New mail: %vism%         '
echo '                                                            '
echo '   I - inbox                             U - check updates  '
echo '   T - trash                                                '
echo '   B - contacts                                             '
echo '                                                            '
echo '   S - write and send mail                                  '
echo '   C - configure SCImail                 X - exit SCImail   '
echo '                                                            '
echo '   Synchronization automatic every 900 seconds [15 minutes] '
echo '                                                            '
echo +------------------------------------------------------------+

choice /C risctuxb /N /D r /T 900 

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
goto start
)

if %ERRORLEVEL% == 5 (
call browse_trash.bat
goto start
)

if %ERRORLEVEL% == 6 (
call scimail_preupdater.bat
goto start
)

if %ERRORLEVEL% == 7 (
exit
)

if %ERRORLEVEL% == 8 (
call browse_contacts.bat
)

set "couldnotupdate=false"

goto start

:countnew
set /a newmail=%newmail%+1
goto lastline

:lastline