echo off
set "pathtohere=%~dp0"
del /q version.txt
ping -n 2  github.com || ( set "couldnotupdate=true" && goto lastline )
bitsadmin /transfer "scimailupdate_version.txt" https://raw.githubusercontent.com/sciAndrew/SCImail/blob/master/version.txt %pathtohere%version.txt
set /p newversion=<version.txt
if %newversion% leq %SCImailversion% ( set "couldnotupdate=uptodate" && goto lastline )
echo new version available
for /f "skip=1 tokens=* delims=" %%f in (version.txt) do ( echo %%f )
echo the window will be closed and you will have to start SCImail.bat again to use the new version
echo do you want to update : n if no, y if yes
choice /C ny
if %errorlevel% == 1 ( goto lastline )

del /q *.new

bitsadmin /transfer "scimailupdate_scimail_updater.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/blob/master/scimail_updater.bat %pathtohere%scimail_updater.bat.new  || ( set "couldnotupdate=true" )

if "%couldnotupdate%"=="true" ( goto lastline ) else (
type scimail_updater.bat.new > scimail_updater.bat
del /q *.new
call scimail_updater.bat
)

:lastline