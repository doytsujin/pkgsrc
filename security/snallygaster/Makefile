# $NetBSD: Makefile,v 1.8 2022/07/23 15:19:38 leot Exp $

DISTNAME=	snallygaster-0.0.12
CATEGORIES=	security python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/snallygaster/}

MAINTAINER=	leot@NetBSD.org
HOMEPAGE=	https://github.com/hannob/snallygaster
COMMENT=	Tool to scan for secret files on HTTP servers
LICENSE=	cc0-1.0-universal

DEPENDS+=	${PYPKGPREFIX}-beautifulsoup4-[0-9]*:../../www/py-beautifulsoup4
DEPENDS+=	${PYPKGPREFIX}-dns-[0-9]*:../../net/py-dns
DEPENDS+=	${PYPKGPREFIX}-urllib3-[0-9]*:../../www/py-urllib3

USE_LANGUAGES=			# none

# Only for Python 3
PYTHON_VERSIONS_INCOMPATIBLE=	27

.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
