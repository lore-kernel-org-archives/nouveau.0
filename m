Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8C4E8B364
	for <nouveau@archiver.kernel.org>; Wed,  4 Feb 2026 03:02:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF62810E5D5;
	Wed,  4 Feb 2026 03:02:29 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E657341B48;
	Wed,  4 Feb 2026 02:53:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770173592;
 b=BjKoqxuoxl7HAjJfhCMAY7Yz+HteZPcguDXEaH7aSQsxt8gh3vjyAAsuYWsV1SYaDMMls
 C8OGgVXF93e9tgDJWGhkzdyLEDXHTxUbaHmL65eh4D/1zXYBW/XglCXboEVZSzpVqBoG3vN
 Szp7LmO2fwKPF/yAxzE7+0Fog0cDZHhogdLkGQDt9IwLGALtR3LfdvBhBBDKN0sDtFkpubg
 a1AiKlwnnIi/A4pyYeB30BMSuspKYTI5xgoABUUWIyaPWxxLQzMszqlzHqvwLYYlrp8l7ih
 RQ1Jnrg3qMVmQ+ZWvwbC+FsJ6iuYNtNu9SAxAo+D9L21S9MK8iywZzMtv4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770173592; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XzBnko3jg3WcHIcsJyp7AB3Et9mItAZ+MUkeqY1MwOw=;
 b=NbF/1sz8l4ba6TPiMLmSLi9EOQm+JcXkPx0SPocOiM6CzAV74IrzHptU+WxJdaNXP5/iZ
 sLT4YEhzrc6+eFL7Z53ZDKEZHJLTXKk1IdksElMDctBOco+u+70a5OsgLIv7I1D17HIjd5x
 pBuEjo55dXIh/ARboqG3wv+Ptd21xI3mtPVPsoY+7norHJrRI4qytbK1aehcoNBpP4NQvsw
 nSGHXuceawO8lI1rEwQhZaBi2X4sQUSrVgf0DwhXjewyCgTCrMT7wtGWzyWnlwTXen9B8J1
 tU//eyBkvHhXZlBScimOvRWDy5A0j/91GnodvDs7agP3alLiY+tF0n0mKXhg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8B5D541AF5
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 02:53:10 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EA6F110E355
	for <nouveau@lists.freedesktop.org>; Wed,  4 Feb 2026 03:02:26 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-512-5H6akBSqObi778w1uoJwiQ-1; Tue,
 03 Feb 2026 22:02:22 -0500
X-MC-Unique: 5H6akBSqObi778w1uoJwiQ-1
X-Mimecast-MFC-AGG-ID: 5H6akBSqObi778w1uoJwiQ_1770174141
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BA5941956096;
	Wed,  4 Feb 2026 03:02:21 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A1C3630001A7;
	Wed,  4 Feb 2026 03:02:19 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] nouveau/vmm: increase size of vmm pte tracker struct to
 u32 (v2)
Date: Wed,  4 Feb 2026 13:00:06 +1000
Message-ID: <20260204030208.2313241-3-airlied@gmail.com>
In-Reply-To: <20260204030208.2313241-1-airlied@gmail.com>
References: <20260204030208.2313241-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: khnG9hsMH7mAe8rpHVf6knvznJcwJ4uTp5Yr4ev0Wb8_1770174141
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: K34TX6FWE2O5V7XX6Q63K4GFEOTVHD4V
X-Message-ID-Hash: K34TX6FWE2O5V7XX6Q63K4GFEOTVHD4V
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K34TX6FWE2O5V7XX6Q63K4GFEOTVHD4V/>
Archived-At: 
 <https://lore.freedesktop.org/20260204030208.2313241-3-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

We need to tracker large counts of spte than previously due to unref
getting delayed sometimes.

This doesn't fix LPT tracking yet, it just creates space for it.

Signed-off-by: Dave Airlie <airlied@redhat.com>

---
v2: fix memset32 wrong length
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 9 +++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c
index efc334f6104c..44daeec0aa6d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -387,7 +387,7 @@ nvkm_vmm_sparse_ptes(const struct nvkm_vmm_desc *desc,
 =09} else
 =09if (desc->type =3D=3D LPT) {
 =09=09union nvkm_pte_tracker sparse =3D { .s.sparse =3D 1 };
-=09=09memset(&pgt->pte[ptei].u, sparse.u, ptes);
+=09=09memset32(&pgt->pte[ptei].u, sparse.u, ptes);
 =09}
 }
=20
@@ -399,7 +399,7 @@ nvkm_vmm_sparse_unref_ptes(struct nvkm_vmm_iter *it, bo=
ol pfn, u32 ptei, u32 pte
 =09=09memset(&pt->pde[ptei], 0x00, sizeof(pt->pde[0]) * ptes);
 =09else
 =09if (it->desc->type =3D=3D LPT)
-=09=09memset(&pt->pte[ptei].u, 0x00, sizeof(pt->pte[0]) * ptes);
+=09=09memset32(&pt->pte[ptei].u, 0x00, ptes);
 =09return nvkm_vmm_unref_ptes(it, pfn, ptei, ptes);
 }
=20
@@ -458,7 +458,7 @@ nvkm_vmm_ref_hwpt(struct nvkm_vmm_iter *it, struct nvkm=
_vmm_pt *pgd, u32 pdei)
 =09=09=09=09=09desc->func->sparse(vmm, pt, pteb, ptes);
 =09=09=09=09else
 =09=09=09=09=09desc->func->invalid(vmm, pt, pteb, ptes);
-=09=09=09=09memset(&pgt->pte[pteb], 0x00, ptes);
+=09=09=09=09memset32(&pgt->pte[pteb].u, 0x00, ptes);
 =09=09=09} else {
 =09=09=09=09desc->func->unmap(vmm, pt, pteb, ptes);
 =09=09=09=09while (ptes--)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.h
index a6312a0e6b84..a8b08126e8dc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -5,11 +5,12 @@
 enum nvkm_memory_target;
=20
 union nvkm_pte_tracker {
-=09u8 u;
+=09u32 u;
 =09struct {
-=09=09u8 sparse:1;
-=09=09u8 spte_valid:1;
-=09=09u8 sptes:6;
+=09=09u32 sparse:1;
+=09=09u32 spte_valid:1;
+=09=09u32 padding:14;
+=09=09u32 sptes:16;
 =09} s;
 };
=20
--=20
2.52.0

