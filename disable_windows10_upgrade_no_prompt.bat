@echo off

:CheckOS
IF EXIST "%PROGRAMFILES(X86)%" (GOTO 64BIT) ELSE (GOTO 32BIT)

:64BIT
    ::64bit OS
	echo "64 bit"
	REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableOSUpgrade /t REG_DWORD /d 1 /f
	REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\OSUpgrade" /v ReservationsAllowed /t REG_DWORD /d 0 /f
	REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Gwx" /v DisableGwx /t REG_DWORD /d 1 /f
 GOTO PROMPT

:32BIT
    :: 32bit OS
	echo "32 bit"
	REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableOSUpgrade /t REG_DWORD /d 1 /f
	REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\OSUpgrade" /v ReservationsAllowed /t REG_DWORD /d 0 /f
	REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Gwx" /v DisableGwx /t REG_DWORD /d 1 /f
GOTO PROMPT	


:PROMPT
::SET /P CONFIRM=done, please reboot the system
::IF /I "%CONFIRM%" NEQ "Y" GOTO END

:END
echo done, please reboot the system
EXIT
