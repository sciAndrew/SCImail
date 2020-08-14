setlocal EnableDelayedExpansion
echo off

call clock.bat
set /a clocklimit=%clock%-2629743
::clock limit is clock minus 1 month in seconds

set /a newmail=%newmail%+0

if not exist "store.txt" ( break >> "store.txt" && goto lastline )
if not exist "mymail.txt" ( break >> "mymail.txt" )
if not exist "trash.txt" ( break >> "trash.txt" )

for /f "tokens=1-2 delims=:" %%a in (store.txt ) do (
if %%a gtr %clocklimit% ( if %%a lss %clock% ( call :check_my_mail %%b %%a ) )
)


:check_my_mail
if "%1"=="16" ( goto lastline )
if "%1"=="" ( goto lastline )
set "msgclock=%2"
set "decryptFULL=%1"
set "decrypt8=%1"
set "decryptFULL=%decryptFULL:~0,800%"
set "decrypt8=%decrypt8:~0,9%"
for /f %%f in ('call cldecryptor.bat %decrypt8% %key1% %key2%') do ( set "decrypted8=%%f" )
if not "%decrypted8:~0,6%"=="%useraddress:~0,6%" ( goto lastline )

for /f %%f in ('call cldecryptor.bat %decryptFULL% %key1% %key2%') do ( set "decryptedFULL=%%f" )
if "%decryptedFULL%"=="" ( goto lastline )
find /c "%msgclock%" "mymail.txt" && goto lastline
find /c "%msgclock%" "trash.txt" && goto lastline
find /c "%decryptedFULL%" "mymail.txt"  || ( find /c "%decryptedFULL%" "trash.txt"  || ( echo %msgclock%:%decryptedFULL%:%date%>> "mymail.txt" ) )



:lastline