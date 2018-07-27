# Copyright 1999-2018 Gentoo Foundation
# Author: Mikhail Klementev <jollheef@riseup.net>
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="Cross-platform library for building Telegram clients"
HOMEPAGE="https://core.telegram.org/tdlib"
EGIT_REPO_URI="https://github.com/tdlib/td.git"
EGIT_COMMIT="v${PV}"

LICENSE="BSL-1.0"
SLOT=0
KEYWORDS="~amd64"

src_prepare() {
	sed -i \
		-e "/DESTINATION/s:lib:$(get_libdir):g" \
		CMakeLists.txt || die

	cmake-utils_src_prepare
}
