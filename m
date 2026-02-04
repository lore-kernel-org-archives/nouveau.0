Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D21E8B364
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 03:02:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD3F10E350;
	Wed,  4 Feb 2026 03:02:26 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 739CF41B49;
	Wed,  4 Feb 2026 02:53:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770173589;
 b=P5f5bbAq50aMT+PP9c9rcVuzuL/X2NqcanOTkhRBizmhypSh33NU1df/1VtjG/ESKSjk1
 upr9jgn/obXZb+huNLwzliLHTGA5BC1wCrPy6X9uvA+WnnrwaTTjS2RCIb+J/H1IeF5LYSF
 K5UQuo1LzcP1vOq/JsdT0Qo8Aw3CM1TepGvjm32MQNjxvXxExOeMhjfcgWn6cp4Fv4l9nFl
 zlKzChlh4WAcpopLW8JyM75jZlLa0MOS/oPQYaHcdNh3YKi0x9FomYGRmvIeCl9EiNEqHRR
 CaemW9BDT65Q2tFoRbL/JtJCADHBC7Jn8ISVRPzeRX0jucd+t8ANoQodRnqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770173589; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oVxRpGxBXgRSIBB6v0tvQGzwfh+G7zsqhberTHHzMHo=;
 b=j3PXY+JwvR3CodK/Gblt88jBcTwUHjeAMlweZYnX7y8l5bJC0qGSGhZHldSFqeYlv2HX5
 1hq4ZuxwVANc8y0BJ4l5q0mhcuY1oLPZF9868KgtxAgHawxNbUTjro4nXwo0fl9PW8An0uH
 xNPdD4UrMbSXkdxOUwH8dRd7CPgCcRqX4pifFj2Fq5ek5k9M9wFWPfAskBjAb7HqxwvP4fF
 wpYoDtCdMOs0V2isCD3RwUFv4/wLIM361IbjaVXyjlpzR1nFN9ymErZ301qsudCiH5V9mnG
 UMn6hfvx+9hP/HtiTkMw3PPNynwCTyYJU3Auf4g+Qa15mTlbPpSAniP89PnA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 20D6940382
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 02:53:07 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62710E0D1
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 03:02:23 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-513-m8Wc8er2M7-DFKlkiYKIhg-1; Tue,
 03 Feb 2026 22:02:19 -0500
X-MC-Unique: m8Wc8er2M7-DFKlkiYKIhg-1
X-Mimecast-MFC-AGG-ID: m8Wc8er2M7-DFKlkiYKIhg_1770174139
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AA63F19560B5;
	Wed,  4 Feb 2026 03:02:18 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AC2FD30001A7;
	Wed,  4 Feb 2026 03:02:16 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] nouveau/vmm: rewrite pte tracker using a struct and
 bitfields.
Date: Wed,  4 Feb 2026 13:00:05 +1000
Message-ID: <20260204030208.2313241-2-airlied@gmail.com>
In-Reply-To: <20260204030208.2313241-1-airlied@gmail.com>
References: <20260204030208.2313241-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CGj0D6S4F_F-FSU9-lSUMNZqKrgWnUBUDQzpwxl1cuA_1770174139
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: BPDSF5MZ37SCA4X3KSVM7X2NJLDZVLHO
X-Message-ID-Hash: BPDSF5MZ37SCA4X3KSVM7X2NJLDZVLHO
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BPDSF5MZ37SCA4X3KSVM7X2NJLDZVLHO/>
Archived-At: 
 <https://lore.freedesktop.org/20260204030208.2313241-2-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

I want to increase the counters here and start tracking LPTs as well
as there are certain situations where userspace with mixed page sizes
can cause ref/unrefs to live longer so need better reference counting.

This should be entirely non-functional.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 41 ++++++++++---------
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 14 +++++--
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c
index f95c58b67633..efc334f6104c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -53,7 +53,7 @@ nvkm_vmm_pt_new(const struct nvkm_vmm_desc *desc, bool sp=
arse,
 =09=09}
 =09}
=20
-=09if (!(pgt =3D kzalloc(sizeof(*pgt) + lpte, GFP_KERNEL)))
+=09if (!(pgt =3D kzalloc(sizeof(*pgt) + (sizeof(pgt->pte[0]) * lpte), GFP_=
KERNEL)))
 =09=09return NULL;
 =09pgt->page =3D page ? page->shift : 0;
 =09pgt->sparse =3D sparse;
@@ -208,7 +208,7 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct n=
vkm_vmm_pt *pgt,
 =09 */
 =09for (lpti =3D ptei >> sptb; ptes; spti =3D 0, lpti++) {
 =09=09const u32 pten =3D min(sptn - spti, ptes);
-=09=09pgt->pte[lpti] -=3D pten;
+=09=09pgt->pte[lpti].s.sptes -=3D pten;
 =09=09ptes -=3D pten;
 =09}
=20
@@ -218,9 +218,9 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct n=
vkm_vmm_pt *pgt,
=20
 =09for (ptei =3D pteb =3D ptei >> sptb; ptei < lpti; pteb =3D ptei) {
 =09=09/* Skip over any LPTEs that still have valid SPTEs. */
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPTES) {
+=09=09if (pgt->pte[pteb].s.sptes) {
 =09=09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09=09if (!(pgt->pte[ptei] & NVKM_VMM_PTE_SPTES))
+=09=09=09=09if (!(pgt->pte[ptei].s.sptes))
 =09=09=09=09=09break;
 =09=09=09}
 =09=09=09continue;
@@ -232,14 +232,14 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct=
 nvkm_vmm_pt *pgt,
 =09=09 *
 =09=09 * Determine how many LPTEs need to transition state.
 =09=09 */
-=09=09pgt->pte[ptei] &=3D ~NVKM_VMM_PTE_VALID;
+=09=09pgt->pte[ptei].s.spte_valid =3D false;
 =09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09if (pgt->pte[ptei] & NVKM_VMM_PTE_SPTES)
+=09=09=09if (pgt->pte[ptei].s.sptes)
 =09=09=09=09break;
-=09=09=09pgt->pte[ptei] &=3D ~NVKM_VMM_PTE_VALID;
+=09=09=09pgt->pte[ptei].s.spte_valid =3D false;
 =09=09}
=20
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPARSE) {
+=09=09if (pgt->pte[pteb].s.sparse) {
 =09=09=09TRA(it, "LPTE %05x: U -> S %d PTEs", pteb, ptes);
 =09=09=09pair->func->sparse(vmm, pgt->pt[0], pteb, ptes);
 =09=09} else
@@ -307,7 +307,7 @@ nvkm_vmm_ref_sptes(struct nvkm_vmm_iter *it, struct nvk=
m_vmm_pt *pgt,
 =09 */
 =09for (lpti =3D ptei >> sptb; ptes; spti =3D 0, lpti++) {
 =09=09const u32 pten =3D min(sptn - spti, ptes);
-=09=09pgt->pte[lpti] +=3D pten;
+=09=09pgt->pte[lpti].s.sptes +=3D pten;
 =09=09ptes -=3D pten;
 =09}
=20
@@ -317,9 +317,9 @@ nvkm_vmm_ref_sptes(struct nvkm_vmm_iter *it, struct nvk=
m_vmm_pt *pgt,
=20
 =09for (ptei =3D pteb =3D ptei >> sptb; ptei < lpti; pteb =3D ptei) {
 =09=09/* Skip over any LPTEs that already have valid SPTEs. */
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_VALID) {
+=09=09if (pgt->pte[pteb].s.spte_valid) {
 =09=09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09=09if (!(pgt->pte[ptei] & NVKM_VMM_PTE_VALID))
+=09=09=09=09if (!pgt->pte[ptei].s.spte_valid)
 =09=09=09=09=09break;
 =09=09=09}
 =09=09=09continue;
@@ -331,14 +331,14 @@ nvkm_vmm_ref_sptes(struct nvkm_vmm_iter *it, struct n=
vkm_vmm_pt *pgt,
 =09=09 *
 =09=09 * Determine how many LPTEs need to transition state.
 =09=09 */
-=09=09pgt->pte[ptei] |=3D NVKM_VMM_PTE_VALID;
+=09=09pgt->pte[ptei].s.spte_valid =3D true;
 =09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09if (pgt->pte[ptei] & NVKM_VMM_PTE_VALID)
+=09=09=09if (pgt->pte[ptei].s.spte_valid)
 =09=09=09=09break;
-=09=09=09pgt->pte[ptei] |=3D NVKM_VMM_PTE_VALID;
+=09=09=09pgt->pte[ptei].s.spte_valid =3D true;
 =09=09}
=20
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPARSE) {
+=09=09if (pgt->pte[pteb].s.sparse) {
 =09=09=09const u32 spti =3D pteb * sptn;
 =09=09=09const u32 sptc =3D ptes * sptn;
 =09=09=09/* The entire LPTE is marked as sparse, we need
@@ -386,7 +386,8 @@ nvkm_vmm_sparse_ptes(const struct nvkm_vmm_desc *desc,
 =09=09=09pgt->pde[ptei++] =3D NVKM_VMM_PDE_SPARSE;
 =09} else
 =09if (desc->type =3D=3D LPT) {
-=09=09memset(&pgt->pte[ptei], NVKM_VMM_PTE_SPARSE, ptes);
+=09=09union nvkm_pte_tracker sparse =3D { .s.sparse =3D 1 };
+=09=09memset(&pgt->pte[ptei].u, sparse.u, ptes);
 =09}
 }
=20
@@ -398,7 +399,7 @@ nvkm_vmm_sparse_unref_ptes(struct nvkm_vmm_iter *it, bo=
ol pfn, u32 ptei, u32 pte
 =09=09memset(&pt->pde[ptei], 0x00, sizeof(pt->pde[0]) * ptes);
 =09else
 =09if (it->desc->type =3D=3D LPT)
-=09=09memset(&pt->pte[ptei], 0x00, sizeof(pt->pte[0]) * ptes);
+=09=09memset(&pt->pte[ptei].u, 0x00, sizeof(pt->pte[0]) * ptes);
 =09return nvkm_vmm_unref_ptes(it, pfn, ptei, ptes);
 }
=20
@@ -445,9 +446,9 @@ nvkm_vmm_ref_hwpt(struct nvkm_vmm_iter *it, struct nvkm=
_vmm_pt *pgd, u32 pdei)
 =09=09 * the SPTEs on some GPUs.
 =09=09 */
 =09=09for (ptei =3D pteb =3D 0; ptei < pten; pteb =3D ptei) {
-=09=09=09bool spte =3D pgt->pte[ptei] & NVKM_VMM_PTE_SPTES;
+=09=09=09bool spte =3D !!pgt->pte[ptei].s.sptes;
 =09=09=09for (ptes =3D 1, ptei++; ptei < pten; ptes++, ptei++) {
-=09=09=09=09bool next =3D pgt->pte[ptei] & NVKM_VMM_PTE_SPTES;
+=09=09=09=09bool next =3D !!pgt->pte[ptei].s.sptes;
 =09=09=09=09if (spte !=3D next)
 =09=09=09=09=09break;
 =09=09=09}
@@ -461,7 +462,7 @@ nvkm_vmm_ref_hwpt(struct nvkm_vmm_iter *it, struct nvkm=
_vmm_pt *pgd, u32 pdei)
 =09=09=09} else {
 =09=09=09=09desc->func->unmap(vmm, pt, pteb, ptes);
 =09=09=09=09while (ptes--)
-=09=09=09=09=09pgt->pte[pteb++] |=3D NVKM_VMM_PTE_VALID;
+=09=09=09=09=09pgt->pte[pteb++].s.spte_valid =3D true;
 =09=09=09}
 =09=09}
 =09} else {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.h
index 4586a425dbe4..a6312a0e6b84 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -4,6 +4,15 @@
 #include <core/memory.h>
 enum nvkm_memory_target;
=20
+union nvkm_pte_tracker {
+=09u8 u;
+=09struct {
+=09=09u8 sparse:1;
+=09=09u8 spte_valid:1;
+=09=09u8 sptes:6;
+=09} s;
+};
+
 struct nvkm_vmm_pt {
 =09/* Some GPUs have a mapping level with a dual page tables to
 =09 * support large and small pages in the same address-range.
@@ -44,10 +53,7 @@ struct nvkm_vmm_pt {
 =09 *
 =09 * This information is used to manage LPTE state transitions.
 =09 */
-#define NVKM_VMM_PTE_SPARSE 0x80
-#define NVKM_VMM_PTE_VALID  0x40
-#define NVKM_VMM_PTE_SPTES  0x3f
-=09u8 pte[];
+=09union nvkm_pte_tracker pte[];
 };
=20
 typedef void (*nvkm_vmm_pxe_func)(struct nvkm_vmm *,
--=20
2.52.0

