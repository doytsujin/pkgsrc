# $NetBSD: Makefile,v 1.34 2022/08/11 05:09:29 gutteridge Exp $
#

DISTNAME=	libunique-3.0.2
PKGNAME=	${DISTNAME:S/libunique/libunique3/}
PKGREVISION=	29
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/libunique/3.0/}
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	ryoon@NetBSD.org
#HOMEPAGE=	http://live.gnome.org/LibUnique
COMMENT=	Library for writing single instance applications
LICENSE=	gnu-lgpl-v2.1

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config gmake

PKGCONFIG_OVERRIDE+=	unique.pc.in

.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
