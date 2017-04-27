# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Reverse engineering tool that lets you disassemble and decompile 32/64 bits intel and ARM executables"
SRC_URI="https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-${PV}-Linux.pkg.tar.xz"

LICENSE="Commercial"
SLOT="0"
KEYWORDS="amd64"

RESTRICT="bindist strip"

RDEPEND="dev-qt/qtgui:5
		dev-qt/qtcore:5
		x11-misc/xdg-utils
		media-libs/tiff
		dev-libs/libbsd
		dev-lang/python:2.7
		>=sys-devel/gcc-5.1.0"

S=${WORKDIR}

src_install() {
	insinto /
	doins -r {usr,opt}

	echo -e '#!/bin/sh\n/opt/hopper-v4/bin/hopper-launcher.sh' >> hopper
	exeinto /usr/bin
	doexe hopper

	exeinto /opt/hopper-v4/bin
	doexe opt/hopper-v4/bin/Hopper
	doexe opt/hopper-v4/bin/hopper-launcher.sh
}
