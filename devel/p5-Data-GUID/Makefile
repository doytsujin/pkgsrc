# $NetBSD: Makefile,v 1.13 2022/06/28 11:32:10 wiz Exp $

DISTNAME=	Data-GUID-0.050
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Data/}

MAINTAINER=	ryoon@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Data-GUID
COMMENT=	Perl 5 module for globally unique identifiers
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Data-UUID>=1.148:../../devel/p5-Data-UUID
DEPENDS+=	p5-Sub-Exporter>=0.90:../../devel/p5-Sub-Exporter
DEPENDS+=	p5-Sub-Install>=0.03:../../devel/p5-Sub-Install

PERL5_PACKLIST=		auto/Data/GUID/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
