# $NetBSD: Makefile,v 1.30 2022/09/01 13:50:49 taca Exp $

DISTNAME=	sinatra-2.2.2
CATEGORIES=	www

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.sinatrarb.com/
COMMENT=	Classy web-development dressed in a DSL
LICENSE=	mit

DEPENDS+=	${RUBY_PKGPREFIX}-rack>=2.2<3:../../www/ruby-rack
DEPENDS+=	${RUBY_PKGPREFIX}-rack-protection>=2.2.2<2.3:../../www/ruby-rack-protection
DEPENDS+=	${RUBY_PKGPREFIX}-mustermann>=2.0<3:../../www/ruby-mustermann
DEPENDS+=	${RUBY_PKGPREFIX}-tilt>=2.0<3:../../textproc/ruby-tilt

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
