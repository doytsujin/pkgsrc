# $NetBSD: Makefile,v 1.24 2022/06/28 11:33:17 wiz Exp $

DISTNAME=	TAP-Formatter-HTML-0.11
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	11
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/S/SP/SPURKIS/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/pod/TAP::Formatter::HTML
COMMENT=	TAP Test Harness output delegate for html output
LICENSE=	${PERL5_LICENSE}

#DEPENDS+=	{perl>=5.10.1,p5-Test-Harness>=3.10}:../../devel/p5-Test-Harness
DEPENDS+=	p5-Template-Toolkit>=2.14:../../www/p5-Template-Toolkit
DEPENDS+=	p5-URI>=1.35:../../www/p5-URI
DEPENDS+=	p5-accessors>=0.2:../../devel/p5-accessors

PERL5_MODULE_TYPE=	Module::Build
PERL5_PACKLIST=		auto/TAP/Formatter/HTML/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
