# $NetBSD: Makefile,v 1.7 2022/09/06 18:47:27 adam Exp $

.include "../../net/nmap/Makefile.common"

PKGNAME=	${DISTNAME:S/nmap/ndiff/}

COMMENT=	Compares Nmap scans

WRKSRC=		${WRKDIR}/${DISTNAME}/ndiff

EXTRACT_ELEMENTS=	${DISTNAME}/ndiff

PYTHON_VERSIONS_ACCEPTED=	27

SUBST_CLASSES+=		setup
SUBST_STAGE.setup=	pre-configure
SUBST_MESSAGE.setup=	Fixing setup.
SUBST_FILES.setup=	setup.py
SUBST_SED.setup=	-e 's,share/man,${PKGMANDIR},g'
SUBST_SED.setup+=	-e 's,\(self.create_uninstaller\),\#\1,g'

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
