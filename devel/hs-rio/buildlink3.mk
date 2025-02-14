# $NetBSD: buildlink3.mk,v 1.4 2022/09/07 06:50:49 pho Exp $

BUILDLINK_TREE+=	hs-rio

.if !defined(HS_RIO_BUILDLINK3_MK)
HS_RIO_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-rio+=	hs-rio>=0.1.21
BUILDLINK_ABI_DEPENDS.hs-rio+=	hs-rio>=0.1.21.0nb3
BUILDLINK_PKGSRCDIR.hs-rio?=	../../devel/hs-rio

.include "../../devel/hs-hashable/buildlink3.mk"
.include "../../devel/hs-microlens/buildlink3.mk"
.include "../../devel/hs-microlens-mtl/buildlink3.mk"
.include "../../devel/hs-primitive/buildlink3.mk"
.include "../../sysutils/hs-typed-process/buildlink3.mk"
.include "../../devel/hs-unliftio/buildlink3.mk"
.include "../../devel/hs-unliftio-core/buildlink3.mk"
.include "../../devel/hs-unordered-containers/buildlink3.mk"
.include "../../devel/hs-vector/buildlink3.mk"
.endif	# HS_RIO_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-rio
