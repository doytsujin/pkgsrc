# $NetBSD: Makefile,v 1.7 2022/09/11 12:51:53 wiz Exp $

DISTNAME=	mojoshader-0.0.20220415
PKGREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	${MASTER_SITE_GITHUB:=icculus/}
GITHUB_TAG=	335f92c67a719bff03b51dc83d34431ca823228a

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.icculus.org/mojoshader/
COMMENT=	Library to move calls to Direct3D shaders to OpenGL
LICENSE=	zlib

USE_LANGUAGES+=	c c++

USE_CMAKE=	yes

# FLIP_VIEWPORT is needed by some FNA games (FEZ if I recall correctly)
CMAKE_ARGS=	-DBUILD_SHARED_LIBS=ON \
		-DFLIP_VIEWPORT=1 \
		-DPROFILE_METAL=OFF

INSTALLATION_DIRS=	lib include

# No upstream install target
do-install:
	${INSTALL_DATA} ${WRKSRC}/mojoshader*.h ${DESTDIR}${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/libmojoshader.so ${DESTDIR}${PREFIX}/lib

.include "../../graphics/vulkan-headers/buildlink3.mk"
.include "../../devel/SDL2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
