# $NetBSD: Makefile,v 1.29 2022/06/28 11:31:55 wiz Exp $

DISTNAME=	B-Hooks-OP-Check-0.22
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	5
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=B/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/B-Hooks-OP-Check
COMMENT=	Perl 5 module to wrap OP check callbacks
LICENSE=	${PERL5_LICENSE}

BUILD_DEPENDS+=	p5-ExtUtils-Depends>=0.302:../../devel/p5-ExtUtils-Depends
#DEPENDS+=	{perl>=5.10.1,p5-parent>0}:../../devel/p5-parent

USE_LANGUAGES=		c
PERL5_PACKLIST=		auto/B/Hooks/OP/Check/.packlist

post-install:
	${INSTALL_DATA_DIR} ${DESTDIR}/${PREFIX}/include
	${INSTALL_DATA} ${WRKSRC}/hook_op_check.h ${DESTDIR}/${PREFIX}/include

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
