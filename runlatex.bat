@echo off
setlocal
REM PharmTeX Windows shell start script, part of the PharmTeX platform.
REM Copyright (C) 2022 Christian Hove Claussen (contact@pharmtex.org).
REM This program is free software: You can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of the GNU Affero General Public License along with this program (see file named LICENSE). If not, see <https://www.gnu.org/licenses/>.

REM Path to texfs
set "CLSDIR=%LDIR%\texlive\texmf-local\tex\latex\pharmtex";
set "BSTDIR=%LDIR%\texlive\texmf-local\bibtex\bst\pharmtex";

REM Disable Texlive perl
if exist "%LDIR%/texlive/tlpkg/tlperl" ( move "%LDIR%/texlive/tlpkg/tlperl" "%LDIR%/texlive/tlpkg/tlperldir" >nul 2>&1 )

REM If no options set, prompt user and execute gui mode
if "%1"=="" (
	set /p NAME=File to edit = 
	set "MODE=gui"
)

REM Temporarily change system PATH if PharmTeX software bundle is present
set "OLDPATH=%PATH%"
if exist "%LDIR%" (
	call "%LDIR%\bin\ini" >nul 2>&1
	call "%LDIR%\bin\setpath" >nul 2>&1
)
call "texhash" >nul 2>&1

REM Check for Sweave, name, extension, and mode
if exist "run-counter" ( for /f "tokens=* delims=" %%x in (run-counter) do set "I=%%x" )
if "%I%"=="" ( set "I=0" )
if "%1"=="--version" (
	<nul set /p=1 > run-counter
	exit /b 0
)
if "%1"=="-synctex" ( if %I%==1 (
	<nul set /p=2 > run-counter
	exit /b 0
))
set "SWEAVE=0"
if "%1"=="-synctex" ( if %I%==2 (
	set "I=3"
	set "SWEAVE=1"
	if exist "run-counter" ( for /f "tokens=* delims=" %%x in (run-counter) do del run-counter )
))
if "%SWEAVE%"=="1" (
	for %%a in (%*) do set "NAME=%%a"
	set "EXT=.Rnw"
	if not "PHARMTEX_MODE"=="" (
		set "MODE=%PHARMTEX_MODE%"
	) else (
		set "MODE=full"
	)
) else ( if "%NAME%"=="" (
	set "NAME=%1"
	set "MODE=%2"
))
for %%a in (%NAME%) do ( set "EXT=%%~xa" )
for %%a in (%NAME%) do ( set "NAME=%%~na" )
set "EXT=%EXT:~1%"
if "%EXT%"=="~1" (
	if exist "%NAME%.Rnw" (
		set "EXT=Rnw"
	) else (
		set "EXT=tex"
	)
)

REM Choose batch mode if no mode set
if "%MODE%"=="" ( set "MODE=batch" )

REM Exit if only path is requested
if "%NAME%"=="texpath" (
	endlocal
	if exist "%LDIR%" ( call %LDIR%\bin\setpath >nul 2>&1 )
	exit /b 0
)

REM Load Texlive manager if requested and exit
if "%NAME%"=="texman" (
	endlocal
	if exist "%LDIR%/texlive/tlpkg/tlperldir" ( move /y "%LDIR%/texlive/tlpkg/tlperldir" "%LDIR%/texlive/tlpkg/tlperl" >nul 2>&1 )
	if exist "%LDIR%" ( call %LDIR%\bin\setpath >nul 2>&1 )
	start /b tlshell
	exit /b 0
)

REM If input file does not exist, exit
if not exist "%NAME%.%EXT%" (
	echo Input file "%NAME%.Rnw" or "%NAME%.tex" does not exist, exiting...
	timeout /t 2 /nobreak > NUL
	exit /b 0
)

REM Load Texstudio if gui mode
if "%MODE%"=="gui" ( texstudio "%NAME%.%EXT%" )

REM Pass arguments on
if not "%MODE%"=="gui" ( perl "%PHARMTEXDIR%\runlatex.pl" "%NAME%.%EXT%" "%MODE%" )

REM Clean up
taskkill /F /IM tlshell.exe >nul 2>&1
taskkill /F /IM pdflatex.exe >nul 2>&1
taskkill /F /IM bibtex.exe >nul 2>&1
taskkill /F /IM makeglossaries.exe >nul 2>&1
taskkill /F /IM perl.exe >nul 2>&1
taskkill /F /IM perltex.exe >nul 2>&1
taskkill /F /IM pdftk.exe >nul 2>&1
if exist "%LDIR%/texlive/tlpkg/tlperldir" ( move /y "%LDIR%/texlive/tlpkg/tlperldir" "%LDIR%/texlive/tlpkg/tlperl" >nul 2>&1 )
if exist "%LDIR%" ( if exist jabref.xml ( move jabref.xml "%LDIR%\jabref\jabref.xml" >nul 2>&1 ) )
if not exist "%LDIR%" ( del jabref.xml >nul 2>&1 )
if exist dodel.txt ( del dodel.txt "%NAME%.pdf" >nul 2>&1 )
set "PATH=%OLDPATH%"
set "PATH=%PATH%"
