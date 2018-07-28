# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Openwsman command line client"
HOMEPAGE="https://openwsman.github.io"
SRC_URI="https://github.com/Openwsman/wsmancli/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-misc/openwsman"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
	eapply_user
}