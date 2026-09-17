Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB789C982D6
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 17:01:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACB4010EFF6;
	Thu, 17 Sep 2026 17:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HIjaUqWw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0661A481BE;
	Thu, 17 Sep 2026 16:44:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789663443;
 b=zY4KV6MbxMo0kG2Hjw/Bo3tWX/nMwmk2CmRJpHatmQse77W96yOJ7Rs9eHi171cSHvMJP
 uUO1GOWtNlGANKtNzNbmY6EBlBYo7h1tzb57Z0cTygDNhCIHqX1ElRIAQRPrao4db9TXBRo
 DpAuP4ik/268LROpGrcTSM8MkgeDP0wKK8lIG6gkCJhdfVMQY8g3Jy5FtazDO4pWvD0ANEe
 MDy6q8bRQn5lS9/darnUAc78v18BJ6cGEjh44QcjSLm4xWdcrj/NUcaf7gFKZsx4x47Gufb
 kh+sPMiICL8pa9GwXV1AVpTN6IsBk4al2DbSrs+th8TSjMMbRgwioaHjslag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789663443; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VRIqDmgykK4M700vzuRX8fM0npjQeUSDWwklvXV0FfY=;
 b=I8lnprOo5x38jVPsDqmaAmPIrom+45OhnPcEGEWdQZyAknma2HsxKpyQKH8NPJKrirX8a
 zpzbrUsqEbsFYZbwGxshruIBB0KLy8t3L95yf6cXqrgEnLtpfcAyu61E6gra8dJvFcWVzmk
 GuMfEnLNFBnCO1AEW+dBt4IBDIbiRe8Hvk2DgRg9Ak2qzoic2XPKPFRBygQvvQW2vcaX1iy
 I5tbvyJwmVFE17iPXzaoVlBQAMCxGefkPLoJ3FLN2m1r4UM6Usn4a92EsO4HU72MXxMFaW0
 j8y2mTkZhnOLfMbqRe4PbYIXgR1QN6vrygYbg2qtbwVTkTLREmoV9JxHWlRA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6D44E480F6
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 16:44:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D0B6310EFCF
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 17:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789664498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VRIqDmgykK4M700vzuRX8fM0npjQeUSDWwklvXV0FfY=;
	b=HIjaUqWwIZG2oAT33tUe/BRhYO+ky4P6JbtAxF/l2K3kS/tc2A+PNa309cNNfOBFEMkFuc
	sOMVyjvi6seaoAJHxUeZeUG6f7t32h36LZADS30reEW9VFnFkznHIvXJhCRUPBfR3bBhVT
	RMEMnZNteyEUB1pLTMzuOgkbjvYFHCQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-9Qi6WqmENgeFUwvPezr_vw-1; Thu,
 17 Sep 2026 13:01:34 -0400
X-MC-Unique: 9Qi6WqmENgeFUwvPezr_vw-1
X-Mimecast-MFC-AGG-ID: 9Qi6WqmENgeFUwvPezr_vw_1789664492
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E5B8A1954186;
	Thu, 17 Sep 2026 17:01:31 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.177])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B0F2230002C2;
	Thu, 17 Sep 2026 17:01:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] drm/nouveau/gsp/r570: Add comp mode workaround from
 issue #3172217
Date: Thu, 17 Sep 2026 12:58:34 -0400
Message-ID: <20260917170042.440276-4-lyude@redhat.com>
In-Reply-To: <20260917170042.440276-1-lyude@redhat.com>
References: <20260917170042.440276-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: OHVk89Lu37LBu1zCfSLdRncbS25PsOPHkb-dhQEcYcY_1789664492
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 5OBHNU4KO3HA4NN4HUASWMPV2AC2YWUZ
X-Message-ID-Hash: 5OBHNU4KO3HA4NN4HUASWMPV2AC2YWUZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5OBHNU4KO3HA4NN4HUASWMPV2AC2YWUZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260917170042.440276-4-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

One of the things that OpenRM does right before initiating fbsr is apply a
special workaround (nvidia issue #3172217) which temporarily disables raw
compression mode on the GPU. It is later re-enabled after resuming with
fbsr completes.

Since we don't currently save the compbit backing with fbsr, this shouldn't
currently make any functional difference in the suspend/resume process. But
it will be required for implementing support for saving and restoring
compbit backings from the GPU.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>

---
V2:
* Fix gsp object mismatch in r570_memsys_enable_raw_comp_mode()
* Clarify debug message a bit in r570_memsys_enable_raw_comp_mode()
V3:
* Enable raw mode before rescheduling FIFO channels
V5:
* Send NV2080_CTRL_CMD_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE using
  gsp->internal.device.subdevice, not gsp->internal.device.object.

 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 48 +++++++++++++++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       |  6 +++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index af5aa5065c3dd..f73d9b29e891d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -26,6 +26,35 @@ r570_fbsr_suspend_channels(struct nvkm_gsp *gsp, bool suspend)
 	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 }
 
+static int
+r570_memsys_enable_raw_comp_mode(struct nvkm_gsp *gsp, bool enable)
+{
+	NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_PARAMS *ctrl;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->bRawMode = enable;
+
+	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
+	if (!ret)
+		nvkm_debug(&gsp->subdev, "memsys: Raw compression mode %s\n",
+			   str_enabled_disabled(enable));
+
+	return ret;
+}
+
+static bool
+r570_need_raw_comp_war(struct nvkm_gsp *gsp, struct nvkm_device *device)
+{
+	return (device->card_type == GA100 || device->card_type == AD100) &&
+	    gsp->memsys.use_raw_mode_comptagline_alloc;
+}
+
 static void
 r570_fbsr_resume(struct nvkm_gsp *gsp)
 {
@@ -33,6 +62,7 @@ r570_fbsr_resume(struct nvkm_gsp *gsp)
 	struct nvkm_instmem *imem = device->imem;
 	struct nvkm_instobj *iobj;
 	struct nvkm_vmm *vmm;
+	int ret;
 
 	/* Restore BAR2 page tables via BAR0 window, and re-enable BAR2. */
 	list_for_each_entry(iobj, &imem->boot, head) {
@@ -54,6 +84,13 @@ r570_fbsr_resume(struct nvkm_gsp *gsp)
 	vmm = nvkm_bar_bar1_vmm(device);
 	vmm->func->flush(vmm, 0);
 
+	/* Re-enable raw mode if it was previously disabled */
+	if (r570_need_raw_comp_war(gsp, device)) {
+		ret = r570_memsys_enable_raw_comp_mode(gsp, true);
+		if (ret)
+			nvkm_error(&gsp->subdev, "Failed to re-enable raw comp mode\n");
+	}
+
 	/* Resume channel scheduling. */
 	r570_fbsr_suspend_channels(device->gsp, false);
 
@@ -104,6 +141,17 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
 	/* Stop channel scheduling. */
 	r570_fbsr_suspend_channels(gsp, true);
 
+	/* Temporarily disable raw mode to prevent FBSR restore operations from corrupting
+	 * compressed surfaces. Required for ampere and ada.
+	 *
+	 * Nvidia bug #3172217
+	 */
+	if (r570_need_raw_comp_war(gsp, device)) {
+		ret = r570_memsys_enable_raw_comp_mode(gsp, false);
+		if (ret)
+			return ret;
+	}
+
 	/* Save BAR2 allocations to system memory. */
 	list_for_each_entry(iobj, &imem->list, head) {
 		if (iobj->preserve) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
index 8af432375f7a2..9050a8274b273 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
@@ -16,4 +16,10 @@ typedef struct NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS {
     NV_DECLARE_ALIGNED(NvU64 sysmemAddrOfSuspendResumeData, 8);
 } NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS;
 
+#define NV2080_CTRL_CMD_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE (0x20800a6f) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_PARAMS_MESSAGE_ID" */
+
+typedef struct NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_PARAMS {
+    NvBool bRawMode;
+} NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_PARAMS;
+
 #endif
-- 
2.55.0

