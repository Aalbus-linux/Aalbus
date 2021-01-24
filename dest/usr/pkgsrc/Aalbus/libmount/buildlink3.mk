# $NetBSD: buildlink3.mk,v 1.3 2018/07/18 23:45:14 maya Exp $

BUILDLINK_TREE+=	libmount

.if !defined(LIBBLKID_BUILDLINK3_MK)
LIBBLKID_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libmount+=	libmount>=2.18
BUILDLINK_PKGSRCDIR.libmount?=		../../Aalbus/libmount

.include "../../devel/libuuid/buildlink3.mk"
.endif	# LIBBLKID_BUILDLINK3_MK

BUILDLINK_TREE+=	-libmount
