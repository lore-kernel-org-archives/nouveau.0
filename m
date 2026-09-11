Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16DAC88E53
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 22:25:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0EC110E597;
	Fri, 11 Sep 2026 22:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MRxN+ktc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E1BFE45F72;
	Fri, 11 Sep 2026 22:08:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789164499;
 b=mzvaF7Zu6tdz2paa+thBtJzWRXv/XC+iTSYQ6RRdwomjG+pYzVYZ6kHBXw9cO7sOweJg7
 8HhGjqP4k9WYBtcCdAs1cswMwvAzEadkya/ROeub/g6QP7dY0Gr38rOXYE9BBaCrhWBHgRz
 7vci55yrH177vt6Gg/nIRpVWMMrQIMu7QkBBJT5IbNHY99qpOrjI5ZOts5VDVATJOXyzd9f
 JLePEreEwqxGIrtXQ1P3WnN9b6BNipJPYEHcuN786NT66J4BBgodYSiaZYRc4sk3RZHVnqF
 HIzvxS/o1y4qmK+YcSoAlDjhplly/gat/1JJQSRZD8T47QKtAjdlMseqGhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789164499; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=f3+fc9C5yBhtRiK8DQ9O2dLg3nyT1SI25h/Gj+b5aC4=;
 b=Jg4ysqDK/x1UxVn8hH26rUFLyT1hv+GU/VZGYjfAkZONC1dS1s0lD+t5PBgYb4bDyrQBT
 MhfX4Pq/pjW3NoEJQBW+W6tTLRL4Pr443bZTDBhTlsXsT0PaqWkPkaKwB1GhDpHu4I5unSx
 XhF6X245EoV5W7IgKecMPuxDS8/lElYxPUZpgE8UOowkgCAFsDl68dpaNzmsucmanysTP9r
 xWwUCU/MacodDthlQKeEHn3iTKBVcGXZ1QhJeQl66qxu9K1hTYYwQWhNvJAxVFHNSc3oJS0
 9GsyUa2iwc2yV/dUQ7pmOZmr75F7/DCbR3Orbhqujgt9bDJzuz/DYpe4ytAg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 71FB645E50
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 22:08:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1089310E38F
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 22:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789165541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f3+fc9C5yBhtRiK8DQ9O2dLg3nyT1SI25h/Gj+b5aC4=;
	b=MRxN+ktcZNyqRpjS6N1Iv9+KHs+MCXgqfmFXX2D+hhvjkQxndeMo0LRchfaip0VvE98Xz2
	Ep92WLq5pXKdmULIYaOxUngLNcTZWxmlWpFYfzrgo+mXozaw6X5iAmilyzdvz+LWQAQ4WM
	uCKrZMgPOf+Er+sK40K5SblTSelu8AU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-211-DFtGMgVxOBWlPx4AY2lQWQ-1; Fri,
 11 Sep 2026 18:25:37 -0400
X-MC-Unique: DFtGMgVxOBWlPx4AY2lQWQ-1
X-Mimecast-MFC-AGG-ID: DFtGMgVxOBWlPx4AY2lQWQ_1789165535
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1841F19540E6;
	Fri, 11 Sep 2026 22:25:35 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 988E119560AB;
	Fri, 11 Sep 2026 22:25:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] drm/nouveau/gsp/r570: Start saving comptag backing stores
Date: Fri, 11 Sep 2026 17:49:57 -0400
Message-ID: <20260911222428.752641-5-lyude@redhat.com>
In-Reply-To: <20260911222428.752641-1-lyude@redhat.com>
References: <20260911222428.752641-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: -xVuRiTydqJRXA3qPC-FC0WvvF8C_LSFRtJ6Wlh65s4_1789165535
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: IX3UYAS2DSEM7WSWD3HU7ZWQAKZSRZIN
X-Message-ID-Hash: IX3UYAS2DSEM7WSWD3HU7ZWQAKZSRZIN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IX3UYAS2DSEM7WSWD3HU7ZWQAKZSRZIN/>
Archived-At: 
 <https://lore.freedesktop.org/20260911222428.752641-5-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

One of the portions of OpenRM's fbsr process that we never implemented is
the saving and restoring of comptag backing stores. This isn't strictly
necessary for fbsr to work (as long as we don't specify bEnteringGcOff =
1), but implementing it brings us much closer to matching OpenRM's fbsr
process - which means we can rely on things being well tested on Nvidia's
side.

Now that we have the required driver workarounds in place and fetch the
required information from GSP's memsys on driver load, let's implement
support for this by fetching the required space for the compbit backing
stores and adding it to the amount of memory that we allocate for fbsr.

With this, we should be able to safely enable bEnteringGcOff in fbsr.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 27 ++++++++++++++++++-
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       | 23 ++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index 7f5aae0c055b8..58f426ba81191 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -26,6 +26,24 @@ r570_fbsr_suspend_channels(struct nvkm_gsp *gsp, bool suspend)
 	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 }
 
+static u64
+r570_fb_get_compbit_store_size(struct nvkm_gsp *gsp)
+{
+	NV0080_CTRL_FB_GET_COMPBIT_STORE_INFO_PARAMS *ctrl;
+	u64 size;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.object,
+				   NV0080_CTRL_CMD_FB_GET_COMPBIT_STORE_INFO,
+				   sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	size = ctrl->Size;
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return size;
+}
+
 static int
 r570_memsys_enable_raw_comp_mode(struct nvkm_gsp *gsp, bool enable)
 {
@@ -134,7 +152,7 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 	struct nvkm_device *device = subdev->device;
 	struct nvkm_instmem *imem = device->imem;
 	struct nvkm_instobj *iobj;
-	u64 size;
+	u64 size, cbc_size;
 	int ret;
 
 	/* Stop channel scheduling. */
@@ -151,6 +169,11 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 			return ret;
 	}
 
+	cbc_size = r570_fb_get_compbit_store_size(gsp);
+	if (cbc_size < 0)
+		return cbc_size;
+	nvkm_debug(&gsp->subdev, "fbsr: Compbit backing store size: 0x%llx bytes\n", cbc_size);
+
 	/* Save BAR2 allocations to system memory. */
 	list_for_each_entry(iobj, &imem->list, head) {
 		if (iobj->preserve) {
@@ -173,6 +196,8 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 	size  = gsp->fb.heap.size;
 	size += gsp->fb.rsvd_size;
 	size += gsp->fb.bios.vga_workspace.size;
+	size += cbc_size;
+
 	nvkm_debug(subdev, "fbsr: size: 0x%llx bytes\n", size);
 
 	ret = nvkm_gsp_sg(device, size, &gsp->sr.fbsr);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
index 9050a8274b273..cb3e448415b42 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
@@ -16,6 +16,29 @@ typedef struct NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS {
     NV_DECLARE_ALIGNED(NvU64 sysmemAddrOfSuspendResumeData, 8);
 } NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS;
 
+#define NV0080_CTRL_CMD_FB_GET_COMPBIT_STORE_INFO (0x801306) /* finn: Evaluated from "(FINN_NV01_DEVICE_0_FB_INTERFACE_ID << 8) | NV0080_CTRL_FB_GET_COMPBIT_STORE_INFO_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0080_CTRL_FB_GET_COMPBIT_STORE_INFO_PARAMS {
+    NV_DECLARE_ALIGNED(NvU64 Size, 8);
+    NV_DECLARE_ALIGNED(NvU64 Address, 8);
+    NvU32 AddressSpace;
+    NvU32 MaxCompbitLine;
+    NvU32 comptagsPerCacheLine;
+    NvU32 cacheLineSize;
+    NvU32 cacheLineSizePerSlice;
+    NvU32 cacheLineFetchAlignment;
+    NV_DECLARE_ALIGNED(NvU64 backingStoreBase, 8);
+    NvU32 gobsPerComptagPerSlice;
+    NvU32 backingStoreCbcBase;
+    NvU32 comptaglineAllocationPolicy;
+    NV_DECLARE_ALIGNED(NvU64 privRegionStartOffset, 8);
+    NvU32 cbcCoveragePerSlice;
+} NV0080_CTRL_FB_GET_COMPBIT_STORE_INFO_PARAMS;
+
+#define NV0080_CTRL_CMD_FB_GET_COMPBIT_STORE_INFO_ADDRESS_SPACE_UNKNOWN 0 // ADDR_UNKNOWN
+#define NV0080_CTRL_CMD_FB_GET_COMPBIT_STORE_INFO_ADDRESS_SPACE_SYSMEM  1 // ADDR_SYSMEM
+#define NV0080_CTRL_CMD_FB_GET_COMPBIT_STORE_INFO_ADDRESS_SPACE_FBMEM   2 // ADDR_FBMEM
+
 #define NV2080_CTRL_CMD_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE (0x20800a6f) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_PARAMS_MESSAGE_ID" */
 
 typedef struct NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_PARAMS {
-- 
2.55.0

