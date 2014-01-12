; natcap.nsi
;
; This script is a NSIS to install InVEST. For now, all of the
; optional settings are left to their default settings.
;
;--------------------------------

!include LogicLib.nsh

; version 
!define VERSION "3.0"
; The name of the installer
Name "InVEST ${VERSION}"
; Name "InVEST"

; The file to write
OutFile "setup-invest-py27.exe"

; The default installation directory
InstallDir "$DESKTOP\invest_${VERSION}"

; license info
LicenseData LICENSE.TXT

; Request application privileges for Windows Vista
RequestExecutionLevel user

;--------------------------------

; Pages
Page license
Page directory
Page instfiles

;--------------------------------

; These are the programs that we need.
Section -Prerequisites
  SetOutPath $INSTDIR\prereq
  MessageBox MB_YESNO "Install Python 2.7.6?" /SD IDYES IDNO endPython
    File "prereq\python-2.7.6.msi"
    ExecWait '"msiexec" /i "$INSTDIR\prereq\python-2.7.6.msi"'
    Goto endPython
  endPython:
  MessageBox MB_YESNO "Install PIP 1.5 for Python 2.7?" /SD IDYES IDNO endPIP
    File "prereq\pip-1.5.win32-py2.7.exe"
    ExecWait "$INSTDIR\prereq\pip-1.5.win32-py2.7.exe"
    Goto endPIP
  endPIP:  
  MessageBox MB_YESNO "Install setuptools 2.0.2 for Python 2.7?" /SD IDYES IDNO endSetupTools
    File "prereq\setuptools-2.0.2.win32-py2.7.exe"
    ExecWait "$INSTDIR\prereq\setuptools-2.0.2.win32-py2.7.exe"
    Goto endPIP
  endSetupTools:
  ; install matplotlib last because there are a lot of dependencies. 
SectionEnd

; The stuff to install
Section "" ;No components page, name is not important

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR

  ; Put file there
  File natcap.nsi

SectionEnd ; end the section
