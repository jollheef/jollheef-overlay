# Copyright 1999-2018 Mikhail Klementev
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Git remote helper to push and pull from repositories encrypted with GnuPG"
HOMEPAGE="https://spwhitton.name/tech/code/git-remote-gcrypt/"
SRC_URI="https://github.com/spwhitton/git-remote-gcrypt/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-vcs/git
	app-crypt/gnupg"
RDEPEND="${DEPEND}"

src_install()
{
	DESTDIR="${D}" prefix="${EPREFIX}/usr" ./install.sh || die
}
