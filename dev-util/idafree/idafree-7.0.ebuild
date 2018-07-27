# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3

EAPI=6

inherit eutils

DESCRIPTION="IDA is the Interactive DisAssembler: the world's smartest and most feature-full disassembler, which many software security specialists are familiar with."
SRC_URI="https://out7.hex-rays.com/files/idafree70_linux.run"
HOMEPAGE="https://www.hex-rays.com/"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="bindist strip"

RDEPEND="dev-qt/qtgui:5
		dev-qt/qtcore:5
		dev-qt/qtprintsupport:5
		dev-qt/qtwidgets:5
		sys-libs/binutils-libs"

S=${WORKDIR}

src_install() {
	cp ${DISTDIR}/idafree70_linux.run ./
	chmod +x idafree70_linux.run
	./idafree70_linux.run --mode unattended --prefix ${WORKDIR}/opt/idafree70

	insinto /
	doins -r opt

	exeinto /opt/idafree70
	doexe ./opt/idafree70/ida64
	dosym /opt/idafree70/ida64 /usr/bin/ida64
}
