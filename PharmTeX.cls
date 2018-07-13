%%% PharmTeX class, part of the PharmTeX platform.
%%% Copyright (C) 2018 Christian Hove Rasmussen (contact@pharmtex.org).
%%% This program is free software: You can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of the GNU Affero General Public License along with this program (see file named LICENSE). If not, see <https://www.gnu.org/licenses/>.
\def\pharmtexdate{2018/07/13}
\def\pharmtexversion{1.7}

%%% Define PharmTeX Class for LaTeX
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PharmTeX}[\pharmtexdate\space v\pharmtexversion\space PharmTeX Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Apply user options (for \documentclass[options]{PharmTeX})
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Option to show appendix
\newif\ifappendix\appendixtrue
\newif\ifcappendix\cappendixfalse
\DeclareOption{appendix}{\appendixtrue\cappendixtrue}
\DeclareOption{noappendix}{\appendixfalse\cappendixtrue}

%%% Option to show cover page
\newif\ifcoverpage\coverpagetrue
\newif\ifccoverpage\ccoverpagefalse
\DeclareOption{nocoverpage}{\coverpagefalse\ccoverpagetrue}
\DeclareOption{coverpage}{\coverpagetrue\ccoverpagetrue}

%%% Option to show QA page
\newif\ifqapage\qapagetrue
\newif\ifcqapage\cqapagefalse
\DeclareOption{noqapage}{\qapagefalse\cqapagetrue}
\DeclareOption{qapage}{\qapagetrue\cqapagetrue}

%%% Option to show TOC
\newif\iftoc\toctrue
\newif\ifctoc\ctocfalse
\DeclareOption{toc}{\toctrue\ctoctrue}
\DeclareOption{notoc}{\tocfalse\ctoctrue}

%%% Option to show LOF
\newif\iflof\loftrue
\newif\ifclof\cloffalse
\DeclareOption{nolof}{\loffalse\cloftrue}
\DeclareOption{lof}{\loftrue\cloftrue}

%%% Option to show LOT
\newif\iflot\lottrue
\newif\ifclot\clotfalse
\DeclareOption{nolot}{\lotfalse\clottrue}
\DeclareOption{lot}{\lottrue\clottrue}

%%% Option to show glossary
\newif\ifglossary\glossarytrue
\newif\ifcglossary\cglossaryfalse
\DeclareOption{noglossary}{\glossaryfalse\cglossarytrue}
\DeclareOption{glossary}{\glossarytrue\cglossarytrue}

%%% Option to synopsis
\newif\ifsynopsis\synopsistrue
\newif\ifcsynopsis\csynopsisfalse
\DeclareOption{nosynopsis}{\synopsisfalse\csynopsistrue}
\DeclareOption{synopsis}{\synopsistrue\csynopsistrue}

%%% Option to signature page
\newif\ifsigpage\sigpagetrue
\newif\ifcsigpage\csigpagefalse
\DeclareOption{nosigpage}{\sigpagefalse\csigpagetrue}
\DeclareOption{sigpage}{\sigpagetrue\csigpagetrue}

%%% Option allow same page hyperlinks
\newif\ifsamepagelinks\samepagelinksfalse
\newif\ifcsamepagelinks\csamepagelinksfalse
\DeclareOption{nosamepagelinks}{\samepagelinksfalse\csamepagelinkstrue}
\DeclareOption{samepagelinks}{\samepagelinkstrue\csamepagelinkstrue}

%%% Option to show glossary hyperlinks
\newif\ifglosshyper\glosshyperfalse
\newif\ifcglosshyper\cglosshyperfalse
\DeclareOption{noglosshyper}{\glosshyperfalse\cglosshypertrue}
\DeclareOption{glosshyper}{\glosshypertrue\cglosshypertrue}

%%% Option to show web hyperlink
\newif\ifwebhyper\webhyperfalse
\newif\ifcwebhyper\cwebhyperfalse
\DeclareOption{nowebhyper}{\webhyperfalse\cwebhypertrue}
\DeclareOption{webhyper}{\webhypertrue\cwebhypertrue}

%%% Option to show item IDs
\newif\ifitemid\itemidtrue
\newif\ifcitemid\citemidfalse
\DeclareOption{noitemid}{\itemidfalse\citemidtrue}
\DeclareOption{itemid}{\itemidtrue\citemidtrue}

%%% Option to item number hyperlinks
\newif\ifitemhyper\itemhypertrue
\newif\ifcitemhyper\citemhyperfalse
\DeclareOption{noitemhyper}{\itemhyperfalse\citemhypertrue}
\DeclareOption{itemhyper}{\itemhypertrue\citemhypertrue}

%%% Option to show artifact IDs
\newif\ifartifactid\artifactidtrue
\newif\ifcartifactid\cartifactidfalse
\DeclareOption{noartifactid}{\artifactidfalse\cartifactidtrue}
\DeclareOption{artifactid}{\artifactidtrue\cartifactidtrue}

%%% Option to show artifact ID hyperlinks
\newif\ifartihyper\artihyperfalse
\newif\ifcartihyper\cartihyperfalse
\DeclareOption{noartihyper}{\artihyperfalse\cartihypertrue}
\DeclareOption{artihyper}{\artihypertrue\cartihypertrue}

%%% Option for draftmode
\newif\ifdraftmode\IfFileExists{batch.txt}{\draftmodefalse}{\draftmodetrue}
\newif\ifcdraftmode\cdraftmodefalse
\DeclareOption{nodraftmode}{\draftmodefalse\cdraftmodetrue}
\DeclareOption{draftmode}{\draftmodetrue\cdraftmodetrue}

%%% Option for fasttmode
\newif\iffast\fastfalse
\newif\ifcfast\cfastfalse
\DeclareOption{nofast}{\fastfalse\cfasttrue}
\DeclareOption{fast}{\fasttrue\cfasttrue}

%%% Option for synopsis only mode
\newif\ifsynonly\synonlyfalse
\newif\ifcsynonly\csynonlyfalse
\DeclareOption{nosynonly}{\synonlyfalse\csynonlytrue}
\DeclareOption{synonly}{\synonlytrue\csynonlytrue}

%%% Option to put watermark on all pages
\newif\ifwatermark\watermarktrue
\newif\ifcwatermark\cwatermarkfalse
\DeclareOption{nowatermark}{\watermarkfalse\cwatermarktrue}
\DeclareOption{watermark}{\watermarktrue\cwatermarktrue}

%%% Option to exclude logo
\newif\iflogo\logotrue
\newif\ifclogo\clogofalse
\DeclareOption{nologo}{\logofalse\clogotrue}
\DeclareOption{logo}{\logotrue\clogotrue}

%%% Option to exclude external PDF documents
\newif\ifexpdf\expdftrue
\newif\ifcexpdf\cexpdffalse
\DeclareOption{noexpdf}{\expdffalse\cexpdftrue}
\DeclareOption{expdf}{\expdftrue\cexpdftrue}

%%% Option to put figure captions below the figure
\newif\iffigcapbelow\figcapbelowfalse
\newif\ifcfigcapbelow\cfigcapbelowfalse
\DeclareOption{nofigcapbelow}{\figcapbelowfalse\cfigcapbelowtrue}
\DeclareOption{figcapbelow}{\figcapbelowtrue\cfigcapbelowtrue}

%%% Option to select paper size.
\newlength{\PmxTopBase}\setlength{\PmxTopBase}{2.54 cm}
\newlength{\PmxBottomBase}\setlength{\PmxBottomBase}{2.54 cm}
\newlength{\PmxLeftBase}\setlength{\PmxLeftBase}{3.175 cm}
\newlength{\PmxRightBase}\setlength{\PmxRightBase}{2.54 cm}
\newlength{\PmxHeadBase}\setlength{\PmxHeadBase}{0.25 cm}
\newlength{\PmxFootBase}\setlength{\PmxFootBase}{1 cm}
\newlength{\PmxTop}\setlength{\PmxTop}{2.54 cm}
\newlength{\PmxBottom}\setlength{\PmxBottom}{2.54 cm}
\newlength{\PmxLeft}\setlength{\PmxLeft}{3.175 cm}
\newlength{\PmxRight}\setlength{\PmxRight}{2.54 cm}
\newlength{\PmxHead}\setlength{\PmxHead}{0.25 cm}
\newlength{\PmxFoot}\setlength{\PmxFoot}{1 cm}
\newcommand{\pmxtop}[1]{\setlength{\PmxTop}{#1}\geometry{top = \PmxTop}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}}
\newcommand{\pmxbottom}[1]{\setlength{\PmxBottom}{#1}\geometry{nottom = \PmxBottom}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}}
\newcommand{\pmxleft}[1]{\setlength{\PmxLeft}{#1}\geometry{left = \PmxLeft}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}}
\newcommand{\pmxright}[1]{\setlength{\PmxRight}{#1}\geometry{right = \PmxRight}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}}
\newcommand{\pmxhead}[1]{\setlength{\PmxHead}{#1}\geometry{headsep = \PmxHead}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}}
\newcommand{\pmxfoot}[1]{\setlength{\PmxFoot}{#1}\geometry{footskip = \PmxFoot}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}}
\newcommand{\mypaper}{a4paper}
\newif\ifisopaper\isopaperfalse
\newif\ifletterpaper\letterpaperfalse
\DeclareOption*{isopaper}{
  \PassOptionsToClass{\CurrentOption}{article}
  \renewcommand{\mypaper}{a4paper}
  \PassOptionsToPackage{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, headheight = 1.75 cm,  headsep = \PmxHead, footskip = \PmxFoot}{geometry}
  \letterpaperfalse\isopapertrue
}
\DeclareOption{letterpaper}{
  \PassOptionsToClass{\CurrentOption}{article}
  \renewcommand{\mypaper}{letterpaper}
  \PassOptionsToPackage{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, headheight = 1.75 cm,  headsep = \PmxHead, footskip = \PmxFoot}{geometry}
  \letterpapertrue\isopaperfalse
}
\ExecuteOptions{isopaper}

%%% Suppress errors about certain symbols
\PassOptionsToPackage{warn}{textcomp}

%%% Load user options
\newread\useroptionsfile
\openin\useroptionsfile=useroptions.txt
\read\useroptionsfile to \useroptions
\closein\useroptionsfile
\useroptions

%%% Transfer options to main class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[12pt,\mypaper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Change some settings after option processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Settings for watermarks
\newcommand{\Watermark}{}
\newcommand{\WatermarkOpacity}{0.2}
\newcommand{\WatermarkScale}{4.5}
\newcommand{\watermark}[1]{\renewcommand{\Watermark}{#1}\ifdraftmode\renewcommand{\Watermark}{Draft}\fi}
\newcommand{\watermarkopacity}[1]{\renewcommand{\WatermarkOpacity}{#1}}
\newcommand{\watermarkscale}[1]{\pgfmathsetmacro{\WatermarkScale}{#1*4.5}}

%%% Settings for synopsis only mode
\ifsynonly
	\ifcsigpage\else\sigpagefalse\fi
	\ifctoc\else\tocfalse\fi
	\ifclot\else\lotfalse\fi
	\ifclof\else\loffalse\fi
\fi

%%% Settings for draftmode
\ifdraftmode
	\renewcommand{\Watermark}{Draft}
	\ifcwatermark\else\watermarktrue\fi
	\ifcglosshyper\else\glosshypertrue\fi
	\ifcwebhyper\else\webhypertrue\fi
	\ifcitemhyper\else\itemhypertrue\fi
	\ifcartihyper\else\artihypertrue\fi
	\ifcsamepagelinks\else\samepagelinkstrue\fi
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Include packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[utf8]{inputenc}
\usepackage[extendedchars]{grffile}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}
\usepackage[table]{xcolor}
\usepackage{geometry, afterpage, etoolbox}
\usepackage[nomessages]{fp}
\usepackage{changepage, amsmath, parskip, sectsty, color, setspace, pdfpages}
\usepackage[nooneline, font={small,bf}]{caption}
\usepackage{listings} % or listingsutf8, but it seems to be buggy
\usepackage[figure,table,lstlisting]{totalcount}
\usepackage[hhmmss]{datetime}
\usepackage[pagewise]{lineno}
\usepackage{afterpage, currfile, graphicx, xspace, enumitem}
\usepackage[absolute]{textpos}
\usepackage{calc, lipsum, fancyhdr}
\usepackage[square, comma, numbers, sort&compress]{natbib}
\usepackage{lastpage, textcomp, tocvsec2}
\usepackage[titles]{tocloft}
\usepackage[compact,bf,explicit]{titlesec}
\usepackage{expl3}
\usepackage{regexpatch}
\usepackage[hang, flushmargin]{footmisc}
\usepackage[bookmarksnumbered, pdftex]{hyperref}
\usepackage[open,openlevel=1]{bookmark}
\usepackage[nameinlink, capitalise, noabbrev]{cleveref}
\usepackage{needspace, refcount}
\usepackage{mathptmx, helvet, courier}
\usepackage{threeparttablex, booktabs, longtable, tabularx, ltablex, multirow, nameref, pdflscape}
\usepackage[originalparameters, document]{ragged2e}
\usepackage{bigstrut, here, float, rotating, subcaption, appendix, upquote, chngcntr}
\usepackage{printlen, upgreek, csvsimple, pbox, arrayjobx, xstring, pgf, ifthen, pax, filecontents, ifplatform}
\usepackage{verbatim, newfile, totcount, framed, alltt}
\usepackage{tikz}
\usetikzlibrary{positioning}
\usetikzlibrary{shapes.misc}
\usetikzlibrary{calc}

%%% Packages needed for glossaries package - glossaries is loaded in PharmTeX.sty to allow for pre-compilation of PharmTeX.cls
\usepackage{mfirstuc, textcase, xfor, datatool-base, substr, datatool-fp}

%%% Package for checking page design, showing boxes etc.
%\usepackage{layouts}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Custom commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Settings for webhyper
% see bottom of this document

\AtBeginEnvironment{align}{\nl}

%%% Set date format
\def\today{\two@digits{\the\day}~\ifcase\month\or JAN\or FEB\or MAR\or APR\or MAY\or JUN\or JUL\or AUG\or SEP\or OCT\or NOV\or DEC\fi~\number\year}

%%% Settings for artifactid
\newcommand{\aid}{}
\newcommand{\afid}{}
\ifartihyper
\newcommand{\artiref}[1]{#1\xspace} % change this line to add a hyperlink using \href
\newcommand{\folderref}[1]{#1\xspace} % change this line to add a hyperlink using \href
\else
\newcommand{\artiref}[1]{#1\xspace}
\newcommand{\folderref}[1]{#1\xspace}
\fi
\ifartifactid
\newcommand{\artifactid}[1]{Artifact ID \artiref{#1}\xspace}
\else
\newcommand{\artifactid}[1]{Artifact ID (omitted)\xspace}
\renewcommand{\artiref}[1]{(omitted)\xspace}
\renewcommand{\folderref}[1]{(omitted)\xspace}
\artifactlistfalse
\fi

%%% Settings for itemid
\ifitemhyper
\newcommand{\itemref}{\hyperlink{itemnumberlist\theitemnumber}{Item \theitemnumber}}
\newcommand{\itemreref}[1]{\hyperlink{itemnumber#1}{Item #1}}
\else
\newcommand{\itemref}{Item \theitemnumber}
\newcommand{\itemreref}[1]{Item #1}
\fi
\newcommand{\ioutput}{0}
\newcommand{\itemid}[1]{}
\ifitemid
\renewcommand{\itemid}[1]{\ifnum\ioutput=1\renewcommand{\ioutput}{0}\raisebox{3cm}[0pt][0pt]{\hypertarget{itemnumber\theitemnumber}{}}\itemref\xspace\else\raisebox{3cm}[0pt][0pt]{\hypertarget{itemnumber\theitemnumber}{}}\itemref, Artifact ID \artiref{#1}\fi}
\else
\renewcommand{\itemid}[1]{\ifnum\ioutput=1 Item ID omitted\xspace\else{}Item ID omitted, Artifact ID omitted\xspace\fi}
\renewcommand{\artiref}[1]{(omitted)\xspace}
\renewcommand{\folderref}[1]{(omitted)\xspace}
\fi

%%% Lengths
\newlength\maxwidth\newlength\maxheight
\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}

%%% Create string to store artifact IDs.
%%% The \findartifacts perl command determines in the first input from \pmxXXXXX is a filepath or an artifact.
%%% The \checkartifact latex command adds the artifact ID, if present, to a list of items to be fetched. It also creates latex variables, including \fname for the given artifact containing the full name of the artifact filename, e.g. RAXXXXXXXX_xxxxx.xxx, that is then used for e.g. the \includegraphics command.
\newcounter{noartifacts}
\newcommand{\noextname}{}
\newcommand{\fname}{}
\newcounter{itemnumber}
\newcommand{\rfiles}{myveryuniqueseparator}
\newcommand{\itemartifact}{}
\newcommand{\itemrfile}{}
\newcommand{\curitem}{}
\newcommand{\artifacts}{}
\newcommand{\missingartifacts}{}
\newcommand{\missingrfiles}{}
% \perlnewcommand{\findartifact}[1]{
%%% Note that the % symbols are required to be there, since otherwise a few of the commands using the \checkartifact command will have issues with line spacing
\newcommand\additemrfile{\edef\exptmp{\theitemnumber}\expandafter\g@addto@macro\expandafter\itemrfile\expandafter{\expandafter;\exptmp}}
\newcommand\additemartifact{\edef\exptmp{\theitemnumber}\expandafter\g@addto@macro\expandafter\itemartifact\expandafter{\expandafter;\exptmp}}
\newcommand{\checkartifact}[1]{%
\findartifact{#1}%
\addtocounter{itemnumber}{1}%
\ifnum\ioutput=1%
\additemrfile%
\iffast\let\fname\empty\fi%
\filename@parse{\fname}%
\edef\fbase{\filename@base}%
\edef\fext{\filename@ext}%
\g@addto@macro\rfiles{myveryuniqueseparator#1}%
\ifx\fname\empty\g@addto@macro\missingrfiles{myveryuniqueseparator#1}\fi%
\else%
\additemartifact%
\ifx\fname\empty%
\edef\fbase{}%
\edef\fext{}%
\g@addto@macro\missingartifacts{#1,}%
\g@addto@macro\artifacts{#1,}%
\addtocounter{noartifacts}{1}%
\else%
\iffast\let\fname\empty\fi%
\filename@parse{\fname}%
\edef\fbase{\filename@base}%
\edef\fext{\filename@ext}%
\g@addto@macro\artifacts{#1,}%
\addtocounter{noartifacts}{1}%
\fi%
\fi%
}%

%%% Other commands
\newcommand{\x}{\;\!} % implicit multiplier for equations. Put in a small space.
\newcommand{\tild}{\string~\xspace} % tilde in text
\newcommand{\regtm}{\textsuperscript{\textregistered}\xspace} % registered trademark
\newcommand{\nt}{\noindent} % do not indent the first line after an empty line in the .tex file
\newcommand{\nl}{\vspace{-0.9\baselineskip}} % skip back approximately one line, used just before a new equation
\newcommand{\nn}{\nonumber} % skip the equation number for a given equation.
\newcommand{\ee}[1]{\cdot 10^{#1}} % *10^ scientific format in pretty print
\newcommand{\degree}{^\circ} % degree symbyl
\newcommand{\s}[1]{_\text{\:\!#1}} % subscript with non-italics in math mode
\newcommand{\diff}[2]{\frac{\text{d} #1}{\text{d} #2}} % d{someting}/d{something else}
\newcommand{\pdfpages}[1]{\pdfximage{#1}\edef\numberofpages{\the\pdflastximagepages}} % comment out if switching to xelatex. Counts the number of pages in a PDF file.
\newcommand{\figlabel}[2]{\hypertarget{#2}{}\caption{#1}\label{#2}\addtocontents{lof}{\protect{\bookmark[rellevel=1,keeplevel,dest=#2]{\figurename~\thefigure. #1}}}} % command for creating a figure label that also adds itself to the List of Figures entry in the top of the PDF bookmarks.
\newcommand{\figlabelpl}[2]{\hypertarget{#2}{}\caption{#1}\label[plfigure]{#2}\addtocontents{lof}{\protect{\bookmark[rellevel=1,keeplevel,dest=#2]{\figurename~\thefigure. #1}}}}
\newcommand{\tablabel}[2]{\caption{#1}\label{#2}\raisebox{\ht\strutbox}{\hypertarget{#2}{}}\addtocontents{lot}{\protect{\bookmark[rellevel=1,keeplevel,dest=#2]{\tablename~\thetable. #1}}}} % command for creating a table label that also adds itself to the List of Figures entry in the top of the PDF bookmarkss.
\newcommand{\back}{\textbackslash\xspace} % prints backslash
\newcommand{\matlab}{MATLAB\regtm} % MATLAB
\newcommand{\nonmem}{NONMEM\regtm} % NONMEM
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}} % used with DRM (Dose Rationale Memo) document
\newcommand{\tab}[1]{\hspace{2.5cm}\rlap{#1}} % used with DRM (Dose Rationale Memo) document
\newcommand{\tablefont}{\footnotesize} % default fontsize for tables
\newcommand{\listingfont}{\scriptsize} % default fontsize for listings
\newcommand{\dotight}{0} % flag for make a table look tighter, i.e. with less whitespace
\newcommand{\pmxtight}{\renewcommand{\dotight}{1}} % command for setting the \dotight flag
\newcommand{\allowchangefont}{1} % change to 0 to disable font changing option (\tablefont) for main body - will then only work in appendices.
\newcommand{\pmxfont}[1]{\ifnum\allowchangefont=1 \renewcommand{\tablefont}{#1} \renewcommand{\listingfont}{#1} \fi} % command for changing the tablefont and listingfont
\newcommand{\pmxtoprule}{\toprule} % default toprule for tables (horizontal line). Apparently the commands interact in different ways with the tabularx environment.
\newcommand{\pmxmidrule}{\toprule} % default midrule for tables (horizontal line). Apparently the commands interact in different ways with the tabularx environment.
\newcommand{\pmxbottomrule}{\bottomrule} % default bottomrule for tables (horizontal line). Apparently the commands interact in different ways with the tabularx environment.
\newoutputstream{tmp}\newcommand{\savefile}[2]{\openoutputfile{#1}{tmp}\addtostream{tmp}{#2}\closeoutputstream{tmp}}
\newcommand{\hyperoff}[1]{\begin{NoHyper}#1\end{NoHyper}} % command for turning off a specific hyperlink for a \cref command

%%% Spacing in enumerate and itemize. Can also be changed in each list using [noitemsep] etc.
\setlist{noitemsep}

%%% Include .tex doc from another run
%%% This is used for socalled daughter steps where another LatexReport step can be loaded into the present one. All code between \begin{document} and \references is included in the spot where the \pmxinclude command is put in the mother document. It will download the daughter .tex document and print a file called "dotwice" telling runlatex.bat to compile latex an extra time and include any artifacts from the daughter document.
\newcommand{\includetexdoc}{}
% \perlnewcommand{\dotwice}{
\newcommand{\pmxinclude}[1]{
\checkartifact{#1}
\ifx\fname\empty
ITEM #1 NOT FOUND
\else
\hypertarget{itemnumber\theitemnumber}{}
\includetex{\fname}
\fi
}

%%% Include a text file from a run.
%%% This command can e.g. load a text file created by an R run containing an important number that will then be put into the spot where the \pmxinput is used. If the artifact is found a \footnote will be created showing the artifact ID.
% \perlnewcommand{\inputtext}[1]{
\newcommand{\pmxinput}[1]{%
\checkartifact{#1}%
\ifx\fname\empty%
ITEM #1 NOT FOUND%
\else%
\hypertarget{itemnumber\theitemnumber}{}
\inputtext{\fname}%
\fi%
}%

%%% General settings for tables.
%\setlength{\extrarowheight}{10pt} % option for added extra row height in a table. NOT USED.
\def\arraystretch{1.2} % stretches the table a bit to allow for more whitespace.
%\setlength\parindent{0pt} % reduce whitespace on edges of table. NOT USED.
\keepXColumns % setting required for the tabularx and longtable packages.
\newcolumntype{L}[1]{>{\hsize=#1\hsize\raggedright\arraybackslash}X} % left justified column, sharing column space according to the coefficient #1
\newcolumntype{R}[1]{>{\hsize=#1\hsize\raggedleft\arraybackslash}X} % right justified column, sharing column space according to the coefficient #1
\newcolumntype{C}[1]{>{\hsize=#1\hsize\centering\arraybackslash}X} % center justified column, sharing column space according to the coefficient #1
% the next 3 lines holds code used for inputting a specified length measurement, e.g. 1.3cm. Not actually used, since perl code in \pmxtable and \pmxtextable will detect the presence of units for e.g. L{1.3cm} and replace with O{1.3cm}.
\newcolumntype{O}[1]{>{\raggedright\arraybackslash}p{#1}} % used for \pmxtable and \pmxtextable as described above.
\newcolumntype{P}[1]{>{\raggedleft\arraybackslash}p{#1}} % used for \pmxtable and \pmxtextable as described above.
\newcolumntype{Q}[1]{>{\centering\arraybackslash}p{#1}} % used for \pmxtable and \pmxtextable as described above.
\def\hlinewd#1{\noalign{\ifnum0=`}\fi\hrule \@height #1\futurelet\reserved@a\@xhline} % creates extra thick horizontal line for first and last rows. Used only with tables that have vertical separation lines, e.g. {|C|C|C|} in the table column specifier. Handled by perl code in \pmxtable and \pmxtextable.
\newcolumntype{$}{>{\global\let\currentrowstyle\relax}} % probably not used, but may be needed for tabularx
\newcolumntype{^}{>{\currentrowstyle}} % probably not used, but may be needed for tabularx
\newcommand{\rowstyle}[1]{\gdef\currentrowstyle{#1}% may be needed for tabularx
  #1\ignorespaces
}
\setlength{\LTleft}{0pt} % fills out longtables (used for glossary and List of Items) to fill the full page width
\setlength{\LTright}{0pt} % fills out longtables to fill the full page width

%%% Turn off badness 10000 warning
\hbadness=10000
\vbadness=10000

%%% Set threshold for overfull hbox
%\hfuzz=5pt
%\newcount\hbadness
%\newdimen\hfuzz

%%% Tablenotes. These are local notes within a given table that reset their alpha counter (a, b, c, etc.) for each new table.
\newcounter{tnote}
\newcounter{tnoteglobal}
\crefname{tnote}{Tablenote}{Tablenotes}
\renewcommand{\thetnote}{$^\text{\alph{tnote}}$}
\renewcommand{\tnote}[2]{\raisebox{\ht\strutbox}{\hypertarget{#1}{}}\refstepcounter{tnote}\thetnote#2\label{#1}}
\newcommand{\tref}[1]{\ref*{#1}} % Disables hyperlinks within tables
%\newcommand{\tref}[1]{\nref{#1}} % Enables hyperlinks within tables. But the hyperlinks in header doesn't always respect nosamepagelinks due to the setup of package longtable/tabularx (firsthead and lasthead are compiled on first and second page only, respectively, not on every page). Thus, hyperlinks are disabled for \tnote. They still work for a \cref to a \tnote.
\newcommand{\tablenote}{} % compatibility with earlier versions of the template

%%% Function for making tables from csv file
%%% This is the most complex perl code in this file. When debugging or just working to understand it, it is recommended to print out various variables into a text file at critical stages using the following code:
% open(FILE, ">debug.txt");
% print FILE "$somevariable or @somearray";
% close(FILE);
\newcommand{\dodescription}{0}
\newcommand{\isinlinetable}{}
\newcommand{\mytabledescription}{}
\newcommand{\mytableitemnumber}{}
\newcommand{\syntab}{0}
\newcommand{\csvtable}{}
% \perlnewcommand{\includecsv}[8]{
% start of actual \pmxtable command using \includecsv. RETAIN empty lines in the beginning and end of \pmxtable to make sure line spacing before and after tables is correct.
\newcommand{\tmpsubstnote}{}
\newcommand{\pmxtable}[8][1]{

\renewcommand{\dodescription}{0}
\renewcommand{\isinlinetable}{0}
\renewcommand{\syntab}{1}
\renewcommand{\csvtable}{}
\renewcommand{\tmpsubstnote}{}
\renewcommand{\pmxtoprule}{\toprule}
\renewcommand{\pmxmidrule}{\toprule}
\renewcommand{\pmxbottomrule}{\bottomrule}
\setcounter{tnote}{0}
\checkartifact{#2}
\tablefont
\ifx\fname\empty
\begin{tabularx}{\maxwidth}{C{1}} \tablabel{#6}{#5}
	\\\toprule
	 ITEM #2 NOT FOUND \\\midrule\endfirsthead\caption[]{#6}\\\toprule
	 ITEM #2 NOT FOUND \\\midrule\endhead
	\endfoot\bottomrule\endlastfoot
\end{tabularx}
\else
\fixnewline{\detokenize{#7}}
\renewcommand{\mytableitemnumber}{\itemid{#2}}
\ifitemid{}\renewcommand{\dodescription}{1}\fi\ifthenelse{\equal{\detokenize{#7}}{}}{}{\renewcommand{\dodescription}{1}}
\includecsv{#1}{\fname}{#3}{#4}{#5}{#6}{\detokenize{#8}}{\dotight}{0}
\csvtable
\vspace{-1.3\baselineskip}
% \footnotesize
% \vspace{-1.8\baselineskip}
% \ifitemid{}\itemid{#2}\tmpsubstnote\fi\ifthenelse{\equal{\detokenize{#7}}{}}{}{\xspace#7}
\normalsize
\renewcommand{\tablefont}{\footnotesize}
\renewcommand{\listingfont}{\scriptsize}
\renewcommand{\dotight}{0}
\fi

}

%%% Function for making tables from a tex file
%%% RETAIN empty lines in the beginning and end of \pmxtextable to make sure line spacing before and after tables is correct.
\newcounter{textable}\setcounter{textable}{0}
\newcommand{\pmxtextable}[6][1]{

\renewcommand{\dodescription}{0}
\renewcommand{\isinlinetable}{1}
\renewcommand{\syntab}{1}
\renewcommand{\csvtable}{}
\renewcommand{\tmpsubstnote}{}
\renewcommand{\pmxtoprule}{\toprule}
\renewcommand{\pmxmidrule}{\toprule}
\renewcommand{\pmxbottomrule}{\bottomrule}
\setcounter{tnote}{0}
\addtocounter{textable}{1}

%% Load via printed file.
\savefile{file.tmp.txt}{\detokenize{#6}}
\tablefont
\fixnewline{\detokenize{#5}}
\renewcommand{\mytableitemnumber}{\itemid{#2}}
\ifitemid{}\renewcommand{\dodescription}{1}\fi\ifthenelse{\equal{\detokenize{#5}}{}}{}{\renewcommand{\dodescription}{1}}
\includecsv{#1}{file.tmp.txt}{tex}{#2}{#3}{#4}{}{\dotight}{1}
\csvtable

\vspace{-1.3\baselineskip}
% \footnotesize
% \vspace{-1.8\baselineskip}
% \ifitemid{}Inline table\tmpsubstnote\fi\ifthenelse{\equal{\detokenize{#5}}{}}{}{\xspace#5}
\normalsize
\renewcommand{\tablefont}{\footnotesize}
\renewcommand{\listingfont}{\scriptsize}
\renewcommand{\dotight}{0}

}

%%% List of Items. This code below, including the perl code, creates the latex code for the list of items table. It is a longtable instead of a tabularx.
\newcommand{\itemlistname}{LIST OF ITEMS}
\newcommand{\artipagecmd}{
\begin{tikzpicture}[remember picture,overlay]
	\node[rotate = 0] at ([xshift=10.3cm,yshift=5.51cm]current page.center) {\textbf{\normalsize{\itemlistname}}};
\end{tikzpicture}
}
\newcommand{\mysp}{\phantom{...}}
% \perlnewcommand{\includemetacsv}[3]{

\newcommand{\itemlist}{

\ifqapage
\ifdefined\QAPage
\ifthenelse{\equal{\QAPage}{}}{}{
\ifx\fname\empty\else
\checkartifact{\QAPage}
\fi
}
\fi
\fi

% Clear last comma or separator in lists of items created by this template
\StrGobbleRight{\artifacts}{1}[\artifacts]
\StrGobbleRight{\missingartifacts}{1}[\missingartifacts]
\StrGobbleLeft{\rfiles}{21}[\rfiles]
\StrGobbleLeft{\missingrfiles}{21}[\missingrfiles]
\StrGobbleLeft{\itemartifact}{1}[\itemartifact]
\StrGobbleLeft{\itemrfile}{1}[\itemrfile]

\newcommand{\docsvtable}{0}
\ifx\rfiles\empty\ifx\artifacts\empty\else\renewcommand{\docsvtable}{1}\fi\else\renewcommand{\docsvtable}{1}\fi

\ifitemid\ifnum\docsvtable=0\else
\renewcommand{\csvtable}{}
%\begin{landscape}
\section*{\itemlistname}
\phantomsection
\hypertarget{itemlisttarget}{}
\label{itemlist}
\addtocontents{toc}{\@backslashchar contentsline {section}{\itemlistname}{\@backslashchar pageref{itemlist}}{itemlisttarget}}
\bookmark[level=1,dest=itemlisttarget,startatroot]{\itemlistname}
\scriptsize
\setlength\LTcapwidth{\maxwidth} % default: 4in
\setlength\LTleft{0pt}           % default: \parindent
\setlength\LTright{0pt}          % default: \fill
\includemetacsv{\artifacts}{\rfiles}{\theitemnumber}{\itemartifact}{\itemrfile}
\csvtable
%\end{landscape}
\fi\fi
\normalsize

% Insert QA page
\newcommand{\qabookmark}{}
\ifqapage
\ifdefined\QAPage

\clearpage
\phantomsection
\hypertarget{qapagetarget}{}
\label{qapage}
\addtocontents{toc}{\@backslashchar contentsline {section}{QUALITY ASSURANCE STATEMENT}{\@backslashchar pageref{qapage}}{qapagetarget}}
\bookmark[level=1,dest=qapagetarget]{QUALITY ASSURANCE STATEMENT}

\ifthenelse{\equal{\QAPage}{}}{
\section*{QUALITY ASSURANCE STATEMENT}
}{
\ifx\fname\empty
\clearpage
\hypertarget{itemnumber\theitemnumber}{}
ITEM \QAPage{} NOT FOUND
\else
% \immediate\write18{paxify tmpqapage.pdf}
% \IfFileExists{tmpqapage.pdf}{}{\immediate\write18{\gscmd\space -dSAFER -dBATCH -dNOPAUSE -dNOCACHE -sDEVICE=pdfwrite -dFirstPage=\QAPageNo\space -dLastPage=\QAPageNo\space -sOutputFile="tmpqapage.pdf" \fname}}
% \IfFileExists{\fbase.pax}{}{}
\includepdf[pages=\QAPageNo, pagecommand={
\thispagestyle{empty}
\hypertarget{itemnumber\theitemnumber}{}
% \blfootnote{\itemid{\QAPage}}
\ifwatermark
\begin{tikzpicture}[remember picture,overlay,opacity=\WatermarkOpacity,scale=\WatermarkScale,every node/.style={scale=\WatermarkScale}]
	\node[rotate = 45] at (current page.center) {\Huge{\Watermark}};
\end{tikzpicture}
\fi
}
]{\fname}
% }]{tmpqapage.pdf}
\fi
}
\fi
\fi

}

%%% Include figures from image files. The code below creates the \pmxfigure command.
% Perl function for plotting PDF files with one or several page
\newcommand{\synfig}{0}
\newcommand{\tmpstr}{}
\newcommand{\figcapbelow}{0}
% \perlnewcommand{\makesubfigopt}[1]{
% \perlnewcommand{\makesubfig}[3]{
\newcommand{\issubfigure}{0}
% Create \pmxfigure command
\newcommand{\pmxfigure}[5]{

\renewcommand{\synfig}{1}
\begingroup
\renewcommand{\tmpstr}{}
\IfSubStr{#1}{&}{\renewcommand{\issubfigure}{1}}{\IfSubStr{#1}{|}{\renewcommand{\issubfigure}{1}}{\renewcommand{\issubfigure}{0}}}
\IfSubStr{\issubfigure}{1}{
\makesubfigopt{#5}
\iffigcapbelow\renewcommand{\figcapbelow}{1}\else\renewcommand{\figcapbelow}{0}\fi
\begin{figure}[H]
	\makesubfig{#1}{#2}{#3}{\figcapbelow}
	\iffigcapbelow\else\\[0.4\baselineskip]\fi % caption above
	\iffigcapbelow\quad\\[-0.4\baselineskip]\fi % caption below
	\footnotesize\ifthenelse{\equal{\detokenize{#4}}{}}{}{#4}
\end{figure}
\vspace{-0.8\baselineskip}
}{
\checkartifact{#1}
\ifx\fname\empty
\edef\numberofpages{1}
\else
\ifthenelse{\equal{\fext}{pdf}}{\pdfpages{\fname}}{\edef\numberofpages{1}}
\fi
\ifnum\numberofpages>1\renewcommand{\tmpstr}{ (1 of \numberofpages)}\else\renewcommand{\tmpstr}{}\fi
\begin{figure}[H]
	\iffigcapbelow\else\figlabel{#3\tmpstr}{#2}\fi % caption above
	\ifx\fname\empty ITEM #1 NOT FOUND \else \includegraphics[page=1,#5]{\fname} \fi
	\iffigcapbelow\figlabel{#3\tmpstr}{#2}\fi % caption below
	\ifnum\numberofpages=1
	\iffigcapbelow\else\\[0.4\baselineskip]\fi % caption above
	\iffigcapbelow\quad\\[-0.5\baselineskip]\fi % caption below
	\footnotesize\ifitemid{}\itemid{#1}.\fi\ifthenelse{\equal{\detokenize{#4}}{}}{}{\xspace#4~}\fi
\end{figure}
\vspace{-0.8\baselineskip}
\ifnum\numberofpages>1
%\clearpage
\foreach \x in {2,...,\numberofpages}{
\addtocounter{figure}{-1}
\begin{figure}[H]
	\iffigcapbelow\else\caption[]{#3 (\x{} of \numberofpages)}\fi % caption above
	\includegraphics[page=\x,#5]{\fname}
	\iffigcapbelow\caption[]{#3 (\x{} of \numberofpages)}\fi % caption below
	\ifnum\x=\numberofpages
	\iffigcapbelow\else\\[0.4\baselineskip]\fi % caption above
	\iffigcapbelow\quad\\[-0.5\baselineskip]\fi % caption below
	\footnotesize\ifitemid{}\itemid{#1}.\fi\ifthenelse{\equal{\detokenize{#4}}{}}{}{\xspace#4}\fi
\end{figure}
\vspace{-0.8\baselineskip}
\ifnum\x=\numberofpages\else\clearpage\fi}
\fi}
\endgroup

}

%%% Create \pmxtexfigure command
\newcommand{\pmxtexfigure}[4]{

\renewcommand{\synfig}{1}
\begingroup
\begin{figure}[H]
	\iffigcapbelow\else\figlabel{#2}{#1}\fi % caption above
	#4
	\iffigcapbelow\figlabel{#2}{#1}\fi % caption below
	\iffigcapbelow\else\\[0.4\baselineskip]\fi % caption below
	\iffigcapbelow\quad\\[-0.5\baselineskip]\fi % caption below
	\footnotesize\ifitemid{}Inline figure\tmpsubstnote\fi\ifthenelse{\equal{\detokenize{#3}}{}}{}{\xspace#3}
\end{figure}
\vspace{-0.8\baselineskip}
\endgroup

}

%%% Command for inserting listings (code) input, e.g. NONMEM, in document
% \perlnewcommand{\printlstlisting}[1]{
\lstset{
	breaklines={true},
%	breakautoindent={false},
	breakindent={0pt},
%	autobreakindent={0pt},
	showlines={true},
	extendedchars={true},
%	inputencoding={utf8/latin1},
	showstringspaces={false},
	tabsize={4},
	mathescape={false},
	escapechar={},
	upquote={true},
	aboveskip={1\baselineskip},
	belowskip={0.5\baselineskip},
	columns={fixed},
	numbersep={3mm},
	numbers={left},
%	xleftmargin={6.0ex},
	numberstyle={\tiny},
	keywordstyle={\color[rgb]{0,0,1}},
	commentstyle={\color[rgb]{0.133,0.545,0.133}},
	stringstyle={\color[rgb]{0.627,0.126,0.941}},
	frame=single,
	basicstyle={\small\ttfamily},
	language={[LaTeX]TeX},
	moretexcs={gls, newacronym, multirow, subsection, subsubsection, paragraph, subparagraph, cref, logo, refstyle, reffile, glsfile, docpdfname, headertext, footertext, doctype, doctitle, docdate, coverline, coverline, docauthor, coverpage, approverline, docapprover, signaturepage, synopsis, references, appendix, pmxfigure, pmxtable, pmxtextable, pmxpdf, pmxlisting, pmxinclude, pmxinput, perlnewcommand, add, newcommand, newline, Sexpr, pmxtexfigure, setatomsep, chemfig, color, schemestart, arrow, schemestop, Cref, cpageref, Cpageref, nref, glspl, Glspl, Gls, newglossaryentry, dfrac, itemlist, qapage, function, text}
}
\lstdefinelanguage{Nonmem}{alsoletter={...}, morekeywords={\$PROBLEM, \$INPUT, \$DATA, \$SUBROUTINES, \$PK, \$MODEL, \$DES, \$THETA, \$OMEGA, \$SIGMA, \$ERROR, \$COV, \$TABLE, \$ESTIMATION, \$COVARIANCE, \$EST, \$COV, \$SUBR, \$ERR, BLOCK, COMP, THETA, ETA, ERR, EPS, IF, THEN, ELSE, ENDIF}, comment=[l];, morecomment=[l]..., morestring=[m]'}[keywords, comments, strings]
\newcommand{\matlabfont}[1]{\matlabbasicfont{#1}\normalfont}
\newcommand{\dootherlang}{0}
\newcommand{\pmxlisting}[5]{

\renewcommand{\dootherlang}{0}
\phantom{X}
\checkartifact{#1}
\listingfont
\ifx\fname\empty
\printtmplisting{#1}
\lstinputlisting[numbers={none},caption={#4},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}
\else
\printlstlisting{\fname}
% RETAIN % symbols below, if not, line spacing will not behave properly
\IfStrEqCase{#2}{%
{nonmem}{\lstinputlisting[language={Nonmem},caption={#4},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{Nonmem}{\lstinputlisting[language={Nonmem},caption={#4},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{NONMEM}{\lstinputlisting[language={Nonmem},caption={#4},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{matlab}{\lstinputlisting[language={Matlab},caption={#4},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{MATLAB}{\lstinputlisting[language={Matlab},caption={#4},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{r}{\lstinputlisting[language={R},caption={#4},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{R}{\lstinputlisting[language={R},caption={#4},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{}{\lstinputlisting[language={Fortran},keywordstyle={\color[rgb]{0,0,0}},commentstyle={\color[rgb]{0,0,0}},stringstyle={\color[rgb]{0,0,0}},caption={#4},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
}[\renewcommand{\dootherlang}{1}]%
\ifnum\dootherlang=1 \lstinputlisting[language={#2},caption={#4},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}\fi
\fi
\footnotesize
\vspace{-1.2\baselineskip}
\ifitemid{}\itemid{#1}.\fi\ifthenelse{\equal{\detokenize{#5}}{}}{}{\xspace#5}
\normalsize
\renewcommand{\tablefont}{\footnotesize}
\renewcommand{\listingfont}{\scriptsize}

}

%%% Settings for including PDF files (whole pages).
%%% Perl code is used to parse out PDF bookmarks from the output of pdftk run on the external file.
%%% The latex package pax is used to transfer hyperlinks from external PDF.
\newcommand{\pdfmakeinclude}{}
\newcommand{\pdfmakebookmark}{}
\newcommand{\pdfmakecontents}{}
% \perlnewcommand{\pdfloadfile}[3]{

% Settings for global footer with page number
\newcommand{\xs}{0.33cm}
\newcommand{\xsl}{0.05cm}
\newcommand{\xal}{south}
\newcommand{\xta}{align=center}
\newcommand{\pdfmark}{
\thispagestyle{empty}
\begin{tikzpicture}[remember picture,overlay]
    \node[rotate = 0, align=\xta, anchor=\xal] at ([xshift=\xs+0.5\PmxLeft-0.5\PmxRight, yshift=0.73cm+\PmxBottom-\PmxBottomBase-\PmxFoot+\PmxFootBase]current page.south) {\footnotesize{\textbf{Main Page \thepage~of~\pageref*{LastPage}}}};
\end{tikzpicture}
\ifwatermark
\begin{tikzpicture}[remember picture,overlay,opacity=\WatermarkOpacity,scale=\WatermarkScale,every node/.style={scale=\WatermarkScale}]
	\node[rotate = 45] at (current page.center) {\Huge{\Watermark}};
\end{tikzpicture}
\fi
}
\newcommand{\pdflmark}{
\thispagestyle{empty}
\begin{tikzpicture}[remember picture,overlay]
    \node[rotate = 90, align=\xta, anchor=\xal] at ([xshift=-0.73cm-\PmxBottom+\PmxBottomBase+\PmxFoot-\PmxFootBase, yshift=\xsl+0.5\PmxLeft-0.5\PmxRight]current page.east) {\footnotesize{\textbf{Main Page \thepage~of~\pageref*{LastPage}}}};
\end{tikzpicture}
\ifwatermark
\begin{tikzpicture}[remember picture,overlay,opacity=\WatermarkOpacity,scale=\WatermarkScale,every node/.style={scale=\WatermarkScale}]
	\node[rotate = 135] at (current page.center) {\Huge{\Watermark}};
\end{tikzpicture}
\fi
}
% \perlnewcommand{\fixpax}[1]{
\newcommand{\pmxpdf}[5][]{
% #1 is page range - to be implemented if needed

\ifexpdf
\renewcommand{\pdfmakeinclude}{}
\renewcommand{\pdfmakebookmark}{}
\renewcommand{\pdfmakecontents}{}
\IfStrEqCase{#3}{
{l}{\renewcommand{\xs}{ \ifletterpaper -8.12cm\fi \ifisopaper -7.77cm\fi }\renewcommand{\xta}{left}\renewcommand{\xal}{west}}
{c}{\renewcommand{\xs}{0.00cm}\renewcommand{\xta}{center}\renewcommand{\xal}{center}}
{r}{\renewcommand{\xs}{ \ifletterpaper 8.12cm\fi \ifisopaper 7.77cm\fi }\renewcommand{\xta}{right}\renewcommand{\xal}{east}}
}
\IfStrEqCase{#3}{
{l}{\renewcommand{\xsl}{ \ifletterpaper -11.27cm\fi \ifisopaper -12.14cm\fi }\renewcommand{\xta}{left}\renewcommand{\xal}{west}}
{c}{\renewcommand{\xsl}{0.00cm}\renewcommand{\xta}{center}\renewcommand{\xal}{center}}
{r}{\renewcommand{\xsl}{ \ifletterpaper 11.27cm\fi \ifisopaper 12.14cm\fi }\renewcommand{\xta}{right}\renewcommand{\xal}{east}}
}
\checkartifact{#2}
\label{#4}
\ifx\fname\empty
ITEM #2 NOT FOUND
\else

%%% Use Pax (Perl script) to extract hyperlinks from external PDF
\IfFileExists{\fbase.pax}{}{\immediate\write18{paxify "\fbase.pdf"}\fixpax{\fbase.pax}}

%%% Use custom Perl script to extract PDF bookmarks (side pane)
\IfFileExists{\fbase.pay}{}{\immediate\write18{pdftk "\fbase.pdf" dump_data_utf8 > "\fbase.pay"}}
\pdfloadfile{\fbase}{\thesection}{\thepage}

\pdfpages{\fname}
\ifnum\numberofpages>1
The next \numberofpages{} pages are an external document\ifitemid{} with \itemid{#2}.\else.\fi
\else
The next page is an external document\ifitemid{} with \itemid{#2}.\else.\fi\fi\xspace#5

% Write commands to table of contents
\addtocontents{toc}{\protect\setcounter{tocdepth}{4}}
\pdfmakeinclude % insert PDF pages
\pdfmakebookmark % create PDF bookmarks (side pane)
%\pdfmakecontents % add these bookmarks to table of contents
\addtocontents{toc}{\protect\setcounter{tocdepth}{3}}

\fi

\else

ITEM #2 OMITTED DUE TO "noexpdf" OPTION.\label{#4}

\fi

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Fonts and other settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\titlespacing{\section}{0pt}{*0}{*-1}
\titlespacing{\subsection}{0pt}{*0}{*-1}
\titlespacing{\subsubsection}{0pt}{*0}{*-1}
\titlespacing{\paragraph}{\parindent}{*0}{*-1}
\titlespacing{\subparagraph}{0pt}{*0}{*-1}
\titleformat{\section}{\normalsize\bfseries}{\thesection.}{4pt}{#1}
\titleformat{\subsection}{\normalsize\bfseries}{\thesubsection.}{4pt}{#1}
\titleformat{\subsubsection}{\normalsize\bfseries}{\thesubsubsection.}{4pt}{#1}
\titleformat{\paragraph}{\normalsize\bfseries}{\theparagraph.}{4pt}{#1}
\titleformat{\subparagraph}{\normalsize\bfseries}{\thesubparagraph.}{4pt}{#1}
\patchcmd{\section}{\@startsection}{\needspace{2\baselineskip}\@startsection}{}{}
\patchcmd{\subsection}{\@startsection}{\needspace{2\baselineskip}\@startsection}{}{}
\patchcmd{\subsubsection}{\@startsection}{\needspace{2\baselineskip}\@startsection}{}{}
\patchcmd{\paragraph}{\@startsection}{\needspace{2\baselineskip}\@startsection}{}{}
\patchcmd{\subparagraph}{\@startsection}{\needspace{2\baselineskip}\@startsection}{}{}
\setlength{\parskip}{1.0em}
\newcommand{\@minipagerestore}{\setlength{\parskip}{\medskipamount}}
\makeatletter
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\ }
\renewcommand{\Hy@numberline}[1]{#1. }
\makeatother
\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{3}
\makeatletter
\setlength\@mathmargin{0pt}
\makeatother
\setlength{\abovecaptionskip}{5pt plus 3pt minus 2pt}
\setlength{\belowcaptionskip}{0pt plus 3pt minus 2pt}
\setlength{\textfloatsep}{20pt plus 2.0pt minus 4.0pt}
\setlength{\intextsep}{10pt plus 2pt minus 2pt}
\renewcommand{\labelitemii}{\tiny{$\bullet$}}
\renewcommand{\labelitemiii}{\tiny{$\bullet$}}
\renewcommand{\cftdotsep}{0.7}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\crefname{appsec}{Appendix}{Appendices}
\crefname{appsubsec}{Appendix}{Appendices}
\crefname{appsubsubsec}{Appendix}{Appendices}
\crefname{apppar}{Appendix}{Appendices}
\crefname{appsubpar}{Appendix}{Appendices}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Define appendix style %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\appendixname}{Appendix}
\newcommand{\nosection}[1]{
\addtocounter{section}{1}
\addtocontents{toc}{\cftpagenumbersoff{section}}
\addtocontents{toc}{\string\contentsline {section}{\appendixname\space\string\numberline{\thesection}#1 (not applicable)}{}{}}
\addtocontents{toc}{\cftpagenumberson{section}}
}
\ifappendix\nl
\makeatletter
\renewcommand\appendix{\par
\renewcommand{\allowchangefont}{1}
% Fix to add "Appendix" before section number in Table of Contents for all appendix section, subsection, etc.
% For appendices, add \appendixname before section, subsection and subsubsection in ToC.
% Do not use [titletoc] option with toclof. Needs \makeatletter/other.
% section
  \let\oldacl@pp=\addcontentsline
  \def\addcontentsline##1##2##3{%
    \def\@pptempa{##1}\def\@pptempb{toc}%
    \ifx\@pptempa\@pptempb
      \def\@pptempa{##2}\def\@pptempb{section}%
      \ifx\@pptempa\@pptempb
\oldacl@pp{##1}{##2}{\appendixname\space ##3}%
      \else
        \oldacl@pp{##1}{##2}{##3}%
      \fi
    \else
      \oldacl@pp{##1}{##2}{##3}%
    \fi}
% subsection
  \let\ooldacl@pp=\addcontentsline
  \def\addcontentsline##1##2##3{%
    \def\@pptempa{##1}\def\@pptempb{toc}%
    \ifx\@pptempa\@pptempb
      \def\@pptempa{##2}\def\@pptempb{subsection}%
      \ifx\@pptempa\@pptempb
\ooldacl@pp{##1}{##2}{\appendixname\space ##3}%
      \else
        \ooldacl@pp{##1}{##2}{##3}%
      \fi
    \else
      \ooldacl@pp{##1}{##2}{##3}%
    \fi}
% subsubsection
  \let\oooldacl@pp=\addcontentsline
  \def\addcontentsline##1##2##3{%
    \def\@pptempa{##1}\def\@pptempb{toc}%
    \ifx\@pptempa\@pptempb
      \def\@pptempa{##2}\def\@pptempb{subsubsection}%
      \ifx\@pptempa\@pptempb
\oooldacl@pp{##1}{##2}{\appendixname\space ##3}%
      \else
        \oooldacl@pp{##1}{##2}{##3}%
      \fi
    \else
      \oooldacl@pp{##1}{##2}{##3}%
    \fi}
% paragraph
  \let\ooooldacl@pp=\addcontentsline
  \def\addcontentsline##1##2##3{%
    \def\@pptempa{##1}\def\@pptempb{toc}%
    \ifx\@pptempa\@pptempb
      \def\@pptempa{##2}\def\@pptempb{paragraph}%
      \ifx\@pptempa\@pptempb
\ooooldacl@pp{##1}{##2}{\appendixname\space ##3}%
      \else
        \ooooldacl@pp{##1}{##2}{##3}%
      \fi
    \else
      \ooooldacl@pp{##1}{##2}{##3}%
    \fi}
% subparagraph
  \let\oooooldacl@pp=\addcontentsline
  \def\addcontentsline##1##2##3{%
    \def\@pptempa{##1}\def\@pptempb{toc}%
    \ifx\@pptempa\@pptempb
      \def\@pptempa{##2}\def\@pptempb{subparagraph}%
      \ifx\@pptempa\@pptempb
\oooooldacl@pp{##1}{##2}{\appendixname\space ##3}%
      \else
        \oooooldacl@pp{##1}{##2}{##3}%
      \fi
    \else
      \oooooldacl@pp{##1}{##2}{##3}%
    \fi}

\titleformat{\section}{\normalsize\bfseries}{\appendixname~\thesection.}{4pt}{##1}
\titleformat{\subsection}{\normalsize\bfseries}{\appendixname~\thesubsection.}{4pt}{##1}
\titleformat{\subsubsection}{\normalsize\bfseries}{\appendixname~\thesubsubsection.}{4pt}{##1}
\titleformat{\paragraph}{\normalsize\bfseries}{\appendixname~\theparagraph.}{4pt}{##1}
\titleformat{\subparagraph}{\normalsize\bfseries}{\appendixname~\thesubparagraph.}{4pt}{##1}
\counterwithin{equation}{section}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{lstlisting}{section}
\renewcommand\theequation{A\arabic{section}.\arabic{equation}}
\renewcommand\thefigure{A\arabic{section}.\arabic{figure}}
\renewcommand\thetable{A\arabic{section}.\arabic{table}}
\renewcommand\thelstlisting{A\arabic{section}.\arabic{lstlisting}}

\newtotcounter{numberappendix}
\hypertarget{app}{}
\ifnum\totvalue{numberappendix}>1
\bookmark[level=0,dest=app]{APPENDICES}
\fi

\begin{appendices}

\renewcommand{\setthesection}{\arabic{section}}
\renewcommand{\setthesubsection}{\arabic{subsection}}
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\theHsection}{\Alph{section}}

\crefalias{section}{appsec}
\crefalias{subsection}{appsubsec}
\crefalias{subsubsection}{appsubsubsec}
\crefalias{paragraph}{apppar}
\crefalias{subparagraph}{appsubpar}
\let\stdsection\section
\renewcommand\section{\stepcounter{numberappendix}\clearpage\stdsection}
}
\makeatother
\else
\renewcommand{\appendix}{\itemlist\end{document}}
\fi

\newcounter{mysyncnt}
\newcommand{\cussyncmd}{}
% \perlnewcommand{\addsynsec}[3]{
\newcommand{\synsecs}{
\ifsynonly
\titleformat{name = \section, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{1}{##1}\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subsection, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{2}{##1}\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subsubsection, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{3}{##1}\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \paragraph, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{4}{##1}\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subparagraph, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{5}{##1}\normalsize\bfseries}{}{0pt}{##1}
\else
\titleformat{name = \section, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{2}{##1}\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subsection, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{3}{##1}\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subsubsection, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{4}{##1}\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \paragraph, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{5}{##1}\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subparagraph, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{6}{##1}\normalsize\bfseries}{}{0pt}{##1}
\fi
}
\newcommand{\normsecs}{
\titleformat{name = \section, numberless}{\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subsection, numberless}{\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subsubsection, numberless}{\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \paragraph, numberless}{\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subparagraph, numberless}{\normalsize\bfseries}{}{0pt}{##1}
}

\newcommand{\synopsis}[1]{\newcommand{\insertsynopsis}{#1}}

\newcommand\mainbody{
\setcounter{section}{0}
\setcounter{subsection}{0}
\setcounter{subsubsection}{0}
\setcounter{paragraph}{0}
\setcounter{subparagraph}{0}
\setcounter{equation}{0}
\setcounter{figure}{0}
\setcounter{table}{0}
\setcounter{lstlisting}{0}
\renewcommand\theequation{\arabic{equation}}
\renewcommand\thefigure{\arabic{figure}}
\renewcommand\thetable{\arabic{table}}
\renewcommand\thelstlisting{\arabic{lstlisting}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Define lists
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\addto\captionsenglish{
\renewcommand{\contentsname}{\normalsize{\textbf{\hfill TABLE OF CONTENTS \hfill}}}
\renewcommand{\listfigurename}{\selectfont \normalsize {\centerline{LIST OF FIGURES}}}
\renewcommand{\listtablename}{\selectfont \normalsize {\centerline{LIST OF TABLES}}}
}
\newlength{\cuslen}
\cftsetindents{figure}{0em}{0em}
\cftsetindents{table}{0em}{0em}
\renewcommand{\cfttabpresnum}{\tablename\space}
\renewcommand{\cfttabaftersnum}{.}
\settowidth{\cuslen}{\cfttabpresnum\cfttabaftersnum}
\addtolength{\cfttabnumwidth}{2.8cm}
\renewcommand{\cftfigpresnum}{\figurename\space}
\renewcommand{\cftfigaftersnum}{.}
\settowidth{\cuslen}{\cftfigpresnum\cftfigaftersnum}
\addtolength{\cftfignumwidth}{2.8cm}
\renewcommand\cftsecaftersnum{.}
\renewcommand\cftsubsecaftersnum{.}
\renewcommand\cftsubsubsecaftersnum{.}
\renewcommand\cftparaaftersnum{.}
\renewcommand\cftsubparaaftersnum{.}
\renewcommand\cftsecfont{\mdseries}
\renewcommand\cftsecpagefont{\mdseries}
\setlength{\cftbeforesecskip}{0pt}
\renewcommand\cftsecafterpnum{\vskip-4pt}
\renewcommand\cftsubsecafterpnum{\vskip-4pt}
\renewcommand\cftsubsubsecafterpnum{\vskip-4pt}
\addtolength{\cftsecnumwidth}{-0cm}
\addtolength{\cftsubsecnumwidth}{-0.03cm}
\addtolength{\cftsubsubsecnumwidth}{-0.09cm}
\addtolength{\cftparanumwidth}{-0.13cm}
\addtolength{\cftsubparanumwidth}{-0.17cm}
\let\cusindent\cftsubsecindent
\setlength{\cusindent}{0.75cm}
\setlength{\cftsecindent}{0\cusindent}
\setlength{\cftsubsecindent}{1\cusindent}
\setlength{\cftsubsubsecindent}{2\cftsubsecindent}
\setlength{\cftparaindent}{3\cftsubsecindent}
\setlength{\cftsubparaindent}{4\cftsubsecindent}
\renewcommand{\theHtable}{\theHsection.\arabic{table}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Format hyperlinks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Define hyperlink colors, based on the hyperref package
\hypersetup{
	hypertexnames=false,
	colorlinks,
	breaklinks,
	urlcolor=blue,
	linkcolor=blue,
	citecolor=blue,
	filecolor=blue,
	linktoc=all,
	pdfstartview=,
	pdfstartpage=1,
	pdftitle={},
	pdfauthor={},
	pdfsubject={},
	pdfkeywords={},
	pdfcreator={PharmTeX-\pharmtexversion},
%	pdfproducer={PharmTeX-\pharmtexversion}
}
%\pdfminorversion=7 % PDF version 1.X, currently 1.5
%\pdfcompresslevel=9 % PDF compression
%\pdfobjcompresslevel=0 % Figure compression

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Reference variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\crefname{page}{page}{pages}
\crefname{chapter}{Chapter}{Chapters}
\crefname{section}{Section}{Sections}
\crefname{subsection}{Section}{Sections}
\crefname{subsubsection}{Section}{Sections}
\crefname{paragraph}{Section}{Sections}
\crefname{subparagraph}{Section}{Sections}
\crefname{figure}{Figure}{Figures}
\crefname{table}{Table}{Tables}
\crefname{equation}{Equation}{Equations}
\crefname{plequation}{Equations}{Equations}
\crefname{plfigure}{Figures}{Figures} 
\crefname{subfigure}{Figure}{Figures}
\crefname{subsubfigure}{Figure}{Figures}
\crefname{myappcount}{Appendix}{Appendices}
\crefformat{appendix}{#2#1#3}
\crefformat{equation}{#2Equation~#1#3} %<--- will give Equation 1
\Crefformat{equation}{#2Equation~#1#3} %<--- will give Equation 1
\crefrangeformat{equation}{#3Equations~#1#4 to~#5#2#6}
\Crefrangeformat{equation}{#3Equations~#1#4 to~#5#2#6}
\crefmultiformat{equation}{#2Equations~#1#3}%
{ and~#2#1#3}{, #2#1#3}{ and~#2#1#3}
\Crefmultiformat{equation}{#2Equations~#1#3}%
{ and~#2#1#3}{, #2#1#3}{ and~#2#1#3}
\crefalias{subequation}{equation}
\crefformat{appendices}{Appendix~(#2#1#3)}

%%% Prevent links to same page
\ifsamepagelinks
\newcommand*{\nref}[1]{\ref{#1}}
\newcommand*{\pref}[1]{\pageref{#1}}
\newcommand*{\sref}[1]{\subref{#1}}
\else
\let\cussubref\subref
\let\cuscref\cref
\let\cuscrefrange\crefrange
\let\cusCref\Cref
\let\cusCrefrange\Crefrange
\let\cuscpageref\cpageref
\let\cuscpagerefrange\cpagerefrange
\let\cusCpageref\Cpageref
\let\cusCpagerefrange\Cpagerefrange
\let\cusfootnote\footnote
\let\subref\undefined
\let\cref\undefined
\let\crefrange\undefined
\let\Cref\undefined
\let\Crefrange\undefined
\let\cpageref\undefined
\let\cpagerefrange\undefined
\let\Cpageref\undefined
\let\Cpagerefrange\undefined
\let\footnote\undefined
\newcounter{nref}
   \renewcommand*{\thenref}{nref:\the\value{nref}}
   \newcommand*{\nref}[1]{%
   \leavevmode
   \stepcounter{nref}%
   \label{\thenref}%
   \ifnumequal{\getpagerefnumber{\thenref}}{\getpagerefnumber{#1}}%
    {\begin{NoHyper}\ref{#1}\end{NoHyper}}{\ref{#1}}%
}
\newcounter{pref}
   \renewcommand*{\thepref}{pref:\the\value{pref}}
   \newcommand*{\pref}[1]{%
   \leavevmode
   \stepcounter{pref}%
   \label{\thepref}%
   \ifnumequal{\getpagerefnumber{\thepref}}{\getpagerefnumber{#1}}%
    {\begin{NoHyper}\pageref{#1}\end{NoHyper}}{\pageref{#1}}%
}
\newcounter{subref}
   \renewcommand*{\thesubref}{subref:\the\value{subref}}
   \newcommand*{\subref}[1]{%
   \leavevmode
   \stepcounter{subref}%
   \label{\thesubref}%
   \ifnumequal{\getpagerefnumber{\thesubref}}{\getpagerefnumber{#1}}%
    {\begin{NoHyper}\cussubref{#1}\end{NoHyper}}{\cussubref{#1}}%
}
\let\sref\subref
\newcounter{cref}
   \renewcommand*{\thecref}{cref:\the\value{cref}}
   \newcommand*{\cref}[1]{%
   \leavevmode
   \stepcounter{cref}%
   \label{\thecref}%
   \ifnumequal{\getpagerefnumber{\thecref}}{\getpagerefnumber{#1}}%
    {\begin{NoHyper}\cuscref{#1}\end{NoHyper}}{\cuscref{#1}}%
}
\newcounter{Cref}
   \renewcommand*{\theCref}{Cref:\the\value{Cref}}
   \newcommand*{\Cref}[1]{%
   \leavevmode
   \stepcounter{Cref}%
   \label{\theCref}%
   \ifnumequal{\getpagerefnumber{\theCref}}{\getpagerefnumber{#1}}%
    {\begin{NoHyper}\cusCref{#1}\end{NoHyper}}{\cusCref{#1}}%
}
\newcounter{crefrange}
   \renewcommand*{\thecrefrange}{crefrange:\the\value{crefrange}}
   \newcommand*{\crefrange}[1]{%
   \leavevmode
   \stepcounter{crefrange}%
   \label{\thecrefrange}%
   \ifnumequal{\getpagerefnumber{\thecrefrange}}{\getpagerefnumber{#1}}%
    {\begin{NoHyper}\cuscrefrange{#1}\end{NoHyper}}{\cuscrefrange{#1}}%
}
\newcounter{Crefrange}
   \renewcommand*{\theCrefrange}{Crefrange:\the\value{Crefrange}}
   \newcommand*{\Crefrange}[1]{%
   \leavevmode
   \stepcounter{Crefrange}%
   \label{\theCrefrange}%
   \ifnumequal{\getpagerefnumber{\theCrefrange}}{\getpagerefnumber{#1}}%
    {\begin{NoHyper}\cusCrefrange{#1}\end{NoHyper}}{\cusCrefrange{#1}}%
}
\newcounter{cpageref}
   \renewcommand*{\thecpageref}{cpageref:\the\value{cpageref}}
   \newcommand*{\cpageref}[1]{%
   \leavevmode
   \stepcounter{cpageref}%
   \label{\thecpageref}%
   \ifnumequal{\getpagerefnumber{\thecpageref}}{\getpagerefnumber{#1}}%
    {\begin{NoHyper}\cuscpageref{#1}\end{NoHyper}}{\cuscpageref{#1}}%
}
\newcounter{Cpageref}
   \renewcommand*{\theCpageref}{Cpageref:\the\value{Cpageref}}
   \newcommand*{\Cpageref}[1]{%
   \leavevmode
   \stepcounter{Cpageref}%
   \label{\theCpageref}%
   \ifnumequal{\getpagerefnumber{\theCpageref}}{\getpagerefnumber{#1}}%
    {\begin{NoHyper}\cusCpageref{#1}\end{NoHyper}}{\cusCpageref{#1}}%
}
\newcounter{cpagerefrange}
   \renewcommand*{\thecpagerefrange}{cpagerefrange:\the\value{cpagerefrange}}
   \newcommand*{\cpagerefrange}[1]{%
   \leavevmode
   \stepcounter{cpagerefrange}%
   \label{\thecpagerefrange}%
   \ifnumequal{\getpagerefnumber{\thecpagerefrange}}{\getpagerefnumber{#1}}%
    {\begin{NoHyper}\cuscpagerefrange{#1}\end{NoHyper}}{\cuscpagerefrange{#1}}%
}
\newcounter{Cpagerefrange}
   \renewcommand*{\theCpagerefrange}{Cpagerefrange:\the\value{Cpagerefrange}}
   \newcommand*{\Cpagerefrange}[1]{%
   \leavevmode
   \stepcounter{Cpagerefrange}%
   \label{\theCpagerefrange}%
   \ifnumequal{\getpagerefnumber{\theCpagerefrange}}{\getpagerefnumber{#1}}%
    {\begin{NoHyper}\cusCpagerefrange{#1}\end{NoHyper}}{\cusCpagerefrange{#1}}%
}
\newcommand{\footnote}[1]{\begin{NoHyper}\cusfootnote{#1}\end{NoHyper}}

\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Bookmarks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\captionsetup*{singlelinecheck=off}
\DeclareCaptionLabelSeparator{dotquad}{.\quad}
\DeclareCaptionTextFormat{Tablebookmark}{#1}
\captionsetup*[table]{textformat=Tablebookmark,labelsep=dotquad,font={normalsize,bf}}
\DeclareCaptionTextFormat{Figurebookmark}{#1}
\captionsetup*[figure]{textformat=Figurebookmark,labelsep=dotquad,font={normalsize,bf}}
\captionsetup*[lstlisting]{textformat=Tablebookmark,labelsep=dotquad,font={normalsize,bf}}%,aboveskip=0.5\normalbaselineskip,margin={-0.35cm,0cm}
\captionsetup*[sub]{position=bottom,justification=centering,font={rm,footnotesize},labelfont={bf,footnotesize}}
\captionsetup*{subrefformat=parens}
%\captionsetup[subfloat]{position=bottom,justification=centering,labelfont={bf}}

% Redefine ToC, LoT, and LoF
\makeatletter
\renewcommand\tableofcontents{%
	\iftoc
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \fi
    \global\@printlisttrue
    \iftoc
    \@starttoc{toc}%
    \fi
    }
\renewcommand\listoftables{%
  \iflot
    \section*{\listtablename}%
  \fi
  \iflot
  \@starttoc{lot}%
  \fi
}
\renewcommand\listoffigures{%
  \iflof
    \section*{\listfigurename}%
 \fi
 \iflof
  \@starttoc{lof}%
 \fi
}
\def\@starttoc#1{%
  \begingroup
    \makeatletter
      \@input{\jobname.#1}%
      \expandafter\newwrite\csname tf@#1\endcsname
      \immediate\openout \csname tf@#1\endcsname \jobname.#1\relax
    \@nobreakfalse
  \endgroup}
\newif\if@printlist

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Custom commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newdateformat{mydate}{\THEDAY\xspace \monthname[\THEMONTH] \THEYEAR\xspace}
\newcommand{\docversion}[1]{\newcommand{\DocVersion}{#1\xspace}}
\newcommand{\docdate}[1]{\newcommand{\DocDate}{#1\xspace}}
\newcommand{\doctitle}[1]{\newcommand{\DocTitle}{#1\xspace}}
\newcommand{\docqcdate}[1]{\newcommand{\DocQCDate}{#1\xspace}}
\newcommand{\doctype}[1]{\newcommand{\DocType}{#1\xspace}}
\newcommand{\docpdfname}[1]{\edef\DocPDFName{#1\ifsynonly-synopsis\fi}}
\newcommand{\docauthora}[1]{\newcommand{\DocAuthora}{#1}}
\newcommand{\docauthorb}[1]{\newcommand{\DocAuthorb}{#1}}
\newcommand{\docauthorc}[1]{\newcommand{\DocAuthorc}{#1}}
\newcommand{\docauthord}[1]{\newcommand{\DocAuthord}{#1}}
\newcommand{\docauthore}[1]{\newcommand{\DocAuthore}{#1}}
\newcommand{\docauthorf}[1]{\newcommand{\DocAuthorf}{#1}}
\newcommand{\docapprovera}[1]{\newcommand{\DocApprovera}{#1}}
\newcommand{\docapproverb}[1]{\newcommand{\DocApproverb}{#1}}
\newcommand{\docapproverc}[1]{\newcommand{\DocApproverc}{#1}}
\newcommand{\docapproverd}[1]{\newcommand{\DocApproverd}{#1}}
\newcommand{\docapprovere}[1]{\newcommand{\DocApprovere}{#1}}
\newcommand{\docapproverf}[1]{\newcommand{\DocApproverf}{#1}}
\newcommand{\logo}[2][scale=1]{\newcommand{\Logo}{\includegraphics[#1]{#2}}}
\newcommand{\refstyle}[1]{\checkfile{#1}{RefStyle}}
\newcommand{\reffile}[1]{\checkfile{#1}{RefFile}\fixbib{\RefFile}\edef\RefFileOrig{#1}}
\newcommand{\signaturepage}[2][1]{\newcommand{\SignaturePageNo}{#1}\newcommand{\SignaturePage}{#2}}
\newcommand{\coverpage}[2][1]{\newcommand{\CoverPageNo}{#1}\newcommand{\CoverPage}{#2}}
\newcommand{\qapage}[2][1]{\newcommand{\QAPageNo}{#1}\newcommand{\QAPage}{#2}}
\newcommand{\versionhistory}[1]{\addtocounter{table}{-1}\newcommand{\VersionHistory}{#1}}
\newcommand{\warningbox}[1]{\newcommand{\WarningBox}{#1}}
\newcommand{\headertext}[3]{\newcommand{\HeaderText}{#1~\\#2~\\#3\xspace}}
\newcommand{\footertext}[1]{\newcommand{\FooterText}{#1\xspace}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Cover page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\CoverLine}{}
\newcommand{\coverline}[2]{\g@addto@macro\CoverLine{#1 & \multicolumn{3}{p{0.69\maxwidth}|}{#2} \\ \hline}}

\newcommand{\dimf}{0.46}
\newcounter{nauthor}
\setcounter{nauthor}{1}
\newcommand{\DocAuthor}{}
\newcommand{\docauthor}[1]{\expandafter\def\csname DocAuthor\alph{nauthor}\endcsname{#1}\addtocounter{nauthor}{1}}

\iflogo\else\renewcommand{\Logo}{}\fi
\newcommand{\insertcoverpage}{

\quad\vspace{-1.5\baselineskip}
\renewcommand{\arraystretch}{1.2}
\begin{tabularx}{\maxwidth}{|L{0.25}|L{0.25}L{0.25}L{0.25}|} \hline
\multicolumn{1}{|>{\centering\arraybackslash}p{0.24\maxwidth}|}{\multirow{4}{*}{\ifdefined\Logo\Logo\fi}} & \multicolumn{3}{>{\centering\arraybackslash}p{0.69\maxwidth}|}{\multirow{4}{*}{\ifdefined\doctype\textbf{\DocType\ifsynonly~(SYNOPSIS)\fi}\fi}} \\
& \multicolumn{3}{c|}{} \\
& \multicolumn{3}{c|}{} \\
& \multicolumn{3}{c|}{} \\ \hline
Report Title: & \multicolumn{3}{p{0.69\maxwidth}|}{\DocTitle} \\ \hline
Date Issued: & \multicolumn{3}{p{0.69\maxwidth}|}{\DocDate} \\ \hline
\CoverLine
\ifdefined\DocAuthora \multicolumn{2}{|p{\dimf\maxwidth}}{\DocAuthora} & \multicolumn{2}{p{\dimf\maxwidth}|}{\ifdefined\DocAuthorb\DocAuthorb\fi} \\ \fi
\ifdefined\DocAuthorc \multicolumn{2}{|p{\dimf\maxwidth}}{~\newline\DocAuthorc} & \multicolumn{2}{p{\dimf\maxwidth}|}{\ifdefined\DocAuthord~\newline\DocAuthord\fi} \\ \fi
\ifdefined\DocAuthore \multicolumn{2}{|p{\dimf\maxwidth}}{~\newline\DocAuthore} & \multicolumn{2}{p{\dimf\maxwidth}|}{\ifdefined\DocAuthorf~\newline\DocAuthorf\fi} \\ \fi
\ifdefined\DocAuthorg \multicolumn{2}{|p{\dimf\maxwidth}}{~\newline\DocAuthorg} & \multicolumn{2}{p{\dimf\maxwidth}|}{\ifdefined\DocAuthorh~\newline\DocAuthorh\fi} \\ \fi
\ifdefined\DocAuthori \multicolumn{2}{|p{\dimf\maxwidth}}{~\newline\DocAuthori} & \multicolumn{2}{p{\dimf\maxwidth}|}{\ifdefined\DocAuthorj~\newline\DocAuthorj\fi} \\ \fi
\ifdefined\DocAuthora\hline\fi
\end{tabularx}
\renewcommand{\arraystretch}{1.2}

\ifdefined\VersionHistory
\nl
\vskip5pt
\footnotesize
\begin{tabularx}{\maxwidth}{|l|l|l|L{1}|} \hline
	\multicolumn{4}{|l|}{\textbf{DOCUMENT HISTORY:}} \\ \hline
	Version & Date & Author(s) & Summary of Changes \\ \hline
	\VersionHistory
\end{tabularx}
\normalsize
\fi
\ifdefined\WarningBox
\begin{center}
\vskip5pt
\footnotesize
\noindent\fbox{\parbox{0.91\maxwidth}{
\WarningBox
}}
\end{center}
\fi
\normalsize
\addtocounter{table}{-1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Approval page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ApproverLine}{}
\newcommand{\approverline}[2]{\g@addto@macro\ApproverLine{#1 & #2 \\ \hline}}
% \newcommand{\approverline}[2]{\g@addto@macro\ApproverLine{#1 & \multicolumn{3}{p{0.69\maxwidth}|}{#2} \\ \hline}}

\newcounter{napprover}
\setcounter{napprover}{1}
\newcommand{\DocApprover}{}
\newcommand{\docapprover}[1]{\expandafter\def\csname DocApprover\alph{napprover}\endcsname{#1}\addtocounter{napprover}{1}}

\newcommand{\insertsigpage}{

\ifdefined\DocApprovera
\quad\vspace{-1.5\baselineskip}
\renewcommand{\arraystretch}{1.2}
\begin{tabularx}{\maxwidth}{|l|L{1}|} \hline
\multicolumn{2}{|c|}{\textbf{APPROVAL PAGE}} \\
\multicolumn{2}{|c|}{\textbf{\DocType}} \\ \hline
Report Title: & \DocTitle \\ \hline
Date Issued: & \DocDate \\ \hline
% \begin{tabularx}{\maxwidth}{|L{0.25}|L{0.25}L{0.25}L{0.25}|} \hline
% \multicolumn{4}{|c|}{\textbf{APPROVAL PAGE}} \\
% \multicolumn{4}{|c|}{\textbf{\DocType}} \\ \hline
% Report Title: & \multicolumn{3}{p{0.69\maxwidth}|}{\DocTitle} \\ \hline
\ApproverLine
\end{tabularx}
\renewcommand{\arraystretch}{1.2}
\addtocounter{table}{-1}
\normalsize

\renewcommand{\arraystretch}{1.2}
\begin{tabularx}{\maxwidth}{L{0.5}L{0.5}} \hline
\ifdefined\DocApprovera{}APPROVAL DATE:\newline~\newline~\newline~\newline\DocApprovera\fi &
\ifdefined\DocApproverb{}APPROVAL DATE:\newline~\newline~\newline~\newline\DocApproverb\fi \\ \hline
\ifdefined\DocApproverc
\ifdefined\DocApproverc{}APPROVAL DATE:\newline~\newline~\newline~\newline\DocApproverc\fi &
\ifdefined\DocApproverd{}APPROVAL DATE:\newline~\newline~\newline~\newline\DocApproverd\fi \\ \hline \fi
\ifdefined\DocApprovere
\ifdefined\DocApprovere{}APPROVAL DATE:\newline~\newline~\newline~\newline\DocApprovere\fi &
\ifdefined\DocApproverf{}APPROVAL DATE:\newline~\newline~\newline~\newline\DocApproverf\fi \\ \hline \fi
\ifdefined\DocApproverg
\ifdefined\DocApproverg{}APPROVAL DATE:\newline~\newline~\newline~\newline\DocApproverg\fi &
\ifdefined\DocApproverh{}APPROVAL DATE:\newline~\newline~\newline~\newline\DocApproverh\fi \\ \hline \fi
\ifdefined\DocApproveri
\ifdefined\DocApproveri{}APPROVAL DATE:\newline~\newline~\newline~\newline\DocApproveri\fi &
\ifdefined\DocApproverj{}APPROVAL DATE:\newline~\newline~\newline~\newline\DocApproverj\fi \\ \hline \fi
\end{tabularx}
\renewcommand{\arraystretch}{1.2}
\addtocounter{table}{-1}
\normalsize

\fi
}

% Portrait pages
\fancypagestyle{regularstyle}{
  \fancyhf{}
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyheadoffset[L]{0cm}
  \fancyheadoffset[R]{0cm}                 
  \fancyfootoffset[L,R]{0cm}
  \fancyhead[L]{\footnotesize{\HeaderText}  
}
   \fancyfoot[C]{    
 \footnotesize{\FooterText \\ Page \thepage~of~\pageref*{LastPage}}
 \ifwatermark
 \begin{tikzpicture}[remember picture,overlay,opacity=\WatermarkOpacity,scale=\WatermarkScale,every node/.style={scale=\WatermarkScale}]
 	\node[rotate = 45] at (current page.center) {\Huge{\Watermark}};
 \end{tikzpicture}
 \fi
 }
   \fancyhead[R]{}
  \fancyfoot[L]{}
   \fancyfoot[R]{}
}

% Landscape pages
\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}
\fancypagestyle{lscape}{
\renewcommand{\footrulewidth}{0pt}
\fancyhf{}
\fancyfoot[C]{
\begin{tikzpicture}[remember picture,overlay]
    \node[rotate = 90] at ([xshift=-1.6cm-\PmxBottom+\PmxBottomBase+\PmxFoot-\PmxFootBase, yshift=0.5\PmxLeft-0.5\PmxRight]current page.east) {\footnotesize{\FooterText}};
    \node[rotate = 90] at ([xshift=-1.15cm-\PmxBottom+\PmxBottomBase+\PmxFoot-\PmxFootBase, yshift=0.5\PmxLeft-0.5\PmxRight]current page.east) {\footnotesize{Page \thepage~of~\pageref*{LastPage}}};
    \node[rotate = 90, text width=20cm] at ([xshift=1.65cm+\PmxTop-\PmxTopBase-\PmxHead+\PmxHeadBase,yshift=13.18cm+\PmxLeft-\PmxLeftBase]current page.south west) {\footnotesize{\HeaderText\\}};
\end{tikzpicture}
\ifwatermark
\begin{tikzpicture}[remember picture,overlay,opacity=\WatermarkOpacity,scale=\WatermarkScale,every node/.style={scale=\WatermarkScale}]
	\node[rotate = 135] at (current page.center) {\Huge{\Watermark}};
\end{tikzpicture}
\fi
 }
}
\AtBeginEnvironment{landscape}{\newgeometry{top = \PmxRight, bottom = \PmxLeft, left = \PmxTop, right = \PmxBottom, headheight = 1.75 cm, headsep = \PmxHead, footskip = \PmxFoot}\pagestyle{lscape}\setlength{\maxwidth}{\textheight}\setlength{\maxheight}{\textwidth}}

%\AtEndEnvironment{landscape}{}
\AfterEndEnvironment{landscape}{\restoregeometry\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}}

% Choose regular style as default
\pagestyle{regularstyle}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Settings for the glossary (used to be here)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Counter for bibliography to determine if any citations are used
\newtotcounter{citenum}
\def\oldcite{}
\let\oldcite=\bibcite
\def\bibcite{\stepcounter{citenum}\oldcite}

%%% Disable empty bibliography warning
\let\myBib\thebibliography
\let\endmyBib\endthebibliography
\renewcommand\thebibliography[1]{\ifx\relax#1\relax\else\myBib{#1}\fi}

%%% Bibliography setup
\newcommand{\references}{
\begingroup

\ifnum\thecitenum>0
\clearpage
\ifsynonly
\def\bibsection{\bookmark[level=1,dest=synref]{REFERENCES}\hypertarget{synref}{}\section*{REFERENCES}\csname biblst@rthook\endcsname\par}
\else
\def\bibsection{\section{REFERENCES}\csname biblst@rthook\endcsname\par}
\fi
\else
\def\bibsection{}
\fi

\ifdefined\RefStyle
\IfFileExists{\RefStyle.bst}{\bibliographystyle{\RefStyle}}{\bibliographystyle{unsrt}}
\else
\bibliographystyle{unsrt}
\fi

\ifdefined\RefFile

\checkartifact{\RefFileOrig}
\hypertarget{itemnumber\theitemnumber}{}
\ifx\fname\empty
ITEM \RefFile.bib NOT FOUND.
\savefile{pmxref-tmpfixfile.bib}{}\bibliography{pmxref-tmpfixfile.bib}
\else
\bibliography{\RefFile}
\fi

\else
\savefile{pmxref-tmpfixfile.bib}{}
\bibliography{pmxref-tmpfixfile.bib}
\fi

\endgroup
}

%%% Hyperlink dotted line and extend it all the way to page number in ToC, LoT, and LoF.
\newcommand{\thecurrenthypertarget}{}
\let\oldcontentsline\contentsline
\renewcommand{\contentsline}[4]{\cftsetpnumwidth{\widthof{#3}-0.1em}\renewcommand{\thecurrenthypertarget}{#4}\oldcontentsline{#1}{#2}{#3}{#4}}
\patchcmd{\cftdotfill}{\leaders}{\hyper@linkstart{link}{\thecurrenthypertarget}\leaders}{}{}
\patchcmd{\cftdotfill}{\hbox{$\m@th\mkern #1 mu\hbox{\cftdot}\mkern #1 mu$}\hfill}{\hbox{$\m@th\mkern #1 mu\hbox{\cftdot}\mkern #1 mu$}\hfill\hyper@linkend}{}{}

%%% Templates for precoding, postcoding, and patching/replacing code in commands
%\pretocmd{<command>}{<code>}{<success>}{<failure>}
%\apptocmd{<command>}{<code>}{<success>}{<failure>}
%\patchcmd{<command>}{<code to replace>}{<code>}{<success>}{<failure>}

%%% Set page number of the first page
\setcounter{page}{1}

% Initialize commands
\newcommand{\coverbookmark}{}
\newcommand{\sigbookmark}{}
\newcommand{\synbookmark}{}
\newcommand{\tocbookmark}{}
\newcommand{\glsbookmark}{}

%%% Load elements of the R knitr package. Do not load the package itself in latex, since some elements cause issues with the setup of this template file.
%%% KNITR SETUP START %%%
\definecolor{fgcolor}{rgb}{0.345, 0.345, 0.345}
\newcommand{\hlnum}[1]{\textcolor[rgb]{0.686,0.059,0.569}{#1}}%
\newcommand{\hlstr}[1]{\textcolor[rgb]{0.192,0.494,0.8}{#1}}%
\newcommand{\hlcom}[1]{\textcolor[rgb]{0.678,0.584,0.686}{\textit{#1}}}%
\newcommand{\hlopt}[1]{\textcolor[rgb]{0,0,0}{#1}}%
\newcommand{\hlstd}[1]{\textcolor[rgb]{0.345,0.345,0.345}{#1}}%
\newcommand{\hlkwa}[1]{\textcolor[rgb]{0.161,0.373,0.58}{\textbf{#1}}}%
\newcommand{\hlkwb}[1]{\textcolor[rgb]{0.69,0.353,0.396}{#1}}%
\newcommand{\hlkwc}[1]{\textcolor[rgb]{0.333,0.667,0.333}{#1}}%
\newcommand{\hlkwd}[1]{\textcolor[rgb]{0.737,0.353,0.396}{\textbf{#1}}}%
\makeatletter
\newenvironment{kframe}{%
 \def\at@end@of@kframe{}%
 \ifinner\ifhmode%
  \def\at@end@of@kframe{\end{minipage}}%
  \begin{minipage}{\columnwidth}%
 \fi\fi%
 \def\FrameCommand##1{\hskip\@totalleftmargin \hskip-\fboxsep
 \colorbox{shadecolor}{##1}\hskip-\fboxsep
     % There is no \\@totalrightmargin, so:
     \hskip-\linewidth \hskip-\@totalleftmargin \hskip\columnwidth}%
 \MakeFramed {\advance\hsize-\width
   \@totalleftmargin\z@ \linewidth\hsize
   \@setminipage}}%
 {\par\unskip\endMakeFramed%
 \at@end@of@kframe}
\makeatother
\definecolor{shadecolor}{rgb}{.97, .97, .97}
\definecolor{messagecolor}{rgb}{0, 0, 0}
\definecolor{warningcolor}{rgb}{1, 0, 1}
\definecolor{errorcolor}{rgb}{1, 0, 0}
\newenvironment{knitrout}{}{} % an empty environment to be redefined in TeX
%\usepackage{alltt}
%%% KNITR SETUP END %%%

% Function for putting in a bookmark without a number, can be used on approval page
\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

%%% Below is code to be executed at \begin{document}
\AtBeginDocument{

% Settings to disable hyperlinks in batch mode
\urlstyle{same} % used to be tt (typewriter)
\ifwebhyper\else
\let\oldhref\href
\let\oldurl\url
\renewcommand{\href}[2]{\begin{NoHyper}\oldhref{#1}{#2}\end{NoHyper}}
\renewcommand{\url}[1]{\begin{NoHyper}\oldurl{#1}\end{NoHyper}}
\fi

% Determine if ghostscript command should be Windows or Linux
\ifwindows\newcommand{\gscmd}{gswin32c}\else\newcommand{\gscmd}{gs}\fi

% Insert cover page
\ifcoverpage
\ifdefined\CoverPage
\checkartifact{\CoverPage}
\ifx\fname\empty
\hypertarget{itemnumber\theitemnumber}{}
ITEM \CoverPage{} NOT FOUND
\clearpage
\else
%\immediate\write18{paxify tmpcoverpage.pdf}
% \IfFileExists{tmpcoverpage.pdf}{}{\immediate\write18{\gscmd\space -dSAFER -dBATCH -dNOPAUSE -dNOCACHE -sDEVICE=pdfwrite -dFirstPage=\CoverPageNo\space -dLastPage=\CoverPageNo\space -sOutputFile="tmpcoverpage.pdf" \fname}}
% \IfFileExists{\fbase.pax}{}{}
\includepdf[pages=\CoverPageNo,pagecommand={
\thispagestyle{empty}
\hypertarget{itemnumber\theitemnumber}{}
% \blfootnote{\itemid{\CoverPage}}
\hypertarget{cov}{}
\ifwatermark
\begin{tikzpicture}[remember picture,overlay,opacity=\WatermarkOpacity,scale=\WatermarkScale,every node/.style={scale=\WatermarkScale}]
	\node[rotate = 45] at (current page.center) {\Huge{\Watermark}};
\end{tikzpicture}
\fi
}]{\fname}
% }]{tmpcoverpage.pdf}
\fi
\else
\hypertarget{cov}{}
%\thispagestyle{empty}
\insertcoverpage
\clearpage
\fi
\renewcommand{\coverbookmark}{\bookmark[level=1,dest=cov]{COVER PAGE}}
\fi

% Insert signature page
\ifdefined\DocApprovera\ifsigpage
\ifdefined\SignaturePage
\checkartifact{\SignaturePage}
\ifx\fname\empty
\hypertarget{itemnumber\theitemnumber}{}
ITEM \SignaturePage{} NOT FOUND
\clearpage
\else
%\immediate\write18{paxify tmpcoverpage.pdf}
% \IfFileExists{tmpcoverpage.pdf}{}{\immediate\write18{\gscmd\space -dSAFER -dBATCH -dNOPAUSE -dNOCACHE -sDEVICE=pdfwrite -dFirstPage=\SignaturePageNo\space -dLastPage=\SignaturePageNo\space -sOutputFile="tmpcoverpage.pdf" \fname}}
% \IfFileExists{\fbase.pax}{}{}
\includepdf[pages=\SignaturePageNo,pagecommand={
\thispagestyle{empty}
\hypertarget{itemnumber\theitemnumber}{}
% \blfootnote{\itemid{\SignaturePage}}
\hypertarget{sig}{}
\ifwatermark
\begin{tikzpicture}[remember picture,overlay,opacity=\WatermarkOpacity,scale=\WatermarkScale,every node/.style={scale=\WatermarkScale}]
	\node[rotate = 45] at (current page.center) {\Huge{\Watermark}};
\end{tikzpicture}
\fi
}]{\fname}
% }]{tmpcoverpage.pdf}
\fi
\else
\hypertarget{sig}{}
\insertsigpage
\clearpage
\fi
\renewcommand{\sigbookmark}{\bookmark[level=1,dest=sig]{APPROVAL PAGE}}
\fi\fi

% Create glossary
\newcommand{\insertglossary}{
\clearpage
\ifglossary
\renewcommand*{\glsclearpage}{}
\renewcommand{\glossaryname}{ABBREVIATION AND DEFINITION OF TERMS}
\hypertarget{gls}{}
\renewcommand{\glsbookmark}{\bookmark[level=1,dest=gls]{\glossaryname}}
\glstocfalse

\ifdefined\GlsFile
\checkartifact{\GlsFile.tex}
\hypertarget{itemnumber\theitemnumber}{}
\ifx\fname\empty
ITEM \GlsFile.tex NOT FOUND.
\fi
\fi

\printglossary[title=\glossaryname,toctitle=\glossaryname,style=mystyle,type=\acronymtype,nogroupskip=true,nonumberlist]
\ifnum\themycnt>0\else
% \phantomsection
% \addcontentsline{toc}{section}{\glossaryname}
\vspace{-1.7\baselineskip}
\section*{\glossaryname}\textbf{No abbreviations in document.}
\fi
\clearpage
\else
\glsdisablehyper
\fi

% Reset glossary
\glsresetall
}

% Insert glossary here (if turned on) for synonly mode
\ifsynonly
\insertglossary
\fi

% Insert synopsis
\hypertarget{syn}{}
\ifdefined\insertsynopsis\ifsynopsis
\section*{SYNOPSIS}
\textbf{\DocTitle}
\fi\fi
\synsecs
\setcounter{section}{0}
\setcounter{subsection}{0}
\setcounter{subsubsection}{0}
\setcounter{paragraph}{0}
\setcounter{subparagraph}{0}
\setcounter{equation}{0}
\setcounter{figure}{0}
\setcounter{table}{0}
\setcounter{lstlisting}{0}
\renewcommand\theequation{S\arabic{equation}}
\renewcommand\thefigure{S\arabic{figure}}
\renewcommand\thetable{S\arabic{table}}
\renewcommand\thelstlisting{S\arabic{lstlisting}}
\ifdefined\insertsynopsis\ifsynopsis
\ifsynonly\else
\renewcommand{\synbookmark}{\bookmark[level=1,dest=syn]{SYNOPSIS}}
\fi
\insertsynopsis
\fi\fi
\normsecs
\mainbody
\ifdefined\insertsynopsis\ifsynopsis
\clearpage
\fi\fi

% Insert Table of Contents
\iftoc
\hypertarget{toc}{}
\renewcommand{\tocbookmark}{\bookmark[level=1,dest=toc]{TABLE OF CONTENTS}}
\tableofcontents
\clearpage
\fi

% Insert List of Tables
\iflot
%% The code below (commented out) will only insert LoT if any tables are present in document
%\iftotaltables
%\phantomsection\label{lotlabel}
%\hypertarget{lot}{}
%\addtocontents{toc}{\@backslashchar contentsline {section}{LIST OF TABLES}{\@backslashchar pageref{lotlabel}}{lot}}
% The code below will insert empty LoT if no tables are present in document
\phantomsection
\addcontentsline{toc}{section}{LIST OF TABLES}
\listoftables
\iftotaltables\else\ifnum\syntab=0\textbf{No tables in document.}\fi\fi
\vskip12pt
\fi
%\fi

\iflof
%% The code below (commented out) will only insert LoF if any figures are present in document
%\iftotalfigures
%\phantomsection\label{loflabel}
%\hypertarget{lof}{}
%\addtocontents{toc}{\@backslashchar contentsline {section}{LIST OF FIGURES}{\@backslashchar pageref{loflabel}}{lof}}
% The code below will insert empty LoF if no figures are present in document
\phantomsection
\addcontentsline{toc}{section}{LIST OF FIGURES}
\listoffigures
\iftotalfigures\else\ifnum\synfig=0\textbf{No figures in document.}\fi\fi
\vskip12pt
\fi
%\fi

% Insert glossary here if not synonly mode
\ifsynonly\else
\insertglossary
\fi

% Insert PDF bookmarks in correct order
\coverbookmark
\sigbookmark
\ifsynonly\glsbookmark\fi
\synbookmark
\ifsynopsis\addsynsec{none}{}{}\cussyncmd\fi
\tocbookmark
\ifsynonly\else\glsbookmark\fi

% End document if synonly mode
\ifsynonly\references\clearpage\itemlist\end{document}\fi
}

% Create perl files>
% missingartifacts.txt - artifacts to download
% finalize.pl - deletes artifacts and temporary files in the LaTeX compilation sequence
% clear.pl - executed with F4 in Texmaker, deletes temporary files and, if run is a server run, also all downloaded artifacts
% \perlnewcommand{\createfiles}[5]{

%%% Code to be executed at \end{document}
\AtEndDocument{

% Apply noappendix option if requested so that appendices are not compiled
\ifsynonly\else\ifappendix
\end{appendices}
\fi\fi

% Clear last comma or separator in lists of items created by this template
\StrGobbleRight{\artifacts}{1}[\artifacts]
\StrGobbleRight{\missingartifacts}{1}[\missingartifacts]
\StrGobbleLeft{\missingrfiles}{21}[\missingrfiles]

% True false variables as well as perl script printing
\ifdefined\DocPDFName\newcommand{\DocPDF}{\DocPDFName}\else\newcommand{\DocPDF}{\jobname}\fi
\newcommand{\doprintsig}{0}\ifdefined\DocApprovera\ifdraftmode\else\ifdefined\SignaturePage\else\ifsigpage\renewcommand{\doprintsig}{1}\fi\fi\fi\fi
\newcommand{\dogetartifacts}{1}\IfStrEqCase{\missingartifacts}{{}{\renewcommand{\dogetartifacts}{0}}}
\ifdraftmode
\createfiles{\jobname}{\DocPDF}{\missingartifacts}{\dogetartifacts}{\doprintsig}{\missingrfiles} % DRAFT MODE: download only MISSING artifacts when at least 1 artifact is missing
%\createfiles{\jobname}{\DocPDF}{\artifacts}{\dogetartifacts}{\doprintsig} % DRAFT MODE: download ALL artifacts (possibly again) when at least 1 artifact is missing
\else
\createfiles{\jobname}{\DocPDF}{\artifacts}{\dogetartifacts}{\doprintsig}{\missingrfiles} % BATCH MODE: download ALL artifacts
\fi

}
