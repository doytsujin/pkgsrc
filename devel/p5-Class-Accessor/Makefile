# $NetBSD: Makefile,v 1.32 2022/06/28 11:31:59 wiz Exp $

DISTNAME=	Class-Accessor-0.51
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	5
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Class/}

MAINTAINER=	hiramatu@boreas.dti.ne.jp
HOMEPAGE=	https://metacpan.org/release/Class-Accessor
COMMENT=	Automated accessor generation
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=		auto/Class/Accessor/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
