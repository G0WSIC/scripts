IF EXIST "C:\Program Files (x86)\Automox\amagent.exe" GOTO UNINSTALL
GOTO END
:UNINSTALL
"C:\Program Files (x86)\Automox\amagent.exe" --deregister
"C:\Program Files (x86)\Automox\unins000.exe" /VERYSILENT /SUPPRESSMSGBOXES
cd \
sc stop amagent
timeout /t 120 /nobreak
sc delete amagent
timeout /t 120 /nobreak
rmdir /s /q "C:\Program Files (x86)\Automox"
:END