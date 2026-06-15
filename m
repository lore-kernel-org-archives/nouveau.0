Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D74CD98C5
	for <nouveau@archiver.kernel.org>; Mon, 15 Jun 2026 04:49:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8171A10E1A0;
	Mon, 15 Jun 2026 04:49:06 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 80AEA46B1E;
	Mon, 15 Jun 2026 04:34:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781498098;
 b=s1aXJorVHvnv291Bq94VevBBY90OjvKGet1x8GHmCIsJofdK31//QTpLuRXVJqkqaMEAn
 8RfkXnKlgieiinRXqRXj3gYh9oxFs62th4nIMcEQyTD316wezPEtC87+d/344pz4Fu5oX44
 PNU+ALbGX+SDiRkCzaxOg1NTLezfIFkusVRS+3pSWTcdy0bCASgv+tEoVMfUNpSf2VCSIky
 coW1hyr4HVvTSbre4zNw7r3KIFzBa+tlBWNAn+EyHR+WOLA1b5neaFLZbXaOO5RiJP0vaJR
 RlisdF31wd5FqVP7th79IHS383WlVAsceBm8J0zH/oWEsUfiUpA/EBtnY3Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781498098; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZA8oFs6XlfnW5qHpnJeQOWgBWyouUMPKxr/2z+r2bHU=;
 b=LQOtsBZwFhidlrQJ71rE4Sc9U4ADVAmOCCxQCcxMaNO7VzW2t7jcu7pNuxEa+VS95hl9g
 mYs6mUtLdvhxzrgp5zBKNAufvbWPJO+v5n3U5i1HDIjBnEBQJHKFdtVkyUAYZxkmKFhT90u
 LZ1CcVMIxXG7A1XYg2bzdtHLCPCW7ArY87KktyF8n+c67Fvn/mgWPWNyCFgFTxjusii6zGN
 X1pHTsjYiZ0WqBnbgyqaJQ/seF9fWfRu6S6L0tzbfSoL41vISis7kD/kDxI5G3Vvt8kEdXS
 6HR1pMh5J2lvkzK1vMEDNRTeXG4rAyvDWk7HXC9wlAYI9dOwpy7J/KYokvnQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8584F414F9
	for <nouveau@lists.freedesktop.org>; Mon, 15 Jun 2026 04:34:55 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E40C310E18D
	for <nouveau@lists.freedesktop.org>; Mon, 15 Jun 2026 04:49:02 +0000 (UTC)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-27-WlUcO-ttP4aLI4DqDrlygg-1; Mon,
 15 Jun 2026 00:47:43 -0400
X-MC-Unique: WlUcO-ttP4aLI4DqDrlygg-1
X-Mimecast-MFC-AGG-ID: WlUcO-ttP4aLI4DqDrlygg_1781498862
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7085819560BB;
	Mon, 15 Jun 2026 04:47:42 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.57])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3431A3008B37;
	Mon, 15 Jun 2026 04:47:39 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/vmm: fix another SPT/LPT race
Date: Mon, 15 Jun 2026 14:47:37 +1000
Message-ID: <20260615044737.3419585-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _BQ5FVB3vhYwiIsR0T-DCenCm_xK8xQZk-U4epH-iew_1781498862
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: AEKCDCOGBD4JMJ7R73XKQW5CI6MRGMI6
X-Message-ID-Hash: AEKCDCOGBD4JMJ7R73XKQW5CI6MRGMI6
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AEKCDCOGBD4JMJ7R73XKQW5CI6MRGMI6/>
Archived-At: 
 <https://lore.freedesktop.org/20260615044737.3419585-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

We've had an unknown Turing issue for a while with page faults since large =
pages and compression.

I've got a patch series that syncs all our L2 handling with ogkm and it mad=
e this fault happen more.

After writing a bunch of debugging patches, I spotted an invalid LPT entry =
where there should have been a valid one.

A 64K MAP succeeds on a range, but a subsequent SPT put drops SPT refs acro=
ss multiple ranges,

We shouldn't assume all ranges where SPTEs go away will have the same spars=
e/invalid/valid state,
just iterate over each instead and do the right thing.

Signed-off-by: Dave Airlie <airlied@redhat.com>
Fixes: d19512f5abb1 ("nouveau/vmm: start tracking if the LPT PTE is valid. =
(v6)")
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 31 +++++++++----------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c
index 8c9fd86b2596..f808a0679a3f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -234,29 +234,26 @@ nvkm_vmm_unref_sptes(struct nvkm_vmm_iter *it, struct=
 nvkm_vmm_pt *pgt,
 =09=09 * covered by a number of LPTEs, the LPTEs once again take
 =09=09 * control over their address range.
 =09=09 *
-=09=09 * Determine how many LPTEs need to transition state.
+=09=09 * Transition each LPTE individually as each may have a
+=09=09 * different target state (sparse, invalid, or valid).
 =09=09 */
-=09=09pgt->pte[ptei].s.spte_valid =3D false;
-=09=09for (ptes =3D 1, ptei++; ptei < lpti; ptes++, ptei++) {
+=09=09for (ptei++; ptei < lpti; ptei++) {
 =09=09=09if (pgt->pte[ptei].s.sptes)
 =09=09=09=09break;
-=09=09=09pgt->pte[ptei].s.spte_valid =3D false;
 =09=09}
=20
-=09=09if (pgt->pte[pteb].s.sparse) {
-=09=09=09TRA(it, "LPTE %05x: U -> S %d PTEs", pteb, ptes);
-=09=09=09pair->func->sparse(vmm, pgt->pt[0], pteb, ptes);
-=09=09} else if (!pgt->pte[pteb].s.lpte_valid) {
-=09=09=09if (pair->func->invalid) {
-=09=09=09=09/* If the MMU supports it, restore the LPTE to the
-=09=09=09=09 * INVALID state to tell the MMU there is no point
-=09=09=09=09 * trying to fetch the corresponding SPTEs.
-=09=09=09=09 */
-=09=09=09=09TRA(it, "LPTE %05x: U -> I %d PTEs", pteb, ptes);
-=09=09=09=09pair->func->invalid(vmm, pgt->pt[0], pteb, ptes);
+=09=09while (pteb < ptei) {
+=09=09=09pgt->pte[pteb].s.spte_valid =3D false;
+=09=09=09if (pgt->pte[pteb].s.sparse) {
+=09=09=09=09TRA(it, "LPTE %05x: U -> S", pteb);
+=09=09=09=09pair->func->sparse(vmm, pgt->pt[0], pteb, 1);
+=09=09=09} else if (!pgt->pte[pteb].s.lpte_valid) {
+=09=09=09=09if (pair->func->invalid) {
+=09=09=09=09=09TRA(it, "LPTE %05x: U -> I", pteb);
+=09=09=09=09=09pair->func->invalid(vmm, pgt->pt[0], pteb, 1);
+=09=09=09=09}
 =09=09=09}
-=09=09} else {
-=09=09=09TRA(it, "LPTE %05x: V %d PTEs", pteb, ptes);
+=09=09=09pteb++;
 =09=09}
 =09}
 }
--=20
2.54.0

