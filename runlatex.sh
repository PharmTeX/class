#!/bin/bash
# PharmTeX Linux start script, part of the PharmTeX platform.
# Copyright (C) 2021 Christian Hove Claussen (contact@pharmtex.org).
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

# Check for name, extension, and mode
if [ "$NAME" == "" ]; then
	NAME=$(basename "$1")
	MODE="$2"
fi
EXT="${NAME##*.}"
if [ "$EXT" == "$NAME" ]; then
	EXT="tex"
fi
NAME="${NAME%.*}"

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
