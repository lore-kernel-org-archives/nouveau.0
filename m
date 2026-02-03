Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD15BE83056
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 05:28:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7C110E54B;
	Tue,  3 Feb 2026 05:28:45 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CF86941B48;
	Tue,  3 Feb 2026 05:19:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770095970;
 b=MTrqvQXTH5v5Mt3D9YO4akoPuQXe9Pw2dMjguYGABbk/mOaXcsg5dwrHFQ378ptV/lsqH
 c9yNbIZ1YJktWHtdbFrGMot10uc/aM+viI7EpbqL8YenMMUmtYPQgWGBfcC20ldFHLx2NZK
 sIU6RTF1HMCvPBJhUHeJMdYyOE/rBMTFTgjVo2rQQKbpUOM1tt2MWw+3PvdSYn14IxE5WKa
 VENLAbT1glqrE2dspkIMhAKuwtbWx6sJg/JQyIlvjijSu81zVtqXn8m/rRojHako8gq18o9
 cpKgwgD0qDuqmhKdTSzwPz62uciT2ydEKcrmfg0Sk178whIBqcOgIFqPnoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770095970; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u54h0HlltOMyAkz/ga+5FfjltotPv085nLv9i/EizPI=;
 b=bUP0c5IY2YpBsgSz/R+oBcTXH0reWlQbIMnHYmt8t4dQNOH+5ZsmJkaBIBIWFbjQbDlQV
 gSIJbp+MqeYxpoXH/yKHoglU16AdjLqDhfb2PP16nAbaZFYphfWKxAvZljIZUkBmPr+glat
 NaPHwXY+jG5Qw3Gj9ysnz8Wp8SuAHm+fXwwL8oiOmY+CQ1ftzukWWnGr0G274lvV1MlTeHu
 joUXfBAREBNUc6PKI9aD6YRC9vq7cJGD+nsluAV7d8VbwYc3qsUokHVg14+6uz2KMWKckJp
 dLO5d8QyXwIZOr+kdiU0PzsharQEJ5zi31oZOCzv9AAYpM0jWSvdxXtEjUUg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E72A741830
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 05:19:28 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 620AF10E551
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 05:28:43 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-oPoglKlVOzCt7N2e4nHesA-1; Tue,
 03 Feb 2026 00:28:39 -0500
X-MC-Unique: oPoglKlVOzCt7N2e4nHesA-1
X-Mimecast-MFC-AGG-ID: oPoglKlVOzCt7N2e4nHesA_1770096518
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AD1BD195606D;
	Tue,  3 Feb 2026 05:28:38 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AEAF51955F16;
	Tue,  3 Feb 2026 05:28:36 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] nouveau/vmm: start tracking if the LPT PTE is valid. (v6)
Date: Tue,  3 Feb 2026 15:25:27 +1000
Message-ID: <20260203052823.2220053-4-airlied@gmail.com>
In-Reply-To: <20260203052823.2220053-1-airlied@gmail.com>
References: <20260203052823.2220053-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EjBXUOL6MYEFUC9HfQuhJ6aYHJlVvoMG47nBT_vrLm8_1770096518
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: VX3DXBII4JCKWB37ZZFTYC7ZU3QDPBGV
X-Message-ID-Hash: VX3DXBII4JCKWB37ZZFTYC7ZU3QDPBGV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VX3DXBII4JCKWB37ZZFTYC7ZU3QDPBGV/>
Archived-At: 
 <https://lore.freedesktop.org/20260203052823.2220053-4-airlied@gmail.com/>
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

This adds an lpte valid tracker and lpte reference count.

Whenever an lpte is referenced, it gets made valid and the ref count
increases, whenever it gets unreference the refcount is tracked.

Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 39 +++++++++++++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |  3 +-
 2 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c
index 8b8f4b85e315..ea1191386c6e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -242,14 +242,17 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct=
 nvkm_vmm_pt *pgt,
 =09=09if (pgt->pte[pteb].s.sparse) {
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
+=09=09} else if (!pgt->pte[pteb].s.lpte_valid) {
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
@@ -280,6 +283,15 @@ nvkm_vmm_unref_ptes(struct nvkm_vmm_iter *it, bool pfn=
, u32 ptei, u32 ptes)
 =09if (desc->type =3D=3D SPT && (pgt->refs[0] || pgt->refs[1]))
 =09=09nvkm_vmm_unref_sptes(it, pgt, desc, ptei, ptes);
=20
+=09if (desc->type =3D=3D LPT && (pgt->refs[0] || pgt->refs[1])) {
+=09=09for (u32 lpti =3D ptei; ptes; lpti++) {
+=09=09=09pgt->pte[lpti].s.lptes--;
+=09=09=09if (pgt->pte[lpti].s.lptes =3D=3D 0)
+=09=09=09=09pgt->pte[lpti].s.lpte_valid =3D false;
+=09=09=09ptes--;
+=09=09}
+=09}
+
 =09/* PT no longer needed? Destroy it. */
 =09if (!pgt->refs[type]) {
 =09=09it->lvl++;
@@ -332,10 +344,12 @@ nvkm_vmm_ref_sptes(struct nvkm_vmm_iter *it, struct n=
vkm_vmm_pt *pgt,
 =09=09 * Determine how many LPTEs need to transition state.
 =09=09 */
 =09=09pgt->pte[ptei].s.spte_valid =3D true;
+=09=09pgt->pte[ptei].s.lpte_valid =3D false;
 =09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
 =09=09=09if (pgt->pte[ptei].s.spte_valid)
 =09=09=09=09break;
 =09=09=09pgt->pte[ptei].s.spte_valid =3D true;
+=09=09=09pgt->pte[ptei].s.lpte_valid =3D false;
 =09=09}
=20
 =09=09if (pgt->pte[pteb].s.sparse) {
@@ -374,6 +388,15 @@ nvkm_vmm_ref_ptes(struct nvkm_vmm_iter *it, bool pfn, =
u32 ptei, u32 ptes)
 =09if (desc->type =3D=3D SPT)
 =09=09nvkm_vmm_ref_sptes(it, pgt, desc, ptei, ptes);
=20
+=09if (desc->type =3D=3D LPT) {
+=09=09for (u32 lpti =3D ptei; ptes; lpti++) {
+=09=09=09pgt->pte[lpti].s.spte_valid =3D false;
+=09=09=09pgt->pte[lpti].s.lpte_valid =3D true;
+=09=09=09pgt->pte[lpti].s.lptes++;
+=09=09=09ptes--;
+=09=09}
+=09}
+
 =09return true;
 }
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.h
index a8b08126e8dc..4ec0a3a21169 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -9,7 +9,8 @@ union nvkm_pte_tracker {
 =09struct {
 =09=09u32 sparse:1;
 =09=09u32 spte_valid:1;
-=09=09u32 padding:14;
+=09=09u32 lpte_valid:1;
+=09=09u32 lptes:13;
 =09=09u32 sptes:16;
 =09} s;
 };
--=20
2.52.0

