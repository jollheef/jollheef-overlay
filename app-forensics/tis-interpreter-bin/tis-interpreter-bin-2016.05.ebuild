# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Tnterpreter of C for detecting undefined behavior"
HOMEPAGE="https://trust-in-soft.com/"
SRC_URI="http://trust-in-soft.com/tis-interpreter-2016-05.linux-x86_64.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"
S="${WORKDIR}"

src_install() {
	insinto /opt
	doins -r tis-interpreter

	exeinto /opt/tis-interpreter/
	doexe tis-interpreter/{tis-mkfs,tis-interpreter.sh}

	exeinto /opt/tis-interpreter/tis-interpreter/bin/
	doexe tis-interpreter/tis-interpreter/bin/frama-c

	mkdir helpers
	echo -e '#!/bin/sh\n/opt/tis-interpreter/tis-interpreter.sh $@' >> helpers/tis-interpreter
	echo -e '#!/bin/sh\n/opt/tis-interpreter/tis-mkfs $@' >> helpers/tis-mkfs

	exeinto /usr/bin
	doexe helpers/{tis-mkfs,tis-interpreter}
}
