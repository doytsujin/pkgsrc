# $NetBSD: Makefile,v 1.108 2022/08/19 11:15:16 tnn Exp $

DISTNAME=	gpgme-1.18.0
CATEGORIES=	security
MASTER_SITES=	https://www.gnupg.org/ftp/gcrypt/gpgme/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.gnupg.org/related_software/gpgme/
COMMENT=	GnuPG Made Easy
LICENSE=	gnu-gpl-v2

USE_LANGUAGES+=		c99 c++
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake
GNU_CONFIGURE=		yes
PTHREAD_OPTS+=		require
INFO_FILES=		yes
CONFIGURE_ARGS+=	--enable-languages="cl cpp"

# configure: error: A compiler with c++11 support is required for the c++ binding.
GCC_REQD+=		4.8

SUBST_CLASSES+=		pthread
SUBST_FILES.pthread=	src/gpgme-config.in
SUBST_SED.pthread+=	-e 's,@PTHREAD_LIBS@,${PTHREAD_LDFLAGS} ${PTHREAD_LIBS},g'
SUBST_VARS.pthread=	PTHREAD_CFLAGS
SUBST_STAGE.pthread=	pre-configure

CPPFLAGS.Darwin=	-D_POSIX_C_SOURCE=200809L
LIBS.SunOS+=		-lnsl -lsocket

BUILDLINK_TRANSFORM+=	rm:-Wsuggest-override

TEST_TARGET=		all
TEST_DIRS=		tests

.include "options.mk"

.include "../../security/libassuan2/buildlink3.mk"
BUILDLINK_API_DEPENDS.libgpg-error+=	libgpg-error>=1.28
.include "../../security/libgpg-error/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
