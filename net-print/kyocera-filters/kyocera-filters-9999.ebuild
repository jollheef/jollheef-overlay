# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils
inherit git-2

EGIT_REPO_URI="https://github.com/jollheef/rastertokpsl-re.git"
EGIT_BRANCH="master"
DESCRIPTION="Cups filters for Kyocera FS-1040"
HOMEPAGE="https://github.com/jollheef/rastertopksl-re/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_unpack() {
        git-2_src_unpack
        cd $EGIT_SOURCEDIR
}

src_install() {
        exeinto /usr/libexec/cups/filter/
        newexe bin/rastertokpsl-re rastertokpsl-re
        newexe scripts/rastertokpsl-re-fixed rastertokpsl-re-fixed

        insinto /usr/share/cups/model/Kyocera/
        newins Kyocera_FS-1040GDI_RE.ppd Kyocera_FS-1040GDI_RE.ppd
}