# Copyright 1999-2018 Mikhail Klementev
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Openwsman client api"
HOMEPAGE="https://openwsman.github.io"
SRC_URI="https://github.com/Openwsman/openwsman/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_BINDINGS=NO
		-DDISABLE_SERVER=YES
	)
	cmake-utils_src_configure
}
