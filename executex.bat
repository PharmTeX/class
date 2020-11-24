@echo off
REM PharmTeX Windows shell wrapper script, part of the PharmTeX platform.
REM Copyright (C) 2020 Christian Hove Claussen (contact@pharmtex.org).
REM This program is free software: You can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of the GNU Affero General Public License along with this program (see file named LICENSE). If not, see <https://www.gnu.org/licenses/>.

REM Path to PharmTeX software installation
set "LDIR=%USERPROFILE%\pharmtex"

REM Path to PharmTeX files
set "PHARMTEXDIR=%LDIR%\pharmtex";

REM If no options set, prompt user
if "%1"=="" (
	set /p "CNAME=File to edit = "
)

REM Start Texstudio if requested
if not "%CNAME%"=="" (
	call "%PHARMTEXDIR%\runlatex.bat" "%CNAME%" gui
	exit /b 0
)

REM Run runlatex.bat with input options
call "%PHARMTEXDIR%\runlatex.bat" %*