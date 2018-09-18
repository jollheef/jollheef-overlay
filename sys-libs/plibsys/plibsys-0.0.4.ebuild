# Copyright 1999-2018 Mikhail Klementev
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils

DESCRIPTION="Highly portable C system library"
HOMEPAGE="http://saprykin.github.io/plibsys-docs"
SRC_URI="https://github.com/saprykin/plibsys/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~mips ~ppc ~ppc64 ~sparc ~x86"
