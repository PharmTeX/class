#!/usr/bin/perl
# PharmTeX perl artifact download script, part of the PharmTeX platform.
# Copyright (C) 2022 Christian Hove Claussen (contact@pharmtex.org).
# This program is free software: You can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for more details. You should have received a copy of the GNU Affero General Public License along with this program (see file named LICENSE). If not, see <https://www.gnu.org/licenses/>.

# Load packages
use strict;
use warnings;
use open OUT => ':raw';
binmode(STDOUT, ":utf8");
use File::Copy qw(copy);
my $OS = "$^O";

### INSERT DOWNLOAD CODE AFTER THIS POINT, INCLUDING ANY ADDITIONAL PERL PACKAGES NEEDED ###

### END OF ARTIFACT DOWNLOAD SCRIPT ###
