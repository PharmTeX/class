#!/usr/bin/perl
# PharmTeX perl script, part of the PharmTeX platform.
# Copyright (C) 2019 Christian Hove Rasmussen (contact@pharmtex.org).
# This program is free software: You can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of the GNU Affero General Public License along with this program (see file named LICENSE). If not, see <https://www.gnu.org/licenses/>.

# Load packages
use strict;
use warnings;
use open OUT => ':raw';
binmode(STDOUT, ":utf8");
use Encode;
use File::Copy qw(copy);
use File::Compare;
use PDF::API2;
use Encoding::FixLatin qw(fix_latin);
use English;
use FileHandle;
my $OS = "$^O";
my $oldpath = $ENV{PATH};

# Get filename, extension, and mode
my $fname = $ARGV[0];
(my $name = $fname) =~ s/\.[^.]*$//;
my $mode = $ARGV[1];
if ( not defined $mode ) { $mode = 'batch'; }
my $modeorig = $mode;

# Check for supported modes
if ( grep $_ eq $mode, < batch full fast eqn sub err fmt noperl clear jabref > ) {} else { die "Unsupported run mode in PharmTeX\n"; }

# Determine bundle version if used
my $file; my $fh; my $str; my $bver = ''; my $bbver = ''; my $bnum; my $btru; my $brnd; my $oss;
if ( "$OS" eq 'MSWin32' ) {
	$file = "$ENV{'USERPROFILE'}\\pharmtex\\version.txt";
	$oss = 'Windows';
} else {
	$file = "$ENV{'HOME'}/pharmtex/version.txt";
	$oss = 'Linux';
}
if (( -e "$file" ) && ( ! grep $_ eq $mode, < clear jabref > )) {
	open $fh, '<:raw', "$file"; $str = do { local $/; <$fh> }; close $fh;
	($bver) = $str =~ /PharmTeX software collection v\. ([0-9]+\.[0-9]+) created/;
	open(FILE, '>', 'bundleversion.txt'); print FILE "$bver"; close(FILE);
	$bbver = " compiled using the PharmTeX Software Bundle for $oss v. $bver";
	($brnd) = $bver =~ /([0-9]+)\.[0-9]+/;
	($btru) = $bver =~ /[0-9]+\.([0-9]+)/;
	$bnum = 100*$brnd + $btru;
} else {
	$bver = 'nan'; $bbver = ''; $bnum = 99999;
}

# Initialize a few variables
my $cp = 0; my $save = 0; my $synctex = 1; my $knit = 0; my $finalize = 0; my $mkfile = 0; my $noperl = 0; my $sub = 0; my $pdflatex; my $txt = '';
my $logfile = "$name";
my $fmtfile = 'PharmTeX';
if ( $OS eq 'MSWin32' ) {
	$pdflatex = 'pdflatex -extra-mem-top=50000000 -extra-mem-bot=50000000';
} else {
	$pdflatex = 'pdflatex';
}
my $perltex = "perltex -nosafe -latex=$pdflatex";
my $nametex = $name;
my $namesave = $name;
my $runmode = 'batchmode';
my $compmode = 'batchmode';
if ( $mode eq 'err' ) {
	$runmode = 'errorstopmode';
	$compmode = 'errorstopmode';
}

# Check for subjob mode
if ( $mode eq 'sub' ) {
	$sub = 1;
	$mode = 'batch';
}
if ( $mode eq 'eqn' ) { $sub = 1; }

# Determine document PDF name
$file = "$name.tex"; open $fh, '<:raw', "$file"; $str = do { local $/; <$fh> }; close $fh;
my $docname; ($docname) = $str =~ /\\docpdfname\{([^\}]+)\}/;
if ( not defined $docname ) { $docname = "$name.pdf" }
"a" =~ /a/; # unset $1 for fix_latin lines further down

# Files to delete in cleanup
unlink ('dodel.txt');
my @delfiles = (("$name.aux", "$name.bbl", "$name.blg", "$name.glg", "$name.glo", "$name.gls", "$name.ist", "$name.loa", "$name.lof", "$name.lot", "$name.toc", "$name.lol", "$name.synctex.gz", "$name.mw", "$name.dat", "$name.topl", "$name.frpl", "$name.tfpl", "$name.ffpl", "$name.dfpl", "$name.lgpl", "$name.pipe", "$name.xtr", "texput.log", ".Rnw", ".lgpl", "finalize.pl", "missingartifacts.txt", "missingfiles.txt", "tmpinputfile.txt", "tmpsigpage.pdf", "tmpsigpage.pax", "tmpcoverpage.pdf", "tmpcoverpage.pax", "tmpqapage.pdf", "tmpqapage.pax", "references.bib.bak", "delauxitems.pl", "batch.txt", "dotwice", "eqnimg.txt", "mathimg.txt", "nonemptyglossary.txt", "rpath.txt", "file.tmp.txt", "PharmTeX.log", "PharmTeX.fmt", "fixfiles", "noperl.txt", "noperlfirst.txt", "noperltex.sty"), <*.bib.sav>, <*-tmpfixfile.*>, <*.pax>, <*.pay>, <noperltex-*.tex>, <RA*_*>, <"$name-eqn*">, <"$name-math*">, <"$name-tex.*">);

# Clear mode to clean out auxiliary files
if ( $mode eq 'clear' ) {
	print STDERR "\nClearing auxiliary files\n\n";
	do './delauxitems.pl';
	unlink ("fixedoptions.txt", "useroptions.txt", "useroptionscomp.txt", "useroptions-eqnbackup.txt", "useroptionscomp-eqnbackup.txt", "useroptions-subbackup.txt", "useroptionscomp-subbackup.txt", "PharmTeX-eqnbackup.log", "PharmTeX-eqnbackup.fmt", "PharmTeX-subbackup.log", "PharmTeX-subbackup.fmt", "sigpage.pdf", "$name.pdf", "$docname.pdf", "$docname-synopsis.pdf", "$docname-word.pdf", "$docname-synopsis-word.pdf", "$name.log", "$name-synopsis.log", "$name-word.log", "$name-synopsis-word.log", "$logfile.out", @delfiles);
	open(FILENEW, '>:utf8', 'dodel.txt'); close(FILENEW);
	$ENV{PATH} = "$oldpath";
	exit;
}

# Start JabRef if requested
if ( $mode eq 'jabref' ) {
	print STDERR "Starting JabReF - may take a few seconds to open\n\n";
	my @bibfiles = (<*.bib>); my $bibstr = "@bibfiles";
	$bibstr =~ s/[^\s]+\.tmpfixfile\.bib//g; $bibstr =~ s/ +/ /g; $bibstr =~ s/ $//g; $bibstr =~ s/^ //g;
	if ( $OS eq 'MSWin32' ) { system("start /b jabref $bibstr"); } else { system("jabref $bibstr &"); }
	exit;
}

# Batch mode initialization
if ( $mode eq 'batch' ) {
	do './delauxitems.pl';
	unlink ("sigpage.pdf", "$docname.pdf", "$name.pdf", "$name.log", "$logfile.out", @delfiles);
	if ( $sub == 0 ) { unlink ("fixedoptions.txt", "useroptions.txt", "useroptionscomp.txt", "useroptions-eqnbackup.txt", "useroptionscomp-eqnbackup.txt", "useroptions-subbackup.txt", "useroptionscomp-subbackup.txt", "PharmTeX-eqnbackup.log", "PharmTeX-eqnbackup.fmt", "PharmTeX-subbackup.log", "PharmTeX-subbackup.fmt", "$docname-synopsis.pdf", "$docname-word.pdf", "$docname-synopsis-word.pdf", "$name-synopsis.log", "$name-word.log", "$name-synopsis-word.log"); }
}

# Check for word or syn modes
my $doeqn = 0; my $domath = 0; my $doword = 0; my $dosyn = 0; my $opt = ''; my $opto = ''; my $word = ''; my $syn = ''; my $fopt; my @opts;
if ( $mode eq 'eqn' ) {
	($opt) = $str =~ /(?:^|\n) *\\documentclass *\[([^\[^\]]{0,})\] *\{ *PharmTeX *\}/; $opt =~ s/ *//g;
} else {
	if ( -e 'fixedoptions.txt' ) {
		$file = "fixedoptions.txt"; open $fh, '<:raw', "$file"; $opt = do { local $/; <$fh> }; close $fh;
		@opts = split ",", $opt;
		if ( grep { $_ eq 'synonly' } @opts ) {	$docname = "$docname-synopsis"; }
		if ( ( grep { $_ eq 'eqnimg' } @opts ) || ( grep { $_ eq 'mathimg' } @opts ) || ( grep { $_ eq 'convimg' } @opts ) ) { $docname = "$docname-word"; }
	} else {
		($fopt) = $str =~ /(?:^|\n) *\\documentclass *\[([^\[^\]]{0,})\] *\{ *PharmTeX *\}/;
		if ( defined $fopt ) {
			$fopt =~ s/ *//g;
			@opts = split ",", $fopt;
			if ( (grep { $_ eq 'eqnimg' } @opts) && (not $bnum < 102) ) {
				$doeqn = 1; @opts = grep ! /eqnimg/, @opts;
				$word = "eqnimg";
			}
			if ( ( grep { $_ eq 'mathimg' } @opts ) && (not $bnum < 102) ) {
				$domath = 1; @opts = grep ! /mathimg/, @opts;
				if ( "$word" eq "" ) { $word = "mathimg"; } else { $word = "$word,mathimg"; }
			}
			if ( ( grep { $_ eq 'convimg' } @opts ) && (not $bnum < 102) ) {
				$domath = 1; @opts = grep ! /convimg/, @opts;
				if ( "$word" eq "" ) { $word = "convimg"; } else { $word = "$word,convimg"; }
			}
			if ( grep { $_ eq 'synonly' } @opts ) {
				$dosyn = 1; @opts = grep ! /synonly/, @opts; $syn = "synonly";
			}
			if ( ( $doeqn == 1 ) || ( $domath == 1 ) ) { $doword = 1; }
			$opt = join( ",", @opts ); $opto = $opt;
			if ( ( $mode eq 'batch' ) && ( ( $doword == 1 ) || ( $dosyn == 1 ) ) ) {
				copy 'PharmTeX.fmt', 'PharmTeX-subbackup.fmt';
				copy 'PharmTeX.log', 'PharmTeX-subbackup.log';
				copy 'useroptions.txt', 'useroptions-subbackup.txt';
				copy 'useroptionscomp.txt', 'useroptionscomp-subbackup.txt';
				
				if ( ( $doword == 1 ) && ( $dosyn == 0 ) ) {
					print STDERR "Word compatibility enabled - run may take longer than usual\n\n"; system("");
					if ( "$opt" eq "" ) { $opt = "$word"; } else { $opt = "$opt,$word"; } open(FILE, '>', 'fixedoptions.txt'); print FILE "$opt"; close(FILE);
					print STDERR "Running subjob 1 of 1\n\n";
					if ( $OS eq 'MSWin32' ) { system("executex \"$name\" sub"); } else { system("bash executex \"$name\" sub"); }
					copy "$name.log", "$name-word.log";
					$opt = $opto;
				}
				if ( ( $doword == 0 ) && ( $dosyn == 1 ) ) {
					print STDERR "Synopsis printing enabled - run may take longer than usual\n\n"; system("");
					if ( "$opt" eq "" ) { $opt = "$syn"; } else { $opt = "$opt,$syn"; } open(FILE, '>', 'fixedoptions.txt'); print FILE "$opt"; close(FILE);
					print STDERR "Running subjob 1 of 1\n\n";
					if ( $OS eq 'MSWin32' ) { system("executex \"$name\" sub"); } else { system("bash executex \"$name\" sub"); }
					copy "$name.log", "$name-synopsis.log";
					$opt = $opto;
				}
				if ( ( $doword == 1 ) && ( $dosyn == 1 ) ) {
					print STDERR "Word compatibility and synopsis printing enabled - run may take longer than usual\n\n"; system("");
					if ( "$opt" eq "" ) { $opt = "$word"; } else { $opt = "$opt,$word"; } open(FILE, '>', 'fixedoptions.txt'); print FILE "$opt"; close(FILE);
					print STDERR "Running subjob 1 of 3\n\n";
					if ( $OS eq 'MSWin32' ) { system("executex \"$name\" sub"); } else { system("bash executex \"$name\" sub"); }
					copy "$name.log", "$name-word.log";
					$opt = $opto;
					if ( "$opt" eq "" ) { $opt = "$syn"; } else { $opt = "$opt,$syn"; } open(FILE, '>', 'fixedoptions.txt'); print FILE "$opt"; close(FILE);
					print STDERR "Running subjob 2 of 3\n\n";
					if ( $OS eq 'MSWin32' ) { system("executex \"$name\" sub"); } else { system("bash executex \"$name\" sub"); }
					copy "$name.log", "$name-synopsis.log";
					$opt = $opto;
					if ( "$opt" eq "" ) { $opt = "$word,$syn"; } else { $opt = "$opt,$word,$syn"; } open(FILE, '>', 'fixedoptions.txt'); print FILE "$opt"; close(FILE);
					print STDERR "Running subjob 3 of 3\n\n";
					if ( $OS eq 'MSWin32' ) { system("executex \"$name\" sub"); } else { system("bash executex \"$name\" sub"); }
					copy "$name.log", "$name-synopsis-word.log";
					$opt = $opto;
				}
				unlink 'fixedoptions.txt';
				print STDERR "Continuing main batch job\n\n";
				copy 'PharmTeX-subbackup.fmt', 'PharmTeX.fmt';
				copy 'PharmTeX-subbackup.log', 'PharmTeX.log';
				copy 'useroptions-subbackup.txt', 'useroptions.txt';
				copy 'useroptionscomp-subbackup.txt', 'useroptionscomp.txt';
				unlink ('PharmTeX-subbackup.fmt', 'PharmTeX-subbackup.log', 'useroptions-subbackup.txt', 'useroptionscomp-subbackup.txt');
			}
		}
	}
}
if ( "$opt" ne "" ) {
	$opt =~ s/ *, */\}\\ExecuteOptions\{/g;
	$opt = "\\ExecuteOptions\{$opt\}";
	$opt =~ s/\\ExecuteOptions\{\}//g;
	if ( $bnum < 102 ) { $opt =~ s/\\ExecuteOptions\{eqnimg\}//g; $opt =~ s/\\ExecuteOptions\{mathimg\}//g; $opt =~ s/\\ExecuteOptions\{convimg\}//g; }
}
open(FILE, '>', 'useroptions.txt'); print FILE "$opt"; close(FILE); system("");

# Create log file and redirect STDOUR and STDERR to this file
unlink "$logfile.out";
if ( $mode eq 'batch' ) { $txt = "Finalized document compilation initiated\n\n"; print STDERR $txt; }
redirect_streams();
if ( $mode eq 'batch' ) { print $txt; $txt = ''; }

# Check for right version of bundle to eqnimg, mathimg, and convimg
if ( ( $mode eq 'batch' ) && (( grep { $_ eq 'eqnimg' } @opts ) || ( grep { $_ eq 'mathimg' } @opts ) || ( grep { $_ eq 'convimg' } @opts )) && ( $bnum < 102 ) ) { $txt = "LaTeX Warning: Options \"eqnimg\", \"mathimg\", and \"convimg\" only supported in software bundle v. 1.2 and higher (you have v. $bver). Please upgrade at http://pharmtex.org. Skipping for now...\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = ''; }

# Batch mode settings
if ( $mode eq 'batch' ) {
	$mode = 'full';
	open(FILE, '>', 'batch.txt'); close(FILE);
	if ( $cp == 0 ) {
		$nametex = "$name-tex";
		copy "$name.tex", "$nametex.tex";
	}
	$finalize = 1; $cp = 1; $synctex = 0;
}

# List of non-standard UTF-8 characters supported by inputenc and fontenc in pdfLaTeX
my $asciichar = '|a-zA-Z\{\}\s%\.\/\-:;,0-9@=\\\\\"\'\(\)_~\$\!&\`\?+#\^<>\[\]\*';
my $utf8char = '\x{00A0}\x{00A1}\x{00A2}\x{00A3}\x{00A4}\x{00A5}\x{00A6}\x{00A7}\x{00A8}\x{00A9}\x{00AA}\x{00AB}\x{00AC}\x{00AD}\x{00AE}\x{00AF}\x{00B0}\x{00B1}\x{00B2}\x{00B3}\x{00B4}\x{00B5}\x{00B6}\x{00B7}\x{00B8}\x{00B9}\x{00BA}\x{00BB}\x{00BC}\x{00BD}\x{00BE}\x{00BF}\x{00C0}\x{00C1}\x{00C2}\x{00C3}\x{00C4}\x{00C5}\x{00C6}\x{00C7}\x{00C8}\x{00C9}\x{00CA}\x{00CB}\x{00CC}\x{00CD}\x{00CE}\x{00CF}\x{00D0}\x{00D1}\x{00D2}\x{00D3}\x{00D4}\x{00D5}\x{00D6}\x{00D7}\x{00D8}\x{00D9}\x{00DA}\x{00DB}\x{00DC}\x{00DD}\x{00DE}\x{00DF}\x{00E0}\x{00E1}\x{00E2}\x{00E3}\x{00E4}\x{00E5}\x{00E6}\x{00E7}\x{00E8}\x{00E9}\x{00EA}\x{00EB}\x{00EC}\x{00ED}\x{00EE}\x{00EF}\x{00F0}\x{00F1}\x{00F2}\x{00F3}\x{00F4}\x{00F5}\x{00F6}\x{00F7}\x{00F8}\x{00F9}\x{00FA}\x{00FB}\x{00FC}\x{00FD}\x{00FE}\x{00FF}\x{0100}\x{0101}\x{0102}\x{0103}\x{0104}\x{0105}\x{0106}\x{0107}\x{0108}\x{0109}\x{010A}\x{010B}\x{010C}\x{010D}\x{010E}\x{010F}\x{0110}\x{0111}\x{0112}\x{0113}\x{0114}\x{0115}\x{0116}\x{0117}\x{0118}\x{0119}\x{011A}\x{011B}\x{011C}\x{011D}\x{011E}\x{011F}\x{0120}\x{0121}\x{0122}\x{0123}\x{0124}\x{0125}\x{0128}\x{0129}\x{012A}\x{012B}\x{012C}\x{012D}\x{012E}\x{012F}\x{0130}\x{0131}\x{0132}\x{0133}\x{0134}\x{0135}\x{0136}\x{0137}\x{0139}\x{013A}\x{013B}\x{013C}\x{013D}\x{013E}\x{0141}\x{0142}\x{0143}\x{0144}\x{0145}\x{0146}\x{0147}\x{0148}\x{014A}\x{014B}\x{014C}\x{014D}\x{014E}\x{014F}\x{0150}\x{0151}\x{0152}\x{0153}\x{0154}\x{0155}\x{0156}\x{0157}\x{0158}\x{0159}\x{015A}\x{015B}\x{015C}\x{015D}\x{015E}\x{015F}\x{0160}\x{0161}\x{0162}\x{0163}\x{0164}\x{0165}\x{0168}\x{0169}\x{016A}\x{016B}\x{016C}\x{016D}\x{016E}\x{016F}\x{0170}\x{0171}\x{0172}\x{0173}\x{0174}\x{0175}\x{0176}\x{0177}\x{0178}\x{0179}\x{017A}\x{017B}\x{017C}\x{017D}\x{017E}\x{0192}\x{01CD}\x{01CE}\x{01CF}\x{01D0}\x{01D1}\x{01D2}\x{01D3}\x{01D4}\x{01E2}\x{01E3}\x{01E6}\x{01E7}\x{01E8}\x{01E9}\x{01EA}\x{01EB}\x{01F0}\x{01F4}\x{01F5}\x{0218}\x{0219}\x{021A}\x{021B}\x{0232}\x{0233}\x{02C6}\x{02C7}\x{02D8}\x{02DC}\x{02DD}\x{0E3F}\x{1E02}\x{1E03}\x{1E20}\x{1E21}\x{200C}\x{2010}\x{2011}\x{2012}\x{2013}\x{2014}\x{2015}\x{2016}\x{2018}\x{2019}\x{201A}\x{201C}\x{201D}\x{201E}\x{2020}\x{2021}\x{2022}\x{2026}\x{2030}\x{2031}\x{2039}\x{203A}\x{203B}\x{203D}\x{2044}\x{204E}\x{2052}\x{20A1}\x{20A4}\x{20A6}\x{20A9}\x{20AB}\x{20AC}\x{20B1}\x{2103}\x{2116}\x{2117}\x{211E}\x{2120}\x{2122}\x{2126}\x{2127}\x{212E}\x{2190}\x{2191}\x{2192}\x{2193}\x{2329}\x{232A}\x{2422}\x{2423}\x{25E6}\x{25EF}\x{266A}';
my $cuschar = '';

# Convert non-UTF8 characters to UTF-8 and check for user options. Check for knitr and add R path to system path if detected
if ( $mode ne 'fmt' ) {
	my $tmpstr = fix_latin($str); my $teststr = $str;
	$tmpstr =~ s/([^$asciichar$utf8char$cuschar])/<\?>/g; if ( defined $1 ) { $txt = "LaTeX Warning: Unsupported symbol(s) in $file. Look for <?> in PDF.\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = ''; $mkfile = 1; $str = $tmpstr; }
	eval { decode( "utf8", $teststr, Encode::FB_CROAK ) }; if ( $@ ) { if ($mkfile==0) {$mkfile = 1; $str = $tmpstr;} }
	if ( $mkfile == 1 ) {
		if (( $cp == 0 ) && ( $mode ne 'noperl' )) {
			$namesave = "$name-save"; $save = 1;
			if ( -e "$namesave.tex" ) { $txt = "LaTeX Warning: Old backup file $namesave.tex exists. Please check contents against $name.tex.\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = ''; sleep 3; exit; }
			copy "$name.tex", "$namesave.tex";
		}
		open $fh, '>:utf8', "$nametex.tex"; print $fh "$str"; close($fh);
	}
}
my ($rpath) = $str =~ / *%%* *rpath *= *(.+)\n/;
if ( defined $rpath ) {
	$rpath =~ s/\//\\/g;
	if ( $OS eq 'MSWin32' ) { $ENV{PATH} = "$rpath;$ENV{PATH}"; }
	else { $ENV{PATH} = "$rpath:$ENV{PATH}"; }
	$knit = 1; $cp = 1;	$synctex = 0;
	if ( $nametex eq $name ) {
		$nametex = "$name-tex";
		copy "$name.tex", "$nametex.tex";
	}
}

# Check if class file should be compiled with new user options
if (( ! -e 'PharmTeX.fmt' ) || ( ! -e 'useroptionscomp.txt' ) || ( compare("useroptionscomp.txt", "useroptions.txt") != 0) || ( $mode eq 'fmt' )) {
	if ( $mode ne 'eqn' ) {	$txt = "Compiling PharmTeX class\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = ''; }
	copy 'useroptions.txt', 'useroptionscomp.txt';
	system("$pdflatex -interaction=$compmode -ini \"\&pdflatex\" PharmTeX.ini");
	if ( $mode eq 'fmt' ) { $ENV{PATH} = "$oldpath"; exit; }
}

# If knitr insert R settings and clean out knitr generated preamble
if ( $knit == 1 ) {
	$txt = "\nRunning knitr\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';
	copy "$nametex.tex", "$nametex.Rnw";
	restore_streams(); $file = "$nametex.Rnw"; open $fh, '<', $file; $str = do { local $/; <$fh> }; close $fh; redirect_streams();
	$str =~ s/((?:^|\n) *(\\documentclass)( *\[[^\[^\]]{0,}\] *)*(\{ *PharmTeX *\}))/$1\n<<Preliminaries, cache=FALSE, echo=FALSE, results='hide', warning=FALSE, message=FALSE>>=\nlibrary(knitr)\nopts_knit\$set(self.contained=FALSE)\nopts_chunk\$set(message=FALSE, comment=NA, warning=FALSE, echo=FALSE, results='hide', cache=FALSE, tidy=FALSE, concordance=FALSE)\n@/g;
	open $fh, '>', "$file"; print $fh "$str"; close($fh);
	system("Rscript -e \"library('knitr'); knit('$nametex.Rnw');\"");
	restore_streams(); $file = "$nametex.tex"; open $fh, '<', $file; $str = do { local $/; <$fh> }; close $fh; redirect_streams();
	$str =~ s/\\usepackage\{knitr\}\n//g; $str =~ s/\\IfFileExists\{upquote.sty\}(.+)\n//g; $str =~ s/ *%%* *rpath *= *.+\n//g;
	open $fh, '>', "$file"; print $fh "$str"; close($fh);
	unlink 'knitr.sty';
}

# Check for and run noperl mode
if ( $mode eq 'noperl' ) {
	$txt = "\nDetaching PharmTeX from Perl\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';
	system("perltex -makesty -nosafe -latex=$pdflatex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=batchmode \"$nametex\"");
	open(FILE, '>', 'noperlfirst.txt'); close(FILE);
	open(FILE, '>', 'noperl.txt'); close(FILE);
	$mode = 'fast';
}

# Check for existence of noperl file
if ( -e 'noperl.txt' ) { $perltex = "$pdflatex"; };

# Check for and run fast mode
if ( $mode eq 'fast' ) {
	$txt = "\nFast compile started\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';
	$txt = "Compiling document using Perltex\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';
	open(FILE, '>', 'fixfiles'); close(FILE);
	system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=$runmode -synctex=$synctex \"$nametex\"");
	unlink "fixfiles";
	
	# If artifacts and/or other input files are missing, print warning
	if (( -e 'missingartifacts.txt' ) || ( -e 'missingfiles.txt' )) { print STDERR "\nLaTeX Warning: There are missing input files. Rerun using F1 or F12 and check LIST OF ITEMS.\n\n"; } 
}

# Check for and run eqn mode
if ( $mode eq 'eqn' ) {
	restore_streams();
	system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=$runmode -synctex=$synctex \"$nametex\"");
	redirect_streams();
}

# Check for and run err mode (debugging in terminal)
if ( $mode eq 'err' ) {
	restore_streams();
	open(FILE, '>', 'fixfiles'); close(FILE);
	system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=$runmode -synctex=$synctex \"$nametex\"");
	unlink "fixfiles";
	redirect_streams();
}

# Check for and run full mode
if ( $mode eq 'full' ) {
	$txt = "Full compile started\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = ''; system("");
	$txt = "Compiling document using Perltex (step 1/6)\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';
	open(FILE, '>', 'fixfiles'); close(FILE);
	system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=batchmode -draftmode \"$nametex\"");
	unlink "fixfiles";
	## Download artifacts at this point
	# if ( -e 'dotwice' ) {
		# system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=batchmode -draftmode \"$nametex\"");
		# ## Download artifacts at this point
		# unlink 'dotwice';
	# }
	$txt = "\nCompiling glossaries (step 2/6)\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';
	if ( -e "$name.glo" ) { system("makeglossaries -q \"$name\"");}
	$txt = "\nCompiling citations (step 3/6)\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';
	system("bibtex \"$name\"");
	$txt = "\nCompiling document using Perltex (step 4/6)\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';
	system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=batchmode -draftmode \"$nametex\"");
	$txt = "\nCompiling document using Perltex (step 5/6)\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';
	system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=batchmode -draftmode \"$nametex\"");
	$txt = "\nCompiling document using Perltex (step 6/6)\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';
	system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=batchmode -synctex=$synctex \"$nametex\"");
	
	# If artifacts and/or other input files are missing, print warning
	if (( -e 'missingartifacts.txt' ) || ( -e 'missingfiles.txt' )) { print STDERR "\nLaTeX Warning: There are missing input files. Check LIST OF ITEMS.\n\n"; } 
}

# Rename all files back to original name
if ( $cp == 1 ) {
	copy "$nametex.lgpl", "$name.lgpl";
	copy "$nametex.pipe", "$name.pipe";
	unlink "$nametex.tex", "$nametex.lgpl", "$nametex.pipe", "$nametex.Rnw", "$name.synctex.gz";
}

# Run finalize.pl if needed
if ( $finalize == 1 ) {
	$txt = "\nFinalizing document\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';
	if ( -e 'finalize.pl' ) {
		do './finalize.pl';
		unlink "batch.txt";
	}
	do './delauxitems.pl';
	unlink (@delfiles, "fixedoptions.txt", "useroptions.txt", "useroptionscomp.txt");
}
$txt = "\nDone. Please check $name.log for error messages and warnings.\n\n"; restore_streams(); print STDERR $txt; redirect_streams(); print $txt; $txt = '';

# If Word mode clear out equation images
if ( $doword == 1 ) {
	unlink (<"$name-eqn*">, <"$name-math*">, <"$name-tmpfixfile.*">);
}

# Move original file back if needed
if (( $save == 1 ) && ( -e "$namesave.tex" )) {
	copy "$namesave.tex", "$name.tex";
	unlink "$namesave.tex";
}

# Remove a few pointless warnings from log file and add output from PharmTeX run sequence
restore_streams();
close(OLDOUT); close(OLDERR); close(STDERR); close(STDOUT);
my $log = ''; my $out = '';
if (( grep $_ eq $mode, < batch full fast err syn fmt noperl > ) && ( -e "$name.log" )) {
	# Load log file and out file
	$file = "$name.log"; open $fh, '<:raw', "$file"; $log = do { local $/; <$fh> }; close $fh;
	if ( -e "$logfile.out" ) { $file = "$logfile.out"; open $fh, '<:raw', "$file"; $out = do { local $/; <$fh> }; close $fh; }
	
	# Remove \textwidth warning
	my @textwidth = $log=~ /\* \\textwidth=(\d+\.\d+pt)/g;
	my @textheight = $log =~ /\* \\textheight=(\d+\.\d+pt)/g;
	@textwidth = (@textwidth, @textheight);
	my $ntextwidth = scalar @textwidth - 1; my $i;
	for ($i=0; $i <= $ntextwidth; $i++) { $log =~ s/Overfull \\hbox \(\Q$textwidth[$i]\E too wide\)[^\n]+\n//g; }
	
	# Remove warning from glossaries package when "noglossary" option is used
	$log =~ s/Package glossaries Warning: No \\printglossary or \\printglossaries found.//g;
	
	# Remove warning caused by bug in Linux perl v. 5.26.1
	$out =~ s/Filehandle STDERR reopened as \$from_h only for input at [^\n]+\/File\/Copy\.pm line [0-9]+\.\n//g;
	
	# Ignore warning caused by hyperref
	$log =~ s/pdfTeX warning \(ext4\):/Ignored by PharmTeX:/g;
	
	# Save log file
	my ($ver)  = $log =~ /Package: PharmTeX [0-9]{4}\/[0-9]{2}\/[0-9]{2} v([0-9]+\.[0-9]+) PharmTeX Package/;
	my ($date) = $log =~ /Package: PharmTeX ([0-9]{4}\/[0-9]{2}\/[0-9]{2}) v[0-9]+\.[0-9]+ PharmTeX Package/;
	open $fh, '>:utf8', "$name.log";
	print $fh "This is the PharmTeX Class v. $ver of $date$bbver.";
	if ( "$out" ne "" ) { print $fh "\n\n\n<<<<<<< Overall output of PharmTeX run sequence >>>>>>>\n\n\nCompilation command: executex $name.tex $modeorig\n\n\n$out"; }
	print $fh "\n<<<<<<< Output of final perltex/pdflatex run >>>>>>>\n\n\n$log";
	close $fh;
}
if ( "$out" ne "" ) { print "$out"; }
unlink "$logfile.out";
if ( $sub == 0 ) { unlink (("bundleversion.txt"), (<*-tmpfixfile.*>)) }

# Reset to old path and clean up
$ENV{PATH} = "$oldpath";
if ( -e "noperlfirst.txt" ) { unlink "noperlfirst.txt"; }

##############################################################
sub restore_streams
{
  close(STDOUT) || die "Can't close STDOUT: $!";
  close(STDERR) || die "Can't close STDERR: $!";
  open(STDERR, ">&OLDERR") || die "Can't restore stderr: $!";
  open(STDOUT, ">&OLDOUT") || die "Can't restore stdout: $!";
}
##############################################################
sub redirect_streams
{
  open OLDOUT,">&STDOUT" || die "Can't duplicate STDOUT: $!";
  open OLDERR,">&STDERR" || die "Can't duplicate STDERR: $!";
  open(STDOUT,">> $logfile.out");
  open(STDERR,">&STDOUT");
}
##############################################################
