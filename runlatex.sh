#!/bin/bash
# PharmTeX Linux start script, part of the PharmTeX platform.
# Copyright (C) 2023 Christian Hove Claussen (contact@pharmtex.org).
# This program is free software: You can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of the GNU Affero General Public License along with this program (see file named LICENSE). If not, see <https://www.gnu.org/licenses/>.

# Path to texfs
BSTDIR="$LDIR/texlive/texmf-local/bibtex/bst/pharmtex"; export BSTDIR
CLSDIR="$LDIR/texlive/texmf-local/tex/latex/pharmtex"; export CLSDIR

# If no options set, prompt user
if [ "$1" == "" ]; then
	read -p 'File to edit = ' NAME
	MODE=gui
fi

# Change paths if PharmTeX bundle is present
OLDPATH="$PATH"
OLDMANPATH="MANPATH"
OLDINFOPATH="INFOPATH"
if [ -d "$LDIR" ]; then
	source $LDIR/bin/setpath
fi
texhash > /dev/null 2>&1

# Check for Rstudio Sweave
if [ -f run-counter ]; then
	read -r i<run-counter
fi
if [ "$1" == "--version" ] && [ -z "$2" ] && [ -z "$3" ]; then
	echo 1 > run-counter
	exit
elif [ "$1" == "-synctex=1" ] && [ "$i" = 1 ]; then
	echo 2 > run-counter
	exit
elif [ "$1" == "-synctex=1" ] && [ "$i" = 2 ]; then
	i=3
	sweave=1
	if [ -f run-counter ]; then
		rm run-counter
	fi
	NAME=$(basename "${*: -1}")
	EXT="${NAME##*.}"
	if [ "$EXT" == "$NAME" ]; then
		EXT="Rnw"
	fi
	NAME="${NAME%.*}"
	if [ -n "$PHARMTEX_MODE" ]; then
		MODE="$PHARMTEX_MODE"
	else
		MODE="full"
	fi
else
	sweave=0
	if [ "$NAME" == "" ]; then
		NAME=$(basename "$1")
		MODE="$2"
	fi
	EXT="${NAME##*.}"
	if [ "$EXT" == "$NAME" ]; then
		if [ -e "$NAME.Rnw" ]; then
			EXT="Rnw"
		else
			EXT="tex"
		fi
	fi
	NAME="${NAME%.*}"
	
fi

# Load Texlive manager if requested and exit
if [ "$NAME" == "texpath" ]; then
	exit
fi

# Load Texlive manager if requested and exit
if [ "$NAME" == "texman" ]; then
	tlshell
	exit
fi

# Choose batch mode if no mode set
if [ -z "$MODE" ]; then
	MODE=batch
fi

# If .tex file does not exist, exit
if [ ! -e "$NAME.$EXT" ]; then
	echo "Input file $NAME.$EXT does not exist, exiting..."
	sleep 1
	exit
fi

# Load MiKTeX Tool if gui mode
if [ "$MODE" == "gui" ]; then
	texstudio "$NAME.$EXT"
else
	perl $PHARMTEXDIR/runlatex.pl "$NAME.$EXT" "$MODE"
fi

# Clean up
if [ -e jabref.xml ] && [ -d "$LDIR/jabref" ]; then
	mv jabref.xml "$LDIR/jabref/jabref.xml"
elif [ -e jabref.xml ]; then
	rm jabref.xml
fi
if [ -e dodel.txt ]; then
	rm dodel.txt
	if [ -e "$NAME.pdf" ]; then
		rm "$NAME.pdf"
	fi
fi
PATH="$OLDPATH"; export PATH
MANPATH="OLDMANPATH"; export MANPATH
INFOPATH="OLDINFOPATH"; export INFOPATH
