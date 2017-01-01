# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/AsamK/signal-cli.git"
EGIT_BRANCH="master"
inherit git-2
DESCRIPTION="Command line interface client for Signal"
HOMEPAGE="https://github.com/AsamK/signal-cli.git"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="virtual/jdk"

src_compile() {
	./gradlew build
	./gradlew installDist
}

src_install() {
	newbin build/install/signal-cli/bin/signal-cli signal-cli
        dolib build/install/signal-cli/lib/*
}
