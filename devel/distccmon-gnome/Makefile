# $NetBSD: Makefile,v 1.76 2022/08/11 05:08:08 gutteridge Exp $

PKGNAME=	${DISTNAME:S/-/-gnome-/}
PKGREVISION=	1
CATEGORIES+=	gnome
COMMENT=	Graphical monitor for distcc, the distributed C/C++ compiler

.include "../../devel/distcc/Makefile.common"

BROKEN=			"Requires libgnome-3.0 and libgnomeui-3.0"
USE_TOOLS+=		pkg-config
CONFIGURE_ARGS+=	--with-gnome

BUILD_TARGET=		distccmon-gnome
INSTALLATION_DIRS+=	share/distcc

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/distccmon-gnome ${DESTDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/gnome/distccmon-gnome.png \
		${DESTDIR}${PREFIX}/share/distcc
	${INSTALL_DATA} ${WRKSRC}/gnome/distccmon-gnome.desktop \
		${DESTDIR}${PREFIX}/share/distcc

.include "../../devel/libgnome/buildlink3.mk"
.include "../../devel/libgnomeui/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../net/avahi/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
