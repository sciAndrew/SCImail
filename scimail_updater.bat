echo off
set "pathtohere=%~dp0"
del /q version.txt
ping -n 2 raw.githubusercontent.com || ( set "couldnotupdate=true" && goto lastline )
bitsadmin /transfer "scimailupdate" https://github.com/sciAndrew/SCImail/blob/master/version.txt %pathtohere%version.txt
set /p newversion=<version.txt
if %newversion% leq %SCImailversion% ( set "couldnotupdate=uptodate" && goto lastline )
echo new version available
for /f "skip=1 tokens=* delims=" %%f in (version.txt) do ( echo %%f )
echo you will have to start SCImail.bat again to use the new version
echo do you want to update : n if no, y if yes
choice /C ny
if %errorlevel% == 1 ( goto lastline )

bitsadmin /transfer "scimailupdate" https://github.com/sciAndrew/SCImail/blob/master/SCImail.bat %pathtohere%SCImail.bat
bitsadmin /transfer "scimailupdate" https://github.com/sciAndrew/SCImail/blob/master/browse_mail.bat %pathtohere%browse_mail.bat
bitsadmin /transfer "scimailupdate" https://github.com/sciAndrew/SCImail/blob/master/browse_trash.bat %pathtohere%browse_trash.bat
bitsadmin /transfer "scimailupdate" https://github.com/sciAndrew/SCImail/blob/master/cldecryptor.bat %pathtohere%cldecryptor.bat
bitsadmin /transfer "scimailupdate" https://github.com/sciAndrew/SCImail/blob/master/clencryptor.bat %pathtohere%clencryptor.bat
bitsadmin /transfer "scimailupdate" https://github.com/sciAndrew/SCImail/blob/master/clock.bat %pathtohere%clock.bat
bitsadmin /transfer "scimailupdate" https://github.com/sciAndrew/SCImail/blob/master/configure_scimail.bat %pathtohere%configure_scimail.bat
bitsadmin /transfer "scimailupdate" https://github.com/sciAndrew/SCImail/blob/master/data_sync.bat %pathtohere%data_sync.bat
bitsadmin /transfer "scimailupdate" https://github.com/sciAndrew/SCImail/blob/master/decrypt_mail.bat %pathtohere%decrypt_mail.bat
bitsadmin /transfer "scimailupdate" https://github.com/sciAndrew/SCImail/blob/master/send_mail.bat %pathtohere%send_mail.bat

echo SCImail updated
echo press any key to exit and run SCIchat.bat again to use the new version
timeout /nobreak 3
pause
exit

:lastline