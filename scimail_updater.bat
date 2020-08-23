echo off
set "pathtohere=%~dp0"

del /q *.new

bitsadmin /transfer "scimailupdate_browse_mail.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/browse_mail.bat %pathtohere%browse_mail.bat.new || ( set "couldnotupdate=true" )
bitsadmin /transfer "scimailupdate_browse_trash.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/browse_trash.bat %pathtohere%browse_trash.bat.new  || ( set "couldnotupdate=true" )
bitsadmin /transfer "scimailupdate_cldecryptor.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/cldecryptor.bat %pathtohere%cldecryptor.bat.new  || ( set "couldnotupdate=true" )
bitsadmin /transfer "scimailupdate_clencryptor.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/clencryptor.bat %pathtohere%clencryptor.bat.new  || ( set "couldnotupdate=true" )
bitsadmin /transfer "scimailupdate_clock.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/clock.bat %pathtohere%clock.bat.new  || ( set "couldnotupdate=true" )
bitsadmin /transfer "scimailupdate_configure_scimail.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/configure_scimail.bat %pathtohere%configure_scimail.bat.new  || ( set "couldnotupdate=true" )
bitsadmin /transfer "scimailupdate_data_sync.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/data_sync.bat %pathtohere%data_sync.bat.new  || ( set "couldnotupdate=true" )
bitsadmin /transfer "scimailupdate_decrypt_mail.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/decrypt_mail.bat %pathtohere%decrypt_mail.bat.new  || ( set "couldnotupdate=true" )
bitsadmin /transfer "scimailupdate_send_mail.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/send_mail.bat %pathtohere%send_mail.bat.new  || ( set "couldnotupdate=true" )
bitsadmin /transfer "scimailupdate_SCImail.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/SCImail.bat %pathtohere%SCImail.bat.new  || ( set "couldnotupdate=true" )
bitsadmin /transfer "scimailupdate_scimail_preupdater.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/scimail_preupdater.bat %pathtohere%scimail_preupdater.bat.new  || ( set "couldnotupdate=true" )
bitsadmin /transfer "scimailupdate_browse_contacts.bat" https://raw.githubusercontent.com/sciAndrew/SCImail/master/browse_contacts.bat %pathtohere%browse_contacts.bat.new  || ( set "couldnotupdate=true" )

if "%couldnotupdate%"=="true" ( goto lastline ) else (
type browse_mail.bat.new > browse_mail.bat
type browse_trash.bat.new > browse_trash.bat
type cldecryptor.bat.new > cldecryptor.bat
type clencryptor.bat.new > clencryptor.bat
type clock.bat.new > clock.bat
type configure_scimail.bat.new > configure_scimail.bat
type data_sync.bat.new > data_sync.bat
type decrypt_mail.bat.new > decrypt_mail.bat
type send_mail.bat.new > send_mail.bat
type SCImail.bat.new > SCImail.bat
type scimail_preupdater.bat.new > scimail_preupdater.bat
type browse_contacts.bat.new > browse_contacts.bat
del /q *.new
exit
)

:lastline