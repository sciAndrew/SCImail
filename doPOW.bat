echo off

set difficulty=%1
set string=%2
set nonce=0

echo Proof Of Work started at %time%

:nextnonce
set /a nonce=%nonce%+1

for /f "skip=2 tokens=1" %%a in ('call checkPOW.bat %difficulty% %string%%nonce%') do (
set result=%%a
)

if not "%result%"=="passed" ( goto nextnonce )

echo Proof Of Work finished at %time%

echo %nonce%