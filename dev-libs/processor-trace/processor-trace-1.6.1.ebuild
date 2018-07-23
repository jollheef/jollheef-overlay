# Copyright 1999-2018 Gentoo Foundation
# Author: Mikhail Klementev <jollheef@riseup.net>
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="Intel(R) Processor Trace decoder library"
HOMEPAGE="https://github.com/01org/processor-trace"
EGIT_REPO_URI="https://github.com/01org/processor-trace.git"
EGIT_COMMIT="v${PV}"

LICENSE="BSD"
SLOT=0
KEYWORDS="amd64"
