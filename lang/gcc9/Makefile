# $NetBSD: Makefile,v 1.39 2022/08/10 21:54:47 jperkin Exp $

GCC_PKGNAME=	gcc9
.include "version.mk"

DISTNAME=	gcc-${GCC9_DIST_VERSION}
PKGNAME=	${GCC_PKGNAME}-${GCC9_DIST_VERSION}
## When bumping the PKGREVISION of this package the PKGREVISION of
## lang/gcc9-libs needs to be bumped to be at least 1 more than the
## PKGREVISION of this package!
PKGREVISION=	9
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GNU:=gcc/gcc-${GCC9_VERSION}/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://gcc.gnu.org/
COMMENT=	The GNU Compiler Collection (GCC) - Release 9 Series
LICENSE=	gnu-gpl-v2 AND gnu-gpl-v3 AND gnu-lgpl-v2 AND gnu-lgpl-v3

# These are conditionally overwritten depending on the package options.
DISTFILES=		${DEFAULT_DISTFILES}
EXTRACT_ONLY=		${DEFAULT_DISTFILES}

USE_LANGUAGES=		c c++
USE_TOOLS+=		gmake makeinfo sed:run tar:build
USE_TOOLS.NetBSD+=	gsed

# Relocations result in a linker error on AArch64, but not x86.
MKPIE_SUPPORTED=	no
CHECK_RELRO_SKIP+=	${GCC_PKGNAME}/lib/*

GNU_CONFIGURE=		yes
GNU_CONFIGURE_STRICT=	no # has several configure scripts
OBJDIR=			${WRKDIR}/build
CONFIGURE_DIRS=		${OBJDIR}
CONFIGURE_SCRIPT=	../${DISTNAME}/configure
GCC9_SUBPREFIX=		gcc9
GCC9_PREFIX=		${PREFIX}/${GCC9_SUBPREFIX}
GNU_CONFIGURE_PREFIX=	${GCC9_PREFIX}
INFO_FILES=		yes
CONFIGURE_ARGS+=	--disable-libstdcxx-pch

UNLIMIT_RESOURCES=	datasize stacksize

CHECK_PORTABILITY_SKIP+=	contrib/* # not needed during the build

.include "../../mk/bsd.prefs.mk"

# Even though the build and target host is x86_64-sun-solaris2.11,
# it fails to compile some seemingly linux-specific code.
# https://bugs.llvm.org/show_bug.cgi?id=44665
#
# libtool: compile:  /home/pbulk/build/lang/gcc9/work/build/./gcc/xgcc [...]
#   -c ../../../../gcc-9.2.0/libsanitizer/sanitizer_common/sanitizer_linux.cc
# ...
# ../../../../gcc-9.2.0/libsanitizer/sanitizer_common/sanitizer_linux.cc: In constructor '__sanitizer::ThreadLister::ThreadLister(__sanitizer::pid_t)':
# ../../../../gcc-9.2.0/libsanitizer/sanitizer_common/sanitizer_linux.cc:932:63: error: 'O_DIRECTORY' was not declared in this scope
#  932 |   descriptor_ = internal_open(task_directory_path, O_RDONLY | O_DIRECTORY);
#      |                                                               ^~~~~~~~~~~
BROKEN_ON_PLATFORM+=	SunOS-*-x86_64

# Configuring stage 1 in ./gcc
# ...
# *** Configuration aarch64--netbsd not supported
NOT_FOR_PLATFORM+=	NetBSD-*-aarch64
# *** Configuration aarch64-apple-darwin20 not supported
NOT_FOR_PLATFORM+=	Darwin-*-aarch64

LANGS=			c

# In some cases LINKER_RPATH_FLAG needs a trailing space.
LINKER_RPATH_FLAG:=	${LINKER_RPATH_FLAG:S/-rpath/& /}

## The Library rpath to use in end programs.
LDFLAGS_FOR_TARGET=	${LDFLAGS:M${COMPILER_RPATH_FLAG}*:N*/usr/lib*} ${LDFLAGS:M-Wl,-z*}

# The "-static-libstdc++ -static-libgcc" flags are normally added to the
# boot-ldflags by configure but because we are supply the boot-ldflags
# we mash supply them.
BOOT_LDFLAGS=		-static-libstdc++ -static-libgcc ${LDFLAGS_FOR_TARGET}
# Needed on Darwin when LDFLAGS point to a SDK
BOOT_LDFLAGS+=		${LDFLAGS:M-Wl,-syslibroot*}
# GCC does not understand this option; remove it, or stage build will fail
BUILDLINK_TRANSFORM+=	rm:-stdlib=libc++

.include "options.mk"

.if ${MACHINE_PLATFORM:MNetBSD-*-*}
# on NetBSD, use the native SSP code in libc
CONFIGURE_ARGS+=	--disable-libssp
# Match base libstdc++ major
SUBST_CLASSES+=		libstdc
SUBST_STAGE.libstdc=	pre-configure
SUBST_FILES.libstdc=	libstdc++-v3/configure
SUBST_MESSAGE.libstdc=	Bumping libstdc++ major to 7
SUBST_SED.libstdc=	-e 's,libtool_VERSION=6:,libtool_VERSION=7:,g'
.else
CONFIGURE_ARGS+=	--enable-libssp
.endif

## For target librarys and libjava programs.
CONFIGURE_ENV+=		LDFLAGS_FOR_TARGET=${LDFLAGS_FOR_TARGET:Q}

CONFIGURE_ARGS+=	--enable-languages=${LANGS:M*:Q}
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	--enable-long-long
CONFIGURE_ARGS+=	--with-local-prefix=${GCC9_PREFIX:Q}
CONFIGURE_ARGS+=	--enable-threads=posix
CONFIGURE_ARGS+=	--with-boot-ldflags=${BOOT_LDFLAGS:M*:Q}

# multilib on Darwin requires fat-binaries
CONFIGURE_ARGS.Darwin+=	--disable-multilib
.if ${OSX_SDK_PATH:U}
CONFIGURE_ARGS.Darwin+=	--with-sysroot=${OSX_SDK_PATH:Q}
.endif

.if ${OPSYS} == NetBSD
CONFIGURE_ARGS+=	--with-gnu-ld --with-ld=/usr/bin/ld
CONFIGURE_ARGS+=	--with-gnu-as --with-as=/usr/bin/as
MAKE_ENV+=		ac_cv_func_clock_gettime=yes
MAKE_ENV+=		ac_cv_func_gethostbyname_r=no
MAKE_ENV+=		ac_cv_func_freelocale=no
MAKE_ENV+=		ac_cv_func_newlocale=no
MAKE_ENV+=		ac_cv_func_uselocale=no
.endif

MAKE_ENV.SunOS+=	ac_cv_func_mkostemp=no

.if !empty(PKGSRC_COMPILER:Mclang) || ${OPSYS} == "DragonFly"
CONFIGURE_ARGS+=	--disable-bootstrap
.endif

.if ${MACHINE_PLATFORM:MNetBSD-*-i386} || ${MACHINE_PLATFORM:MLinux-*-i386}
CONFIGURE_ARGS+=	--with-arch=i486 --with-tune=i486
.endif

.if ${MACHINE_PLATFORM:MNetBSD-*-x86_64} || ${MACHINE_PLATFORM:MLinux-*-x86_64}
CONFIGURE_ARGS+=	--with-arch=nocona --with-tune=nocona --with-fpmath=sse
.endif

.if ${MACHINE_PLATFORM:MDarwin-[0-8].*-*}
CONFIGURE_ARGS+=	--with-dwarf2
.endif

# ${WRKSRC}/fixincludes/ looks for sed and compiles the path to sed into
# a binary so we need to make sure we give it the installed sed and not
# the tool wrapped one.
MAKE_ENV+=		ac_cv_path_SED=${TOOLS_SED}
MAKE_ENV+=		lt_cv_path_SED=${TOOLS_SED}

# Determine whether to use binutils
.if ${OPSYS} == SunOS
.  if exists(/usr/sfw/bin/gobjdump)
CONFIGURE_ENV+=		OBJDUMP=/usr/sfw/bin/gobjdump
.  endif
.  if exists(/usr/bin/ld)
CONFIGURE_ARGS+=	--without-gnu-ld --with-ld=/usr/bin/ld
.  else
CONFIGURE_ARGS+=	--without-gnu-ld --with-ld=/usr/ccs/bin/ld
.  endif
.  if exists(/usr/sfw/bin/gas)
CONFIGURE_ARGS+=	--with-gnu-as --with-as=/usr/sfw/bin/gas
.  elif exists(/usr/ccs/bin/as)
CONFIGURE_ARGS+=	--without-gnu-as --with-as=/usr/ccs/bin/as
.  else
DEPENDS+=		binutils-[0-9]*:../../devel/binutils
CONFIGURE_ARGS+=	--with-gnu-as --with-as=${PREFIX}/bin/gas
.  endif
.endif

.if ${OS_VARIANT} == SmartOS
SUBST_CLASSES+=		ccs
SUBST_STAGE.ccs=	pre-configure
SUBST_FILES.ccs=	contrib/make_sunver.pl
SUBST_SED.ccs=		-e 's,/usr/ccs/bin,/usr/bin,g'
.endif

SUBST_CLASSES+=		vars
SUBST_MESSAGE.vars=	Setting target machine name path in ${SUBST_FILES.vars}
SUBST_STAGE.vars=	pre-configure
SUBST_FILES.vars=	gcc/Makefile.in
SUBST_VARS.vars=	MACHINE_GNU_PLATFORM

pre-configure:
	${RUN} cd ${WRKSRC} && ${MKDIR} ${OBJDIR}

TEST_TARGET=		-j ${MAKE_JOBS} -k check
TEST_DEPENDS+=		dejagnu-[0-9]*:../../devel/dejagnu

post-test:
	${RUN} cd ${WRKSRC} && cd ${OBJDIR} \
	&& ${SH} ${WRKSRC}/contrib/test_summary >${WRKDIR}/test_summary.log
	@${INFO_MSG} "Test summary is available in ${WRKDIR}/test_summary.log"

post-install:
	${TEST} -f ${DESTDIR}${GCC9_PREFIX}/bin/cc \
	|| (cd ${DESTDIR}${GCC9_PREFIX}/bin && ${LN} -f gcc cc)

GENERATE_PLIST+= \
	cd ${DESTDIR}${PREFIX} && \
	${FIND} ${GCC9_SUBPREFIX} \( -type f -o -type l \) -print | ${SORT};

CHECK_BUILTIN.zlib:=	yes
.include "../../devel/zlib/builtin.mk"
CHECK_BUILTIN.zlib:=	no
.if !empty(USE_BUILTIN.zlib:M[yY][eE][sS])
CONFIGURE_ARGS+=	--with-system-zlib
.include "../../devel/zlib/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-system-zlib
.endif
.include "../../lang/python/application.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
