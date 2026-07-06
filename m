Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A630C43458
	for <nouveau@archiver.kernel.org>; Mon,  6 Jul 2026 03:05:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 175AA10E724;
	Mon,  6 Jul 2026 03:05:34 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A430D46EE5;
	Mon,  6 Jul 2026 02:50:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783306239;
 b=qGIp/24P8ON6N18bToKfIP3P6dHDgQj6y9u1cJNXy7APHBs3ooeni1G66WrX8e/RKXV+Q
 HJ8FqCFVV+xqSYG/NrKcGCp6Or6eqhTskirn++ciSVzvHdGVarxyVidss0Q7B3YeiB+22Fu
 59v5pjDMtAHu5dtlM9TNCjjJmOXPG+jC9iRWbO7NckYMm6V0WGdzhIiHTjV7XibnPz1KKaT
 Q0zW/1ii7N7ljhLLBOGJ4iDZjdGFFxfgJs2Sy028MqfL/C+fpuctMSNxdG3cpE77JOqQl1D
 XSFqSasTyxM+/OrknScyG0xwVKNmLk/DP7gtfhy4tu6abBTDo8SPm0TDAIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783306239; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=84//c6an6Z313wtJFwr3pxp+X2IDQ1dkKbBl3KdRdOk=;
 b=A7U1VM0dw+mqwglY4d+J2+1dqnHYP4ERtNO67/A6/mcDhXT9zPKDjr2P0lsBdd1RTUIjy
 agrKOVkuaeRzcFGhkyOZcDyyOMfCykPkjzd2rzCXl1Ew0zvxMkujXQWRTtwlE5gQzywgJuH
 /4LPD3Q3bVa8Uz85u6BwszOdUf32kZ3PJSkI1o23CpEa5kgEd4028ekDDQsnrbfukRF81Ib
 x9iIp1Gmq8jVGkltJ37+EVg86CLVerCydV+4vdIIhiiK+6MpYtxpGmW+e5HlJT5/Dlo/F8+
 z+54BKsg01pCvwJJbBXqL/mgLIExpcNhOq7151FroUmYTmNvOYBRByAr6jiQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 17E2F46B7C
	for <nouveau@lists.freedesktop.org>; Mon,  6 Jul 2026 02:50:36 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1E34210E71C
	for <nouveau@lists.freedesktop.org>; Mon,  6 Jul 2026 03:05:30 +0000 (UTC)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-328-LKg31dyrNAyQfCwzCeZD6g-1; Sun,
 05 Jul 2026 23:05:26 -0400
X-MC-Unique: LKg31dyrNAyQfCwzCeZD6g-1
X-Mimecast-MFC-AGG-ID: LKg31dyrNAyQfCwzCeZD6g_1783307125
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3E1C3180137A;
	Mon,  6 Jul 2026 03:05:25 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.13])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 05D701956045;
	Mon,  6 Jul 2026 03:05:22 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau/instmem: use iomapping interface for instmem handling
 (v3)
Date: Mon,  6 Jul 2026 13:05:20 +1000
Message-ID: <20260706030520.857104-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YwrDiKkP5KvJCVWs7wzXwJQNkhGF_nYDlJTG0GF61cA_1783307125
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: X7EDELZJMDJRZ5MQFJNFMJ426CRKZZQH
X-Message-ID-Hash: X7EDELZJMDJRZ5MQFJNFMJ426CRKZZQH
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dakr@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X7EDELZJMDJRZ5MQFJNFMJ426CRKZZQH/>
Archived-At: 
 <https://lore.freedesktop.org/20260706030520.857104-1-airlied@gmail.com/>
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

This create the io mapping on first use, because creating it at init
time causes a resource mapping error, because nouveau hasn't kicked
simpledrm off the hardware yet, but ioremap_wc the whole BAR causes
an overlap with BOOTFB/simpledrm. I think the resource system could
do better here, but it's easier to just delay creating the mapping
until first use.

Signed-off-by: Dave Airlie <airlied@redhat.com>

---
v2: move the mapping into the main code.
v3: fixup some Sashiko review, just do mapping in boot code
which should always be called for bar2.
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c    |  1 +
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    | 39 ++++++++++++++-----
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |  1 +
 3 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
index 700cea5def35..f128330f30d7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
@@ -297,6 +297,7 @@ r535_fbsr =3D {
 static void *
 r535_instmem_dtor(struct nvkm_instmem *imem)
 {
+=09nv50_instmem_dtor(imem);
 =09kfree(imem->func);
 =09return imem;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/g=
pu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index 6fbaa1e5876d..f4489efc94a7 100644
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
+=09iobj->map =3D io_mapping_map_wc(&imem->iomap, (u32)iobj->bar->addr, siz=
e);
 =09if (!iobj->map) {
 =09=09nvkm_warn(subdev, "PRAMIN ioremap failed\n");
 =09=09nvkm_vmm_put(vmm, &iobj->bar);
@@ -188,6 +190,16 @@ nv50_instobj_map(struct nvkm_memory *memory, u64 offse=
t, struct nvkm_vmm *vmm,
 =09return nvkm_memory_map(memory, offset, vmm, vma, argv, argc);
 }
=20
+static bool
+check_io_mapping(struct nv50_instmem *imem)
+{
+=09struct nvkm_device *device =3D imem->base.subdev.device;
+
+=09return io_mapping_init_wc(&imem->iomap,
+=09=09=09=09  device->func->resource_addr(device, NVKM_BAR2_INST),
+=09=09=09=09  device->func->resource_size(device, NVKM_BAR2_INST)) !=3D NU=
LL;
+}
+
 static void
 nv50_instobj_release(struct nvkm_memory *memory)
 {
@@ -239,7 +251,7 @@ nv50_instobj_acquire(struct nvkm_memory *memory)
=20
 =09/* Attempt to get a direct CPU mapping of the object. */
 =09if ((vmm =3D nvkm_bar_bar2_vmm(imem->subdev.device))) {
-=09=09if (!iobj->map)
+=09=09if (!iobj->map && iobj->imem->iomap.size)
 =09=09=09nv50_instobj_kmap(iobj, vmm);
 =09=09map =3D iobj->map;
 =09}
@@ -277,7 +289,12 @@ nv50_instobj_boot(struct nvkm_memory *memory, struct n=
vkm_vmm *vmm)
 =09=09iobj->lru.next =3D NULL;
 =09}
=20
-=09nv50_instobj_kmap(iobj, vmm);
+=09/*
+=09 * boot is only called on BAR2, if we can't remap the complete
+=09 * BAR it's unlikely things are functioning well.
+=09 */
+=09if (check_io_mapping(iobj->imem))
+=09=09nv50_instobj_kmap(iobj, vmm);
 =09nvkm_instmem_boot(imem);
 =09mutex_unlock(&imem->mutex);
 }
@@ -330,7 +347,7 @@ nv50_instobj_dtor(struct nvkm_memory *memory)
=20
 =09if (map) {
 =09=09struct nvkm_vmm *vmm =3D nvkm_bar_bar2_vmm(imem->subdev.device);
-=09=09iounmap(map);
+=09=09io_mapping_unmap(map);
 =09=09if (likely(vmm)) /* Can be NULL during BAR destructor. */
 =09=09=09nvkm_vmm_put(vmm, &bar);
 =09}
@@ -406,10 +423,14 @@ nv50_instmem_fini(struct nvkm_instmem *base)
 =09nv50_instmem(base)->addr =3D ~0ULL;
 }
=20
-static void *
+void *
 nv50_instmem_dtor(struct nvkm_instmem *base)
 {
-=09return nv50_instmem(base);
+=09struct nv50_instmem *imem =3D nv50_instmem(base);
+
+=09if (imem->iomap.size)
+=09=09io_mapping_fini(&imem->iomap);
+=09return imem;
 }
=20
 static const struct nvkm_instmem_func
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h b/drivers/g=
pu/drm/nouveau/nvkm/subdev/instmem/priv.h
index 87bbdd786eaa..b423f01f5fcd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
@@ -26,6 +26,7 @@ int nv50_instobj_new(struct nvkm_instmem *, u32 size, u32=
 align, bool zero,
 =09=09     struct nvkm_memory **);
 int nv50_instobj_wrap(struct nvkm_instmem *, struct nvkm_memory *vram,
 =09=09      struct nvkm_memory **bar2);
+void *nv50_instmem_dtor(struct nvkm_instmem *base);
=20
 void nvkm_instmem_ctor(const struct nvkm_instmem_func *, struct nvkm_devic=
e *,
 =09=09       enum nvkm_subdev_type, int, struct nvkm_instmem *);
--=20
2.54.0

