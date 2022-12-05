taskkill.exe /F /IM steam.exe
set login1=ENTER FIRST LOGIN
set login2=ENTER SECOND LOGIN
for /f "tokens=3" %%a in ('reg query "HKCU\Software\Valve\Steam"  /V AutoLoginUser  ^|findstr /ri "REG_SZ"') do set login0=%%a
if /I %login1%==%login0% (reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %login2% /f) else (reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %login1% /f)
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main
