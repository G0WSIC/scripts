@echo on

REM Disable .CMD warning prompts
REG ADD HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Associations /v LowRiskFileTypes /d .cmd;.msi;.msp /f

:AGRESSO
IF EXIST "C:\Users\Public\Desktop\Agresso - Shortcut.lnk" GOTO OFFICE2016
copy ".\Agresso\Agresso - Shortcut.lnk" "C:\Users\Public\Desktop"
IF EXIST "C:\Program Files (x86)\Agresso Report Engine 8" GOTO OFFICE2016
".\Agresso\Unit4ReportEngine9.msi" /qn

:OFFICE2016
REM IF EXIST "C:\Program Files\Microsoft Office\Office16\WINWORD.exe"  GOTO OFFICEWEBCOMP
REM IF EXIST "C:\Program Files (x86)\Microsoft Office\Office16\WINWORD.exe"  GOTO OFFICEWEBCOMP
".\Microsoft\Office_Professional_Plus_2016_64Bit\Setup.exe"

:OFFICEWEBCOMP
IF EXIST "C:\Program Files (x86)\Common Files\Microsoft Shared\Web Components\10"  GOTO ADOBEREADER
".\Microsoft\OfficeXPWebComponents\owc10se.msi"/quiet


:ADOBEREADER
IF EXIST "C:\Program Files (x86)\Adobe\Reader 11.0" GOTO 7ZIP
IF EXIST "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader" GOTO 7ZIP
".\Adobe DC\AcroRdrDC1501720050_en_US.exe" /msi EULA_ACCEPT=YES /qn

:7ZIP
IF EXIST "C:\Program Files (x86)\7-Zip" GOTO BGINFO
IF EXIST "C:\Program Files\7-Zip" GOTO BGINFO
IF EXIST "C:\Program Files (x86)" GOTO 7ZipX64
".\7zip\7z1602.msi" /QN
GOTO BGINFO

:7ZipX64
".\7zip\7z1602-x64.msi" /QN

:BGINFO
IF EXIST "C:\Windows\Bginfo.exe" GOTO CHROME
XCOPY /C /Y ".\BGinfo\Bginfo.exe" C:\Windows\

:CHROME
IF EXIST "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" GOTO CISCOVPN
".\Chrome4Work\googlechromestandaloneenterprise64.msi" /QN

:CISCOVPN
IF EXIST "C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client" GOTO SEP
".\Cisco VPN\anyconnect-win-4.2.01035.msi" /QN

:SEP
IF EXIST "C:\Program Files (x86)\Symantec\Symantec Endpoint Protection" GOTO END
IF EXIST "C:\Program Files\Symantec\Symantec Endpoint Protection" GOTO END
".\Symantec\SEP12x64\Sep64.msi" /QN


:END