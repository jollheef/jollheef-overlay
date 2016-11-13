# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="A native code to C/C++ decompiler"
HOMEPAGE="https://derevenets.com/"
EGIT_REPO_URI="https://github.com/yegord/snowman.git"
EGIT_COMMIT="v${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-qt/qtcore:5 dev-qt/qtwidgets:5"
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}/src"
