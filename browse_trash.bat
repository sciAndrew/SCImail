if not exist "store.txt" ( break >> "store.txt" )
if not exist "trash.txt" ( break >> "trash.txt" )
echo off
set "spaces_60=                                                            "

for /f "tokens=1-3 delims=-" %%a in (trash.txt ) do ( call :load_mail %%a %%b %%c )

cls
echo +------------------------------------------------------------+
echo '                                                            '
echo '    NO MORE TRASH                                           '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo '                                                            '
echo +------------------------------------------------------------+
echo 'shift+B=back                shift+D=delete trash permanently'
echo +------------------------------------------------------------+

choice /C BD /CS

if "%errorlevel%"=="1" ( goto lastline )
if "%errorlevel%"=="2" (
 break>trash.txt
 goto lastline
)

goto lastline

:load_mail

set "mail_Rdate=%3        "
set "full_mail=%2"
set "senderaddr=%full_mail:~6,6%"
set "mail_contents=%full_mail:~12%"

set "line_1______________________________________________=%mail_contents:~0,60%%spaces_60%"
set "line_2______________________________________________=%mail_contents:~60,60%%spaces_60%"
set "line_3______________________________________________=%mail_contents:~120,60%%spaces_60%"
set "line_4______________________________________________=%mail_contents:~180,60%%spaces_60%"
set "line_5______________________________________________=%mail_contents:~240,60%%spaces_60%"
set "line_6______________________________________________=%mail_contents:~300,60%%spaces_60%"
set "line_7______________________________________________=%mail_contents:~360,60%%spaces_60%"
set "line_8______________________________________________=%mail_contents:~420,60%%spaces_60%"
set "line_9______________________________________________=%mail_contents:~480,60%%spaces_60%"
set "line_10_____________________________________________=%mail_contents:~540,60%%spaces_60%"


cls
echo +------------------------------------------------------------+
echo ' mail from: %senderaddr%         recieved: %mail_Rdate%     '
echo +------------------------------------------------------------+
echo '%line_1______________________________________________:~0,60%'
echo '%line_2______________________________________________:~0,60%'
echo '%line_3______________________________________________:~0,60%'
echo '%line_4______________________________________________:~0,60%'
echo '%line_5______________________________________________:~0,60%'
echo '%line_6______________________________________________:~0,60%'
echo '%line_7______________________________________________:~0,60%'
echo '%line_8______________________________________________:~0,60%'
echo '%line_9______________________________________________:~0,60%'
echo '%line_10_____________________________________________:~0,60%'
echo +------------------------------------------------------------+
echo 'shift+B=back  shift+N=next  shift+D=delete trash permanently'
echo +------------------------------------------------------------+



choice /C BND /CS

if "%errorlevel%"=="1" ( goto lastline )
if "%errorlevel%"=="3" (
 break>trash.txt
 goto lastline
)

:lastline