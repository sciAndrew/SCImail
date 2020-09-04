echo off
set /a difficulty=%1 / 2
set string=%2
set maxval=2147483647
set /a limit=%maxval% / %difficulty%
set /a nlimit=%limit% * -1

set "POWpass=passed"

for /f "skip=2 tokens=1" %%a in ('call andrewhash.bat 2 %string%') do (
if %%a gtr %limit% ( set POWpass=failed )
if %%a lss %nlimit% ( set POWpass=failed )
)

echo %POWpass%