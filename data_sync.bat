echo off
call clock.bat
set /a clocklimit=%clock%-2629743
::clock limit is clock minus 1 month in seconds
::max store size set to 1000000 bytes = 1MB
set "maxBsize=1000000"

::create missing files if don't exist
if not exist "%pdrive%:\SCImail.txt" ( break >> "%pdrive%:\SCImail.txt" )
if not exist "store.txt" ( break >> "store.txt" )

FOR /F "usebackq" %%A IN ('store.txt') DO ( set size=%%~zA )

::download any new/missing lines to store
for /f "tokens=1-2 delims=- " %%a in (%pdrive%:\SCImail.txt ) do (
 if %%~za leq 800 (
  if %%a gtr %clocklimit% (
   if %%a lss %clock% (
    find /c "%%a-%%b" "store.txt"  || ( echo %%a-%%b>> "store.txt" )
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
for /f "tokens=1-2 delims=-" %%a in (store.txt ) do (
 if %%~za leq 800 (
  if %%a gtr %clocklimit% (
   if %%a lss %clock% (
    find /c "%%a-%%b" "%pdrive%:\SCImail.txt"  || ( echo %%a-%%b>> "%pdrive%:\SCImail.txt" )
   )
  )
 )
)

:lastline