# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop qmake-utils xdg

DESCRIPTION="Qt5-based Chess Database Utility"
HOMEPAGE="http://chessx.sourceforge.net/"
SRC_URI="https://sourceforge.net/projects/chessx/files/chessx/${PV}/${P}.tgz"

LICENSE="GPL-2+ LGPL-2+ LGPL-2.1+ ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-libs/quazip-0.9.1
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtsvg:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	dev-qt/qtconcurrent:5
"
BDEPEND="
	dev-qt/linguist-tools:5
	virtual/pkgconfig
"

PATCHES=( "${FILESDIR}"/${P}-system-quazip.patch )

src_configure() {
	eqmake5
}

src_install() {
	dobin release/${PN}
	dodoc ChangeLog TODO
	doicon data/images/${PN}.png
	domenu unix/chessx.desktop
}
