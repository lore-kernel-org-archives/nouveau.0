Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AECC54F55
	for <nouveau@archiver.kernel.org>; Wed, 29 Jul 2026 04:17:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 940FD10E64D;
	Wed, 29 Jul 2026 04:17:14 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 20E774747A;
	Wed, 29 Jul 2026 04:01:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785297689;
 b=ZzLIQF4QLSnjgEBnkSoUBYfJELJ6nJCar4kQ2iLBf8QoiET+STmwpcVJOJiVHQg4JQvEa
 biHsZ+2Ip8u9Ko646pqJzfy4iiNpGRBV68h0GffsHergA1F7mHdIY7XxsEfQSwX3iUkya8+
 Mm6OrNJLzyn6hqazkwVPieWq8WUZQBhtgjO9TYwCmYCNvdzTKYvIhKHumhOs4ct36QVgfmT
 jYp2P20iYjJHYZmfNfZHyi4T8CFI+hGQZGVXbvyKF4gfgCT6zJZ0+APRxNVyEdT2Fihetdw
 MQbMTZv7eyBVqtFo5KuOqlmDL7UjUtadYnvD/Svg8h/6srlyM1tKzCfjDJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785297689; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ypMZ0eSEP3j+9eeBLRb+D/y+8/+/k+Gb5Kb+08a1EW8=;
 b=ntM2sQO7o/Ya2l/46ONn/d70cyzDyvPRW5iSMgh8VCc54pRVTn9MjcALTGM4RH8mIiIzX
 rUwmAM8T1YAON9unEbjubdIqrfaJeHczGTlYRKSrBlIUUt26ahZFwZ1VYs84Kna3ehfhziZ
 FQUx16TGzlQ/hUOv62p2GR8imiv66r8VjL3IgBhPkvrr/2SrsVqvyN2iMNQq02KUmxscqBy
 EIoIFggV5jLlGo+1aKUOZHT+hrxvRtFj5ByLuGV3GCT3jkzdpPCOLfaia5e5NFd0VL/zR83
 U9qCRx8YsGyyDXZg6hxyVvGuLu6PIb1UZYtaRH0rjUm9mMV/Xi/xUfaTbehg==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EB6CF463F9
	for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2026 04:01:26 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A380110E38E
	for <nouveau@lists.freedesktop.org>; Wed, 29 Jul 2026 04:17:11 +0000 (UTC)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-364-FYSTQq4VMUC6KHt3hNHbOg-1; Wed,
 29 Jul 2026 00:17:07 -0400
X-MC-Unique: FYSTQq4VMUC6KHt3hNHbOg-1
X-Mimecast-MFC-AGG-ID: FYSTQq4VMUC6KHt3hNHbOg_1785298626
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 35CA41956089;
	Wed, 29 Jul 2026 04:17:06 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.13])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D311F1800480;
	Wed, 29 Jul 2026 04:17:03 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] nouveau/gsp: make libos init per-gsp version.
Date: Wed, 29 Jul 2026 14:15:26 +1000
Message-ID: <20260729041653.3985549-3-airlied@gmail.com>
In-Reply-To: <20260729041653.3985549-1-airlied@gmail.com>
References: <20260729041653.3985549-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W-5Ip7sBqlSgThCfvUpsbr0ptKHX7effpNq6f2LONes_1785298626
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: L76D2SSPZVD3HOW54LSNRBBP5S4DCEYF
X-Message-ID-Hash: L76D2SSPZVD3HOW54LSNRBBP5S4DCEYF
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L76D2SSPZVD3HOW54LSNRBBP5S4DCEYF/>
Archived-At: 
 <https://lore.freedesktop.org/20260729041653.3985549-3-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This makes it a per-gsp thing, but just adds r570 as a copy of r535
for now.

r570 will be enhanced next.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 23 ++-----
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c | 68 +++++++++++++++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        | 23 +++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   | 16 +++++
 4 files changed, 114 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index f4f4142ec8d0..8e1ad2e79d3e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1205,7 +1205,7 @@ r535_gsp_set_rmargs(struct nvkm_gsp *gsp, bool resume=
)
 =09}
 }
=20
-static int
+int
 r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
 {
 =09int ret;
@@ -1362,7 +1362,7 @@ static struct dentry *create_debugfs(struct nvkm_gsp =
*gsp, const char *name,
  * r535_gsp_booter_load() is called, so that if GSP-RM fails to initialize=
,
  * there could still be a log to capture.
  */
-static void
+void
 r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
 {
 =09struct device *dev =3D gsp->subdev.device->dev;
@@ -1433,17 +1433,6 @@ r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
=20
 #endif
=20
-static inline u64
-r535_gsp_libos_id8(const char *name)
-{
-=09u64 id =3D 0;
-
-=09for (int i =3D 0; i < sizeof(id) && *name; i++, name++)
-=09=09id =3D (id << 8) | *name;
-
-=09return id;
-}
-
 /**
  * create_pte_array() - creates a PTE array of a physically contiguous buf=
fer
  * @ptes: pointer to the array
@@ -1461,7 +1450,8 @@ r535_gsp_libos_id8(const char *name)
  *
  * See memdescGetPhysAddrsForGpu()
  */
-static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
+void
+r535_gsp_create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
 {
 =09unsigned int num_pages =3D DIV_ROUND_UP_ULL(size, GSP_PAGE_SIZE);
 =09unsigned int i;
@@ -1488,7 +1478,7 @@ gsp_fill_libos_entry(struct nvkm_gsp *gsp,
 =09arg->size =3D mem->size;
 =09arg->kind =3D LIBOS_MEMORY_REGION_CONTIGUOUS;
 =09arg->loc  =3D LIBOS_MEMORY_REGION_LOC_SYSMEM;
-=09create_pte_array(mem->data + sizeof(u64), mem->addr, mem->size);
+=09r535_gsp_create_pte_array(mem->data + sizeof(u64), mem->addr, mem->size=
);
 =09return 0;
 }
=20
@@ -2187,7 +2177,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 =09/* Release FW images - we've copied them to DMA buffers now. */
 =09nvkm_gsp_dtor_fws(gsp);
=20
-=09ret =3D r535_gsp_libos_init(gsp);
+=09ret =3D rmapi->gsp->libos_init(gsp);
 =09if (WARN_ON(ret))
 =09=09return ret;
=20
@@ -2206,6 +2196,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
=20
 const struct nvkm_rm_api_gsp
 r535_gsp =3D {
+=09.libos_init =3D r535_gsp_libos_init,
 =09.set_rmargs =3D r535_gsp_set_rmargs,
 =09.set_system_info =3D r535_gsp_set_system_info,
 =09.get_static_info =3D r535_gsp_get_static_info,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
index 996941c668ba..64011430f4c0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -205,8 +205,76 @@ r570_gsp_set_rmargs(struct nvkm_gsp *gsp, bool resume)
 =09args->bDmemStack =3D 1;
 }
=20
+static int
+gsp_fill_libos_entry(struct nvkm_gsp *gsp,
+=09=09     LibosMemoryRegionInitArgument *arg,
+=09=09     size_t size,
+=09=09     struct nvkm_gsp_mem *mem,
+=09=09     const char *name)
+{
+=09int ret;
+
+=09ret =3D nvkm_gsp_mem_ctor(gsp, size, mem);
+=09if (ret)
+=09=09return ret;
+
+=09arg->id8  =3D r535_gsp_libos_id8(name);
+=09arg->pa   =3D mem->addr;
+=09arg->size =3D mem->size;
+=09arg->kind =3D LIBOS_MEMORY_REGION_CONTIGUOUS;
+=09arg->loc  =3D LIBOS_MEMORY_REGION_LOC_SYSMEM;
+=09r535_gsp_create_pte_array(mem->data + sizeof(u64), mem->addr, mem->size=
);
+=09return 0;
+}
+
+/**
+ * r570_gsp_libos_init() -- create the libos arguments structure
+ * @gsp: gsp pointer
+ */
+static int
+r570_gsp_libos_init(struct nvkm_gsp *gsp)
+{
+=09LibosMemoryRegionInitArgument *args;
+=09int ret;
+
+=09ret =3D nvkm_gsp_mem_ctor(gsp, 0x1000, &gsp->libos);
+=09if (ret)
+=09=09return ret;
+
+=09args =3D gsp->libos.data;
+
+=09ret =3D gsp_fill_libos_entry(gsp, &args[0], 0x10000, &gsp->loginit, "LO=
GINIT");
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D gsp_fill_libos_entry(gsp, &args[1], 0x10000, &gsp->logintr, "LO=
GINTR");
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D gsp_fill_libos_entry(gsp, &args[2], 0x10000, &gsp->logrm, "LOGR=
M");
+=09if (ret)
+=09=09return ret;
+
+=09ret =3D r535_gsp_rmargs_init(gsp, false);
+=09if (ret)
+=09=09return ret;
+
+=09args[3].id8  =3D r535_gsp_libos_id8("RMARGS");
+=09args[3].pa   =3D gsp->rmargs.addr;
+=09args[3].size =3D gsp->rmargs.size;
+=09args[3].kind =3D LIBOS_MEMORY_REGION_CONTIGUOUS;
+=09args[3].loc  =3D LIBOS_MEMORY_REGION_LOC_SYSMEM;
+
+#ifdef CONFIG_DEBUG_FS
+=09r535_gsp_libos_debugfs_init(gsp);
+#endif
+
+=09return 0;
+}
+
 const struct nvkm_rm_api_gsp
 r570_gsp =3D {
+=09.libos_init =3D r570_gsp_libos_init,
 =09.set_rmargs =3D r570_gsp_set_rmargs,
 =09.set_system_info =3D r570_gsp_set_system_info,
 =09.get_static_info =3D r570_gsp_get_static_info,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h b/d=
rivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
index b6075021e74f..23c30cbdefff 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
@@ -523,6 +523,29 @@ typedef struct
=20
 #define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3            (0x00000003=
U)
=20
+typedef NvU64 LibosAddress;
+
+typedef struct
+{
+    LibosAddress          id8;  // Id tag.
+    LibosAddress          pa;   // Physical address.
+    LibosAddress          size; // Size of memory area.
+    NvU8                  kind; // See LibosMemoryRegionKind above.
+    NvU8                  loc;  // See LibosMemoryRegionLoc above.
+} LibosMemoryRegionInitArgument;
+
+typedef enum {
+    LIBOS_MEMORY_REGION_NONE,
+    LIBOS_MEMORY_REGION_CONTIGUOUS,
+    LIBOS_MEMORY_REGION_RADIX3
+} LibosMemoryRegionKind;
+
+typedef enum {
+    LIBOS_MEMORY_REGION_LOC_NONE,
+    LIBOS_MEMORY_REGION_LOC_SYSMEM,
+    LIBOS_MEMORY_REGION_LOC_FB
+} LibosMemoryRegionLoc;
+
 typedef struct
 {
     // Magic for verification by secure ucode
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/=
drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index a9af94adf9ef..cc9f33202673 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -32,6 +32,7 @@ struct nvkm_rm_wpr {
=20
 struct nvkm_rm_api {
 =09const struct nvkm_rm_api_gsp {
+=09=09int (*libos_init)(struct nvkm_gsp *);
 =09=09void (*set_rmargs)(struct nvkm_gsp *, bool resume);
 =09=09int (*set_system_info)(struct nvkm_gsp *);
 =09=09int (*get_static_info)(struct nvkm_gsp *);
@@ -144,6 +145,9 @@ void r535_gsp_acpi_caps(acpi_handle, CAPS_METHOD_DATA *=
);
 struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS;
 void r535_gsp_get_static_info_fb(struct nvkm_gsp *,
 =09=09=09=09 const struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS *);
+void r535_gsp_create_pte_array(u64 *ptes, dma_addr_t addr, size_t size);
+int r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume);
+void r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp);
 extern const struct nvkm_rm_api_rpc r535_rpc;
 extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
@@ -188,4 +192,16 @@ extern const struct nvkm_rm_api_gr r570_gr;
 int r570_gr_gpc_mask(struct nvkm_gsp *, u32 *mask);
 int r570_gr_tpc_mask(struct nvkm_gsp *, int gpc, u32 *mask);
 extern const struct nvkm_rm_api_engine r570_ofa;
+
+static inline u64
+r535_gsp_libos_id8(const char *name)
+{
+=09u64 id =3D 0;
+
+=09for (int i =3D 0; i < sizeof(id) && *name; i++, name++)
+=09=09id =3D (id << 8) | *name;
+
+=09return id;
+}
+
 #endif
--=20
2.55.0

