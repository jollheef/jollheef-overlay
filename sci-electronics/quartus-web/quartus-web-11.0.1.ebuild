# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Full-featured EDA product for altera devices"
SRC_URI="11.0sp1_quartus_free_linux.sh"

LICENSE="Quartus-prime-megacore"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="media-libs/libpng:1.2"

RESTRICT="fetch bindist strip"

RDEPEND="media-libs/libpng:1.2[abi_x86_32]
		x11-libs/libXft[abi_x86_32]
		app-arch/bzip2[abi_x86_32]
		sys-libs/zlib[abi_x86_32]
		sys-libs/glibc[multilib]"
S=${WORKDIR}

pkg_nofetch() {
    elog "Due to licensing restrictions, you need to download the distfile manually."
    elog "Please navigate to https://www.altera.com/downloads/software/quartus-ii-we/110sp1.html"
    elog "Sign in with your Altera account (you need to register)"
    elog "Download ${SRC_URI} and place it into ${DISTDIR}"
    elog "And restart the installation."
}

pkg_pretend() {
    einfo "The checksum and unpack will take quite some time to run"
}

src_unpack() {
    ${DISTDIR}/${A} --noexec --target ${S}
}

src_install() {
    einfo "The Quartus install runs in unattended mode"
    einfo "you wont see much and it will take a long time"

    cp /usr/lib32/libz.so ./altera_installer/bin/libz.so.1

    ./setup --remove_temp -w --auto --install=quartus_free \
            --target="${D}/opt/quartus-web-${PV}/" \
            2>&1 >>/dev/null || die

    RUN_SCRIPT=${D}/opt/bin/quartus-11.0sp1
    mkdir -p ${D}/opt/bin/

    echo '#!/bin/bash' >> ${RUN_SCRIPT}
    echo 'LD_LIBRARY_PATH=/opt/quartus-web-11.0.1/installer /opt/quartus-web-11.0.1/quartus/bin/quartus ${@}' >> ${RUN_SCRIPT}
    chmod +x ${RUN_SCRIPT}
}
