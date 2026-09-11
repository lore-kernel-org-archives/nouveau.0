Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D581DC88E4D
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 22:25:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 97EE610F71C;
	Fri, 11 Sep 2026 22:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CK70hL3d";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 90A3345E5A;
	Fri, 11 Sep 2026 22:07:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789164459;
 b=W/X8BLyYSguwbPWnD9NX+TA9/bvl5drH1dG7hPNmw7tiGt1/kEVvZLyM3HeeHfEPto+SD
 Faym30u4y8EzA6n9UYRPJ0btGS0YuKEs3+lXUZMNNvDkxPtE5yQlLd1RNjTpYAbqQacNgYn
 enzmB9SJosdniSbBMqCMj4Kux6IWQkx8wHZtm9pz693d2t3gQWJCr2FtBVbkH8CFM+7OocN
 ySrPpSlIwWfwmXsxJeXIrniyWY5xyxTkhTL/3cgTfE44pZUvS99nYwnEaX8zsvY0b86c1QV
 QdAwv/Q/dZXx5tElW6LkIdQpdj8ewdxS2XIz4J9ISyZfMEeCUzZLv7HZeMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789164459; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9A4k9uvhSjB1bn/Qmm66aX7Slnjo2bWqZcI/rVlwx/s=;
 b=SW3gUBHahXdpKkd3iWo3rG7qlLKKglyaN7QoZPrqFXn/fB5li/mfWkGvQRbV1mvPkY4HS
 dPiRjKtsrupyxkg5K1SqfjRsrXEcSVm9u2abynuf9OjIQHJ2RB8sQ8pRnMVEZQw/JLaKLgM
 7S8TwR9PsiM40PUQ+9Z+0ULLXw0KY1lhf4QcIDqzJRZrhpdfie+FES8txNfldHLM7OjFB7t
 fBQiK5GLkGbc6BSKA/Q+q0ATi4XuktvLhthVxblpyltamdIAyz0wALX0bcVtT3hWWt3hixL
 idcRjrGJZLkhn1HlMgdJ3gK/Y3AHvCsDfdjfMsuopI4aMJn3hil7co6Nq7Ew==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 48CD240086
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 22:07:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DB24210F70D
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 22:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789165499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9A4k9uvhSjB1bn/Qmm66aX7Slnjo2bWqZcI/rVlwx/s=;
	b=CK70hL3dKD2vUyy7BG7v5vz+X1QfGwjIhLUlb6VvyCv+i+snWgAZLfVGTu9PeypgjZUHs5
	TRVF/fjDyhFB9m5U/YPFEkfKpzuXDtmvShq2M+MPkqmMVnbMxq2RMGZ7aXxR3NUaewQzmn
	yq/Gu9KDzYS46LpST+OrBLomb/ip5kc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-45oaGiEzPCSWsE1-j4eBEA-1; Fri,
 11 Sep 2026 18:24:56 -0400
X-MC-Unique: 45oaGiEzPCSWsE1-j4eBEA-1
X-Mimecast-MFC-AGG-ID: 45oaGiEzPCSWsE1-j4eBEA_1789165494
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 539DE19539B7;
	Fri, 11 Sep 2026 22:24:53 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1A6B119560AB;
	Fri, 11 Sep 2026 22:24:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] drm/nouveau/gsp/r535: Add support for
 INTERNAL_GCX_ENTRY_PREREQUISITE
Date: Fri, 11 Sep 2026 17:49:54 -0400
Message-ID: <20260911222428.752641-2-lyude@redhat.com>
In-Reply-To: <20260911222428.752641-1-lyude@redhat.com>
References: <20260911222428.752641-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: vUs_EHjWtqh8BTD-uDqsKOjiVCxHMNINWq792ydtNqA_1789165494
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 2DJNSV225WS7XU7COQJZ55UONK3ZJAPQ
X-Message-ID-Hash: 2DJNSV225WS7XU7COQJZ55UONK3ZJAPQ
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2DJNSV225WS7XU7COQJZ55UONK3ZJAPQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260911222428.752641-2-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

OpenRM's runtime PM handling looks a bit different then nouveau's, one part
in particular that differs from us: OpenRM actually consults GSP to ask
whether the GPU should be allowed to enter Gc6 and/or GcOff before runtime
suspending the GPU. In the event the card isn't ready, runtime suspend is
simply delayed for a few seconds before retrying.

Implement the command used for querying GSP about this,
NV2080_CTRL_CMD_INTERNAL_GCX_ENTRY_PREREQUISITE, and check to ensure that
the GPU is ready for runtime suspend in nouveau_pmops_runtime_suspend()
using this query. If the GPU can't be runtime suspended, update the last
busy counter of the device and then return -EBUSY from
nouveau_pmops_runtime_suspend() - essentially delaying the runtime suspend
process by whatever autosuspend_delay_ms is set to.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h | 10 ++++++
 drivers/gpu/drm/nouveau/include/nvif/device.h |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  3 ++
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 +++++
 drivers/gpu/drm/nouveau/nvif/device.c         | 13 +++++++
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 36 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 26 ++++++++++++++
 .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        |  7 ++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 10 files changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index ea8267e0d8da2..9e639df1da467 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -4,6 +4,7 @@
 
 #define NV_DEVICE_V0_INFO                                                  0x00
 #define NV_DEVICE_V0_TIME                                                  0x01
+#define NV_DEVICE_V0_GCX_READY						   0x02
 
 struct nv_device_info_v0 {
 	__u8  version;
@@ -55,6 +56,15 @@ struct nv_device_time_v0 {
 	__u64 time;
 };
 
+#define NV_DEVICE_GC6_READY	BIT(0)
+#define NV_DEVICE_GCOFF_READY	BIT(1)
+
+struct nv_device_gcx_ready_v0 {
+	__u8 version;
+	__u8 pad01[6];
+	__u8 ready;
+};
+
 #define NV_DEVICE_INFO_UNIT                               (0xffffffffULL << 32)
 #define NV_DEVICE_INFO(n)                          ((n) | (0x00000000ULL << 32))
 #define NV_DEVICE_HOST(n)                          ((n) | (0x00000001ULL << 32))
diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index 7877a2a79da9b..ce2fadcb05d9e 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -22,4 +22,5 @@ int  nvif_device_ctor(struct nvif_client *, const char *name, struct nvif_device
 void nvif_device_dtor(struct nvif_device *);
 int  nvif_device_map(struct nvif_device *);
 u64  nvif_device_time(struct nvif_device *);
+int  nvif_device_gcx_ready(struct nvif_device *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 64fed208e4cf8..2bccf58f0f53c 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -10,6 +10,9 @@
 #define GSP_PAGE_SHIFT 12
 #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
 
+#define GSP_GCX_ENTRY_GC6_READY		BIT(0)
+#define GSP_GCX_ENTRY_GCOFF_READY	BIT(1)
+
 struct nvkm_gsp_mem {
 	struct device *dev;
 	size_t size;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index b0f9fb10a74dd..12300700d331f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1157,6 +1157,7 @@ nouveau_pmops_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+	struct nvif_device *nvif = &drm->client.device;
 	int ret;
 
 	if (!nouveau_pmops_runtime()) {
@@ -1164,6 +1165,14 @@ nouveau_pmops_runtime_suspend(struct device *dev)
 		return -EBUSY;
 	}
 
+	// Check if the GPU itself is ready for runtime suspend, otherwise mark as busy and check
+	// again in a bit.
+	if (!(nvif_device_gcx_ready(nvif) & NV_DEVICE_GCOFF_READY)) {
+		NV_DEBUG(drm, "GPU isn't ready for suspend yet, delaying...\n");
+		pm_runtime_mark_last_busy(dev);
+		return -EBUSY;
+	}
+
 	nouveau_switcheroo_optimus_dsm();
 	ret = nouveau_do_suspend(drm, true);
 	pci_save_state(pdev);
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index 24880931039f6..1be9fbe6cb703 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -38,6 +38,19 @@ nvif_device_time(struct nvif_device *device)
 	return device->user.func->time(&device->user);
 }
 
+int
+nvif_device_gcx_ready(struct nvif_device *device)
+{
+	struct nv_device_gcx_ready_v0 args = {};
+	int ret;
+
+	ret = nvif_object_mthd(&device->object, NV_DEVICE_V0_GCX_READY, &args, sizeof(args));
+	if (ret)
+		return ret;
+
+	return args.ready;
+}
+
 int
 nvif_device_map(struct nvif_device *device)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 23d11d8221cb6..f602e4a07fbb0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -27,6 +27,8 @@
 
 #include <core/client.h>
 #include <subdev/fb.h>
+#include <subdev/gsp.h>
+#include <subdev/gsp/priv.h>
 #include <subdev/instmem.h>
 #include <subdev/timer.h>
 
@@ -189,6 +191,38 @@ nvkm_udevice_time(struct nvkm_udevice *udev, void *data, u32 size)
 	return ret;
 }
 
+static int
+nvkm_udevice_gcx_ready(struct nvkm_udevice *udev, void *data, u32 size)
+{
+	struct nvkm_object *object = &udev->object;
+	struct nvkm_device *device = udev->device;
+	struct nvkm_gsp *gsp = device->gsp;
+	union {
+		struct nv_device_gcx_ready_v0 v0;
+	} *args = data;
+	int ret = -ENOSYS;
+
+	/* XXX: We don't know any way of performing this check outside of GSP, so just assume
+	 * things are ready for non-GSP clients.
+	 */
+	if (!device->gsp)
+		return NV_DEVICE_GC6_READY | NV_DEVICE_GCOFF_READY;
+
+	nvif_ioctl(object, "device gcx ready size %d\n", size);
+	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
+		nvif_ioctl(object, "device gcx ready vers %d\n", args->v0.version);
+
+		ret = r535_gsp_gcx_ready(gsp);
+		if (ret < 0)
+			return ret;
+
+		args->v0.ready = ret;
+		ret = 0;
+	}
+
+	return ret;
+}
+
 static int
 nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 {
@@ -199,6 +233,8 @@ nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 		return nvkm_udevice_info(udev, data, size);
 	case NV_DEVICE_V0_TIME:
 		return nvkm_udevice_time(udev, data, size);
+	case NV_DEVICE_V0_GCX_READY:
+		return nvkm_udevice_gcx_ready(udev, data, size);
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index 71b7203bef507..b07797813b049 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -93,6 +93,7 @@ void r535_gsp_dtor(struct nvkm_gsp *);
 int r535_gsp_oneinit(struct nvkm_gsp *);
 int r535_gsp_init(struct nvkm_gsp *);
 int r535_gsp_fini(struct nvkm_gsp *, enum nvkm_suspend_state suspend);
+int r535_gsp_gcx_ready(struct nvkm_gsp *gsp);
 
 int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
 		  struct nvkm_gsp **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 94925f1590ea4..09b17b85dc1ac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -30,6 +30,7 @@
 #include <engine/fifo/chan.h>
 #include <engine/sec2.h>
 #include <nvif/log.h>
+#include <nvif/cl0080.h>
 
 #include <nvfw/fw.h>
 
@@ -1721,6 +1722,31 @@ r535_gsp_sr_data_size(struct nvkm_gsp *gsp)
 	return meta->gspFwWprEnd - meta->gspFwWprStart;
 }
 
+int
+r535_gsp_gcx_ready(struct nvkm_gsp *gsp)
+{
+	NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS *ctrl;
+	int ret = 0;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				   NV2080_CTRL_CMD_INTERNAL_GCX_ENTRY_PREREQUISITE,
+				   sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	if (ctrl->bIsGC6Satisfied)
+		ret |= NV_DEVICE_GC6_READY;
+	if (ctrl->bIsGCOFFSatisfied)
+		ret |= NV_DEVICE_GCOFF_READY;
+
+	nvkm_debug(&gsp->subdev,
+		   "GCX ready status: GC6=%s GCOFF=%s\n",
+		   str_yes_no(ctrl->bIsGC6Satisfied), str_yes_no(ctrl->bIsGCOFFSatisfied));
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.client.object, ctrl);
+	return ret;
+}
+
 int
 r535_gsp_fini(struct nvkm_gsp *gsp, enum nvkm_suspend_state suspend)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
index b6683a5bf870c..fd1170037c030 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/gsp.h
@@ -782,6 +782,13 @@ typedef struct NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS {
 
 #define GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE      ((48 << 10) * 2048)   // Support 2048 channels
 
+#define NV2080_CTRL_CMD_INTERNAL_GCX_ENTRY_PREREQUISITE (0x2080a7d7)
+
+typedef struct NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS {
+    NvBool bIsGC6Satisfied;
+    NvBool bIsGCOFFSatisfied;
+} NV2080_CTRL_INTERNAL_GCX_ENTRY_PREREQUISITE_PARAMS;
+
 typedef union rpc_message_rpc_union_field_v03_00
 {
     NvU32      spare;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index e9ac47d86b69a..3de7871e22934 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -174,6 +174,7 @@ int r535_gr_chan_new(struct nvkm_gr *, struct nvkm_chan *, const struct nvkm_ocl
 int r535_gr_promote_ctx(struct r535_gr *, bool golden, struct nvkm_vmm *,
 			struct nvkm_memory **pctxbuf_mem, struct nvkm_vma **pctxbuf_vma,
 			struct nvkm_gsp_object *chan);
+int r535_gsp_gcx_ready(struct nvkm_gsp *gsp);
 extern const struct nvkm_rm_api_engine r535_nvdec;
 extern const struct nvkm_rm_api_engine r535_nvenc;
 extern const struct nvkm_rm_api_engine r535_nvjpg;
-- 
2.55.0

