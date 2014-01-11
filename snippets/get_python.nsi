; GetPythonPath
Name "Python Check"
OutFile "setup-check.exe"

 ;
 ; By based on Yazno's script to check if flash is installed, http://yazno.tripod.com/powerpimpit/
 ; Returns on top of stack
 ; 0 (Flash is not installed)
 ; or
 ; 1 (Flash is installed)
 ;
 ; Usage:
 ;   Call IsPythonInstalled
 ;   Pop $R0
 ;   ; $R0 at this point is "1" or "0"

 Function IsFlashInstalled
  Push $R0
  ClearErrors
  ReadRegStr $R0 HKCR "CLSID\{D27CDB6E-AE6D-11cf-96B8-444553540000}" ""
  IfErrors lbl_na
    StrCpy $R0 1
  Goto lbl_end
  lbl_na:
    StrCpy $R0 0
  lbl_end:
  Exch $R0
 FunctionEnd

Function GetPythonPath
  Push $R0
  ClearErrors
  ReadRegStr $R0 HKLM "Software\Microsoft\Windows\CurrentVersion\App Paths\Python.exe" ""
  DetailPrint "Python is installed at: $R0"
FunctionEnd

Section "" 
  Call GetPythonPath
  Pop $R0
SectionEnd