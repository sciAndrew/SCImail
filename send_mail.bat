echo off
set "tgtusraddrs="
set "spaces_60=                                                            "

set "mail_contents=_"

:render
if "%mail_contents%"=="" ( set "mail_contents=_" )
set "mail_contents=%mail_contents:~0,660%"
set "visaddress=%tgtusraddrs%%spaces_60%"
set "visaddress=%visaddress:~0,6%'%visaddress:~8,5%"

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
echo 'new mail to: %visaddress%              from: %useraddress%  '
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
echo 'use shift' S=space ' B=back ' X=delete ' E=send ' C=contacts'
echo +------------------------------------------------------------+

choice /C abcdefghijklmnopqrstuvwxyzSBXEC /CS

if "%errorlevel%"=="28" ( goto lastline )
if "%errorlevel%"=="29" (
 if not "%mail_contents%"=="_" ( set "mail_contents=%mail_contents:~0,-1%" )
 if "%mail_contents%"=="_" ( set "tgtusraddrs=%tgtusraddrs:~0,-1%" )
)
if "%errorlevel%"=="30" ( goto send )

if "%errorlevel%"=="31" ( call browse_contacts.bat )

if %errorlevel% gtr 27 ( goto render )

set nextchar=%errorlevel%
set nextchar=%nextchar:27=_%
set nextchar=%nextchar:26=z%
set nextchar=%nextchar:25=y%
set nextchar=%nextchar:24=x%
set nextchar=%nextchar:23=w%
set nextchar=%nextchar:22=v%
set nextchar=%nextchar:21=u%
set nextchar=%nextchar:20=t%
set nextchar=%nextchar:19=s%
set nextchar=%nextchar:18=r%
set nextchar=%nextchar:17=q%
set nextchar=%nextchar:16=p%
set nextchar=%nextchar:15=o%
set nextchar=%nextchar:14=n%
set nextchar=%nextchar:13=m%
set nextchar=%nextchar:12=l%
set nextchar=%nextchar:11=k%
set nextchar=%nextchar:10=j%
set nextchar=%nextchar:9=i%
set nextchar=%nextchar:8=h%
set nextchar=%nextchar:7=g%
set nextchar=%nextchar:6=f%
set nextchar=%nextchar:5=e%
set nextchar=%nextchar:4=d%
set nextchar=%nextchar:3=c%
set nextchar=%nextchar:2=b%
set nextchar=%nextchar:1=a%


if "%visaddress:~5,1%"==" " ( set "tgtusraddrs=%tgtusraddrs%%nextchar%" )
if not "%visaddress:~5,1%"==" " ( set "mail_contents=%mail_contents%%nextchar%" )

goto render

:send

set "FULLMAIL=%tgtusraddrs%%useraddress:~0,6%%mail_contents%"
set /p Rkey_1=recipients key 1 : 
set /p Rkey_2=recipients key 2 : 


echo encrypting mail...
for /f %%f in ('call clencryptor.bat %FULLMAIL% %Rkey_1% %Rkey_2%') do ( set "ENCRYPTEDMAIL=%%f" )
echo synchronizing clock...
call clock.bat
echo %clock%:%ENCRYPTEDMAIL%>>store.txt
if not exist "%pdrive%SCImail.txt" ( echo https://github.com/sciAndrew/SCImail >> "%pdrive%SCImail.txt" )
echo %clock%:%ENCRYPTEDMAIL%>>%pdrive%SCImail.txt

:lastline