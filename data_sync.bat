echo off
call clock.bat
set /a clocklimit=%clock%-2629743
::clock limit is clock minus 1 month in seconds
::max store size set to 30000 bytes = 30KB
set "maxBsize=30000"
set "PowDifficulty=100"

::create missing files if don't exist
if not exist "%pdrive%SCImail.txt" ( echo https://github.com/sciAndrew/SCImail >> "%pdrive%SCImail.txt" )
if not exist "store.txt" ( break >> "store.txt" )

FOR /F "usebackq" %%A IN ('store.txt') DO ( set size=%%~zA )

::download any new/missing lines to store
for /f "tokens=1-3 delims=: " %%a in (%pdrive%SCImail.txt ) do (
 if %%~za leq 800 (
  if %%a gtr %clocklimit% (
   if %%a lss %clock% (
       call :sync %%a %%b %%c
    )
   )
  )
 )
)

if %size% GTR %maxBsize% (
    echo store full, can't download more messages - making space
	del /q store.txt
	goto lastline
)

::upload any new/missing lines to SCImail
for /f "tokens=1-3 delims=:" %%a in (store.txt ) do (
 if %%~za leq 800 (
  if %%a gtr %clocklimit% (
   if %%a lss %clock% (
    find /c "%%a:%%b:%%c" "%pdrive%SCImail.txt"  || ( echo %%a:%%b:%%c>> "%pdrive%SCImail.txt" )
   )
  )
 )
)

goto lastline

:sync
call checkPOW.bat %PowDifficulty% %1-%2-%3
if "%POWpass%"=="passed" (
 find /c "%1:%2:%3" "store.txt"  || ( echo %1:%2:%3>> "store.txt" )
)
goto lastline


:lastline