# $NetBSD: Makefile,v 1.18 2022/09/12 06:54:04 wiz Exp $

DISTNAME=	pydoctor-22.7.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	devel textproc python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pydoctor/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/twisted/pydoctor
COMMENT=	Python API document generator
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-appdirs-[0-9]*:../../devel/py-appdirs
DEPENDS+=	${PYPKGPREFIX}-astor>=0.8.1:../../devel/py-astor
DEPENDS+=	${PYPKGPREFIX}-attrs>=0:../../devel/py-attrs
DEPENDS+=	${PYPKGPREFIX}-configargparse>=0:../../devel/py-configargparse
DEPENDS+=	${PYPKGPREFIX}-cachecontrol-[0-9]*:../../devel/py-cachecontrol
DEPENDS+=	${PYPKGPREFIX}-lunr>=0.6.2:../../textproc/py-lunr
DEPENDS+=	${PYPKGPREFIX}-docutils>=0.17:../../textproc/py-docutils
DEPENDS+=	${PYPKGPREFIX}-requests-[0-9]*:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-twisted-[0-9]*:../../net/py-twisted
DEPENDS+=	${PYPKGPREFIX}-toml-[0-9]*:../../textproc/py-toml
TEST_DEPENDS+=	${PYPKGPREFIX}-beautifulsoup4-[0-9]*:../../www/py-beautifulsoup4
TEST_DEPENDS+=	${PYPKGPREFIX}-hypothesis-[0-9]*:../../devel/py-hypothesis
TEST_DEPENDS+=	${PYPKGPREFIX}-sphinx-[0-9]*:../../textproc/py-sphinx
TEST_DEPENDS+=	${PYPKGPREFIX}-test-[0-9]*:../../devel/py-test

PYTHON_VERSIONS_INCOMPATIBLE+=	27 37

.include "../../lang/python/pyversion.mk"

.if ${PYPKGPREFIX} == "py37"
DEPENDS+=	${PYPKGPREFIX}-importlib-metadata-[0-9]*:../../devel/py-importlib-metadata
.endif
.if ${PYPKGPREFIX} == "py37" || ${PYPKGPREFIX} == "py38"
DEPENDS+=	${PYPKGPREFIX}-importlib-resources-[0-9]*:../../devel/py-importlib-resources
.endif

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
