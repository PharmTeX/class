@echo off
REM PharmTeX Windows shell script, part of the PharmTeX platform
REM Created by Christian Hove Rasmussen (contact@pharmtex.org)
REM Released under the GNU AFFERO GENERAL PUBLIC LICENSE Version 3

REM Change this path to fit your installation
set "LDIR=%USERPROFILE%\pharmtex"

REM Check startup options and files
for %%i in (%1) do ( set "NAME=%%~ni" )
set "MODE=%2"

REM If TEx file set, prompt user and execute gui mode
if "%NAME%"=="" (
	if "%MODE%"=="" (
		set /p NAME=File to edit = 
		set "MODE=gui"
	)
)

REM Set variables and system PATH. %NAME% is filename without extension.
set "OLDPATH=%PATH%"
set "PATH=%LDIR%\bin;%LDIR%\java\bin;%LDIR%\miktex\miktex\bin;%LDIR%\perl\perl\bin;%LDIR%\perl\perl\site\bin;%LDIR%\perl\c\bin;%LDIR%\pdftk\bin;%LDIR%\texmaker;%LDIR%\qpdf\bin;%PATH%"
set "PATH=%PATH%"
call perlportable

REM Exit if script is run to set path only
if "%MODE%"=="path" ( exit )

REM Load MiKTeX Tool if gui mode
if "%MODE%"=="gui" (
	call miktex-taskbar-icon
	call texmaker %NAME%.tex
)

REM Pass arguments on
if not "%MODE%"=="gui" ( call perl runlatex.pl %NAME% %MODE% )

REM Clean up
if "%MODE%"=="gui" ( call taskkill /IM miktex-taskbar-icon.tmp )
if exist jabref.xml ( move jabref.xml "%LDIR%\jabref\jabref.xml" > nul 2>&1 )
if exist dodel.txt ( del "%NAME%.pdf" dodel.txt > nul 2>&1 )
set "PATH=%OLDPATH%"
set "PATH=%PATH%"
