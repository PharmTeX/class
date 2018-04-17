#!/usr/bin/perl
# PharmTeX perl script, part of the PharmTeX platform.
# Copyright (C) 2018 Christian Hove Rasmussen (contact@pharmtex.org).
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
my $OS = "$^O";
my $oldpath = $ENV{PATH};
unlink ('dodel.txt');

# Get filename, extension, and mode
my $fname = $ARGV[0];
(my $name = $fname) =~ s/\.[^.]*$//;
my $mode = $ARGV[1];
if ( not defined $mode ) { $mode = 'batch'; }

# Check for supported modes
if ( grep $_ eq $mode, < batch full fast err syn fmt noperl clear jabref > ) {} else { die "Unsupported run mode in PharmTeX\n"; }

# Files to delete in cleanup
my @delfiles = (("$name.aux", "$name.bbl", "$name.blg", "$name.glg", "$name.glo", "$name.gls", "$name.ist", "$name.loa", "$name.lof", "$name.lot", "$name.toc", "$name.lol", "$name.synctex.gz", "$name.mw", "$name.dat", "$name.topl", "$name.frpl", "$name.tfpl", "$name.ffpl", "$name.dfpl", "$name.lgpl", "$name.pipe", "texput.log", ".Rnw", ".lgpl", "finalize.pl", "getartifacts.txt", "tmpinputfile.txt", "tmpsigpage.pdf", "tmpsigpage.pax", "tmpcoverpage.pdf", "tmpcoverpage.pax", "tmpqapage.pdf", "tmpqapage.pax", "references.bib.bak", "batch.txt", "dotwice", "rpath.txt", "PharmTeX.log", "PharmTeX.fmt", "useroptions.txt", "useroptionscomp.txt", "delauxitems.pl", "fixfiles", "noperl.txt", "noperlfirst.txt", "noperltex.sty"), <*-tmpfixfile.*>, <*.tmp.txt>, <*.pax>, <*.pay>, <noperltex-*.tex>);

# Start JabRef if requested
if ( $mode eq 'jabref' ) {
	my @bibfiles = (<*.bib>); my $bibstr = "@bibfiles";
	$bibstr =~ s/[^\s]+\.tmpfixfile\.bib//g; $bibstr =~ s/ +/ /g; $bibstr =~ s/ $//g; $bibstr =~ s/^ //g;
	if ( $OS eq 'MSWin32' ) { system("start /b jabref $bibstr"); }
	else { system("jabref $bibstr &"); }
	exit;
}

# Initialize a few variables
my $cp = 0;
my $save = 0;
my $syn = 0;
my $synctex = 1;
my $knit = 0;
my $finalize = 0;
my $mkfile = 0;
my $noperl = 0;
my $fmtfile = 'PharmTeX';
my $pdflatex;
if ( $OS eq 'MSWin32' ) {
	$pdflatex = 'pdflatex -extra_mem_top=50000000 -extra_mem_bot=50000000';
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

# Synopsis only mode
if ( $mode eq 'syn' ) {
	$mode = 'batch';
	$syn = 1;
}

# Batch mode settings
if ( $mode eq 'batch' ) {
	$mode = 'full';
	do './delauxitems.pl';
	unlink ("sigpage.pdf", @delfiles);
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

# Get finalized PDF name from TEX file
my $file = "$nametex.tex"; open my $fh, '<:raw', "$file"; my $str = do { local $/; <$fh> }; close $fh;
my $docname = "$name.pdf"; ($docname) = $str =~ /\\docpdfname\{([^\}]+)\}/;
"a" =~ /a/; # unset $1 for fix_latin lines further down

# Load name of finalized PDF and clear any old finalized documents
# if ( -e 'docname.txt' ) { my $newfile = 'docname.txt'; open my $newfh, '<:raw', "$newfile"; $docname = do { local $/; <$newfh> }; close $newfh; } else { $docname = "$name"; }
my $docnameshort = $docname; $docnameshort =~ s/-synopsis//g;
if ( grep $_ eq $mode, < batch full fast err fmt clear syn > ) {
	if ( ( -e "$docname.pdf" ) && ( "$docname.pdf" ne "$name.pdf" ) ) {
		if ( $syn==1 ) { $docname = "$docname-synopsis"; }
		unlink ("$docname.pdf", 'docname.txt');
	}
}

# Make sure that auxiliary files are deleted
if ( $mode eq 'clear' ) {
	do './delauxitems.pl';
	unlink ("sigpage.pdf", "$name.log", "$name.pdf", "$docname.pdf", "$docname-synopsis.pdf", 'docname.txt', @delfiles);
	open(FILENEW, '>:utf8', 'dodel.txt'); close(FILENEW);
	$ENV{PATH} = "$oldpath";
	exit;
}

# Convert non-UTF8 characters to UTF-8 and check for user options. Check for knitr and add R path to system path if detected
if ( $mode ne 'fmt' ) {
	my $tmpstr = fix_latin($str); my $teststr = $str;
	$tmpstr =~ s/([^$asciichar$utf8char$cuschar])/<\?>/g; if ( defined $1 ) { print STDERR "Unsupported symbol(s) in $file. Look for <?> in PDF.\n"; $mkfile = 1; $str = $tmpstr; }
	eval { decode( "utf8", $teststr, Encode::FB_CROAK ) }; if ( $@ ) { if ($mkfile==0) {$mkfile = 1; $str = $tmpstr;} }
	if ( $mkfile == 1 ) {
		if (( $cp == 0 ) && ( $mode ne 'noperl' )) {
			$namesave = "$name-save"; $save = 1;
			if ( -e "$namesave.tex" ) { print STDERR "Old backup file $namesave.tex exists. Please check contents against $name.tex.\n"; sleep 3; exit; }
			copy "$name.tex", "$namesave.tex";
		}
		open $fh, '>:utf8', "$nametex.tex"; print $fh "$str"; close($fh);
	}
}
my ($opt) = $str =~ /\n* *\\documentclass *\[([^\[^\]]{0,})\] *\{ *PharmTeX *\}/;
if ( defined $opt ) {
	$opt =~ s/ *, */\}\\ExecuteOptions\{/g;
	$opt = "\\ExecuteOptions\{$opt\}";
	$opt =~ s/\\ExecuteOptions\{\}//g;
	if ( $syn == 1) {
		$opt = "$opt,\\ExecuteOptions{synonly}";
	}
	open(FILE, '>', 'useroptions.txt'); print FILE "$opt"; close(FILE);
} else {
	if ( $syn == 1 ) {
		my $opt = "\\ExecuteOptions{synonly}";
		open(FILE, '>', 'useroptions.txt'); print FILE "$opt"; close(FILE);
	} else {
		open(FILE, '>', 'useroptions.txt'); close(FILE);
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
	copy 'useroptions.txt', 'useroptionscomp.txt';
	system("$pdflatex -interaction=$compmode -ini \"\&pdflatex\" PharmTeX.ini");
	if ( $mode eq 'fmt' ) { $ENV{PATH} = "$oldpath"; exit; }
}

# If knitr insert R settings and clean out knitr generated preamble
if ( $knit == 1 ) {
	copy "$nametex.tex", "$nametex.Rnw";
	$file = "$nametex.Rnw"; open $fh, '<', $file; $str = do { local $/; <$fh> }; close $fh; $str =~ s/( *(\\documentclass)( *\[[^\[^\]]{0,}\] *)*(\{ *PharmTeX *\}))/$1\n<<Preliminaries, cache=FALSE, echo=FALSE, results='hide', warning=FALSE, message=FALSE>>=\nlibrary(knitr)\nopts_knit\$set(self.contained=FALSE)\nopts_chunk\$set(message=FALSE, comment=NA, warning=FALSE, echo=FALSE, results='hide', cache=FALSE, tidy=FALSE, concordance=FALSE)\n@/g; open $fh, '>', "$file"; print $fh "$str"; close($fh);
	system("Rscript -e \"library('knitr'); knit('$nametex.Rnw');\"");
	$file = "$nametex.tex"; open $fh, '<', $file; $str = do { local $/; <$fh> }; close $fh; $str =~ s/\\usepackage\{knitr\}\n//g; $str =~ s/\\IfFileExists\{upquote.sty\}(.+)\n//g; $str =~ s/ *%%* *rpath *= *.+\n//g; open $fh, '>', "$file"; print $fh "$str"; close($fh);
	unlink 'knitr.sty';
}

# Check for and run noperl mode
if ( $mode eq 'noperl' ) {
	system("perltex -makesty -nosafe -latex=$pdflatex -fmt=$fmtfile --jobname=\"$name\" -shell-escape -interaction=batchmode \"$nametex\"");
	open(FILE, '>', 'noperlfirst.txt'); close(FILE);
	open(FILE, '>', 'noperl.txt'); close(FILE);
	$mode = 'fast';
}

# Check for existence of noperl file
if ( -e 'noperl.txt' ) { $perltex = "$pdflatex"; };

# Check for and run fast/err mode
if (( $mode eq 'fast' ) || ( $mode eq 'err' )) {
	open(FILE, '>', 'fixfiles'); close(FILE);
	system("$perltex -fmt=$fmtfile --jobname=\"$name\" -shell-escape -interaction=$runmode -synctex=$synctex \"$nametex\"");
	unlink "fixfiles";
}

# Check for and run full mode
if ( $mode eq 'full' ) {
	open(FILE, '>', 'fixfiles'); close(FILE);
	system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=batchmode -draftmode \"$nametex\"");
	unlink "fixfiles";
	## Download artifacts at this point
	# if ( -e 'dotwice' ) {
		# system("perltex -nosafe -latex=$pdflatex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=batchmode -draftmode \"$nametex\"");
		# ## Download artifacts at this point
		# unlink 'dotwice';
	# }
	if ( -e "$name.glo" ) { system("makeglossaries -q \"$name\""); }
	system("bibtex \"$name\"");
	system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=batchmode -draftmode \"$nametex\"");
	system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=batchmode -draftmode \"$nametex\"");
	system("$perltex -fmt=$fmtfile -jobname=\"$name\" -shell-escape -interaction=batchmode -synctex=$synctex \"$nametex\"");
}

# Rename all files back to original name
if ( $cp == 1 ) {
	copy "$nametex.lgpl", "$name.lgpl";
	copy "$nametex.pipe", "$name.pipe";
	unlink "$nametex.tex", "$nametex.lgpl", "$nametex.pipe", "$nametex.Rnw", "$name.synctex.gz";
}

# Remove a few pointless warnings from log file
if (( grep $_ eq $mode, < batch full fast err syn fmt noperl > ) && ( -e "$name.log" )) {
	$file = "$name.log"; open $fh, '<:raw', "$file"; $str = do { local $/; <$fh> }; close $fh;
	my @textwidth = $str =~ /\* \\textwidth=(\d+\.\d+pt)/g;
	my @textheight = $str =~ /\* \\textheight=(\d+\.\d+pt)/g;
	@textwidth = (@textwidth, @textheight);
	my $ntextwidth = scalar @textwidth - 1; my $i;
	for ($i=0; $i <= $ntextwidth; $i++) { $str =~ s/Overfull \\hbox \(\Q$textwidth[$i]\E too wide\)[^\n]+\n//g; }
	open $fh, '>:utf8', "$name.log"; print $fh "@textwidth\n$str"; close($fh);
}

# Run finalize.pl if needed
if ( $finalize == 1 ) { 
	if ( -e 'finalize.pl' ) {
		do './finalize.pl';
		unlink "batch.txt";
	}
	do './delauxitems.pl';
	unlink @delfiles, 'textable.tmp.txt';
}

# Move original file back if needed
if (( $save == 1 ) && ( -e "$namesave.tex" )) {
	copy "$namesave.tex", "$name.tex";
	unlink "$namesave.tex";
}

# Reset to old path and clean up
$ENV{PATH} = "$oldpath";
if ( -e "noperlfirst.txt" ) { unlink "noperlfirst.txt"; }
