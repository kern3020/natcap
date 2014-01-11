Working on an windows installer for the Natural Capital project
(http://www.naturalcapitalproject.org/). The scripts are written for
NSIS ( http://nsis.sourceforge.net/Main_Page ) and based on Invest's
Building InVESTonWindows document (
https://code.google.com/p/invest-natcap/wiki/BuildingInVESTonWindows )

The main install script is install/natcap.nsi. Typing 

 makensis.exe natcap.nsi

will generate an setup executable called setup-invest-py27.exe.  Left
clicking on natcap.nsi and selecting "Compiling NSIS script" brings up
a nice GUI on windows. 

Inputs to the installer include about 16 embedded installers. It
doesn't make sense to check them into the git. They are stored on the
filesystem.

Notes: 

The snippets directory contains of small scripts detailing
how to do something(ie, find the path to the python executable).

I found this link helpful to understand on to access the
Windows registry from
NSIS. http://nsis.sourceforge.net/Reading_and_Writing_the_Registry_-_NSIS_makes_it_easy

