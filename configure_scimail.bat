echo off

set "drivenotfound=false"
:render
if %key1% lss 0 ( set /a key1=%key1% * -1 )
set "viskey1=%key1%         "
set "viskey1=%viskey1:~0,9%"

if %key2% lss 0 ( set /a key2=%key2% * -1 )
set "viskey2=%key2%         "
set "viskey2=%viskey2:~0,9%"

set "useraddress=%useraddress:~0,6%______"
set "useraddress=%useraddress:~0,6%             "
set "useraddress=%useraddress:~0,13%"

set "vispath_______________long=%pdrive%                            "
set "vispath_______________long=%vispath_______________long:~0,28%"


cls
echo +------------------------------------------------------------+
echo ' ( shift+A to change ) key 1 : %viskey1%                    '
echo '                                                            '
echo ' ( shift+B to change ) key 2 : %viskey2%                    '
echo '                                                            '
echo ' ( shift+C to change ) address : %useraddress%              '
echo '                                                            '
echo ' ( shift+D to change ) drive : %vispath_______________long% '
echo '                                                            '
echo ' ( shift+E to change ) mail notification : %notify%           '
echo '                                                            '
echo '          shift+F to find drive automatically               '
echo '  only works if other SCImail client synchronized recently  '
echo '                                                            '
echo '    shift+X to go back          shift+S to save             '
echo +------------------------------------------------------------+
if "%drivenotfound%"=="true" ( echo shared drive not found )

choice /C ABCXSDFE /CS

if "%errorlevel%"=="1" (
set /p key1=key 1 : max 2 digit number, must be bigger than 0 : 
)

if "%errorlevel%"=="2" (
set /p key2=key 2 : recomended 3 digit number, must be bigger than 0 : 
)

if "%errorlevel%"=="3" (
set /p useraddress=address - max 6 small letters, no spaces : 
)

if "%errorlevel%"=="4" ( goto lastline )

if "%errorlevel%"=="5" ( goto write_config )

if "%errorlevel%"=="6" (
set /p pdrive=shared drive or folder path, for example P:\  : 
)
if "%errorlevel%"=="7" (
 set "drivenotfound=true"
 if exist A:\SCImail.txt (
  set "pdrive=A:\"
  set "drivenotfound=false"
 )
 if exist B:\SCImail.txt (
  set "pdrive=B:\"
  set "drivenotfound=false"
 )
 if exist C:\SCImail.txt (
  set "pdrive=C:\"
  set "drivenotfound=false"
 )
 if exist D:\SCImail.txt (
  set "pdrive=D:\"
  set "drivenotfound=false"
 )
 if exist E:\SCImail.txt (
  set "pdrive=E:\"
  set "drivenotfound=false"
 )
 if exist F:\SCImail.txt (
  set "pdrive=F:\"
  set "drivenotfound=false"
 )
 if exist G:\SCImail.txt (
  set "pdrive=G:\"
  set "drivenotfound=false"
 )
 if exist H:\SCImail.txt (
  set "pdrive=H:\"
  set "drivenotfound=false"
 )
 if exist I:\SCImail.txt (
  set "pdrive=I:\"
  set "drivenotfound=false"
 )
 if exist J:\SCImail.txt (
  set "pdrive=J:\"
  set "drivenotfound=false"
 )
 if exist K:\SCImail.txt (
  set "pdrive=K:\"
  set "drivenotfound=false"
 )
 if exist L:\SCImail.txt (
  set "pdrive=L:\"
  set "drivenotfound=false"
 )
 if exist M:\SCImail.txt (
  set "pdrive=M:\"
  set "drivenotfound=false"
 )
 if exist N:\SCImail.txt (
  set "pdrive=N:\"
  set "drivenotfound=false"
 )
 if exist O:\SCImail.txt (
  set "pdrive=O:\"
  set "drivenotfound=false"
 )
 if exist P:\SCImail.txt (
  set "pdrive=P:\"
  set "drivenotfound=false"
 )
 if exist Q:\SCImail.txt (
  set "pdrive=Q:\"
  set "drivenotfound=false"
 )
 if exist R:\SCImail.txt (
  set "pdrive=R:\"
  set "drivenotfound=false"
 )
 if exist S:\SCImail.txt (
  set "pdrive=S:\"
  set "drivenotfound=false"
 )
 if exist T:\SCImail.txt (
  set "pdrive=T:\"
  set "drivenotfound=false"
 )
 if exist U:\SCImail.txt (
  set "pdrive=U:\"
  set "drivenotfound=false"
 )
 if exist V:\SCImail.txt (
  set "pdrive=V:\"
  set "drivenotfound=false"
 )
 if exist W:\SCImail.txt (
  set "pdrive=W:\"
  set "drivenotfound=false"
 )
 if exist X:\SCImail.txt (
  set "pdrive=X:\"
  set "drivenotfound=false"
 )
 if exist Y:\SCImail.txt (
  set "pdrive=Y:\"
  set "drivenotfound=false"
 )
 if exist Z:\SCImail.txt (
  set "pdrive=Z:\"
  set "drivenotfound=false"
 )
)

if "%errorlevel%"=="8" (
if "%notify%"=="notify" ( set "notify=silent" ) else ( set "notify=notify" )
)

goto render

:write_config

echo %useraddress:~0,6%;%key1%;%key2%;%pdrive%;%notify%>config.txt

:lastline