# Copyright 1999-2018 Mikhail Klementev
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils xdg-utils

DESCRIPTION="Disassembler and decompiler for 32/64 bits intel and ARM executables"
SRC_URI="https://d2ap6ypl1xbe4k.cloudfront.net/Hopper-v4-${PV}-Linux.pkg.tar.xz"
HOMEPAGE="https://www.hopperapp.com/"

LICENSE="Hopper-Disassembler-LA CPL-1.0 UoI-NCSA BSD"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="bindist strip"

RDEPEND="dev-qt/qtgui:5
		dev-qt/qtcore:5
		dev-qt/qtxml:5
		dev-qt/qtnetwork:5
		dev-qt/qtprintsupport:5
		x11-misc/xdg-utils
		media-libs/tiff
		dev-libs/libbsd
		dev-lang/python:2.7
		>=sys-devel/gcc-5.1.0
		sys-libs/ncurses
		sys-libs/binutils-libs
		dev-libs/libffi:0/0"

S=${WORKDIR}

src_prepare() {
	sed -i'' -e 's/\.png$//' -e 's/Application;//' \
		usr/share/applications/hopper-v4.desktop
	eapply_user
}

src_install() {
	insinto /
	doins -r {usr,opt}

	exeinto /opt/hopper-v4/bin
	doexe opt/hopper-v4/bin/Hopper
	dosym /opt/hopper-v4/bin/Hopper /usr/bin/hopper
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
