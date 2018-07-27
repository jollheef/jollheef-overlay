# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit mercurial

DESCRIPTION="vk.com (vkontakte) plugin for Pidgin"
HOMEPAGE="https://bitbucket.org/olegoandreev/purple-vk-plugin"
EHG_REPO_URI="https://bitbucket.org/olegoandreev/purple-vk-plugin"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
SLOT="0"

RDEPEND="net-im/pidgin"

DEPEND="${RDEPEND}"

src_compile() {
    cd "${T}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr "${S}"
    emake
}

src_install() {
    cd "${T}"
    emake DESTDIR="${D}" install
}
