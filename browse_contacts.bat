if not exist "contacts.txt" ( break >> "contacts.txt" )
echo off
set "spaces_60=                                                            "

set contactnumber=0
:fillspaces
set /a contactnumber=%contactnumber%+1
set "contct_xx_xxx_description_%contactnumber%=          -empty-            "
if %contactnumber%==24 ( goto reread )
goto fillspaces

:reread
set contactnumber=0
for /f "tokens=1-4 delims=-" %%a in (contacts.txt ) do ( call :load_contact %%a %%b %%c %%d )

cls
echo +------------------------------------------------------------+
echo '%contct_xx_xxx_description_1% '%contct_xx_xxx_description_13%'
echo '%contct_xx_xxx_description_2% '%contct_xx_xxx_description_14%'
echo '%contct_xx_xxx_description_3% '%contct_xx_xxx_description_15%'
echo '%contct_xx_xxx_description_4% '%contct_xx_xxx_description_16%'
echo '%contct_xx_xxx_description_5% '%contct_xx_xxx_description_17%'
echo '%contct_xx_xxx_description_6% '%contct_xx_xxx_description_18%'
echo '%contct_xx_xxx_description_7% '%contct_xx_xxx_description_19%'
echo '%contct_xx_xxx_description_8% '%contct_xx_xxx_description_20%'
echo '%contct_xx_xxx_description_9% '%contct_xx_xxx_description_21%'
echo '%contct_xx_xxx_description_10% '%contct_xx_xxx_description_22%'
echo '%contct_xx_xxx_description_11% '%contct_xx_xxx_description_23%'
echo '%contct_xx_xxx_description_12% '%contct_xx_xxx_description_24%'
echo +------------------------------------------------------------+
echo 'shift+B=back                shift+A=add new contact         '
echo +------------------------------------------------------------+

choice /C BA /CS

if "%errorlevel%"=="1" ( goto lastline )
if "%errorlevel%"=="2" (
 set /p newcontactaddress=New contact address [6 characters] :
 set /p newcontactkey1=New contact key 1 :
 set /p newcontactkey2=New contact key 2 :
 set /p newcontactdescription=New contact description [optional, max 16 characters] :
)
if "%errorlevel%"=="2" (
 echo %newcontactaddress%-%newcontactkey1%-%newcontactkey2%-%newcontactdescription%>>contacts.txt
)


goto reread

goto lastline

:load_contact
set /a contactnumber=%contactnumber%+1
set "thiscontactdescription=%4"
set "nextcontact=%1 %2 %3 %4                  "
set "contct_xx_xxx_description_%contactnumber%=%nextcontact:~0,29%"

:lastline