Stata package wordwrap
======================

Wordwrap is a Stata routing that wraps a string to a specific number of characters. What wordwrap does is really just wrapping a very long string into pieces and adding line breaks. This might be useful if you are dealing with very long notes below Stata graphs or other stuff. No hyphenation supported.


## Installation

You can install the latest version of wordwrap via Stata:

	. net from https://mloeffler.github.io/stata/
	. net install wordwrap

Done.


## Use

There is a good example by [Scott Merryman](http://www.stata.com/statalist/archive/2007-03/msg00778.html) and [Raymond P. Guiteras](http://www.stata.com/statalist/archive/2008-01/msg00579.html) on the Stata list:

	. local text = "This is a pretty short note with text."
	. sysuse auto
	. scatter weight length, note("`text'")

Just see, what it does. This note is short, but still we may break it into several lines:

	. wordwrap "`text'", l(10)
	. scatter weight length, note("`r(text)'")

This is even shorter, right? Of course you wouldn't break a note like this into pieces. But image how useful this could be if you had to document all the details of your graph in one single very long note.


## Info

Copyright (C) 2014, [Max Löffler](http://www.zew.de/en/staff/mlo)

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

