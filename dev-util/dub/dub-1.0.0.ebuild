# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Package and build management system for the D programming language"
HOMEPAGE="http://code.dlang.org/"
LICENSE="MIT"

SLOT="0"
KEYWORDS="amd64 x86"

SRC_URI="https://github.com/rejectedsoftware/dub/archive/v1.0.0.tar.gz"

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"

src_compile() {
	./build.sh
}

src_install() {
	dobin bin/dub
	dodoc README.md
}
