Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA98CDB471
	for <nouveau@archiver.kernel.org>; Tue, 23 Jun 2026 22:34:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E42A210ECF5;
	Tue, 23 Jun 2026 22:34:35 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 88E2146CB2;
	Tue, 23 Jun 2026 22:20:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782253208;
 b=uK33cnwCIuXXUEOFRXcNA0Tll+XMLJF065I7LBHXvHjzDnkSwG6pIyi+18jrm2p72nnEQ
 HreVn7Gy06MzHIfkpxqVserE2NjxMgE50rs3iu8WzewcXLwlBOaRMBIXcLzOwUijfkTgqWU
 X9/lvz1mzkzVXagdOPhc0VNzVPBnUIouEOQhA3uVwPP6dx+OLrAVhFqn1GLzjbVv7+xg7LP
 IXn4z9u/Sf+B9kQCtLjDzMq4pSnRAFvjqaHB56PILMMlr9QWIovqY/o9ZQXGvRq43sxKxer
 THxHcI6afiNmFuKp2D02LFjMmY22M/utZmCCyCpEc925Qf1uHpMxLJPeSbFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782253208; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7S1teQfTPJYV0a4TiMbbq3hzKoE0FYU8pP1yoZ8ylw0=;
 b=pUSSpzBblN23aYbyF9R02hd49yxpeDmd48F25bth+pFVSIxxUmzM/2B0PTDTNnaIXZsYd
 eYIwh/WNnuN/t89ImWU0Z3KwKU4wgCDZPWlwe7HIe59KDNptuuqX7nw+gJgfgZxY1RVawVQ
 GB+aJ+m/cTVR7LBmpQ5DqSF344kS97ldexP2RToUtkDpzYy4+T1DJ/mZVR4oCErnJ7YdEXH
 yXH+B7ICReLrTiRiu0Go7OPHJxLOWvpYGewGw42DHPhj4ouc93DzHkabA3J/BpxBLnIHmZt
 NvsXN9EXRA1yvnqyZoD03+Ib8SytcfTwGGYEFVENzqJjXfPoZr2JVh0ViFDA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8819E4062B
	for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2026 22:20:05 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7003810E392
	for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2026 22:34:32 +0000 (UTC)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-379aMDJnMMiuPvhC18smYQ-1; Tue,
 23 Jun 2026 18:33:26 -0400
X-MC-Unique: 379aMDJnMMiuPvhC18smYQ-1
X-Mimecast-MFC-AGG-ID: 379aMDJnMMiuPvhC18smYQ_1782254005
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 49BC61800473;
	Tue, 23 Jun 2026 22:33:25 +0000 (UTC)
Received: from dreadlord.taild9177d.ts.net (unknown [10.67.32.13])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EC722364CC;
	Tue, 23 Jun 2026 22:33:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/instmem: use iomapping interface for instmem handling
Date: Wed, 24 Jun 2026 08:33:20 +1000
Message-ID: <20260623223320.3837840-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z7U-S9wIdCjhWTgiZLGkEQn0qe9oxCNn6QJK6gnTkrg_1782254005
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: IX773MRHCXRZ3WNHFZN2P7YV6UBX36P6
X-Message-ID-Hash: IX773MRHCXRZ3WNHFZN2P7YV6UBX36P6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IX773MRHCXRZ3WNHFZN2P7YV6UBX36P6/>
Archived-At: 
 <https://lore.freedesktop.org/20260623223320.3837840-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This avoids constant need to ioremap when instobjs move at least
on 64-bit systems.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    | 25 ++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index 6fbaa1e5876d..929246bde72d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -30,10 +30,14 @@
 #include <subdev/gsp.h>
 #include <subdev/mmu.h>
=20
+#include <linux/io-mapping.h>
+
 struct nv50_instmem {
 =09struct nvkm_instmem base;
 =09u64 addr;
=20
+=09struct io_mapping iomap;
+
 =09/* Mappings that can be evicted when BAR2 space has been exhausted. */
 =09struct list_head lru;
 };
@@ -124,7 +128,6 @@ nv50_instobj_kmap(struct nv50_instobj *iobj, struct nvk=
m_vmm *vmm)
 =09struct nv50_instobj *eobj;
 =09struct nvkm_memory *memory =3D &iobj->base.memory;
 =09struct nvkm_subdev *subdev =3D &imem->base.subdev;
-=09struct nvkm_device *device =3D subdev->device;
 =09struct nvkm_vma *bar =3D NULL, *ebar;
 =09u64 size =3D nvkm_memory_size(memory);
 =09void *emap;
@@ -155,7 +158,7 @@ nv50_instobj_kmap(struct nv50_instobj *iobj, struct nvk=
m_vmm *vmm)
 =09=09mutex_unlock(&imem->base.mutex);
 =09=09if (!eobj)
 =09=09=09break;
-=09=09iounmap(emap);
+=09=09io_mapping_unmap(emap);
 =09=09nvkm_vmm_put(vmm, &ebar);
 =09}
=20
@@ -172,8 +175,7 @@ nv50_instobj_kmap(struct nv50_instobj *iobj, struct nvk=
m_vmm *vmm)
=20
 =09/* Make the mapping visible to the host. */
 =09iobj->bar =3D bar;
-=09iobj->map =3D ioremap_wc(device->func->resource_addr(device, NVKM_BAR2_=
INST) +
-=09=09=09       (u32)iobj->bar->addr, size);
+=09iobj->map =3D io_mapping_map_wc(&imem->iomap, iobj->bar->addr, size);
 =09if (!iobj->map) {
 =09=09nvkm_warn(subdev, "PRAMIN ioremap failed\n");
 =09=09nvkm_vmm_put(vmm, &iobj->bar);
@@ -330,7 +332,7 @@ nv50_instobj_dtor(struct nvkm_memory *memory)
=20
 =09if (map) {
 =09=09struct nvkm_vmm *vmm =3D nvkm_bar_bar2_vmm(imem->subdev.device);
-=09=09iounmap(map);
+=09=09io_mapping_unmap(map);
 =09=09if (likely(vmm)) /* Can be NULL during BAR destructor. */
 =09=09=09nvkm_vmm_put(vmm, &bar);
 =09}
@@ -409,7 +411,10 @@ nv50_instmem_fini(struct nvkm_instmem *base)
 static void *
 nv50_instmem_dtor(struct nvkm_instmem *base)
 {
-=09return nv50_instmem(base);
+=09struct nv50_instmem *imem =3D nv50_instmem(base);
+
+=09io_mapping_fini(&imem->iomap);
+=09return imem;
 }
=20
 static const struct nvkm_instmem_func
@@ -433,8 +438,16 @@ nv50_instmem_new_(const struct nvkm_instmem_func *func=
,
=20
 =09if (!(imem =3D kzalloc_obj(*imem)))
 =09=09return -ENOMEM;
+
+=09if (!io_mapping_init_wc(&imem->iomap, device->func->resource_addr(devic=
e, NVKM_BAR2_INST),
+=09=09=09=09device->func->resource_size(device, NVKM_BAR2_INST))) {
+=09=09kfree(imem);
+=09=09return -ENOMEM;
+=09}
+
 =09nvkm_instmem_ctor(func, device, type, inst, &imem->base);
 =09INIT_LIST_HEAD(&imem->lru);
+
 =09*pimem =3D &imem->base;
 =09return 0;
 }
--=20
2.54.0

