# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kde5

DESCRIPTION="Style for QtQuickControls 2 that uses QWidget's QStyle for painting"
SRC_URI="mirror://kde/unstable/${PN}/${P}.tar.xz"

KEYWORDS="~amd64 ~arm ~x86"
LICENSE="|| ( GPL-2+ LGPL-3+ )"
IUSE=""

# drop qtdeclarative subslot operator when QT_MINIMAL >= 5.8.0
DEPEND="
	$(add_qt_dep qtdeclarative '' '' '5=')
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
"
RDEPEND="${DEPEND}
	$(add_qt_dep qtgraphicaleffects)
	$(add_qt_dep qtquickcontrols2)
"
