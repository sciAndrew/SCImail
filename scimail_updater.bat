echo off
set "pathtohere=%~dp0"
del /q version.txt
ping -n 2  github.com || ( set "couldnotupdate=true" && goto lastline )
bitsadmin /transfer "scimailupdate_version.txt" https://raw.githubusercontent.com/sciAndrew/SCImail/master/version.txt %pathtohere%version.txt
set /p newversion=<version.txt
if %newversion% leq %SCImailversion% ( set "couldnotupdate=uptodate" && goto lastline )
echo new version available
for /f "skip=1 tokens=* delims=" %%f in (version.txt) do ( echo %%f )
echo the window will be closed and you will have to start SCImail.bat again to use the new version
echo do you want to update : n if no, y if yes
choice /C ny
if %errorlevel% == 1 ( goto lastline )

bitsadmin /transfer "scimailupdate_browse_mail.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/browse_mail.bat %pathtohere%browse_mail.bat
bitsadmin /transfer "scimailupdate_browse_trash.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/browse_trash.bat %pathtohere%browse_trash.bat
bitsadmin /transfer "scimailupdate_cldecryptor.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/cldecryptor.bat %pathtohere%cldecryptor.bat
bitsadmin /transfer "scimailupdate_clencryptor.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/clencryptor.bat %pathtohere%clencryptor.bat
bitsadmin /transfer "scimailupdate_clock.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/clock.bat %pathtohere%clock.bat
bitsadmin /transfer "scimailupdate_configure_scimail.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/configure_scimail.bat %pathtohere%configure_scimail.bat
bitsadmin /transfer "scimailupdate_data_sync.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/data_sync.bat %pathtohere%data_sync.bat
bitsadmin /transfer "scimailupdate_decrypt_mail.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/decrypt_mail.bat %pathtohere%decrypt_mail.bat
bitsadmin /transfer "scimailupdate_send_mail.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/send_mail.bat %pathtohere%send_mail.bat
bitsadmin /transfer "scimailupdate_SCImail.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/SCImail.bat %pathtohere%SCImail.bat
bitsadmin /transfer "scimailupdate_scimail_updater.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/scimail_updater.bat %pathtohere%scimail_updater.bat && exit

:lastline