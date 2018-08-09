# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Security oriented fuzzer with powerful analysis options"
HOMEPAGE="http://honggfuzz.com/"
SRC_URI="https://github.com/google/honggfuzz/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="intel-pt"

DEPEND=""
RDEPEND="${DEPEND}
	sys-libs/binutils-libs
	sys-libs/libunwind
	sys-devel/clang
	intel-pt? ( dev-libs/processor-trace )"

src_install() {
	dobin honggfuzz
	dobin hfuzz_cc/hfuzz-{cc,clang,clang++,gcc,g++}
}
