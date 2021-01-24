# $NetBSD: buildlink3.mk,v 1.2 2019/11/04 21:28:44 rillig Exp $

BUILDLINK_TREE+=	f2fs-tools

.if !defined(E2FSPROGS_BUILDLINK3_MK)
E2FSPROGS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.f2fs-tools+=	f2fs-tools>=1.14.0nb1
BUILDLINK_PKGSRCDIR.f2fs-tools?=	../../Aalbus/f2fs-tools

.endif	# E2FSPROGS_BUILDLINK3_MK

BUILDLINK_TREE+=	-f2fs-tools
