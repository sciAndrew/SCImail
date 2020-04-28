echo off
del /q version.txt
ping raw.githubusercontent.com || ( set "couldnotupdate=true" && goto lastline )
bitsadmin /transfer "scimailupdate" https://raw.githubusercontent.com/sciAndrew/SCImail/master/version.txt version.txt
set /p newversion=<version.txt
if %newversion% leq %SCImailversion% ( set "couldnotupdate=uptodate" && goto lastline )
echo new version available
for /f "skip=1 tokens=* delims=" %%f in (version.txt) do ( echo %%f )
echo you will have to start SCImail.bat again to use the new version
echo do you want to update : n if no, y if yes
choice /C ny
if %errorlevel% == 1 ( goto lastline )
set "pathtohere=%~dp0"

bitsadmin /transfer "scimailupdate" https://raw.githubusercontent.com/sciAndrew/SCImail/master/SCImail.bat %pathtohere%SCImail.bat
bitsadmin /transfer "scimailupdate" https://raw.githubusercontent.com/sciAndrew/SCImail/master/browse_mail.bat %pathtohere%browse_mail.bat
bitsadmin /transfer "scimailupdate" https://raw.githubusercontent.com/sciAndrew/SCImail/master/browse_trash.bat %pathtohere%browse_trash.bat
bitsadmin /transfer "scimailupdate" https://raw.githubusercontent.com/sciAndrew/SCImail/master/cldecryptor.bat %pathtohere%cldecryptor.bat
bitsadmin /transfer "scimailupdate" https://raw.githubusercontent.com/sciAndrew/SCImail/master/clencryptor.bat %pathtohere%clencryptor.bat
bitsadmin /transfer "scimailupdate" https://raw.githubusercontent.com/sciAndrew/SCImail/master/clock.bat %pathtohere%clock.bat
bitsadmin /transfer "scimailupdate" https://raw.githubusercontent.com/sciAndrew/SCImail/master/configure_scimail.bat %pathtohere%configure_scimail.bat
bitsadmin /transfer "scimailupdate" https://raw.githubusercontent.com/sciAndrew/SCImail/master/data_sync.bat %pathtohere%data_sync.bat
bitsadmin /transfer "scimailupdate" https://raw.githubusercontent.com/sciAndrew/SCImail/master/decrypt_mail.bat %pathtohere%decrypt_mail.bat
bitsadmin /transfer "scimailupdate" https://raw.githubusercontent.com/sciAndrew/SCImail/master/send_mail.bat %pathtohere%send_mail.bat

echo SCImail updated
echo press any key to exit and run SCIchat.bat again to use the new version
timeout /nobreak 3
pause
exit

:lastline