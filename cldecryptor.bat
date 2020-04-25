setlocal EnableDelayedExpansion
echo off

:start
::cldecryptor.bat [string to decrypt] [key] [modifier]
set key=%1
set modf=%2
set mod=%3

set key=0%key%
set "keyprocessing=true"
set "stringprocessing=true"

set char=0
set charplace=0

set "RESULT="




:keyprocess

set /a prvcharplace=%charplace%-1

set nchar=!key:~%charplace%,1!

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

set fchar=%nchar%

set nchar=!key:~%prvcharplace%,1!

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

set prvchar=%nchar%

set /a pchar=( ( ( %fchar% - %prvchar% - ( %modf% %% 28 ) ) + ( 28 * 2 )  ) %% 28 )
set /a modf=(%modf%+%fchar%) %% %mod%

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

if "!key:~%charplace%,1!"=="" ( set "keyprocessing=false" )

if "%keyprocessing%"=="true" ( goto keyprocess )

set "RESULT=%RESULT:~2%"

echo %RESULT%