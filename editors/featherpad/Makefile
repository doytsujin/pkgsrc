# $NetBSD: Makefile,v 1.31 2022/10/09 16:04:10 pin Exp $

VERSION=	1.3.3
DISTNAME=	FeatherPad-V${VERSION}
PKGNAME=	featherpad-${VERSION}
CATEGORIES=	editors
MASTER_SITES=	${MASTER_SITE_GITHUB:=tsujan/}
GITHUB_TAG=	V${PKGVERSION_NOREV}

MAINTAINER=	pin@NetBSD.org
HOMEPAGE=	https://github.com/tsujan/FeatherPad/
COMMENT=	Lightweight Qt5 plain-text editor
LICENSE=	gnu-gpl-v3

WRKSRC=		${WRKDIR}/FeatherPad-${VERSION}
USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

CONFIGURE_DIRS=	build
CMAKE_ARG_PATH=	..

pre-configure:
	${MKDIR} -p ${WRKSRC}/build

TOOL_DEPENDS+=	qt5-qttools-[0-9]*:../../x11/qt5-qttools

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtx11extras/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../textproc/hunspell/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
