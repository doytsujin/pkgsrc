# $NetBSD: Makefile,v 1.19 2022/09/28 18:10:41 schmonz Exp $

DISTNAME=		texttest-4.2.1
GITHUB_TAG=		${PKGVERSION_NOREV}
PKGNAME=		${DISTNAME:tl}
CATEGORIES=		devel python
MASTER_SITES=		${MASTER_SITE_GITHUB:=texttest/}

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		http://texttest.sourceforge.net/
COMMENT=		Tool for text-based Approval Testing
LICENSE=		gnu-lgpl-v2.1

DEPENDS+=		${PYPKGPREFIX}-gobject3-[0-9]*:../../devel/py-gobject3
DEPENDS+=		${PYPKGPREFIX}-psutil-[0-9]*:../../sysutils/py-psutil

USE_LANGUAGES=		# none

REPLACE_PYTHON+=	texttestlib/default/batch/__init__.py
REPLACE_PYTHON+=	texttestlib/default/virtualdisplay.py

PYTHON_VERSIONS_INCOMPATIBLE=	27

SUBST_CLASSES+=		prefix
SUBST_STAGE.prefix=	pre-configure
SUBST_FILES.prefix=	texttestlib/default/__init__.py
SUBST_VARS.prefix=	PREFIX

.include "../../lang/python/egg.mk"
.include "../../lang/python/application.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
