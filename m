Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEB1E7FDF3
	for <nouveau@archiver.kernel.org>; Mon,  2 Feb 2026 22:04:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6B110E406;
	Mon,  2 Feb 2026 22:04:17 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0EF7241B47;
	Mon,  2 Feb 2026 21:55:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770069302;
 b=gFJ1Svwj/B37BYGDt0ejNrwbbdglrCr6AvPAQ07HzDpdH3idabK8h4sUvvT3jD6OTO6BM
 nqfJdCGbZYE9+2mdw3vLVTSRTzmQqcybSVP6OhptT3hntqVJnQZKeJzn1gOYfv/FvOb9qt6
 EUTCn+RxU54lDS0DULhkW9zZf8KGyrOXl876IL3L0IToNlm6UTSSoX4CsKz6UQx97HLcS9C
 5LuzZm7E8i8MsizGxRY0EtFmS+Syw0za99YQ69l9GLnRbHPJLi2E4fpVGlGk+ECxdaV9gWA
 c+SAJp8pGJDPSlafEJ5MMwgRPLw1SjgiX2he7FXveRm4jl4sVjHVsCtx1bgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770069302; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fmENZzUK76t9twDx8qrkJMc0v3Z56wZmi/l0agr+E08=;
 b=GpXv1f6ufwArvu8CGZFnPiORpnAk3TA472M6JcFvYu5zFUNspydT5vDLhXR4M7tMdGhE8
 58tjanIWu/C+fqQkasO7W/pT9JVoc9ODKH+KrI/cljEg2jGUl57MTZ2EfghXx7TvUQiMmTj
 VnYAYtOrO1kLw+kDRQoMxP7OlpL4Sxo0JRWklpBrxiKrbz/QxhlEcFoEDJGvQiUU/1gaQQd
 84fqvEJhRpUTkIG8h/IxF2vp3v4d5jR7RhhFsP/n0rMWCDCmNMtlbllkoxGSrMbPV4yiOSv
 5NCU7+ufrMyvAXQ+rfOsw9MsNVTmiuompjSqoeVoWH6rtSQu3VgcQMKMHyXg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C10EF4015A
	for <nouveau@lists.freedesktop.org>; Mon,  2 Feb 2026 21:54:59 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 844A610E278
	for <nouveau@lists.freedesktop.org>; Mon,  2 Feb 2026 22:04:13 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-yNFmwIMuOiqU5LGfMJjNcw-1; Mon,
 02 Feb 2026 17:04:08 -0500
X-MC-Unique: yNFmwIMuOiqU5LGfMJjNcw-1
X-Mimecast-MFC-AGG-ID: yNFmwIMuOiqU5LGfMJjNcw_1770069847
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9A10C18003FC;
	Mon,  2 Feb 2026 22:04:07 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6F9FA30001A7;
	Mon,  2 Feb 2026 22:04:04 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/vmm: start tracking if the LPT PTE is valid. (v4)
Date: Tue,  3 Feb 2026 08:04:02 +1000
Message-ID: <20260202220402.2217813-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F-ZCzlK0rEkURVvpIhjk2y3-8gkCeD_lO1x6ewAaCkc_1770069847
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: NHQ6WNVUI5J5P7KDRCVMMMKSHUKKS6TN
X-Message-ID-Hash: NHQ6WNVUI5J5P7KDRCVMMMKSHUKKS6TN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NHQ6WNVUI5J5P7KDRCVMMMKSHUKKS6TN/>
Archived-At: 
 <https://lore.freedesktop.org/20260202220402.2217813-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

When NVK enabled large pages userspace tests were seeing fault
reports at a valid address.

There was a case where an address moving from 64k page to 4k pages
could expose a race between unmapping the 4k page, mapping the 64k
page and unref the 4k pages.

Unref 4k pages would cause the dual-page table handling to always
set the LPTE entry to SPARSE or INVALID, but if we'd mapped a valid
LPTE in the meantime, it would get trashed. Keep track of when
a valid LPTE has been referenced, and don't reset in that case.

This increase the tracking to 32-bit, because it turns out if
unref can get delayed, you can get a lot of these outstanding
and this can cause strange behaviours.

Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610
Signed-off-by: Dave Airlie <airlied@redhat.com>

--
v2: move to 32-bit from 8-bit tracker
fix some more flag changes.
v3: missed one BIG_PTE unset
v4: start referencing counting LPTE
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 80 ++++++++++++-------
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 14 +++-
 2 files changed, 61 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c
index f95c58b67633..c2dfaa4b89cf 100644
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
+=09=09pgt->pte[lpti].spte_count -=3D pten;
 =09=09ptes -=3D pten;
 =09}
=20
@@ -218,9 +218,9 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct n=
vkm_vmm_pt *pgt,
=20
 =09for (ptei =3D pteb =3D ptei >> sptb; ptei < lpti; pteb =3D ptei) {
 =09=09/* Skip over any LPTEs that still have valid SPTEs. */
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPTES) {
+=09=09if (pgt->pte[pteb].spte_count) {
 =09=09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09=09if (!(pgt->pte[ptei] & NVKM_VMM_PTE_SPTES))
+=09=09=09=09if (!pgt->pte[ptei].spte_count)
 =09=09=09=09=09break;
 =09=09=09}
 =09=09=09continue;
@@ -232,24 +232,27 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct=
 nvkm_vmm_pt *pgt,
 =09=09 *
 =09=09 * Determine how many LPTEs need to transition state.
 =09=09 */
-=09=09pgt->pte[ptei] &=3D ~NVKM_VMM_PTE_VALID;
+=09=09pgt->pte[ptei].spte_valid =3D false;
 =09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09if (pgt->pte[ptei] & NVKM_VMM_PTE_SPTES)
+=09=09=09if (pgt->pte[ptei].spte_count)
 =09=09=09=09break;
-=09=09=09pgt->pte[ptei] &=3D ~NVKM_VMM_PTE_VALID;
+=09=09=09pgt->pte[ptei].spte_valid =3D false;
 =09=09}
=20
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPARSE) {
+=09=09if (pgt->pte[pteb].sparse) {
 =09=09=09TRA(it, "LPTE %05x: U -> S %d PTEs", pteb, ptes);
 =09=09=09pair->func->sparse(vmm, pgt->pt[0], pteb, ptes);
-=09=09} else
-=09=09if (pair->func->invalid) {
-=09=09=09/* If the MMU supports it, restore the LPTE to the
-=09=09=09 * INVALID state to tell the MMU there is no point
-=09=09=09 * trying to fetch the corresponding SPTEs.
-=09=09=09 */
-=09=09=09TRA(it, "LPTE %05x: U -> I %d PTEs", pteb, ptes);
-=09=09=09pair->func->invalid(vmm, pgt->pt[0], pteb, ptes);
+=09=09} else if (!pgt->pte[pteb].lpte_valid) {
+=09=09=09if (pair->func->invalid) {
+=09=09=09=09/* If the MMU supports it, restore the LPTE to the
+=09=09=09=09 * INVALID state to tell the MMU there is no point
+=09=09=09=09 * trying to fetch the corresponding SPTEs.
+=09=09=09=09 */
+=09=09=09=09TRA(it, "LPTE %05x: U -> I %d PTEs", pteb, ptes);
+=09=09=09=09pair->func->invalid(vmm, pgt->pt[0], pteb, ptes);
+=09=09=09}
+=09=09} else {
+=09=09=09TRA(it, "LPTE %05x: V %d PTEs", pteb, ptes);
 =09=09}
 =09}
 }
@@ -280,6 +283,13 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pfn=
, u32 ptei, u32 ptes)
 =09if (desc->type =3D=3D SPT && (pgt->refs[0] || pgt->refs[1]))
 =09=09nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
=20
+=09if (desc->type =3D=3D LPT && (pgt->refs[0] || pgt->refs[1])) {
+=09=09for (u32 lpti =3D ptei; ptes; lpti++) {
+=09=09=09pgt->pte[lpti].lpte_count--;
+=09=09=09ptes--;
+=09=09}
+=09}
+
 =09/* PT no longer needed? Destroy it. */
 =09if (!pgt->refs[type]) {
 =09=09it->lvl++;
@@ -307,7 +317,7 @@ nvkm_vmm_ref_sptes(struct nvkm_vmm_iter *it, struct nvk=
m_vmm_pt *pgt,
 =09 */
 =09for (lpti =3D ptei >> sptb; ptes; spti =3D 0, lpti++) {
 =09=09const u32 pten =3D min(sptn - spti, ptes);
-=09=09pgt->pte[lpti] +=3D pten;
+=09=09pgt->pte[lpti].spte_count +=3D pten;
 =09=09ptes -=3D pten;
 =09}
=20
@@ -317,9 +327,9 @@ nvkm_vmm_ref_sptes(struct nvkm_vmm_iter *it, struct nvk=
m_vmm_pt *pgt,
=20
 =09for (ptei =3D pteb =3D ptei >> sptb; ptei < lpti; pteb =3D ptei) {
 =09=09/* Skip over any LPTEs that already have valid SPTEs. */
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_VALID) {
+=09=09if (pgt->pte[pteb].spte_valid) {
 =09=09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09=09if (!(pgt->pte[ptei] & NVKM_VMM_PTE_VALID))
+=09=09=09=09if (!pgt->pte[ptei].spte_valid)
 =09=09=09=09=09break;
 =09=09=09}
 =09=09=09continue;
@@ -331,14 +341,16 @@ nvkm_vmm_ref_sptes(struct nvkm_vmm_iter *it, struct n=
vkm_vmm_pt *pgt,
 =09=09 *
 =09=09 * Determine how many LPTEs need to transition state.
 =09=09 */
-=09=09pgt->pte[ptei] |=3D NVKM_VMM_PTE_VALID;
+=09=09pgt->pte[ptei].spte_valid =3D true;
+=09=09pgt->pte[ptei].lpte_valid =3D false;
 =09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
-=09=09=09if (pgt->pte[ptei] & NVKM_VMM_PTE_VALID)
+=09=09=09if (pgt->pte[ptei].spte_valid)
 =09=09=09=09break;
-=09=09=09pgt->pte[ptei] |=3D NVKM_VMM_PTE_VALID;
+=09=09=09pgt->pte[ptei].spte_valid =3D true;
+=09=09=09pgt->pte[ptei].lpte_valid =3D false;
 =09=09}
=20
-=09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPARSE) {
+=09=09if (pgt->pte[pteb].sparse) {
 =09=09=09const u32 spti =3D pteb * sptn;
 =09=09=09const u32 sptc =3D ptes * sptn;
 =09=09=09/* The entire LPTE is marked as sparse, we need
@@ -374,6 +386,15 @@ nvkm_vmm_ref_ptes(struct nvkm_vmm_iter *it, bool pfn, =
u32 ptei, u32 ptes)
 =09if (desc->type =3D=3D SPT)
 =09=09nvkm_vmm_ref_sptes(it, pgt, desc, ptei, ptes);
=20
+=09if (desc->type =3D=3D LPT) {
+=09=09for (u32 lpti =3D ptei; ptes; lpti++) {
+=09=09=09pgt->pte[lpti].spte_valid =3D false;
+=09=09=09pgt->pte[lpti].lpte_valid =3D true;
+=09=09=09pgt->pte[lpti].lpte_count++;
+=09=09=09ptes--;
+=09=09}
+=09}
+
 =09return true;
 }
=20
@@ -386,7 +407,8 @@ nvkm_vmm_sparse_ptes(const struct nvkm_vmm_desc *desc,
 =09=09=09pgt->pde[ptei++] =3D NVKM_VMM_PDE_SPARSE;
 =09} else
 =09if (desc->type =3D=3D LPT) {
-=09=09memset(&pgt->pte[ptei], NVKM_VMM_PTE_SPARSE, ptes);
+=09=09struct pt_tracker sparse =3D { .sparse =3D 1 };
+=09=09memset32((u32 *)&pgt->pte[ptei], *(u32 *)&sparse, ptes);
 =09}
 }
=20
@@ -398,7 +420,7 @@ nvkm_vmm_sparse_unref_ptes(struct nvkm_vmm_iter *it, bo=
ol pfn, u32 ptei, u32 pte
 =09=09memset(&pt->pde[ptei], 0x00, sizeof(pt->pde[0]) * ptes);
 =09else
 =09if (it->desc->type =3D=3D LPT)
-=09=09memset(&pt->pte[ptei], 0x00, sizeof(pt->pte[0]) * ptes);
+=09=09memset32((u32 *)&pt->pte[ptei], 0x00, ptes);
 =09return nvkm_vmm_unref_ptes(it, pfn, ptei, ptes);
 }
=20
@@ -445,9 +467,9 @@ nvkm_vmm_ref_hwpt(struct nvkm_vmm_iter *it, struct nvkm=
_vmm_pt *pgd, u32 pdei)
 =09=09 * the SPTEs on some GPUs.
 =09=09 */
 =09=09for (ptei =3D pteb =3D 0; ptei < pten; pteb =3D ptei) {
-=09=09=09bool spte =3D pgt->pte[ptei] & NVKM_VMM_PTE_SPTES;
+=09=09=09bool spte =3D !!pgt->pte[ptei].spte_count;
 =09=09=09for (ptes =3D 1, ptei++; ptei < pten; ptes++, ptei++) {
-=09=09=09=09bool next =3D pgt->pte[ptei] & NVKM_VMM_PTE_SPTES;
+=09=09=09=09bool next =3D !!pgt->pte[ptei].spte_count;
 =09=09=09=09if (spte !=3D next)
 =09=09=09=09=09break;
 =09=09=09}
@@ -457,11 +479,11 @@ nvkm_vmm_ref_hwpt(struct nvkm_vmm_iter *it, struct nv=
km_vmm_pt *pgd, u32 pdei)
 =09=09=09=09=09desc->func->sparse(vmm, pt, pteb, ptes);
 =09=09=09=09else
 =09=09=09=09=09desc->func->invalid(vmm, pt, pteb, ptes);
-=09=09=09=09memset(&pgt->pte[pteb], 0x00, ptes);
+=09=09=09=09memset32((u32 *)&pgt->pte[pteb], 0x00, ptes);
 =09=09=09} else {
 =09=09=09=09desc->func->unmap(vmm, pt, pteb, ptes);
 =09=09=09=09while (ptes--)
-=09=09=09=09=09pgt->pte[pteb++] |=3D NVKM_VMM_PTE_VALID;
+=09=09=09=09=09pgt->pte[pteb++].spte_valid =3D true;
 =09=09=09}
 =09=09}
 =09} else {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.h
index 4586a425dbe4..8c4531a70a3a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -4,6 +4,15 @@
 #include <core/memory.h>
 enum nvkm_memory_target;
=20
+struct pt_tracker {
+=09u32 sparse:1;
+=09u32 spte_valid:1;
+=09u32 lpte_valid:1;
+=09u32 lpte_count:13;
+=09u32 spte_count:16;
+};
+
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
+=09struct pt_tracker pte[];
 };
=20
 typedef void (*nvkm_vmm_pxe_func)(struct nvkm_vmm *,
--=20
2.52.0

