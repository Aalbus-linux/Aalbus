# $NetBSD: buildlink3.mk,v 1.1 2016/07/08 14:29:53 kamil Exp $

BUILDLINK_TREE+=	libcap-ng

.if !defined(LIBCAP_BUILDLINK3_MK)
LIBCAP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libcap-ng+=	libcap-ng>=0.8.2
BUILDLINK_PKGSRCDIR.libcap-ng?=	../../Aalbus/libcap-ng
.endif	# LIBCAP_BUILDLINK3_MK

BUILDLINK_TREE+=	-libcap-ng
