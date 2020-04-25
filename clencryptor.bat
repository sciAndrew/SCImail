@echo off
setlocal EnableDelayedExpansion

:start
::clencryptor.bat [string to encrypt] [key] [modifier]
::all required, none are optional, also possible to save to files like this
::clencryptor.bat [string to encrypt] [key] [modifier] >> file.txt
set string=%1
set key=%2
set mod=%3

set string=0%string%
set "processing=true"

set char=0
set charplace=0

set "RESULT="

:stringprocess

set nchar=!string:~%charplace%,1!

set nchar=%nchar:a=1%
set nchar=%nchar:b=2%
set nchar=%nchar:c=3%
set nchar=%nchar:d=4%
set nchar=%nchar:e=5%
set nchar=%nchar:f=6%
set nchar=%nchar:g=7%
set nchar=%nchar:h=8%
set nchar=%nchar:i=9%
set nchar=%nchar:j=10%
set nchar=%nchar:k=11%
set nchar=%nchar:l=12%
set nchar=%nchar:m=13%
set nchar=%nchar:n=14%
set nchar=%nchar:o=15%
set nchar=%nchar:p=16%
set nchar=%nchar:q=17%
set nchar=%nchar:r=18%
set nchar=%nchar:s=19%
set nchar=%nchar:t=20%
set nchar=%nchar:u=21%
set nchar=%nchar:v=22%
set nchar=%nchar:w=23%
set nchar=%nchar:x=24%
set nchar=%nchar:y=25%
set nchar=%nchar:z=26%
set nchar=%nchar:_=27%

set /a char=( ( %char% + %nchar% + %key% ) %% 28 )
set /a key=(%key%+%char%) %% %mod%

set pchar=%char%
set pchar=%pchar:27=_%
set pchar=%pchar:26=z%
set pchar=%pchar:25=y%
set pchar=%pchar:24=x%
set pchar=%pchar:23=w%
set pchar=%pchar:22=v%
set pchar=%pchar:21=u%
set pchar=%pchar:20=t%
set pchar=%pchar:19=s%
set pchar=%pchar:18=r%
set pchar=%pchar:17=q%
set pchar=%pchar:16=p%
set pchar=%pchar:15=o%
set pchar=%pchar:14=n%
set pchar=%pchar:13=m%
set pchar=%pchar:12=l%
set pchar=%pchar:11=k%
set pchar=%pchar:10=j%
set pchar=%pchar:9=i%
set pchar=%pchar:8=h%
set pchar=%pchar:7=g%
set pchar=%pchar:6=f%
set pchar=%pchar:5=e%
set pchar=%pchar:4=d%
set pchar=%pchar:3=c%
set pchar=%pchar:2=b%
set pchar=%pchar:1=a%


set "RESULT=%RESULT%%pchar%"

set /a charplace=%charplace%+1

if "!string:~%charplace%,1!"=="" ( set "processing=false" )

if "%processing%"=="true" ( goto stringprocess )
::set RESULT=%RESULT:~1%
echo %RESULT%