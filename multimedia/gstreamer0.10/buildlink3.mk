# $NetBSD: buildlink3.mk,v 1.28 2022/06/28 11:34:55 wiz Exp $

BUILDLINK_TREE+=	gstreamer0.10

.if !defined(GSTREAMER0.10_BUILDLINK3_MK)
GSTREAMER0.10_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gstreamer0.10+=	gstreamer0.10>=0.10.1
BUILDLINK_ABI_DEPENDS.gstreamer0.10+=	gstreamer0.10>=0.10.36nb20
BUILDLINK_PKGSRCDIR.gstreamer0.10?=	../../multimedia/gstreamer0.10

pkgbase := gstreamer0.10
.include "../../mk/pkg-build-options.mk"

.if !empty(PKG_BUILD_OPTIONS.gstreamer0.10:Mgstcheck)
.include "../../devel/check/buildlink3.mk"
.endif

.include "../../devel/glib2/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.endif # GSTREAMER0.10_BUILDLINK3_MK

BUILDLINK_TREE+=	-gstreamer0.10
