echo off
set inputstring=%2
set bonus=%1

::andrewhash.bat [difficulty] [string to hash]

::max 32bit integer is 2,147,483,647

set "extendstring=fhkdgjsfhadg"

:prepare

set inputstring=%extendstring%f%inputstring%f%extendstring%
set inputstring=%inputstring:a=1%
set inputstring=%inputstring:b=2%
set inputstring=%inputstring:c=3%
set inputstring=%inputstring:d=4%
set inputstring=%inputstring:e=5%
set inputstring=%inputstring:f=6%
set inputstring=%inputstring:g=7%
set inputstring=%inputstring:h=8%
set inputstring=%inputstring:i=9%
set inputstring=%inputstring:j=11%
set inputstring=%inputstring:k=12%
set inputstring=%inputstring:l=13%
set inputstring=%inputstring:m=14%
set inputstring=%inputstring:n=15%
set inputstring=%inputstring:o=16%
set inputstring=%inputstring:p=17%
set inputstring=%inputstring:q=18%
set inputstring=%inputstring:r=19%
set inputstring=%inputstring:s=21%
set inputstring=%inputstring:t=22%
set inputstring=%inputstring:u=23%
set inputstring=%inputstring:v=24%
set inputstring=%inputstring:w=25%
set inputstring=%inputstring:x=26%
set inputstring=%inputstring:y=27%
set inputstring=%inputstring:z=28%
set inputstring=%inputstring:_=29%
set inputstring=%inputstring:-=31%
set inputstring=%inputstring:0=32%
set rinputstring=############%inputstring%
set inputstring=%inputstring%############

set outcome=0
set part=0

:calculate
set nextpart=%inputstring:~0,6%
set inputstring=%inputstring:~6%
if "%nextpart:#=%" == "" ( goto endhashing )
call :processpart %nextpart:#=%
set /a outcome=%outcome% + %part%
set nextpart=%rinputstring:~-6,6%
set rinputstring=%rinputstring:~0,-6%
if "%nextpart:#=%" == "" ( goto endhashing )
call :processpart %nextpart:#=%
set /a outcome=%outcome% + %part%
goto calculate

:processpart
set roundsleft=%bonus%
set part=%1
:reprocess
set /a part=%part% * ( %part% %% 667 ) + 1
set /a roundsleft=%roundsleft%-1
if %roundsleft% gtr 0 ( goto reprocess )
goto lastline
::ends call

:endhashing
echo %outcome%

:lastline