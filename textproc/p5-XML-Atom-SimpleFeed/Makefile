# $NetBSD: Makefile,v 1.33 2022/09/26 11:05:54 kleink Exp $

DISTNAME=	XML-Atom-SimpleFeed-0.905
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=XML/}

MAINTAINER=	kleink@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/XML-Atom-SimpleFeed
COMMENT=	Generate simple Atom syndication feeds
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=		auto/XML/Atom/SimpleFeed/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
