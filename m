Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50809D6CFA4
	for <nouveau@archiver.kernel.org>; Thu, 22 Jan 2026 20:35:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7983E10EAB5;
	Thu, 22 Jan 2026 20:35:01 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E4E7C404F1;
	Thu, 22 Jan 2026 20:26:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769113571;
 b=F8tduOvVE4PdvxpeDaV9XXdaBmBQ9nmWEjOEXne64dhDetO2JSZ8Z2Z0WIS6nbxY9Xhm7
 xaT/jBmD9enYa9Vcke+ExpEllwe9VUt+GKQJiolEXQNUqdPMP8TzniKPvOGble0qY00nKVb
 qXaLXdBQ0lMz0fuHWE0XLDHfs8+0W8tYZwoxd09kecHsMAHCCBupdbINlC26BzRbmzVNLXj
 h3PBqDB0/lzD+ddR4dVRJtoHuOF5lWC5qlrLPe536oNtXbMo5IWESpDmGjkVMlnU95SC6+J
 oinVCW8Hp3mRkUyBxQXoMJb/9Swpmi7kVHoVwTZcBlojMC6i+RxpERevkqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769113571; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/9kWPmWC2nwDI9iFySOoWmTgpfJL8F1ay+7RKC0TXDw=;
 b=GJi3lAt2fF5R38ptrMlgmy5AtBknJabzZKBWvXtywnPZ6gsV1pZHxK2vKSSoPJQVfLGgk
 jn3CKiTRvQhMkNnoP/EpO8atiTFqWLT5nGCoc1WzJBTDkmPASmCmOefKC60Q6mjPWXYnLQA
 IDDkLIgev1d3E+C6VkVpIrAOlMYj9BaP9F3thWR3lmVJioZRz54jUx0vJWiAm4zxL3y8nDJ
 BV5H1escFN72iQxgvz8Af1w6qdq8WUL6ru+akKQTMMPScwN0dm66SCOmOC+VaEFqot2lSQn
 B3tS0bcqPGng1BQBChpMywUUdHVzMrUm6kHwhTNS6gTb4IDOCxgr/A6omlRQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 16AF1403B4
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 20:26:09 +0000 (UTC)
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Thu, 22 Jan 2026 20:34:58 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB7410EAAE
	for <nouveau@lists.freedesktop.org>; Thu, 22 Jan 2026 20:34:58 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-zTki-aoAPHyFYfOOwPLKqw-1; Thu,
 22 Jan 2026 15:28:41 -0500
X-MC-Unique: zTki-aoAPHyFYfOOwPLKqw-1
X-Mimecast-MFC-AGG-ID: zTki-aoAPHyFYfOOwPLKqw_1769113720
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 00E341800451;
	Thu, 22 Jan 2026 20:28:40 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.125])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F22E61800240;
	Thu, 22 Jan 2026 20:28:37 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/vmm: start tracking if the LPT PTE is valid.
Date: Fri, 23 Jan 2026 06:28:34 +1000
Message-ID: <20260122202834.414058-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WDkeaJaJp7XgNwMc4FRUVPID_vlLWup8r1NLJQPIRXA_1769113720
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: O6CTYYV26UCJGKOUUZEK4BEMESZJTJF3
X-Message-ID-Hash: O6CTYYV26UCJGKOUUZEK4BEMESZJTJF3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O6CTYYV26UCJGKOUUZEK4BEMESZJTJF3/>
Archived-At: 
 <https://lore.freedesktop.org/20260122202834.414058-1-airlied@gmail.com/>
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

The SPTES field is fine at 31 limit, so just steal a bit from it.

Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 33 ++++++++++++++-----
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |  3 +-
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c
index f95c58b67633..73141dda4728 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -242,14 +242,17 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct=
 nvkm_vmm_pt *pgt,
 =09=09if (pgt->pte[pteb] & NVKM_VMM_PTE_SPARSE) {
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
+=09=09} else if (!(pgt->pte[pteb] & NVKM_VMM_PTE_BIG_VALID)) {
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
+=09=09=09pgt->pte[lpti] &=3D ~NVKM_VMM_PTE_BIG_VALID;
+=09=09=09ptes--;
+=09=09}
+=09}
+
 =09/* PT no longer needed? Destroy it. */
 =09if (!pgt->refs[type]) {
 =09=09it->lvl++;
@@ -374,6 +384,13 @@ nvkm_vmm_ref_ptes(struct nvkm_vmm_iter *it, bool pfn, =
u32 ptei, u32 ptes)
 =09if (desc->type =3D=3D SPT)
 =09=09nvkm_vmm_ref_sptes(it, pgt, desc, ptei, ptes);
=20
+=09if (desc->type =3D=3D LPT) {
+=09=09for (u32 lpti =3D ptei; ptes; lpti++) {
+=09=09=09pgt->pte[lpti] |=3D NVKM_VMM_PTE_BIG_VALID;
+=09=09=09ptes--;
+=09=09}
+=09}
+
 =09return true;
 }
=20
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.h
index 4586a425dbe4..1fe7915b8e87 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -46,7 +46,8 @@ struct nvkm_vmm_pt {
 =09 */
 #define NVKM_VMM_PTE_SPARSE 0x80
 #define NVKM_VMM_PTE_VALID  0x40
-#define NVKM_VMM_PTE_SPTES  0x3f
+#define NVKM_VMM_PTE_BIG_VALID 0x20
+#define NVKM_VMM_PTE_SPTES  0x1f
 =09u8 pte[];
 };
=20
--=20
2.52.0

