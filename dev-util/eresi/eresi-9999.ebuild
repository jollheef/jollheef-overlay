# Copyright 1999-2018 Mikhail Klementev
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

DESCRIPTION="The ERESI Reverse Engineering Software Interface"
HOMEPAGE="http://www.eresi-project.org/"
EGIT_REPO_URI="https://github.com/thorkill/eresi.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_configure() {
	./configure --enable-32-64
}

src_install() {
	mkdir /var/tmp/portage/dev-util/eresi-9999/image/usr/
	make DESTDIR=/var/tmp/portage/dev-util/eresi-9999/image/usr/ install
}
