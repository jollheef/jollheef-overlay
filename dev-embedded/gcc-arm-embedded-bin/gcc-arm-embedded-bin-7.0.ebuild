# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="GNU ARM Embedded Toolchain."
HOMEPAGE="https://developer.arm.com/open-source/gnu-toolchain/gnu-rm"
SRC_URI="https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2"

LICENSE="BSD GPL GPL-2 LGPL-2 LGPL-3 MIT NEWLIB ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86 -*"
IUSE="doc samples"
RESTRICT="strip binchecks"

DEPEND=""
RDEPEND="amd64? ( sys-libs/glibc[multilib] )"

S="${WORKDIR}"/gcc-arm-none-eabi-7-2017-q4-major

src_install() {
	if ! use samples ; then
		rm -rf "${S}"/share/gcc-arm-none-eabi/samples
	fi
	if ! use doc ; then
		rm -rf "${S}"/share/doc
	fi

	dodir /opt/${PN}
	cp -r "${S}"/* "${ED}"/opt/${PN} || die "cp failed"
	fowners -R root:0 /opt/${PN}

	local DEST=/opt/${PN}
	cat > "${T}/env" << EOF
PATH=${DEST}/bin
ROOTPATH=${DEST}/bin
LDPATH=${DEST}/lib
MANPATH=${DEST}/share/doc/arm-arm-none-eabi/man
EOF
	newenvd "${T}/env" 99gcc-arm-embedded-bin
}

pkg_postinst() {
	env-update
}
