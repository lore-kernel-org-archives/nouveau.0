Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EB9E83057
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 05:28:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 63E2610E54F;
	Tue,  3 Feb 2026 05:28:41 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9427541B48;
	Tue,  3 Feb 2026 05:19:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770095966;
 b=nTpurgRfMyU7UmfaIULbZzYarMdAVYrki3bDTwz3lCdgebrffoCJHLJ3MfOkSuMKhasL/
 Sm1lui62A/QEbxqRsGzFlLUgCKZfZxqiEXnnSOeGRbKN/DtMOraSu3l8Dy/X3d1Nc/SdPXI
 KRGAW0vi68xc8/fpnDLb22RhVaqqnsISjTGcU9kiYDDef6Q8NyOf3+jcSIbr9PL2U/AD4AW
 5pRY4Pv/w3nFbR05laOlvDLptEJ9ZX1lkiUPZDuIJaP6PLU3sEqERnFLARv3N+QOUfGKHPX
 Xg6iP2tAc4N98vXppWwZHQKTjwc30XCkLLoljiUu00NW6WioAzAATqL0S4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770095966; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=U20bpnFmroSrWYg8YZ2pSCR9/u6zOIEBJwfr4GfJNro=;
 b=rNJbsN+A6MxNh0XjTPdkkJM9O/t2EniIynSpDGVADeA7HQfD6Q/I0oWezcmi4Wrk9bgui
 1+YfDMrva2BiL6Wnzewrg+cGEIn4mP1L13mSzewOVTQr7SP1lMJc/uhKX8jEuL12LPXRm/9
 ZxlHdMKt8WsVUHcV3r3Zj0i3uBTBipnCWt1GjqQZEK/ulG1VpkPKguSdvFp1WdpEBpEy6hP
 VcI90M0T8Y/6WfYpYsydLAA6kin33D2BziNTF+VnIwvlOePBYDKIB1/ubLWnXqsxS4uLb6K
 vrEqbTzCGJWHlI8COvs9LGwFHBi22/2TuqAts79BvJVOAjuZzzEs7lXocYhg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 89C1A41A0C
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 05:19:24 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 03E3710E53D
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 05:28:38 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-442-ErzvWeI5N-KrP7mHnnHSKA-1; Tue,
 03 Feb 2026 00:28:36 -0500
X-MC-Unique: ErzvWeI5N-KrP7mHnnHSKA-1
X-Mimecast-MFC-AGG-ID: ErzvWeI5N-KrP7mHnnHSKA_1770096515
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B7DC0195609D;
	Tue,  3 Feb 2026 05:28:35 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B82EE1955F1B;
	Tue,  3 Feb 2026 05:28:33 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] nouveau/vmm: increase size of vmm pte tracker struct to
 u32
Date: Tue,  3 Feb 2026 15:25:26 +1000
Message-ID: <20260203052823.2220053-3-airlied@gmail.com>
In-Reply-To: <20260203052823.2220053-1-airlied@gmail.com>
References: <20260203052823.2220053-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: orXmbjLMjIy-JInEYfsUR4tszfHiPSiYQ8q5KY5b2gg_1770096515
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: WCV2YU4FZPBUT6HUZP4FP6JA2UAEQEY5
X-Message-ID-Hash: WCV2YU4FZPBUT6HUZP4FP6JA2UAEQEY5
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WCV2YU4FZPBUT6HUZP4FP6JA2UAEQEY5/>
Archived-At: 
 <https://lore.freedesktop.org/20260203052823.2220053-3-airlied@gmail.com/>
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
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 9 +++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/dr=
m/nouveau/nvkm/subdev/mmu/vmm.c
index efc334f6104c..8b8f4b85e315 100644
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
+=09=09memset32(&pt->pte[ptei].u, 0x00, sizeof(pt->pte[0]) * ptes);
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

