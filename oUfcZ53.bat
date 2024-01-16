
-- rust.bat start --
rem Kill process
taskkill /f /im Rust.exe
taskkill /f /im RustClient.exe
taskkill /f /im Steam.exe

rem Clean registry
regedit /S E:\rust.reg

rem Change MAC adress
"c:\Program Files (x86)\Technitium\TMACv6.0\TMAC.exe" -n Ethernet -re -s

rem Clean Rust dumps
for /f "Tokens=1* Delims=" %%F in ('dir /AD /B d:\SteamLibrary\steamapps\common\Rust\2*') do echo %%F

rem Clean Rust logs
del /Q "d:\SteamLibrary\steamapps\common\Rust\RustClient_Data\output_log.txt"
del /Q "d:\SteamLibrary\steamapps\common\Rust\RustClient_Data\output_log.last"

rem Clean Steam
for /f "Tokens=1* Delims=" %%F in ('dir /AD /B "c:\Program Files (x86)\Steam\appcache\*"') do rmdir /S /Q "c:\Program Files (x86)\Steam\appcache\%%F"

del /Q "c:\Program Files (x86)\Steam\appcache\*.*"
del /Q "c:\Program Files (x86)\Steam\depotcache\*.*"
del /Q "c:\Program Files (x86)\Steam\config\*.*"
del /Q "c:\Program Files (x86)\Steam\dumps\*.*"
del /Q "c:\Program Files (x86)\Steam\logs\*.*"
del /Q "c:\Program Files (x86)\Steam\.crash"

for /f "Tokens=1* Delims=" %%F in ('dir /A /B "c:\Program Files (x86)\Steam\ssfn*"') do del /Q "c:\Program Files (x86)\Steam\%%F"
for /f "Tokens=1* Delims=" %%F in ('dir /AD /B "c:\Program Files (x86)\Steam\userdata\*"') do rmdir /S /Q "c:\Program Files (x86)\Steam\userdata\%%F"

rem Complite
-- rust.bat end --

-- rust.reg start --
Windows Registry Editor Version 5.00

[-HKEY_CURRENT_USER\SOFTWARE\Facepunch Studios LTD\Rust]

[HKEY_USERS\S-1-5-21-3418248263-400613800-3086360259-1001\SOFTWARE\Valve\Steam]
"AutoLoginUser"=""
-- rust.reg end --