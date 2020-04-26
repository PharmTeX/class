@echo off
REM PharmTeX Windows shell script, part of the PharmTeX platform.
REM Copyright (C) 2020 Christian Hove Claussen (contact@pharmtex.org).
REM This program is free software: You can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of the GNU Affero General Public License along with this program (see file named LICENSE). If not, see <https://www.gnu.org/licenses/>.

REM Change this path to fit your installation
set "LDIR=%USERPROFILE%\pharmtex"

REM Check startup options and files
for %%i in (%1) do ( set "NAME=%%~ni" )
set "MODE=%2"

REM If TEX file not set, prompt user and execute gui mode
if "%NAME%"=="" (
	if "%MODE%"=="" (
		set /p NAME=File to edit = 
		set "MODE=gui"
	)
)
for %%i in (%NAME%) do ( set "NAME=%%~ni" )

REM Temporarily change system PATH if PharmTeX software bundle is present
set "OLDPATH=%PATH%"
if exist "%LDIR%" ( call %LDIR%\bin\setpath >nul 2>&1 )

REM Exit if script is run to set path only
if "%MODE%"=="path" ( exit )

REM Load MiKTeX Tool if gui mode
if "%MODE%"=="gui" (
	start miktex-taskbar-icon
	call texmaker "%NAME%.tex"
)

REM Pass arguments on
if not "%MODE%"=="gui" ( call perl runlatex.pl %NAME% %MODE% )

REM Clean up
if "%MODE%"=="gui" ( call taskkill /F /IM miktex-taskbar-icon.exe )
if exist "%LDIR%" ( if exist jabref.xml ( move jabref.xml "%LDIR%\jabref\jabref.xml" >nul 2>&1 ) )
if not exist "%LDIR%" ( del jabref.xml >nul 2>&1 )
if exist dodel.txt ( del dodel.txt "%NAME%.pdf" >nul 2>&1 )
set "PATH=%OLDPATH%"
set "PATH=%PATH%"
