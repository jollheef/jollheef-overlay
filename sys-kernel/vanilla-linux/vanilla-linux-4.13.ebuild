# Copyright 1999-2017 Gentoo Foundation
# Author: Mikhail Klementyev <jollheef@riseup.net>
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils git-r3

DESCRIPTION="Linux kernel"
HOMEPAGE="https://kernel.org/"
EGIT_REPO_URI="https://github.com/torvalds/linux.git"
EGIT_COMMIT="v${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cryptsetup suid"

DEPEND="sys-devel/make sys-devel/binutils dev-lang/perl sys-devel/bc"
RDEPEND="${DEPEND}"

ARCH=x86

src_prepare() {
    default

    echo 'config LOCAL_CONFIG' >> Kconfig
    echo -e '\tbool "Local configuration"' >> Kconfig
    echo -e '\tdefault y' >> Kconfig

    if use cryptsetup; then
        echo -e '\tselect DM_CRYPT' >> Kconfig
        echo -e '\tselect CRYPTO_USER_API_SKCIPHER' >> Kconfig
        cat /proc/cpuinfo | grep aes && {
            echo -e '\tselect CRYPTO_AES_NI_INTEL' >> Kconfig
        }
    fi

    if use suid; then
        echo -e '\tselect USER_NS' >> Kconfig
    fi

    make defconfig
}

src_install() {
    mkdir -p ./boot
    make install INSTALL_PATH=./boot
    insinto /boot
    ls ./boot | while read file; do
       doins ./boot/${file}
    done
}
