# $NetBSD: Makefile,v 1.9 2022/08/17 16:21:25 tnn Exp $

DISTNAME=	opencl-clang-14.0.0
CATEGORIES=	parallel
MASTER_SITES=	${MASTER_SITE_GITHUB:=intel/}
GITHUB_PROJECT=	opencl-clang	# do not remove this, it breaks cwrappers
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/intel/opencl-clang
COMMENT=	OpenCL-oriented wrapper library around clang
LICENSE=	modified-bsd

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

# C++14
GCC_REQD+=	7 # sync with llvm/clang

BUILDLINK_TRANSFORM.Darwin+=	rm:-Wl,--version-script=${WRKSRC}/common_clang.map
BUILDLINK_TRANSFORM.SunOS+=	rm:-Wl,--version-script=${WRKSRC}/common_clang.map

.include "../../parallel/spirv-llvm-translator/buildlink3.mk"
.include "../../lang/clang/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
