# $NetBSD: Makefile,v 1.40 2022/09/09 15:17:20 wiz Exp $

DISTNAME=	hunspell-1.7.1
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=hunspell/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	ahoka@NetBSD.org
HOMEPAGE=	https://hunspell.github.io/
COMMENT=	Improved spellchecker
LICENSE=	mpl-1.1 OR gnu-lgpl-v2.1 OR gnu-gpl-v2

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_TOOLS+=		pkg-config perl:run autoreconf autoconf automake autopoint
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++03

CPPFLAGS.SunOS+=	-D_XPG6

CONFIGURE_ARGS+=	--with-ui

PKGCONFIG_OVERRIDE+=	hunspell.pc.in

SUBST_CLASSES+=		paths
SUBST_MESSAGE.paths=	Fixing default path to dictionaries.
SUBST_STAGE.paths=	pre-configure
SUBST_FILES.paths=	man/hunspell.1 man/hu/hunspell.1 src/tools/hunspell.cxx
SUBST_SED.paths+=	-e 's,/usr/share/hunspell,${PREFIX}/share/hunspell,g'
# Trailing slash important to not change hunspell.cxx
SUBST_SED.paths+=	-e 's,/usr/share/myspell/,${PREFIX}/share/hunspell/,g'

PLIST_SRC=		PLIST
PLIST_SUBST+=		DISTNAME=${DISTNAME}

REPLACE_PERL=	src/tools/ispellaff2myspell

post-patch:
	cd ${WRKSRC} && ${TOOLS_PATH.autoreconf} -v -i --force

.include "options.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../mk/curses.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
