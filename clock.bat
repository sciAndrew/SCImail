::set /a yearsince2000=%date:~6,4% - 2000
::set /a yearS=%yearsince2000% * 1461 * 24 * 3600 / 4
set /a monthS=%date:~3,2% * 61 * 24 * 3600 / 2
set /a dayS=%date:~0,2% * 24 * 3600

set /a hourS=%time:~0,2% * 3600
set /a minuteS=%time:~3,2% * 60
set /a seconds=%time:~6,2% * 1

set /a clock=%monthS%+%dayS%+%hourS%+%minuteS%+%seconds%
echo %clock%