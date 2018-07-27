# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

EGIT_REPO_URI="https://github.com/jollheef/battery-watcher-daemon.git"
inherit git-2
DESCRIPTION="Daemon for run \$COMMAND on low battery"
HOMEPAGE="https://github.com/jollheef/battery-watcher-daemon"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	dobin battery-watcher
	doinitd battery-watcherd
	echo 'DAEMON_ARGS=""' > battery-watcherd
	doconfd battery-watcherd
}
