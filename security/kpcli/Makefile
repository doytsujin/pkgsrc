# $NetBSD: Makefile,v 1.28 2022/06/28 11:35:35 wiz Exp $

DISTNAME=	kpcli-3.3
PKGREVISION=	6
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=kpcli/}
EXTRACT_SUFX=	.pl

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://kpcli.sourceforge.net/
COMMENT=	Command line interface to KeePass password safes
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Clone-[0-9]*:../../devel/p5-Clone
DEPENDS+=	p5-Sort-Naturally-[0-9]*:../../devel/p5-Sort-Naturally
DEPENDS+=	p5-Term-ReadKey-[0-9]*:../../devel/p5-Term-ReadKey
DEPENDS+=	p5-Term-ShellUI-[0-9]*:../../devel/p5-Term-ShellUI
DEPENDS+=	p5-Crypt-Rijndael-[0-9]*:../../security/p5-Crypt-Rijndael
DEPENDS+=	p5-File-KeePass-[0-9]*:../../security/p5-File-KeePass
DEPENDS+=	p5-Crypt-PWSafe3-[0-9]*:../../security/p5-Crypt-PWSafe3
DEPENDS+=	p5-Term-ReadLine-Gnu-[0-9]*:../../devel/p5-Term-ReadLine-Gnu

WRKSRC=		${WRKDIR}
USE_LANGUAGES=	# none

REPLACE_PERL=		${DISTNAME}.pl
INSTALLATION_DIRS=	bin

do-build:

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${DISTNAME}.pl ${DESTDIR}${PREFIX}/bin/kpcli.pl

.include "../../lang/perl5/buildlink3.mk"
.include "../../lang/perl5/license.mk"
.include "../../mk/bsd.pkg.mk"
