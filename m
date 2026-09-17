Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB5FC982D2
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 17:01:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4F110F002;
	Thu, 17 Sep 2026 17:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QpZgnXQn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5ACDF481C2;
	Thu, 17 Sep 2026 16:44:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789663461;
 b=RwjyfYoq+UsyAGqY1RvLo1OXbyAu/YAzxZdWgRm+KyHwvvKeYFqi4nWV2FkqzeLKVZR0v
 XCjT5XiSos7OwRLji1MRLHZcXkAhahqsF4004Ub1AL9+oARmmbILszw++eEHcUBDe2X6NSz
 JqwnDI7UGwKHJaq0MvaRSmxaWQUNgWmXUBdqEjLjS4QejUYJ56f3rop9ecLhuOiqna8C8I3
 B2bRQcDsoAa6Gpk79cgchIE6QjZcS90KZZU5JqY85cnL5DA0BfxdfqG5emPePZqkBpaom8j
 XLxC0DLDbhkCbekhxQzDyH3fePLYxRrGyXAir2tC/44YIEKjrJbvJaQFcH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789663461; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RHd/Dk5Z3xxUsB7VKRWoo8mcH7HGTcC9gaNXWpM+1jM=;
 b=038IKk6r6ebUw/rfjmkDBtyyWYlL2NsyK2OCNtPkRcsQNqI2wyciDLlzIyS+xk8FL7h22
 4KV/ZyAcYndE+lt3JkXjzoHEzBEzrrQt4SBqS2w9BbkRb5NnTOa5Nv/kG6fvpVrzGYHOdEE
 gynAv688S2skiebYA6+mbUpO0+zTbdau5adD2+hiYvAvBYibSyKx6ap7aNmqOeaLhJ3NZKn
 nclxChHDrV3hhDg4CMSV8PLey+jH5YX7EhbcBKaeF16BBz5rnVWnknCdivkmZQCeAUwp3JS
 cPyXZREUMTUch+X06EZUjqV2Sx7uIOhgFKudmCCHycQElY5PlYuWlTo4NLkQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3342B481BB
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 16:44:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 991BA10EFB2
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 17:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789664515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RHd/Dk5Z3xxUsB7VKRWoo8mcH7HGTcC9gaNXWpM+1jM=;
	b=QpZgnXQnsea4+qP+usTa1KGEplqQWNnJxQD9NYaK0wJKR/C7n5E8oMvUvAUPnotehUujTY
	cadAMU8oq2ElCxU6GO/4TG7b2EIRRD0UjqvLc/LQR+VIbWqz8xPl6hk/FWffyO7Sctrspq
	s7VysEwN+IjrF2fsAnh3vZ9S0Vzdk+Y=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-410-spvhQ8X2Pxy1dhqTQIRxlQ-1; Thu,
 17 Sep 2026 13:01:49 -0400
X-MC-Unique: spvhQ8X2Pxy1dhqTQIRxlQ-1
X-Mimecast-MFC-AGG-ID: spvhQ8X2Pxy1dhqTQIRxlQ_1789664506
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0FE3C1802147;
	Thu, 17 Sep 2026 17:01:46 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.177])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A0FC430002C7;
	Thu, 17 Sep 2026 17:01:43 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/5] drm/nouveau/gsp/r570: Start saving comptag backing
 stores
Date: Thu, 17 Sep 2026 12:58:35 -0400
Message-ID: <20260917170042.440276-5-lyude@redhat.com>
In-Reply-To: <20260917170042.440276-1-lyude@redhat.com>
References: <20260917170042.440276-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: j_QHlPiRJ0RfIHLwOtK41mDl14mp5jMb0wHmf773RpQ_1789664506
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: ZPPAETS65AY2CQCC62OXDKJVM7ABSUAB
X-Message-ID-Hash: ZPPAETS65AY2CQCC62OXDKJVM7ABSUAB
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZPPAETS65AY2CQCC62OXDKJVM7ABSUAB/>
Archived-At: 
 <https://lore.freedesktop.org/20260917170042.440276-5-lyude@redhat.com/>
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
Reviewed-by: Dave Airlie <airlied@redhat.com>

---
V2:
* Fix object mismatch in r570_fb_get_compbit_store_size() (rm_ctrl_done
  and rm_ctrl_rd() were using different objects by mistake)
* Fix GSP object mismatchs
* Don't return the size of the compbit store directly from
  r570_fb_get_compbit_store_size(), this makes it impossible for us to
  return errors since it's a u64.

 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 27 ++++++++++++++++++-
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       | 23 ++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index f73d9b29e891d..a93a39ef7c690 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -26,6 +26,23 @@ r570_fbsr_suspend_channels(struct nvkm_gsp *gsp, bool suspend)
 	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 }
 
+static int
+r570_fb_get_compbit_store_size(struct nvkm_gsp *gsp, u64 *size)
+{
+	NV0080_CTRL_FB_GET_COMPBIT_STORE_INFO_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.object,
+				   NV0080_CTRL_CMD_FB_GET_COMPBIT_STORE_INFO,
+				   sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	*size = ctrl->Size;
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.object, ctrl);
+	return 0;
+}
+
 static int
 r570_memsys_enable_raw_comp_mode(struct nvkm_gsp *gsp, bool enable)
 {
@@ -135,7 +152,7 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 	struct nvkm_device *device = subdev->device;
 	struct nvkm_instmem *imem = device->imem;
 	struct nvkm_instobj *iobj;
-	u64 size;
+	u64 size, compbit_store_size;
 	int ret;
 
 	/* Stop channel scheduling. */
@@ -152,6 +169,12 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 			return ret;
 	}
 
+	ret = r570_fb_get_compbit_store_size(gsp, &compbit_store_size);
+	if (ret < 0)
+		return ret;
+	nvkm_debug(&gsp->subdev, "fbsr: Compbit backing store size: 0x%llx bytes\n",
+		   compbit_store_size);
+
 	/* Save BAR2 allocations to system memory. */
 	list_for_each_entry(iobj, &imem->list, head) {
 		if (iobj->preserve) {
@@ -174,6 +197,8 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 	size  = gsp->fb.heap.size;
 	size += gsp->fb.rsvd_size;
 	size += gsp->fb.bios.vga_workspace.size;
+	size += compbit_store_size;
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

