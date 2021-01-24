# $NetBSD: buildlink3.mk,v 1.1 2017/10/03 00:31:39 schmonz Exp $

BUILDLINK_TREE+=	s6-dns

.if !defined(SKALIBS_BUILDLINK3_MK)
SKALIBS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.s6-dns+=		s6-dns>=2.3.5.0
BUILDLINK_PKGSRCDIR.s6-dns?=		../../Aalbus/s6-dns

.endif # SKALIBS_BUILDLINK3_MK

BUILDLINK_TREE+=	-s6dns
