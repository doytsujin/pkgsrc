# $NetBSD: Makefile,v 1.70 2022/08/11 05:09:29 gutteridge Exp $
#

DISTNAME=	libgnomekbd-3.6.0
PKGREVISION=	12
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/libgnomekbd/3.6/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.gnome.org/
COMMENT=	Gnome keyboard configuration library
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config intltool gmake msgfmt

GNU_CONFIGURE_GCONF_SCHEMAS=	no

PKGCONFIG_OVERRIDE+=	libgnomekbd.pc.in
PKGCONFIG_OVERRIDE+=	libgnomekbdui.pc.in

.include "../../devel/GConf/schemas.mk"
.include "../../x11/gtk3/buildlink3.mk"
BUILDLINK_API_DEPENDS.libxklavier+=	libxklavier>=4.0
.include "../../x11/libxklavier/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
