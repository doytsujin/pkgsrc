# $NetBSD: Makefile,v 1.20 2022/06/28 11:30:53 wiz Exp $

DISTNAME=	Compress-LZMA-Simple-0.2
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	15
CATEGORIES=	archivers
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Compress/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Compress-LZMA-Simple
COMMENT=	Perl interface of lzmalib
LICENSE=	${PERL5_LICENSE}

PERL5_PACKLIST=	auto/Compress/LZMA/Simple/.packlist

.include "../../archivers/lzmalib/buildlink3.mk"
.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
