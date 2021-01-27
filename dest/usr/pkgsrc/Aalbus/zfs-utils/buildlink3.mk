# $NetBSD: buildlink3.mk,v 1.2 2019/11/04 21:28:44 rillig Exp $

BUILDLINK_TREE+=	zfs-utils

.if !defined(E2FSPROGS_BUILDLINK3_MK)
E2FSPROGS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.f2fs-tools+=	zfs-utils>=2.0.0nb1
BUILDLINK_PKGSRCDIR.f2fs-tools?=	../../Aalbus/zfs-utils

.endif	# E2FSPROGS_BUILDLINK3_MK

BUILDLINK_TREE+=	-zfs-utils
