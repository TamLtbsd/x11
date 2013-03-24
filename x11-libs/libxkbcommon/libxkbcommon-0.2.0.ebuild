# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

if [[ ${PV} = *9999* ]]; then
	GIT_ECLASS="git-2"
	EXPERIMENTAL="true"
	EGIT_REPO_URI="git://anongit.freedesktop.org/${PN}"
	KEYWORDS=""
else
	XORG_BASE_INDIVIDUAL_URI=""
	SRC_URI="http://xkbcommon.org/download/${P}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
fi

inherit xorg-2 ${GIT_ECLASS}

DESCRIPTION="X.Org xkbcommon library"
XORG_EAUTORECONF="yes"

IUSE="doc"

RDEPEND="
	x11-proto/xproto
	>=x11-proto/kbproto-1.0.5"
DEPEND="${RDEPEND}
	sys-devel/bison
	sys-devel/flex
	doc? ( app-doc/doxygen )"

XORG_CONFIGURE_OPTIONS=(
	--with-xkb-config-root="${EPREFIX}/usr/share/X11/xkb" $(use_with doc doxygen)
)
