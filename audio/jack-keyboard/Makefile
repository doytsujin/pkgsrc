# $NetBSD: Makefile,v 1.4 2022/09/11 12:51:18 wiz Exp $

DISTNAME=	jack-keyboard-2.7.2
PKGREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=jack-keyboard/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://jack-keyboard.sourceforge.net/
COMMENT=	Virtual MIDI keyboard for JACK applications
LICENSE=	2-clause-bsd

USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

CMAKE_ARGS+=	-DLashEnable=OFF

.include "../../audio/jack/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
