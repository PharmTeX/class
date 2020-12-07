%%% PharmTeX class, part of the PharmTeX platform.
%%% Copyright (C) 2020 Christian Hove Claussen (contact@pharmtex.org).
%%% This program is free software: You can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of the GNU Affero General Public License along with this program (see file named LICENSE). If not, see <https://www.gnu.org/licenses/>.
\def\pharmtexdate{2020/12/07}
\def\pharmtexversion{2.1}

%%% Define PharmTeX Class for LaTeX
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PharmTeX}[\pharmtexdate\space v\pharmtexversion\space PharmTeX Class]

%%%% Load bundle version if possible
\newread\pharmtexread
\IfFileExists{bundleversion.txt}{
\openin\pharmtexread=bundleversion.txt
\read\pharmtexread to \bundleversion
\closein\pharmtexread
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Apply user options (for \documentclass[options]{PharmTeX})
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Default font size is 12pt
\def\@@ptsize{12pt}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}

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
\newif\iftocintoc\tocintocfalse
\newif\iftoc\toctrue
\newif\ifctoc\ctocfalse
\DeclareOption{toc}{\toctrue\ctoctrue}
\DeclareOption{notoc}{\tocfalse\ctoctrue}

%%% Option to show LOA
\newif\ifloa\loatrue
\newif\ifcloa\cloafalse
\DeclareOption{loa}{\loatrue\cloatrue}
\DeclareOption{noloa}{\loafalse\cloatrue}

%%% Option to show LOF
\newif\iflofcl\lofclfalse
\newif\iflof\loftrue
\newif\ifclof\cloffalse
\DeclareOption{nolof}{\loffalse\cloftrue}
\DeclareOption{lof}{\loftrue\cloftrue}

%%% Option to show LOT
\newif\ifloftfirst\loftfirsttrue
\newif\iflot\lottrue
\newif\ifclot\clotfalse
\DeclareOption{nolot}{\lotfalse\clottrue}
\DeclareOption{lot}{\lottrue\clottrue}

%%% Option to show glossary
\newif\ifglossary\glossarytrue
\newif\ifcglossary\cglossaryfalse
\newif\ifglossaryupper\glossaryuppertrue
\newif\ifglossarypostdot\glossarypostdottrue
\DeclareOption{noglossary}{\glossaryfalse\cglossarytrue}
\DeclareOption{glossary}{\glossarytrue\cglossarytrue}

%%% Option to reset glossary for each appendix
\newif\ifappgls\appglstrue
\newif\ifcappgls\cappglsfalse
\DeclareOption{noappgls}{\appglsfalse\cappglstrue}
\DeclareOption{appgls}{\appglstrue\cappglstrue}

%%% Option to show synopsis
\newif\ifsynopsis\synopsistrue
\newif\ifcsynopsis\csynopsisfalse
\DeclareOption{nosynopsis}{\synopsisfalse\csynopsistrue}
\DeclareOption{synopsis}{\synopsistrue\csynopsistrue}

%%% Option to signature page
\newif\ifprintsigpage\printsigpagetrue
\newif\ifsigpage\sigpagetrue
\newif\ifcsigpage\csigpagefalse
\DeclareOption{nosigpage}{\sigpagefalse\csigpagetrue}
\DeclareOption{sigpage}{\sigpagetrue\csigpagetrue}

%%% Option allow same page hyperlinks
\newif\ifsamepagelinks\samepagelinkstrue
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
\newif\ifshowinlinetable\showinlinetabletrue
\newif\ifitemid\itemidtrue
\newif\ifcitemid\citemidfalse
\DeclareOption{noitemid}{\itemidfalse\citemidtrue}
\DeclareOption{itemid}{\itemidtrue\citemidtrue}

%%% Option to display List of Numbers
\newif\iflon\IfFileExists{batch.txt}{\lonfalse}{\lontrue}
\newif\ifclon\clonfalse
\DeclareOption{nolon}{\lonfalse\clontrue}
\DeclareOption{lon}{\lontrue\clontrue}

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

%%% Option to print and include equations as images
\newif\ifeqnimg\eqnimgfalse
\newif\ifceqnimg\ceqnimgfalse
\DeclareOption{noeqnimg}{\eqnimgfalse\ceqnimgtrue}
\DeclareOption{eqnimg}{\eqnimgtrue\ceqnimgtrue}

%%% Option to print and include inline math as images
\newif\ifmathimg\mathimgfalse
\newif\ifcmathimg\cmathimgfalse
\DeclareOption{nomathimg}{\mathimgfalse\cmathimgtrue}
\DeclareOption{mathimg}{\mathimgtrue\cmathimgtrue}

%%% Option to print and include inline math as images (only for \convimg command)
\newif\ifconvimg\convimgfalse
\newif\ifcconvimg\cconvimgfalse
\DeclareOption{noconvimg}{\convimgfalse\cconvimgtrue}
\DeclareOption{convimg}{\convimgtrue\cconvimgtrue}

%%% Option to copy all inputfiles to ./pmxinputfiles and load from there if present
\newif\ifitemsbytime\itemsbytimefalse
\newif\ifcitemsbytime\citemsbytimefalse
\DeclareOption{itemsbyid}{\itemsbytimefalse\citemsbytimetrue}
\DeclareOption{itemsbytime}{\itemsbytimetrue\citemsbytimetrue}

%%% Option to copy all inputfiles to ./inputfiles and load from there if present
\newif\ifcopy\copyfalse
\newif\ifccopy\ccopyfalse
\DeclareOption{nocopy}{\copyfalse\ccopytrue}
\DeclareOption{copy}{\copytrue\ccopytrue}

%%% Option for paper size
\newif\ifletterpaper\letterpaperfalse
\newcommand{\mypaperkoma}{a4}
\newif\ifcletterpaper\cletterpaperfalse
\DeclareOption{a4paper}{\letterpaperfalse\cletterpapertrue\renewcommand{\mypaperkoma}{a4}}
\DeclareOption{isopaper}{\letterpaperfalse\cletterpapertrue\renewcommand{\mypaperkoma}{a4}}
\DeclareOption{letterpaper}{\letterpapertrue\cletterpapertrue\renewcommand{\mypaperkoma}{letter}}

%%% Ready-to-use mutually exclusive document type options: rep = report-type document (default), sow = scope of work
\newif\ifrep\reptrue
\DeclareOption{rep}{\reptrue\sowfalse\emptyfalse}
\newif\ifsow\sowfalse
\DeclareOption{sow}{\repfalse\sowtrue\emptyfalse\ExecuteOptions{10pt}}
\newif\ifempty\emptyfalse
\DeclareOption{empty}{\repfalse\sowfalse\emptytrue}

%%% Use \footnotesize in synopsis true/false
\newif\ifsynopsisfootfont\synopsisfootfontfalse

%%% Display table swapping information
\newif\ifsubstnote\substnotetrue

%%% Option to select paper size.
\PassOptionsToClass{\CurrentOption}{article}

%%% Make url package obey spaces
\PassOptionsToPackage{obeyspaces}{url}

%%% Suppress errors about certain symbols
\PassOptionsToPackage{warn}{textcomp}

%%% Load user options
\openin\pharmtexread=useroptions.txt
\read\pharmtexread to \useroptions
\closein\pharmtexread
\useroptions

%%% Transfer options to main class
\DeclareOption*{\PassOptionsToClass{\CurrentOption,\@@ptsize}{article}}
\ProcessOptions\relax
\LoadClass[\@@ptsize]{article}

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

%%% Settings for blank
\ifempty
	\ifcletterpaper\else\letterpapertrue\fi
	\ifccoverpage\else\coverpagefalse\fi
	\ifctoc\else\tocfalse\fi
	\ifcloa\else\loafalse\fi
	\ifclot\else\lotfalse\fi
	\ifclof\else\loffalse\fi
	\ifcglossary\else\glossaryfalse\fi
	\ifcitemid\else\itemidfalse\fi
\fi

%%% Settings for Word compatible PDF mode
\newcommand{\DocPDFWord}{}
\newcommand{\doDocPDFWord}{0}
\ifeqnimg\renewcommand{\doDocPDFWord}{1}\fi
\ifmathimg\renewcommand{\doDocPDFWord}{1}\fi
\ifconvimg\renewcommand{\doDocPDFWord}{1}\fi
\ifnum\doDocPDFWord=1\renewcommand{\DocPDFWord}{-word}\fi

%%% Settings for copy
\ifcopy
	\newcommand{\docopy}{1}
\else
	\newcommand{\docopy}{0}
\fi

%%% Settings for sorting itemlist
\ifitemsbytime
	\newcommand{\doitemsbytime}{1}
\else
	\newcommand{\doitemsbytime}{0}
\fi

%%% Fix error thrown by chngcntr package. Should be fixed in a later release of MiKTeX
\let\counterwithout\relax
\let\counterwithin\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Include packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\usepackage{scrwfile}
%\usepackage{etex}
\usepackage[utf8]{inputenc}
\usepackage[extendedchars]{grffile}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}
\usepackage{footnotehyper}
\usepackage[table]{xcolor}
\usepackage[usegeometry]{typearea}
\usepackage{scrlayer-scrpage}
\usepackage{geometry, afterpage, etoolbox}
\usepackage[nomessages]{fp}
\usepackage{changepage, amsmath, amssymb, parskip, sectsty, color, setspace, pdfpages}
\usepackage[nooneline, font={small,bf}]{caption}
\usepackage{listings} % or listingsutf8, but it seems to be buggy
\usepackage[figure,table,lstlisting]{totalcount}
\usepackage[hhmmss]{datetime}
\usepackage[pagewise]{lineno}
\usepackage{afterpage, currfile, graphicx, xspace, enumitem, moreenum}
\usepackage[absolute]{textpos}
\usepackage{calc, lipsum}
\usepackage[square, comma, numbers, sort&compress]{natbib}
\usepackage{lastpage, textcomp, tocvsec2}
\usepackage[titles]{tocloft}
\usepackage[compact,bf,explicit]{titlesec}
\usepackage{expl3}
\usepackage{regexpatch}
\usepackage[hang, flushmargin, bottom]{footmisc}
\usepackage[bookmarksnumbered, pdftex, unicode]{hyperref}
\usepackage[open,openlevel=1]{bookmark}
\usepackage[nameinlink, capitalise, noabbrev]{cleveref}
\usepackage{needspace, refcount}
\usepackage{mathptmx, helvet, courier, sansmath}
\usepackage{threeparttable, threeparttablex, booktabs, longtable, tabularx, ltablex, nameref, hhline}
\usepackage[longtable]{multirow}
\usepackage[originalparameters, document]{ragged2e}
\usepackage{bigstrut, here, float, rotating, subcaption, appendix, upquote, chngcntr}
\usepackage{printlen, upgreek, csvsimple, pbox, arrayjobx, xstring, pgf, ifthen, pax, filecontents, ifplatform}
\usepackage{verbatim, newfile, totcount, framed, alltt, environ}
\usepackage{tikz}
\usetikzlibrary{positioning}
\usetikzlibrary{shapes.misc}
\usetikzlibrary{calc}

%%% Packages needed for glossaries package - glossaries is loaded in PharmTeX.sty to allow for pre-compilation of PharmTeX.cls
\usepackage{mfirstuc, textcase, xfor, datatool-base, substr, datatool-fp}

%%% Package for checking page design, showing boxes etc.
%\usepackage{layouts}

%%% Set paper size for KOMA
\KOMAoptions{paper=\mypaperkoma}\recalctypearea

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Custom commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Fix bug in pax package when using filenames with spaces
\newcommand{\mypaxfileinput}{}
\def\PAX@AddAnnots#1#2{%
  \kvsetkeys{PAX@Gin}{#1}%
  \Grot@setangle{\PAX@Gin@angle}%
  % a little careful, is type of angle int or real?
  \loop
  \ifdim\PAX@Gin@angle\p@<360\p@
  \else
    \edef\PAX@Gin@angle{\the\numexpr-360+\number\PAX@Gin@angle}%
  \repeat
  \loop
  \ifdim\PAX@Gin@angle\p@<\z@
    \edef\PAX@Gin@angle{\strip@pt\dimexpr\PAX@Gin@angle\p@+360\p@}%
  \repeat
  \ifcase0\ifnum\PAX@Gin@angle=0 1\fi
          \ifnum\PAX@Gin@angle=90 1\fi
          \ifnum\PAX@Gin@angle=180 1\fi
          \ifnum\PAX@Gin@angle=270 1\fi
    \PackageWarning{pax}{Unsupported value for option angle}%
  \fi
  \filename@parse{#2}%
  \def\PAX@file{\filename@area\filename@base.pax}%
  \let\[\PAX@parser
  \def\<{<}%
  \def\>{>}%
  \endlinechar=-1 %
  \InputIfFileExists{"\PAX@file"}{%
  }{%
    \typeout{* Missing: \PAX@file}%
  }%
}

%%% PharmTeX and bundle versions as numbers
\newcommand{\intpart}[1]{\expandafter\int@part#1..\@nil}
\def\int@part#1.#2.#3\@nil{\if\relax#1\relax0\else#1\fi}
\newcommand{\fracpart}[1]{\expandafter\frac@part#1..\@nil}
\def\frac@part#1.#2.#3\@nil{\if\relax#2\relax0\else#2\fi}
\ifdefined\bundleversion
\pgfmathsetmacro{\bundlenumber}{int(\intpart{\bundleversion}*100 + \fracpart{\bundleversion})}
\else
\newcommand{\bundlenumber}{99999}
\fi
\pgfmathsetmacro{\pharmtexnumber}{int(\intpart{\pharmtexversion}*100 + \fracpart{\pharmtexversion})}

%%% Settings for webhyper
% see bottom of this document

%%% Allow page breaks in multiline equations
\allowdisplaybreaks

%%% Remove extra blank line before equations
\newif\ifsubequations\subequationsfalse
\BeforeBeginEnvironment{subequations}{\nlalign\subequationstrue}
\AfterEndEnvironment{subequations}{\subequationsfalse}
\AtBeginEnvironment{equation}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{equation*}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{eqnarray}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{eqnarray*}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{align}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{align*}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{alignat}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{alignat*}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{gather}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{gather*}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{multline}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{multline*}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{flalign}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}
\AtBeginEnvironment{flalign*}{\ifsubequations\nopagebreak[4]\else\nlalign\fi}

%%% Settings for eqnimg option
\newenvironment{oldsubequations}{%
  \refstepcounter{equation}%
  \protected@edef\theparentequation{\theequation}%
  \setcounter{parentequation}{\value{equation}}%
  \setcounter{equation}{0}%
  \def\theequation{\theparentequation\alph{equation}}%
  \ignorespaces
}{%
  \setcounter{equation}{\value{parentequation}}%
  \ignorespacesafterend
}
\newenvironment{oldalign}{%
  \start@align\@ne\st@rredfalse\m@ne
}{%
  \math@cr \black@\totwidth@
  \egroup
  \ifingather@
    \restorealignstate@
    \egroup
    \nonumber
    \ifnum0=`{\fi\iffalse}\fi
  \else
    $$%
  \fi
  \ignorespacesafterend
}

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
\newcommand{\itemreref}[1]{\renewcommand{\newunderscorename}{}\fixunderscore{#1}\hyperlink{itemnumber#1}{Item \newunderscorename{}}}
\else
\newcommand{\itemref}{Item \theitemnumber}
\newcommand{\itemreref}[1]{\renewcommand{\newunderscorename}{}\fixunderscore{#1}Item \newunderscorename{}}
\fi
\newcommand{\ioutput}{0}
\newcommand{\itemid}[1]{}
\ifitemid
\renewcommand{\itemid}[1]{\ifnum\ioutput=1\renewcommand{\ioutput}{0}\raisebox{3cm}[0pt][0pt]{\hypertarget{itemnumber\theitemnumber}{}}\itemref\xspace\else\raisebox{3cm}[0pt][0pt]{\hypertarget{itemnumber\theitemnumber}{}}\itemref, Artifact ID \artiref{#1}\fi}
\else
\renewcommand{\itemid}[1]{}
\renewcommand{\artiref}[1]{(omitted)\xspace}
\renewcommand{\folderref}[1]{(omitted)\xspace}
\fi

%%% Lengths
\newlength\maxwidth\newlength\maxheight
\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}
\newlength{\myspacer}\setlength{\myspacer}{14.5pt}

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
%%% Note that the % symbols are required to be there, since otherwise a few of the commands using the \checkartifact command will have issues with line spacing
\newcommand\additemrfile{\edef\exptmp{\theitemnumber}\expandafter\g@addto@macro\expandafter\itemrfile\expandafter{\expandafter;\exptmp}}
\newcommand\additemartifact{\edef\exptmp{\theitemnumber}\expandafter\g@addto@macro\expandafter\itemartifact\expandafter{\expandafter;\exptmp}}
\newcommand{\checkartifact}[1]{%
\findartifact{#1}{\docopy}%
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
\newcommand{\tm}{\texttrademark\xspace} % trademark
\newcommand{\nt}{\noindent} % do not indent the first line after an empty line in the .tex file
\newcommand{\nl}{\vspace{-0.9\baselineskip}} % skip back approximately one line, used just before a new equation
\newcommand{\nlalign}{\vspace{-0.9\baselineskip}} % same command, just for use with eqnimg
\newcommand{\nn}{\nonumber} % skip the equation number for a given equation.
\newcommand{\ee}[1]{\cdot 10^{#1}} % *10^ scientific format in pretty print
\newcommand{\degree}{^\circ} % degree symbyl
\newcommand{\s}[1]{_\mathrm{\:\!#1}} % subscript with non-italics in math mode
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
\newcommand{\descfont}{\footnotesize} % default fontsize for description
\newcommand{\tabledeffont}{\footnotesize} % default fontsize for tables
\newcommand{\listingdeffont}{\scriptsize} % default fontsize for listings
\newcommand{\tablefont}{\tabledeffont} % default fontsize for tables
\newcommand{\listingfont}{\listingdeffont} % fontsize for listings
\newcommand{\dotight}{0} % flag for make a table look tighter, i.e. with less whitespace
\newcommand{\pmxtight}{\renewcommand{\dotight}{1}} % command for setting the \dotight flag
\newcommand{\allowchangefont}{1} % change to 0 to disable font changing option (\tablefont) for main body - will then only work in appendices.
\newcommand{\pmxfont}[1]{\ifnum\allowchangefont=1 \renewcommand{\tablefont}{#1} \renewcommand{\listingfont}{#1} \fi} % command for changing the tablefont and listingfont
\newcommand{\pmxtoprule}{\toprule} % default toprule for tables (horizontal line). Apparently the commands interact in different ways with the tabularx environment.
\newcommand{\pmxmidrule}{\midrule} % default midrule for tables (horizontal line). Apparently the commands interact in different ways with the tabularx environment.
\newcommand{\pmxbottomrule}{\bottomrule} % default bottomrule for tables (horizontal line). Apparently the commands interact in different ways with the tabularx environment.
%\newoutputstream{tmp}\newcommand{\savefile}[2]{\openoutputfile{#1}{tmp}\addtostream{tmp}{#2}\closeoutputstream{tmp}}
\newcommand{\hyperoff}[1]{\begin{NoHyper}#1\end{NoHyper}} % command for turning off a specific hyperlink for a \cref command
\newcommand{\bundleos}{\ifwindows{}Win\else{}Lin\fi}
\newcommand{\thefontsize}{\f@size} % font size in pt (print e.g. 12)
\newcommand{\secheadfont}{\normalsize} % font size for section, subsection, etc. headings
\newcommand*{\getlength}[1]{\strip@pt#1} % get length as number without units
\newcommand*\makeAlph[1]{\ifnum#1<27\symbol{\numexpr96+#1}\else\PackageError{PharmTeX}{Number exceeds the number of letters in the alphabet.}{}\fi}
\newcommand{\citelocation}{}

%%% Set page margins
% Headheight:
% 12 pt 1 lines = 14.5 pt (14.49998pt)
% 12 pt 2 lines = 29.0 pt (28.99998pt)
% 12 pt 3 lines = 43.5 pt (43.49998pt)
% 10 pt 1 lines = 14.5pt = \baselineskip
% 10 pt 2 lines = 24.0pt
% 10 pt 3 lines = 36.0pt
%  8 pt 1 lines = 12.0pt = \baselineskip
%  8 pt 2 lines = 19.0pt (18.99998pt)
%  8 pt 3 lines = 28.5pt (28.49998pt)
\newlength{\PmxTopBase}\setlength{\PmxTopBase}{2.55 cm}
\newlength{\PmxBottomBase}\setlength{\PmxBottomBase}{2.65 cm}
\newlength{\PmxLeftBase}\setlength{\PmxLeftBase}{3.175 cm}
\newlength{\PmxRightBase}\setlength{\PmxRightBase}{2.54 cm}
\newlength{\PmxHeadBase}\setlength{\PmxHeadBase}{0.8 cm}
\newlength{\PmxFootBase}\setlength{\PmxFootBase}{1.35 cm}
\newlength{\PmxHeadHeightBase}\setlength{\PmxHeadHeightBase}{43.5 pt}
\newlength{\PmxFootHeightBase}\setlength{\PmxFootHeightBase}{24 pt}
\newlength{\PmxTop}\setlength{\PmxTop}{2.55 cm}
\newlength{\PmxBottom}\setlength{\PmxBottom}{2.65 cm}
\newlength{\PmxLeft}\setlength{\PmxLeft}{3.175 cm}
\newlength{\PmxRight}\setlength{\PmxRight}{2.54 cm}
\newlength{\PmxHead}\setlength{\PmxHead}{0.8 cm}
\newlength{\PmxFoot}\setlength{\PmxFoot}{1.35 cm}
\newlength{\PmxHeadHeight}\setlength{\PmxHeadHeight}{43.5 pt}
\newlength{\PmxFootHeight}\setlength{\PmxFootHeight}{24 pt}
\newcommand{\pmxtop}[1]{\setlength{\PmxTop}{#1}\newgeometry{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, head = \PmxHeadHeight, headsep = \PmxTop-\PmxHead-\PmxHeadHeight, footskip = \PmxBottom-\PmxFoot}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}\KOMAoptions{footheight=\PmxFootHeight}}
\newcommand{\pmxbottom}[1]{\setlength{\PmxBottom}{#1}\newgeometry{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, head = \PmxHeadHeight, headsep = \PmxTop-\PmxHead-\PmxHeadHeight, footskip = \PmxBottom-\PmxFoot}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}\KOMAoptions{footheight=\PmxFootHeight}}
\newcommand{\pmxleft}[1]{\setlength{\PmxLeft}{#1}\newgeometry{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, head = \PmxHeadHeight, headsep = \PmxTop-\PmxHead-\PmxHeadHeight, footskip = \PmxBottom-\PmxFoot}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}\KOMAoptions{footheight=\PmxFootHeight}}
\newcommand{\pmxright}[1]{\setlength{\PmxRight}{#1}\newgeometry{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, head = \PmxHeadHeight, headsep = \PmxTop-\PmxHead-\PmxHeadHeight, footskip = \PmxBottom-\PmxFoot}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}\KOMAoptions{footheight=\PmxFootHeight}}
\newcommand{\pmxhead}[1]{\setlength{\PmxHead}{#1}\newgeometry{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, head = \PmxHeadHeight, headsep = \PmxTop-\PmxHead-\PmxHeadHeight, footskip = \PmxBottom-\PmxFoot}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}\KOMAoptions{footheight=\PmxFootHeight}}
\newcommand{\pmxfoot}[1]{\setlength{\PmxFoot}{#1}\newgeometry{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, head = \PmxHeadHeight, headsep = \PmxTop-\PmxHead-\PmxHeadHeight, footskip = \PmxBottom-\PmxFoot}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}\KOMAoptions{footheight=\PmxFootHeight}}
\newcommand{\pmxheadheight}[1]{\setlength{\PmxHeadHeight}{#1}\newgeometry{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, head = \PmxHeadHeight, headsep = \PmxTop-\PmxHead-\PmxHeadHeight, footskip = \PmxBottom-\PmxFoot}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}\KOMAoptions{footheight=\PmxFootHeight}}
\newcommand{\pmxfootheight}[1]{\setlength{\PmxFootHeight}{#1}\newgeometry{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, head = \PmxHeadHeight, headsep = \PmxTop-\PmxHead-\PmxHeadHeight, footskip = \PmxBottom-\PmxFoot}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}\KOMAoptions{footheight=\PmxFootHeight}}
\geometry{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, head = \PmxHeadHeight, headsep = \PmxTop-\PmxHead-\PmxHeadHeight, footskip = \PmxBottom-\PmxFoot}
\KOMAoptions{footheight=\PmxFootHeight}
\setlength{\maxwidth}{\textwidth}
\setlength{\maxheight}{\textheight}
\newcommand*{\useportrait}{\clearpage\KOMAoptions{paper=portrait,DIV=current}\newgeometry{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, head = \PmxHeadHeight, headsep = \PmxTop-\PmxHead-\PmxHeadHeight, footskip = \PmxBottom-\PmxFoot}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}}
\newcommand*{\uselandscape}{\clearpage\KOMAoptions{paper=landscape,DIV=current}\newgeometry{top = \PmxTop, bottom = \PmxBottom, left = \PmxLeft, right = \PmxRight, head = \PmxHeadHeight, headsep = \PmxTop-\PmxHead-\PmxHeadHeight, footskip = \PmxBottom-\PmxFoot}\setlength{\maxwidth}{\textwidth}\setlength{\maxheight}{\textheight}}
\newenvironment{landscape}{}{}
\BeforeBeginEnvironment{landscape}{\uselandscape}
\AfterEndEnvironment{landscape}{\useportrait}

\addtokomafont{pagehead}{\normalfont\footnotesize}
\addtokomafont{pagefoot}{\normalfont\footnotesize}
\ihead{\ifdefined\HeaderText\HeaderText\fi}
\chead{}
\ohead{}
\ifoot{}
\cfoot{\ifdefined\FooterText\FooterText\else\quad\fi \\ Page \thepage~of~\pageref*{LastPage}\ifwatermark\begin{tikzpicture}[remember picture,overlay,opacity=\WatermarkOpacity,scale=\WatermarkScale,every node/.style={scale=\WatermarkScale}]\node[rotate = 45] at (current page.center) {\Huge{\Watermark}};\end{tikzpicture}\fi}
\ofoot{}

%%% Settings in enumerate and itemize
\setlist{noitemsep}
\setlist[1]{labelindent=\parindent} % < Usually a good idea
\setlist[itemize]{align=parleft,itemsep=3pt,partopsep=0pt,topsep=3pt,labelsep=*,leftmargin=0.3in} % use labelsep=0.3in,leftmargin=* to switch to right side of label for aligning
\setlist[itemize,1]{label=\footnotesize$\bullet$,topsep=3pt}
\setlist[itemize,2]{label=\footnotesize$\circ$,topsep=3pt}
\setlist[itemize,3]{label=\tiny$\square$,topsep=3pt}
\setlist[itemize,4]{label=\tiny$\triangle$,topsep=3pt}
\setlist[enumerate]{align=parleft,itemsep=3pt,partopsep=0pt,topsep=3pt,labelsep=*,leftmargin=0.3in} % use labelsep=0.3in,leftmargin=* to switch to right side of label for aligning
\setlist[enumerate,1]{label=\arabic*.,ref=\arabic*}
\setlist[enumerate,2]{label=\alph*.,ref=\theenumi.\alph*}
\setlist[enumerate,3]{label=\roman*.,ref=\theenumii.\roman*}
\setlist[enumerate,4]{label=\greek*.,ref=\theenumiii.\greek*}

%%% Include .tex doc from another run
%%% This is used for socalled daughter steps where another LatexReport step can be loaded into the present one. All code between \begin{document} and \references is included in the spot where the \pmxinclude command is put in the mother document. It will download the daughter .tex document and print a file called "dotwice" telling runlatex.bat to compile latex an extra time and include any artifacts from the daughter document.
\newcommand{\newunderscorename}{}
\newcommand{\includetexdoc}{}
% \perlnewcommand{\dotwice}{
\newcommand{\pmxinclude}[1]{
\renewcommand{\newunderscorename}{}
\checkartifact{#1}
\fixunderscore{#1}
\ifx\fname\empty
ITEM \newunderscorename{} NOT FOUND
\else
\hypertarget{itemnumber\theitemnumber}{}
\includetex{\fname}
\fi
}

%%% Include a text file from a run.
%%% This command can e.g. load a text file created by an R run containing an important number that will then be put into the spot where the \pmxinput is used. If the artifact is found a \footnote will be created showing the artifact ID.
% \perlnewcommand{\inputtext}[1]{
\newcommand{\pmxtxt}[1]{%
\renewcommand{\newunderscorename}{}
\checkartifact{#1}%
\fixunderscore{#1}%
\ifx\fname\empty%
ITEM \newunderscorename{} NOT FOUND%
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
% \def\@cline#1-#2\@nil{%
  % \omit
  % \@multicnt#1%
  % \advance\@multispan\m@ne
  % \ifnum\@multicnt=\@ne\@firstofone{&\omit}\fi
  % \@multicnt#2%
  % \advance\@multicnt-#1%
  % \advance\@multispan\@ne
  % \leaders\hrule\@height\arrayrulewidth\hfill
  % \cr
  % \noalign{\nobreak\vskip-\arrayrulewidth}}
% \let\pmxcline\cline
\let\pmxcline\cmidrule

% Tools for keeping the description of a table on the same page as the table itself
\renewcommand\TPTminimum{\maxwidth}
\newcommand\gettablemaxwidth{%
  \noalign{\begingroup
  \setlength\TPTL@width{0pt}
  \renewcommand\LT@entry[2]{\global\advance\TPTL@width by ##2}
  \@nameuse{LT@\romannumeral\c@LT@tables}
  \ifdim\TPTL@width<\TPTminimum\relax\global\TPTL@width=\TPTminimum\fi
  \endgroup}
}
\newlength\TPTL@widthh
\newcommand\gettablewidth{%
  \noalign{\begingroup
  \setlength\TPTL@widthh{0pt}
  \renewcommand\LT@entry[2]{\global\advance\TPTL@widthh by ##2}
  \@nameuse{LT@\romannumeral\c@LT@tables}
  \endgroup}
}
\newcommand{\ltcols}{\LT@cols}
\newcommand{\tptlwidth}{\TPTL@width}
\newcommand{\tptlwidthh}{\TPTL@widthh}

%%% Turn off badness 10000 warning
\hbadness=10000
\vbadness=10000
\newcount\hbadness
\newcount\vbadness

%%% Set threshold for overfull hbox/vbox
\hfuzz=10pt
\vfuzz=20pt
\newdimen\hfuzz
\newdimen\vfuzz

%%% Tablenotes. These are local notes within a given table that reset their alpha counter (a, b, c, etc.) for each new table.
\newcounter{tnote}
\newcounter{tnoteglobal}
\crefname{tnote}{Tablenote}{Tablenotes}
%\renewcommand{\thetnote}{$^\text{\alph{tnote}}$}
\renewcommand{\thetnote}{\textsuperscript{\alph{tnote}}}
\renewcommand{\tnote}[2]{\refstepcounter{tnote}\thetnote\space#2\label{#1}}
%\renewcommand{\tnote}[2]{\raisebox{\ht\strutbox}{\hypertarget{#1}{}}\refstepcounter{tnote}\thetnote\space#2\label{#1}}
\newcommand{\tref}[1]{\ref*{#1}} % Disables hyperlinks within tables
%\newcommand{\tref}[1]{\nref{#1}} % Enables hyperlinks within tables. But the hyperlinks in header doesn't always respect nosamepagelinks due to the setup of package longtable/tabularx (firsthead and lasthead are compiled on first and second page only, respectively, not on every page). Thus, hyperlinks are disabled for \tnote. They still work for a \cref to a \tnote.
\newcommand{\tablenote}{} % compatibility with earlier versions of the template

%%% Function for making tables from csv file
\newlength{\pmxtabcolsep}\setlength{\pmxtabcolsep}{\tabcolsep}
\newcounter{pmxcolumnnumber}\setcounter{pmxcolumnnumber}{1}
\newcommand{\istable}{0}
\newcommand{\istextable}{0}
\newcommand{\mypmxcaption}{}
\newcommand{\dodescription}{0}
\newcommand{\myfloatdescription}{}
\newcommand{\mytableitemnumber}{}
\newcommand{\syntab}{0}
\newcommand{\csvtable}{}
\newcommand{\tabletopnote}{}
\ifitemid\newcommand{\doitemid}{1}\else\newcommand{\doitemid}{0}\fi
% \perlnewcommand{\includecsv}[8]{
% start of actual \pmxtable command using \includecsv. RETAIN empty lines in the beginning and end of \pmxtable to make sure line spacing before and after tables is correct.
\newcommand{\tmpsubstnote}{}
\newcommand{\pmxtable}[8][1]{

\setcounter{pmxcolumnnumber}{1}
\renewcommand{\istable}{1}
\renewcommand{\istextable}{0}
\renewcommand{\myfloatdescription}{}
\renewcommand{\dodescription}{0}
\renewcommand{\syntab}{1}
\renewcommand{\csvtable}{}
\renewcommand{\tabletopnote}{}
\renewcommand{\tmpsubstnote}{}
\setcounter{tnote}{0}
\renewcommand{\newunderscorename}{}
\renewcommand{\mypmxcaption}{#6}
\fixglscaption{\mypmxcaption}
\fixunderscore{#2}
\checkartifact{#2}
{\tablefont
\ifx\fname\empty
\begin{tabularx}{\maxwidth}{C{1}} \tablabel{\mypmxcaption}{#5}
	\\\toprule
	 ITEM \newunderscorename{} NOT FOUND \\\midrule\endfirsthead\caption[]{\mypmxcaption}\\\toprule
	 ITEM \newunderscorename{} NOT FOUND \\\midrule\endhead
	\endfoot\bottomrule\endlastfoot
\end{tabularx}
\else
\renewcommand{\mytableitemnumber}{\itemid{#2}}
\fixnewline{\detokenize{#7}}{\doitemid}
\ifitemid{}\renewcommand{\dodescription}{1}\fi\ifthenelse{\equal{\detokenize{#7}}{}}{}{\renewcommand{\dodescription}{1}}
\includecsv{#1}{\fname}{#3}{#4}{#5}{\mypmxcaption}{\detokenize{#8}}{\dotight}{0}
\csvtable
}
\renewcommand{\tablefont}{\tabledeffont}
\renewcommand{\listingfont}{\listingdeffont}
\renewcommand{\dotight}{0}
\renewcommand{\mypmxcaption}{}
\setlength{\tabcolsep}{\pmxtabcolsep}
\fi

}

%%% Function for making tables from a tex file
%%% RETAIN empty lines in the beginning and end of \pmxtextable to make sure line spacing before and after tables is correct.
\newcounter{textable}\setcounter{textable}{0}
\newcommand{\pmxtextable}[6][1]{

\setcounter{pmxcolumnnumber}{1}
\renewcommand{\istable}{1}
\renewcommand{\istextable}{1}
\renewcommand{\myfloatdescription}{}
\renewcommand{\dodescription}{0}
\renewcommand{\syntab}{1}
\renewcommand{\csvtable}{}
\renewcommand{\tabletopnote}{}
\renewcommand{\tmpsubstnote}{}
\setcounter{tnote}{0}
\renewcommand{\mypmxcaption}{#4}
\fixglscaption{\mypmxcaption}
\addtocounter{textable}{1}

%% Load via printed file.
\savefile{file.tmp.txt}{\detokenize{#6}}
{\tablefont
\renewcommand{\mytableitemnumber}{Inline table}
\fixnewline{\detokenize{#5}}{\doitemid}
\ifitemid{}\renewcommand{\dodescription}{1}\fi\ifthenelse{\equal{\detokenize{#5}}{}}{}{\renewcommand{\dodescription}{1}}
\includecsv{#1}{file.tmp.txt}{tex}{#2}{#3}{\mypmxcaption}{}{\dotight}{1}
\csvtable
}
\renewcommand{\tablefont}{\tabledeffont}
\renewcommand{\listingfont}{\listingdeffont}
\renewcommand{\dotight}{0}
\renewcommand{\mypmxcaption}{}
\setlength{\tabcolsep}{\pmxtabcolsep}

}

%%% Function for inserting tables from image files
\newcommand{\pmxfigtable}[5]{
	\renewcommand{\myfloatdescription}{}
	\fixnewline{\detokenize{#4}}{\doitemid}
	\renewcommand{\istable}{1}
	\renewcommand{\newunderscorename}{}
	\renewcommand{\mypmxcaption}{#3}
	\fixglscaption{\mypmxcaption}
	\fixunderscore{#1}
	\checkartifact{#1}
	\ifx\fname\empty
	\edef\numberofpages{1}
	\else
	\ifthenelse{\equal{\fext}{pdf}}{\pdfpages{\fname}}{\edef\numberofpages{1}}
	\fi
	\begin{table}[H]
		\hypertarget{#2}{}\caption{\mypmxcaption}\label{#2}
		\addtocontents{lot}{\protect{\bookmark[rellevel=1,keeplevel,dest=#2]{\tablename~\thetable. \mypmxcaption}}}
		\ifx\fname\empty ITEM \newunderscorename{} NOT FOUND \else \includegraphics[page=1,#5]{\fname} \fi
		\ifnum\numberofpages=1
		\\\vspace{0.2\baselineskip}
		\descfont\ifitemid{}\itemid{#1}.\fi\ifthenelse{\equal{\detokenize{#4}}{}}{}{\xspace\myfloatdescription~}
		\fi
	\end{table}
	\vspace{-0.8\baselineskip}
	\ifnum\numberofpages>1
	\foreach \x in {2,...,\numberofpages}{
		\addtocounter{table}{-1}
		\begin{table}[H]
			\caption[]{\mypmxcaption}
			\includegraphics[page=\x,#5]{\fname}
			\ifnum\x=\numberofpages
			\\\vspace{0.2\baselineskip}
			\descfont\ifitemid{}\itemid{#1}.\fi\ifthenelse{\equal{\detokenize{#4}}{}}{}{\xspace\myfloatdescription}
			\fi
		\end{table}
		\vspace{-0.8\baselineskip}
		\ifnum\x<\numberofpages
		\clearpage
		\fi}
	\fi
	\renewcommand{\mypmxcaption}{}
}

%%% List of Numbers
\newcommand{\numberlistname}{LIST OF NUMBERS}
\newcounter{listofnumbersvalue}
\newcommand{\rout}[1]{\ifdefined\LonFile\loadlistofnumbersvalue{\pmxlonallnum}{\pmxlonallpath}{\pmxlonallvar}{\pmxlonalltime}{\detokenize{#1}}{\thelistofnumbersvalue}\addtocounter{listofnumbersvalue}{1}\else\PackageError{PharmTeX}{\@backslashchar lonfile needs to be defined for \@backslashchar rout to work.}{}\fi}
\newcommand{\pmxlonnum}{}
\newcommand{\pmxlonpath}{}
\newcommand{\pmxlonvar}{}
\newcommand{\pmxlontime}{}
\newcommand{\pmxlonpage}{}

\newcommand{\numberlist}{

\renewcommand{\csvtable}{}
\section*{\centering\numberlistname}
\phantomsection
\hypertarget{numberlisttarget}{}
\hypertarget{itemnumber\thelonitemid}{}
\label{numberlist}
\addtocontents{toc}{\@backslashchar contentsline {section}{\numberlistname}{\@backslashchar pageref{numberlist}}{numberlisttarget}}
\bookmark[level=1,dest=numberlisttarget,startatroot]{\numberlistname}
\IfStrEqCase{\thefontsize}{
{10}{\small}
{10.95}{\footnotesize}
{12}{\scriptsize}
}[]
\printlistofnumbers{\pmxlonnum}{\pmxlonpath}{\pmxlonvar}{\pmxlontime}
\addtocounter{table}{-1}
\normalsize

}

%%% List of Items. This code below, including the perl code, creates the latex code for the list of items table. It is a longtable instead of a tabularx.
\ifcopy\newcommand{\docopyfiles}{1}\else\newcommand{\docopyfiles}{0}\fi
\newcommand{\itemlistname}{LIST OF ITEMS}
\newcommand{\mysp}{\phantom{...}}
% \perlnewcommand{\includemetacsv}[3]{

\newcommand{\itemlist}{

\iflon\ifnum\thelistofnumbersvalue>0\numberlist\clearpage\fi\fi

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
\renewcommand{\tabletopnote}{}
\includemetacsv{\artifacts}{\rfiles}{\theitemnumber}{\itemartifact}{\itemrfile}{\docopyfiles}{\doitemsbytime}
%\begin{landscape}
\section*{\centering\itemlistname}
\phantomsection
\hypertarget{itemlisttarget}{}
\label{itemlist}
\addtocontents{toc}{\@backslashchar contentsline {section}{\itemlistname}{\@backslashchar pageref{itemlist}}{itemlisttarget}}
\bookmark[level=1,dest=itemlisttarget,startatroot]{\itemlistname}
\IfStrEqCase{\thefontsize}{
{10}{\small}
{10.95}{\footnotesize}
{12}{\scriptsize}
}[]
\setlength\LTcapwidth{\maxwidth} % default: 4in
\setlength\LTleft{0pt}           % default: \parindent
\setlength\LTright{0pt}          % default: \fill
\csvtable
%\end{landscape}
\fi\fi
\normalsize

}

%%% Include figures from image files. The code below creates the \pmxfigure command.
% Perl function for plotting PDF files with one or several page
\newcommand{\isfigure}{0}
\newcommand{\synfig}{0}
\newcommand{\tmpstr}{}
\newcommand{\figcapbelow}{0}
% \perlnewcommand{\makesubfigopt}[1]{
% \perlnewcommand{\makesubfig}[3]{
\newcommand{\issubfigure}{0}
% Create \pmxfigure command
\newcommand{\pmxfigure}[5]{

\renewcommand{\myfloatdescription}{}
\fixnewline{\detokenize{#4}}{\doitemid}
\renewcommand{\isfigure}{1}
\renewcommand{\mypmxcaption}{#3}
\fixglscaption{\mypmxcaption}
\renewcommand{\synfig}{1}
\begingroup
\renewcommand{\tmpstr}{}
\IfSubStr{#1}{&}{\renewcommand{\issubfigure}{1}}{\IfSubStr{#1}{|}{\renewcommand{\issubfigure}{1}}{\renewcommand{\issubfigure}{0}}}
\IfSubStr{\issubfigure}{1}{
\makesubfigopt{#5}
\iffigcapbelow\renewcommand{\figcapbelow}{1}\else\renewcommand{\figcapbelow}{0}\fi
\begin{figure}[H]
\makesubfig{#1}{#2}{\mypmxcaption}{\figcapbelow}
\descfont\ifthenelse{\equal{\detokenize{#4}}{}}{}{\myfloatdescription}
\end{figure}
\vspace{-0.8\baselineskip}
}{
\renewcommand{\newunderscorename}{}
\fixunderscore{#1}
\checkartifact{#1}
\ifx\fname\empty
\edef\numberofpages{1}
\else
\ifthenelse{\equal{\fext}{pdf}}{\pdfpages{\fname}}{\edef\numberofpages{1}}
\fi
\ifnum\numberofpages>1\renewcommand{\tmpstr}{ (1 of \numberofpages)}\else\renewcommand{\tmpstr}{}\fi
\begin{figure}[H]
	\iffigcapbelow\else\figlabel{\mypmxcaption\tmpstr}{#2}\fi % caption above
	\ifx\fname\empty ITEM \newunderscorename{} NOT FOUND \else \includegraphics[page=1,#5]{\fname} \fi
	\iffigcapbelow\figlabel{\mypmxcaption\tmpstr}{#2}\fi % caption below
	\ifnum\numberofpages=1
	\iffigcapbelow\else\\[0.4\myspacer]\fi % caption above
	\iffigcapbelow\quad\\[-0.5\myspacer]\fi % caption below
	\descfont\ifitemid{}\itemid{#1}.\fi\ifthenelse{\equal{\detokenize{#4}}{}}{}{\xspace\myfloatdescription~}\fi
\end{figure}
\vspace{-0.8\baselineskip}
\ifnum\numberofpages>1
%\clearpage
\foreach \x in {2,...,\numberofpages}{
\addtocounter{figure}{-1}
\begin{figure}[H]
	\iffigcapbelow\else\caption[]{\mypmxcaption{} (\x{} of \numberofpages)}\fi % caption above
	\includegraphics[page=\x,#5]{\fname}
	\iffigcapbelow\caption[]{\mypmxcaption (\x{} of \numberofpages)}\fi % caption below
	\ifnum\x=\numberofpages
	\iffigcapbelow\else\\[0.4\myspacer]\fi % caption above
	\iffigcapbelow\quad\\[-0.5\myspacer]\fi % caption below
	\descfont\ifitemid{}\itemid{#1}.\fi\ifthenelse{\equal{\detokenize{#4}}{}}{}{\xspace\myfloatdescription}\fi
\end{figure}
\vspace{-0.8\baselineskip}
\ifnum\x=\numberofpages\else\clearpage\fi}
\fi}
\renewcommand{\mypmxcaption}{}
\endgroup

}

%%% Create \pmxtexfigure command
\newcommand{\pmxtexfigure}[4]{

\renewcommand{\myfloatdescription}{}
\fixnewline{\detokenize{#3}}{\doitemid}
\renewcommand{\isfigure}{1}
\renewcommand{\mypmxcaption}{#2}
\fixglscaption{\mypmxcaption}
\renewcommand{\synfig}{1}
\begingroup
\begin{figure}[H]
	\iffigcapbelow\else\figlabel{\mypmxcaption}{#1}\fi % caption above
	#4
	\iffigcapbelow\figlabel{\mypmxcaption}{#1}\fi % caption below
	\iffigcapbelow\else\\[0.4\myspacer]\fi % caption below
	\iffigcapbelow\quad\\[-0.5\myspacer]\fi % caption below
	\descfont\ifshowinlinetable\ifitemid{}Inline figure\tmpsubstnote\fi\fi\ifthenelse{\equal{\detokenize{#3}}{}}{}{\xspace\myfloatdescription}
\end{figure}
\vspace{-0.8\baselineskip}
\renewcommand{\mypmxcaption}{}
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
	moretexcs={gls, newacronym, multirow, subsection, subsubsection, paragraph, subparagraph, cref, logo, refstyle, reffile, glsfile, docpdfname, headertext, footertext, doctype, doctitle, docdate, coverline, coverline, docauthor, coverpage, approverline, docapprover, signaturepage, synopsis, references, appendix, pmxfigure, pmxtable, pmxtextable, pmxpdf, pmxlisting, pmxinclude, pmxinput, pmxtxt, SweaveInput, SweaveOpts, perlnewcommand, add, newcommand, newline, Sexpr, pmxtexfigure, setatomsep, chemfig, color, schemestart, arrow, schemestop, Cref, cpageref, Cpageref, nref, glspl, Glspl, Gls, newglossaryentry, dfrac, itemlist, qapage, function, text, convimg, pmxfigtable, pmx, pmxfont, pmxtight, pmxtop, pmxbottom, pmxleft, pmxright, pmxhead, pmxfoot, rout}
}
\lstdefinelanguage{Monolix}{morekeywords={LONGITUDINAL, DESCRIPTION, PK, EQUATION, EQUATION, OUTPUT, ddt}, comment=[l];}[keywords, comments, strings]
\lstdefinelanguage{Nonmem}{alsoletter={...}, morekeywords={\$PROBLEM, \$INPUT, \$DATA, \$SUBROUTINES, \$PK, \$MODEL, \$DES, \$THETA, \$OMEGA, \$SIGMA, \$ERROR, \$COV, \$TABLE, \$ESTIMATION, \$COVARIANCE, \$EST, \$COV, \$SUBR, \$ERR, BLOCK, COMP, THETA, ETA, ERR, EPS, IF, THEN, ELSE, ENDIF}, comment=[l];, morecomment=[l]..., morestring=[m]'}[keywords, comments, strings]
\newcommand{\matlabfont}[1]{\matlabbasicfont{#1}\normalfont}
\newcommand{\dootherlang}{0}
\newcommand{\pmxlisting}[5]{

\renewcommand{\dootherlang}{0}
\phantom{X}\vspace{-1.1\baselineskip}
\checkartifact{#1}
\renewcommand{\mypmxcaption}{#4}
\fixglscaption{\mypmxcaption}
\ifx\fname\empty
{\listingfont\printtmplisting{#1}}
\lstinputlisting[numbers={none},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}
\else
\printlstlisting{\fname}
% RETAIN % symbols below, if not, line spacing will not behave properly
\IfStrEqCase{#2}{%
{monolix}{\lstinputlisting[language={Monolix},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{Monolix}{\lstinputlisting[language={Monolix},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{MONOLIX}{\lstinputlisting[language={Monolix},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{nonmem}{\lstinputlisting[language={Nonmem},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{Nonmem}{\lstinputlisting[language={Nonmem},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{NONMEM}{\lstinputlisting[language={Nonmem},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{matlab}{\lstinputlisting[language={Matlab},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{MATLAB}{\lstinputlisting[language={Matlab},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{r}{\lstinputlisting[language={R},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{R}{\lstinputlisting[language={R},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
{}{\lstinputlisting[language={Fortran},keywordstyle={\color[rgb]{0,0,0}},commentstyle={\color[rgb]{0,0,0}},stringstyle={\color[rgb]{0,0,0}},caption={#4},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}}%
}[\renewcommand{\dootherlang}{1}]%
\ifnum\dootherlang=1 \lstinputlisting[language={#2},caption={\mypmxcaption},label={#3},aboveskip={0\baselineskip},belowskip={1\baselineskip},numbers=left,frame=none,basicstyle={\scriptsize\ttfamily}]{file.tmp.txt}\fi
\fi
{\descfont
\vspace{-1.2\baselineskip}
\ifitemid{}\itemid{#1}.\fi\ifthenelse{\equal{\detokenize{#5}}{}}{}{\xspace#5}
}
\renewcommand{\tablefont}{\tabledeffont}
\renewcommand{\listingfont}{\listingdeffont}
\renewcommand{\mypmxcaption}{}

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
    \node[rotate = 0, align=\xta, anchor=\xal] at ([xshift=\xs+0.5\PmxLeft-0.5\PmxRight, yshift=0.8cm+0.73cm+\PmxBottom-\PmxBottomBase-\PmxFoot+\PmxFootBase]current page.south) {\footnotesize{\textbf{Main Page \thepage~of~\pageref*{LastPage}}}};
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
    \node[rotate = 90, align=\xta, anchor=\xal] at ([xshift=-0.8cm-0.73cm-\PmxBottom+\PmxBottomBase+\PmxFoot-\PmxFootBase, yshift=\xsl+0.5\PmxLeft-0.5\PmxRight]current page.east) {\footnotesize{\textbf{Main Page \thepage~of~\pageref*{LastPage}}}};
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
{l}{\renewcommand{\xs}{ \ifletterpaper -8.12cm \else -7.77cm \fi }\renewcommand{\xta}{left}\renewcommand{\xal}{west}}
{c}{\renewcommand{\xs}{0.00cm}\renewcommand{\xta}{center}\renewcommand{\xal}{center}}
{r}{\renewcommand{\xs}{ \ifletterpaper 8.12cm \else 7.77cm \fi }\renewcommand{\xta}{right}\renewcommand{\xal}{east}}
}
\IfStrEqCase{#3}{
{l}{\renewcommand{\xsl}{ \ifletterpaper -11.27cm \else -12.14cm \fi }\renewcommand{\xta}{left}\renewcommand{\xal}{west}}
{c}{\renewcommand{\xsl}{0.00cm}\renewcommand{\xta}{center}\renewcommand{\xal}{center}}
{r}{\renewcommand{\xsl}{ \ifletterpaper 11.27cm \else 12.14cm \fi }\renewcommand{\xta}{right}\renewcommand{\xal}{east}}
}
\renewcommand{\newunderscorename}{}
\fixunderscore{#2}
\checkartifact{#2}
\label{#4}
\ifx\fname\empty
ITEM \newunderscorename{} NOT FOUND
\else

\copytmppdffile{\fname}

%%% Use Pax (Perl script) to extract hyperlinks from external PDF and custom Perl script to extract PDF bookmarks (side pane)
\fixpax{\fbase}
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

\renewcommand{\newunderscorename}{}
\fixunderscore{#2}

ITEM \newunderscorename{} OMITTED DUE TO "noexpdf" OPTION.\label{#4}

\fi

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Fonts and other settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifnum\bundlenumber>101
\newcommand{\bfac}{0.81}
\newcommand{\efac}{0.45}
\titlespacing{\section}{0pt}{\bfac\baselineskip}{\efac\baselineskip}
\titlespacing{\subsection}{0pt}{\bfac\baselineskip}{\efac\baselineskip}
\titlespacing{\subsubsection}{0pt}{\bfac\baselineskip}{\efac\baselineskip}
\titlespacing{\paragraph}{\parindent}{\bfac\baselineskip}{\efac\baselineskip}
\titlespacing{\subparagraph}{0pt}{\bfac\baselineskip}{\efac\baselineskip}
\else
\titlespacing{\section}{0pt}{*0}{*-1}
\titlespacing{\subsection}{0pt}{*0}{*-1}
\titlespacing{\subsubsection}{0pt}{*0}{*-1}
\titlespacing{\paragraph}{\parindent}{*0}{*-1}
\titlespacing{\subparagraph}{0pt}{*0}{*-1}
\fi
\titleformat{\section}{\normalsize\bfseries}{\thesection.}{4pt}{\MakeUppercase{#1}}
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
\newcommand{\listappendixname}{LIST OF APPENDICES}
\newlistof{appendix}{loa}{LIST OF APPENDICES}
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
\oldacl@pp{loa}{##2}{\appendixname\space ##3}%
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
% \ooldacl@pp{loa}{##2}{\appendixname\space ##3}%
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
% \oooldacl@pp{loa}{##2}{\appendixname\space ##3}%
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
% \ooooldacl@pp{loa}{##2}{\appendixname\space ##3}%
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
% \oooooldacl@pp{loa}{##2}{\appendixname\space ##3}%
      \else
        \oooooldacl@pp{##1}{##2}{##3}%
      \fi
    \else
      \oooooldacl@pp{##1}{##2}{##3}%
    \fi}

\titleformat{\section}{\normalsize\bfseries}{\raisebox{\ht\strutbox}{\hypertarget{app\thenumberappendix}{}}\bookmark[level=1,dest=app\thenumberappendix]{\appendixname~\thenumberappendix. ##1}\appendixname~\thesection.}{4pt}{##1}
\titleformat{\subsection}{\normalsize\bfseries}{\raisebox{\ht\strutbox}{\hypertarget{app\thesubsection}{}}\bookmark[level=2,dest=app\thesubsection]{A\thesubsection. ##1}A\thesubsection.}{4pt}{##1}
\titleformat{\subsubsection}{\normalsize\bfseries}{\raisebox{\ht\strutbox}{\hypertarget{app\thesubsubsection}{}}\bookmark[level=2,dest=app\thesubsubsection]{A\thesubsubsection. ##1}A\thesubsubsection.}{4pt}{##1}
\titleformat{\paragraph}{\normalsize\bfseries}{A\theparagraph.}{4pt}{##1}
\titleformat{\subparagraph}{\normalsize\bfseries}{A\thesubparagraph.}{4pt}{##1}
\counterwithin{equation}{section}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{lstlisting}{section}
\renewcommand\theequation{A\arabic{section}.\arabic{equation}}
\renewcommand\thefigure{A\arabic{section}.\arabic{figure}}
\renewcommand\thetable{A\arabic{section}.\arabic{table}}
\renewcommand\thelstlisting{A\arabic{section}.\arabic{lstlisting}}
\renewcommand{\citelocation}{A\arabic{section}.}

\newtotcounter{numberappendix}
\ifnum\totvalue{numberappendix}>2
\bookmark[level=0,dest=app]{APPENDICES}
\fi

\begin{appendices}

\renewcommand{\setthesection}{\arabic{section}}
\renewcommand{\setthesubsection}{\arabic{subsection}}
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\theHsection}{\Alph{section}}
\def\bibsection{\subsection{References}\csname biblst@rthook\endcsname\par}
\newcounter{appcitenum}\setcounter{appcitenum}{0}

\crefalias{section}{appsec}
\crefalias{subsection}{appsubsec}
\crefalias{subsubsection}{appsubsubsec}
\crefalias{paragraph}{apppar}
\crefalias{subparagraph}{appsubpar}
\let\stdsection\section
\renewcommand\section{\ifnum\thenumberappendix>0\ifnum\theappcitenum>0\fixmultibib{\RefFile}{XA\alph{numberappendix}}\csname bibliographyXA\alph{numberappendix}\endcsname{XA\alph{numberappendix}.bib}\fi\fi\setcounter{appcitenum}{0}\stepcounter{numberappendix}\expandafter\let\csname citen\expandafter\endcsname\csname citeXA\alph{numberappendix}\endcsname\let\oriciten\citen\renewcommand\citen{\stepcounter{appcitenum}\oriciten}\expandafter\let\csname citea\expandafter\endcsname\csname citetXA\alph{numberappendix}\endcsname\let\oricitea\citea\renewcommand\citea{\stepcounter{appcitenum}\oricitea}\expandafter\let\csname Citea\expandafter\endcsname\csname CitetXA\alph{numberappendix}\endcsname\let\oriCitet\Citet\renewcommand\Citet{\stepcounter{appcitenum}\oriCitet}\expandafter\let\csname citey\expandafter\endcsname\csname citeyearXA\alph{numberappendix}\endcsname\let\oricitey\citey\renewcommand\citey{\stepcounter{appcitenum}\oricitey}\clearpage\ifappgls\glsresetall\fi\ifnum\thenumberappendix=1\hypertarget{app}{}\fi\stdsection}
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
\titleformat{name = \section, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{1}{##1}\secheadfont\bfseries}{}{0pt}{##1}
\titleformat{name = \subsection, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{2}{##1}\secheadfont\bfseries}{}{0pt}{##1}
\titleformat{name = \subsubsection, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{3}{##1}\secheadfont\bfseries}{}{0pt}{##1}
\titleformat{name = \paragraph, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{4}{##1}\secheadfont\bfseries}{}{0pt}{##1}
\titleformat{name = \subparagraph, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{5}{##1}\secheadfont\bfseries}{}{0pt}{##1}
\else
\titleformat{name = \section, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{2}{##1}\secheadfont\bfseries}{}{0pt}{##1}
\titleformat{name = \subsection, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{3}{##1}\secheadfont\bfseries}{}{0pt}{##1}
\titleformat{name = \subsubsection, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{4}{##1}\secheadfont\bfseries}{}{0pt}{##1}
\titleformat{name = \paragraph, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{5}{##1}\secheadfont\bfseries}{}{0pt}{##1}
\titleformat{name = \subparagraph, numberless}{\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{6}{##1}\secheadfont\bfseries}{}{0pt}{##1}
\fi
}
\newcommand{\normsecs}{
\titleformat{name = \section, numberless}{\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subsection, numberless}{\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subsubsection, numberless}{\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \paragraph, numberless}{\normalsize\bfseries}{}{0pt}{##1}
\titleformat{name = \subparagraph, numberless}{\normalsize\bfseries}{}{0pt}{##1}
}

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
\renewcommand{\listappendixname}{\selectfont \normalsize {\centerline{LIST OF APPENDICES}}}
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
\ifnum\bundlenumber<103
\setlength{\cftbeforesecskip}{0pt}
\renewcommand\cftsecafterpnum{\vskip-4pt}
\renewcommand\cftsubsecafterpnum{\vskip-4pt}
\renewcommand\cftsubsubsecafterpnum{\vskip-4pt}
\else
\setlength{\cftbeforesecskip}{11.7pt}
\renewcommand\cftsecafterpnum{\vskip7.77pt}
\renewcommand\cftsubsecafterpnum{\vskip7.77pt}
\renewcommand\cftsubsubsecafterpnum{\vskip7.77pt}
\setlength{\cftbeforefigskip}{11.7pt}
\setlength{\cftbeforetabskip}{11.7pt}
\renewcommand\cftfigafterpnum{\vskip0.1pt}
\renewcommand\cfttabafterpnum{\vskip0.1pt}
\fi
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
	pdfcreator={PharmTeX-Class-\pharmtexversion}
}
\ifdefined\bundleversion\hypersetup{pdfproducer={PharmTeX-Bundle-\bundleos-\bundleversion}}\fi
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
\renewcommand\listofappendix{%
  \iflof
    \section*{\listappendixname}%
 \fi
 \iflof
  \@starttoc{loa}%
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
\newcommand{\docstate}[1]{\newcommand{\DocState}{#1\xspace}}
\newcommand{\docpdfname}[1]{\ifsynonly\def\DocPDFName{#1-synopsis}\else\def\DocPDFName{#1}\fi}
\newcommand{\logo}[2][scale=1]{\newcommand{\Logo}{\includegraphics[#1]{#2}}}
\newcommand{\refstyle}[1]{\checkfile{#1}{RefStyle}}
\newcommand{\reffile}[1]{\checkfile{#1}{RefFile}\fixbib{\RefFile}\edef\RefFileOrig{#1}}
\newcommand{\lonfile}[1]{\newcommand{\LonFile}{#1}\checkartifact{\LonFile}\newcounter{lonitemid}\setcounter{lonitemid}{\theitemnumber}\ifx\fname\empty\PackageError{PharmTeX}{\@backslashchar lonfile not found, but is needed for \@backslashchar rout to work.}{}\else\loadlistofnumbers{\LonFile}\fi}
\newcommand{\synopsis}[1]{\newcommand{\insertsynopsis}{#1}}
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

\quad\vspace{-1.5\myspacer}
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
\newcommand{\approvalpagename}{APPROVAL PAGE}
\newcommand{\docapprover}[1]{\expandafter\def\csname DocApprover\alph{napprover}\endcsname{#1}\addtocounter{napprover}{1}}

\newcommand{\insertsigpage}{

\ifdefined\DocApprovera
\quad\vspace{-1.5\myspacer}
\renewcommand{\arraystretch}{1.2}
\begin{tabularx}{\maxwidth}{|l|L{1}|} \hline
\multicolumn{2}{|c|}{\textbf{}} \\
\multicolumn{2}{|c|}{\textbf{\DocType}} \\ \hline
Report Title: & \DocTitle \\ \hline
Date Issued: & \DocDate \\ \hline
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% QA page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{nqaapprover}
\setcounter{nqaapprover}{1}
\newcommand{\QaApprover}{}
\newcommand{\qaapprover}[1]{\expandafter\def\csname QaApprover\alph{nqaapprover}\endcsname{#1}\addtocounter{nqaapprover}{1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Settings for the glossary (used to be here)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Counter for bibliography to determine if any citations are used
%\newtotcounter{citenum}
%\let\oldcite\bibcite
%\def\bibcite{\stepcounter{citenum}\oldcite}

% %%% Disable empty bibliography warning
% \let\myBib\thebibliography
% \let\endmyBib\endthebibliography
% \renewcommand\thebibliography[1]{\ifx\relax#1\relax\else\myBib{#1}\fi}

%%% Bibliography setup
\newcommand{\doprintbibliography}{1}
\newcommand{\references}{
\checkemptybib{\jobname}
\ifnum\doprintbibliography=1
\begingroup

\setbiblabelwidth{100}
%\ifnum\thecitenum>0
\clearpage
\ifsynonly
\def\bibsection{\bookmark[level=1,dest=synref]{REFERENCES}\hypertarget{synref}{}\section*{REFERENCES}\csname biblst@rthook\endcsname\par}
\else
\def\bibsection{\section{REFERENCES}\csname biblst@rthook\endcsname\par}
\fi
%\else
%\def\bibsection{}
%\fi

\ifdefined\RefStyle
\bibliographystyle{\RefStyle}
\else
\bibliographystyle{unsrt}
\fi

\ifdefined\RefFile
%\ifnum\thecitenum>0
\checkartifact{\RefFileOrig}
\hypertarget{itemnumber\theitemnumber}{}
%\fi
\ifx\fname\empty
ITEM \RefFile.bib NOT FOUND.
\savefile{pmxref-tmpfixfile.bib}{}
\bibliography{pmxref-tmpfixfile.bib}
\else
\bibliography{\RefFile}
\fi

\else
\savefile{pmxref-tmpfixfile.bib}{}
\bibliography{pmxref-tmpfixfile.bib}
\fi

\endgroup
%\else
%\def\bibsection{}
\fi
}

%%% Synopsis references
\newcommand{\synrefname}{References}
\newcounter{synrefcnt}\setcounter{synrefcnt}{0}
\newcommand{\synreferences}{

\ifnum\thesynrefcnt>0
\begingroup
\fixmultibib{\RefFile}{XS}
\setbiblabelwidth{10}
\stepcounter{mysyncnt}\hypertarget{mysynhyper\roman{mysyncnt}}{}\addsynsec{\roman{mysyncnt}}{2}{\synrefname}
\def\bibsection{\section*{\ifsynopsisfootfont\footnotesize\fi{}\synrefname}\csname biblst@rthook\endcsname\par}

\ifdefined\RefStyle
\bibliographystyleXS{\RefStyle}
\else
\bibliographystyleXS{unsrt}
\fi
\bibliographyXS{XS.bib}

\endgroup
\fi

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
\newcommand{\qabookmark}{}
\newcommand{\synbookmark}{}
\newcommand{\tocbookmark}{}
\newcommand{\loabookmark}{}
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

%%% Load elements of the R Sweave package. Do not load the package itself in latex, since some elements cause issues with the setup of this template file.
%%% SWEAVE SETUP START %%%
\RequirePackage{ifthen}
\newboolean{Sweave@gin}
\setboolean{Sweave@gin}{true}
\newboolean{Sweave@ae}
\setboolean{Sweave@ae}{true}
\newboolean{Sweave@inconsolata}
\setboolean{Sweave@inconsolata}{false}

\DeclareOption{nogin}{\setboolean{Sweave@gin}{false}}
\DeclareOption{noae}{\setboolean{Sweave@ae}{false}}
\DeclareOption{inconsolata}{\setboolean{Sweave@ae}{false}\setboolean{Sweave@inconsolata}{true}}
\ProcessOptions

\RequirePackage{graphicx,fancyvrb,textcomp}
%% inspired by an earlier version of upquote.sty
% \begingroup
% \catcode`'=\active \catcode``=\active
% \g@addto@macro\@noligs{\let`\textasciigrave \let'\textquotesingle}
% \endgroup

% \ifthenelse{\boolean{Sweave@gin}}{\setkeys{Gin}{width=0.8\textwidth}}{}%
\ifthenelse{\boolean{Sweave@ae}}{%
  %\RequirePackage[T1]{fontenc}
  %\RequirePackage{ae}
}{}%
% see comment in Rd.sty
\ifthenelse{\boolean{Sweave@inconsolata}}{%
 \IfFileExists{zi4.sty}{\usepackage[noupquote]{zi4}}{\usepackage{inconsolata}}}{}

\DefineVerbatimEnvironment{Sinput}{Verbatim}{fontshape=sl}
\DefineVerbatimEnvironment{Soutput}{Verbatim}{}
\DefineVerbatimEnvironment{Scode}{Verbatim}{fontshape=sl}

\ifdefined\Schunk%
  \message{\string Environment Schunk is already defined, stay with former definition}%
\else
  \newenvironment{Schunk}{}{}%
\fi

\newcommand{\Sconcordance}[1]{%
  \ifx\pdfoutput\undefined%
  \csname newcount\endcsname\pdfoutput\fi%
  \ifcase\pdfoutput\special{#1}%
  \else%
   \begingroup%
     \pdfcompresslevel=0%
     \immediate\pdfobj stream{#1}%
     \pdfcatalog{/SweaveConcordance \the\pdflastobj\space 0 R}%
   \endgroup%
  \fi}
%%% SWEAVE SETUP END %%%

%%% Add a couple of commands to handle Sweave docs without R
\let\pmxinput\input
\let\SweaveInput\input
\newcommand{\SweaveOpts}[1]{}

% Function for putting in a bookmark without a number, can be used on approval page
\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}

\catcode`\*=11
\makeatletter
\let\oricite\cite

% \let\citet\undefined
\let\citep\undefined
\let\citet*\undefined
\let\citep*\undefined
% \let\Citet\undefined
\let\Citep\undefined
\let\Citet*\undefined
\let\Citep*\undefined
\let\citealt\undefined
\let\citealt*\undefined
\let\citealp\undefined
\let\citealp*\undefined
\let\Citealt\undefined
\let\Citealt*\undefined
\let\Citealp\undefined
\let\Citealp*\undefined
\let\citenum\undefined
\let\citetext\undefined
\let\citeauthor\undefined
\let\citeauthor*\undefined
\let\Citeauthor\undefined
\let\Citeauthor*\undefined
% \let\citeyear\undefined
\let\citeyearpar\undefined
\let\defcitealias\undefined
\let\citetalias\undefined
\let\citepalias\undefined

\let\citen\cite
\let\citea\citet
\let\Citea\Citet
\let\citey\citeyear
\let\oriciteyear\citeyear\RenewDocumentCommand{\citey}{O{} O{} m}{\begin{NoHyper}\oriciteyear[#1][#2]{#3}\end{NoHyper}}

\let\oriciten\citen
\let\oricitet\citea
\let\oriCitet\Citea
\let\oricitey\citey

\makeatother
\catcode`\*=12

\newcommand{\numappendix}{12}

%%% Below is code to be executed at \begin{document}.
%%% Note, however, that code in the \AtBeginDocument hook is part of the preamble. Thus, restrictions limit what can be put there; in particular, no typesetting can be done.
%%% A better hook is provided as \AfterEndPreamble of package etoolbox, which is executed at the very end of \begin{document}, after the \AtBeginDocument stuff.
\AtBeginDocument{

\newcommand{\tmpcitearg}{}

\newcites{XS}{References}
\let\oriciteXS\citeXS\RenewDocumentCommand{\citeXS}{O{} O{} m}{\stepcounter{synrefcnt}\StrSubstitute{#3}{,}{-XS,}[\tmpcitearg]\renewcommand{\citenumfont}[1]{S##1}\oriciteXS[#1][#2]{\tmpcitearg-XS}\renewcommand{\citenumfont}[1]{##1}}
\let\oricitetXS\citetXS\RenewDocumentCommand{\citetXS}{O{} O{} m}{\stepcounter{synrefcnt}\StrSubstitute{#3}{,}{-XS,}[\tmpcitearg]\renewcommand{\citenumfont}[1]{S##1}\oricitetXS[#1][#2]{\tmpcitearg-XS}\renewcommand{\citenumfont}[1]{##1}}
\let\oriCitetXS\CitetXS\RenewDocumentCommand{\CitetXS}{O{} O{} m}{\stepcounter{synrefcnt}\StrSubstitute{#3}{,}{-XS,}[\tmpcitearg]\renewcommand{\citenumfont}[1]{S##1}\oriCitetXS[#1][#2]{\tmpcitearg-XS}\renewcommand{\citenumfont}[1]{##1}}
\let\oriciteyearXS\citeyearXS\RenewDocumentCommand{\citeyearXS}{O{} O{} m}{\stepcounter{synrefcnt}\StrSubstitute{#3}{,}{-XS,}[\tmpcitearg]\renewcommand{\citenumfont}[1]{S##1}\begin{NoHyper}\oriciteyearXS[#1][#2]{\tmpcitearg-XS}\end{NoHyper}\renewcommand{\citenumfont}[1]{##1}}

\addmultibib{\numappendix}

}

\AfterEndPreamble{

%%% Remove citations in list of *
\fixlistof{\jobname}

% Portrait mode
\useportrait

% Run input files via a perl filter to harmonize encoding to utf8
\let\pmxinput\fixinputfile
\let\SweaveInput\fixinputfile

% Check for location of PharmTeX directory
\checkpharmtex

% Settings to disable hyperlinks in batch mode
\urlstyle{same} % used to be tt (typewriter)
\DeclareUrlCommand\path{\urlstyle{same}}
\appto\UrlNoBreaks{\do\:} % \do\.\do\_
\ifwebhyper\else
\let\oldhref\href
\let\oldurl\url
\renewcommand{\href}[2]{\begin{NoHyper}\oldhref{#1}{#2}\end{NoHyper}}
\renewcommand{\url}[1]{\begin{NoHyper}\oldurl{#1}\end{NoHyper}}
\fi

% Insert cover page
\ifcoverpage
\ifdefined\CoverPage
\checkartifact{\CoverPage}
\ifx\fname\empty
\hypertarget{itemnumber\theitemnumber}{}
ITEM \CoverPage{} NOT FOUND
\clearpage
\else
\includepdf[pages=\CoverPageNo,pagecommand={
\thispagestyle{empty}
\hypertarget{itemnumber\theitemnumber}{}
\hypertarget{cov}{}
\ifwatermark
\begin{tikzpicture}[remember picture,overlay,opacity=\WatermarkOpacity,scale=\WatermarkScale,every node/.style={scale=\WatermarkScale}]
	\node[rotate = 45] at (current page.center) {\Huge{\Watermark}};
\end{tikzpicture}
\fi
}]{\fname}
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
\hypertarget{itemnumber\theitemnumber}{}
\hypertarget{sig}{}
\includepdf[pages=-,pagecommand={
\thispagestyle{empty}
\ifwatermark
\begin{tikzpicture}[remember picture,overlay,opacity=\WatermarkOpacity,scale=\WatermarkScale,every node/.style={scale=\WatermarkScale}]
	\node[rotate = 45] at (current page.center) {\Huge{\Watermark}};
\end{tikzpicture}
\fi
}]{\fname}
\fi
\else
\hypertarget{sig}{}
\insertsigpage
\clearpage
\fi
\renewcommand{\sigbookmark}{\bookmark[level=1,dest=sig]{\approvalpagename}}
\fi\fi

% Insert QA page
\ifsynonly\else
\ifqapage
\ifdefined\QAPage
\checkartifact{\QAPage}
\ifx\fname\empty
\hypertarget{itemnumber\theitemnumber}{}
\hypertarget{qapage}{}
ITEM \QAPage{} NOT FOUND
\renewcommand{\qabookmark}{\bookmark[level=1,dest=qapage]{QUALITY ASSURANCE STATEMENT}}
\clearpage
\else
\hypertarget{itemnumber\theitemnumber}{}
\hypertarget{qapage}{}
\includepdf[pages=-,pagecommand={
\thispagestyle{empty}
\ifwatermark
\begin{tikzpicture}[remember picture,overlay,opacity=\WatermarkOpacity,scale=\WatermarkScale,every node/.style={scale=\WatermarkScale}]
	\node[rotate = 45] at (current page.center) {\Huge{\Watermark}};
\end{tikzpicture}
\fi
}]{\fname}
\renewcommand{\qabookmark}{\bookmark[level=1,dest=qapage]{QUALITY ASSURANCE STATEMENT}}
\fi
\else
\ifdefined\QaApprovera
\hypertarget{qapage}{}
\insertqapage
\renewcommand{\qabookmark}{\bookmark[level=1,dest=qapage]{QUALITY ASSURANCE STATEMENT}}
\clearpage
\fi
\fi
\fi
\fi

% Create glossary
\newcommand{\insertglossary}{
\clearpage
\ifglossary
\renewcommand*{\glsclearpage}{}
\renewcommand{\glossaryname}{\abbreviationname}
\hypertarget{gls}{}
\label{glossary}
\addtocontents{toc}{\protect\contentsline {section}{\glossaryname}{\protect\pageref{glossary}}{gls}}
\renewcommand{\glsbookmark}{\bookmark[level=1,dest=gls]{\glossaryname}}
\glstocfalse

\ifdefined\GlsFile

\IfFileExists{nonemptyglossary.txt}{
\checkartifact{\GlsFile.tex}
\hypertarget{itemnumber\theitemnumber}{}
}{}

\ifx\fname\empty
ITEM \GlsFile.tex NOT FOUND.
\fi
\fi

\ifglossarypostdot
\printglossary[title=\protect\centering\glossaryname,toctitle=\glossaryname,style=mystyle,type=\acronymtype,nogroupskip=true,nonumberlist]
\else
\printglossary[title=\protect\centering\glossaryname,toctitle=\glossaryname,style=mystyle,type=\acronymtype,nogroupskip=true,nonumberlist,nopostdot]
\fi
\ifnum\themycnt>0
\nonemptyglossary
\else
% \phantomsection
% \addcontentsline{toc}{section}{\glossaryname}
\vspace{-1.7\baselineskip}
\section*{\centering\glossaryname}\textbf{No abbreviations in document.}
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
\ifsynopsisfootfont
\renewcommand{\secheadfont}{\footnotesize}
\footnotesize
\fi
\ifdefined\synopsisintro
\synopsisintro
\else
\textbf{\DocTitle}
\fi\fi\fi
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
\let\citen\citeXS
\let\citea\citetXS
\let\Citea\CitetXS
\let\citey\citeyearXS
% \let\cite\citeXS
\renewcommand{\citelocation}{S}
\IfFileExists{\insertsynopsis}{\pmxinput{\insertsynopsis}}{}
\ifsynopsisfootfont
\par
\renewcommand{\secheadfont}{\normalsize}
\fi
\fi\fi
\normsecs
\synreferences
\renewcommand{\citelocation}{}
\let\citen\oriciten
\let\citea\oricitet
\let\Citea\oriCitet
\let\citey\oricitey
% \let\cite\oricite
\normalsize
\mainbody
\ifdefined\insertsynopsis\ifsynopsis
\clearpage
\glsresetall
\fi\fi

% Insert Table of Contents
\iftoc
\hypertarget{toc}{}
\renewcommand{\tocbookmark}{\bookmark[level=1,dest=toc]{TABLE OF CONTENTS}}
\iftocintoc
\phantomsection\label{toclabel}
\addtocontents{toc}{\protect\contentsline{section}{TABLE OF CONTENTS}{\protect\pageref{toclabel}}{toc}}
\fi
\tableofcontents
\clearpage
\fi

% Insert List of Appendices
\ifloa\ifnum\totvalue{numberappendix}>2
\hypertarget{loa}{}
\renewcommand{\loabookmark}{\bookmark[level=1,dest=loa]{LIST OF APPENDICES}}
\phantomsection\label{loalabel}
\addtocontents{toc}{\protect\contentsline{section}{LIST OF APPENDICES}{\protect\pageref{loalabel}}{loa}}
\listofappendix
\clearpage
\fi\fi

\ifloftfirst\else
\coverbookmark
\sigbookmark
\qabookmark
\ifsynonly\glsbookmark\fi
\synbookmark
\ifsynopsis\addsynsec{none}{}{}\cussyncmd\fi
\tocbookmark
\loabookmark
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
\iflot\iflofcl\clearpage\fi\fi
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
\ifloftfirst
\coverbookmark
\sigbookmark
\qabookmark
\ifsynonly\glsbookmark\fi
\synbookmark
\ifsynopsis\addsynsec{none}{}{}\cussyncmd\fi
\tocbookmark
\loabookmark
\fi
\ifsynonly\else\glsbookmark\fi

% End document if synonly mode
\ifsynonly\references\clearpage\itemlist\end{document}\fi
}

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
\printdocpdfname{\DocPDF}
\newcommand{\doprintsig}{0}
\ifprintsigpage\ifdefined\DocApprovera\ifdraftmode\else\ifdefined\SignaturePage\else\ifsigpage\renewcommand{\doprintsig}{1}\fi\fi\fi\fi\fi
\newcommand{\dogetartifacts}{1}\IfStrEqCase{\missingartifacts}{{}{\renewcommand{\dogetartifacts}{0}}}
\ifdraftmode
\createfiles{\jobname}{\DocPDF\DocPDFWord}{\missingartifacts}{\dogetartifacts}{\doprintsig}{\missingrfiles} % DRAFT MODE: download only MISSING artifacts when at least 1 artifact is missing
%\createfiles{\jobname}{\DocPDF}{\artifacts}{\dogetartifacts}{\doprintsig} % DRAFT MODE: download ALL artifacts (possibly again) when at least 1 artifact is missing
\else
\createfiles{\jobname}{\DocPDF\DocPDFWord}{\artifacts}{\dogetartifacts}{\doprintsig}{\missingrfiles} % BATCH MODE: download ALL artifacts
\fi

% Compile mathimg
\savemathfiles{\jobname}{\eqnimgscalewin}{\eqnimgscalelin}

}
