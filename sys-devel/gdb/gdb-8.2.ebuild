# Copyright 1999-2018 Mikhail Klementev
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="The GNU Project Debugger"
HOMEPAGE="https://www.gnu.org/software/gdb/"
SRC_URI="mirror:///gnu/gdb/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="intel-pt"

DEPEND=""
RDEPEND="${DEPEND}
	intel-pt? ( dev-libs/processor-trace )"

src_configure() {
	local myconf=(
		# Gentoo-related
		--disable-install-libbfd
		--disable-install-libiberty
		--disable-{binutils,etc,gas,gold,gprof,ld}
		# Intel processor trace
		$(use_with intel-pt)
	)

	econf "${myconf[@]}"
}

src_install() {
	default

	# Avoid conflicts with bunutils-libs
	find "${ED}/usr/share/locale" -name opcodes.mo -delete -o -name bfd.mo -delete
	rm "${ED}/usr/share/info/bfd.info"
}
