# $NetBSD: Makefile,v 1.18 2022/09/11 12:51:29 wiz Exp $

DISTNAME=	focuswriter-1.7.6
PKGREVISION=	14
CATEGORIES=	editors
MASTER_SITES=	${MASTER_SITE_GITHUB:=gottcode/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://gottcode.org/focuswriter/
COMMENT=	Simple, distraction-free writing environment
LICENSE=	gnu-gpl-v3

USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c++
USE_TOOLS+=		pkg-config

INSTALL_MAKE_FLAGS+=	INSTALL_ROOT=${DESTDIR}

do-configure:
	cd ${WRKSRC} && \
	${SETENV} ${CONFIGURE_ENV} \
	${QTDIR}/bin/qmake -o Makefile \
		PREFIX=${PREFIX} PKGMANDIR=${PKGMANDIR}

TOOL_DEPENDS+=	qt5-qttools-[0-9]*:../../x11/qt5-qttools

.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtmultimedia/buildlink3.mk"
.include "../../audio/pulseaudio/buildlink3.mk"
.include "../../textproc/hunspell/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
