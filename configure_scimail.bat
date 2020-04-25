echo off


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

cls
echo +------------------------------------------------------------+
echo '                                                            '
echo '    key 1 : %viskey1%         ( shift+A to change )         '
echo '                                                            '
echo '    key 2 : %viskey2%         ( shift+B to change )         '
echo '                                                            '
echo '    address : %useraddress%   ( shift+C to change )         '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo '    shift+D to go back          shift+S to save             '
echo '                                                            '
echo +------------------------------------------------------------+

choice /C ABCDS /CS

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

goto render

:write_config

echo %useraddress:~0,6%;%key1%;%key2%>config.txt

:lastline