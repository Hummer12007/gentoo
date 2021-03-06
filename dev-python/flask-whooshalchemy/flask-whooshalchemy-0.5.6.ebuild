# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{2_7,3_4} pypy )

RESTRICT="test"		# appears pretty borken

inherit distutils-r1 versionator

MY_PN="Flask-WhooshAlchemy"
MY_P="${MY_PN}-$(replace_version_separator 2 '')"

DESCRIPTION="Whoosh extension to Flask/SQLAlchemy"
HOMEPAGE="https://github.com/gyllstromk/Flask-WhooshAlchemy https://pypi.python.org/pypi/${MY_PN}"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND="dev-python/flask[${PYTHON_USEDEP}]
	dev-python/flask-sqlalchemy[${PYTHON_USEDEP}]
	dev-python/blinker[${PYTHON_USEDEP}]
	dev-python/whoosh[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
#	test? (
#		dev-python/flask-testing[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${MY_P}"

python_test() {
	nosetests || die "Testing failed with ${EPYTHON}"
}
