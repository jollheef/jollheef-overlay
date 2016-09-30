# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/HaCk3Dq/vk.git"
inherit git-2
DESCRIPTION="NCurses interface client for VK"
HOMEPAGE="https://github.com/HaCk3Dq/vk"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-libs/ncurses
	dev-lang/dmd
	dev-util/dub
	dev-util/dlang-tools
	"

src_compile() {
	dub build
}

src_install() {
	dobin vk
}
