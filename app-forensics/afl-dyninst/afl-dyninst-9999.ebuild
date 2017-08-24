EAPI=6
inherit git-r3

DESCRIPTION="AFL Fuzzing blackbox binaries"
HOMEPAGE="https://github.com/talos-vulndev/afl-dyninst"
EGIT_REPO_URI="https://github.com/talos-vulndev/afl-dyninst"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
RDEPEND="app-forensics/dyninst
	app-forensics/afl"

src_prepare() {
	default
	sed -i 's;#include "config.h";#include <afl/config.h>;' libAflDyninst.cpp
}

src_install() {
	dolib libAflDyninst.so
	dobin afl-dyninst
}
