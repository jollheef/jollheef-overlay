# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="https://github.com/AsamK/signal-cli.git"
EGIT_BRANCH="master"
inherit git-2
inherit user
DESCRIPTION="Command line interface client for Signal"
HOMEPAGE="https://github.com/AsamK/signal-cli.git"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="virtual/jdk dev-java/libmatthew-java"

src_compile() {
	./gradlew build
	./gradlew installDist
}

src_install() {
	newbin build/install/signal-cli/bin/signal-cli signal-cli
        dolib build/install/signal-cli/lib/*

        sed -i 's/signal-cli/signal/' data/org.asamk.Signal.conf
        insinto /etc/dbus-1/system.d/
        doins data/org.asamk.Signal.conf

        insinto /usr/share/dbus-1/system-services/
        doins data/org.asamk.Signal.service

	newinitd "${FILESDIR}"/signal-cli.init signal-cli
        newconfd "${FILESDIR}"/signal-cli.conf signal-cli
}

pkg_postinst() {
	enewgroup signal
	enewuser signal -1 -1 /var/lib/signal-cli signal

	if [[ ! -e "${EROOT%/}"/var/lib/signal-cli ]]; then
		mkdir -p "${EROOT%/}"/var/lib/signal-cli || die
		chown signal:signal "${EROOT%/}"/var/lib/signal-cli || die
		chmod 700 "${EROOT%/}"/var/lib/signal-cli || die
	fi
}
