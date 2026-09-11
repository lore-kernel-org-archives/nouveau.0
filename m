Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C093C88E50
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 22:25:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 70E9210F706;
	Fri, 11 Sep 2026 22:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Yia22E2D";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 89CF545E65;
	Fri, 11 Sep 2026 22:08:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789164484;
 b=Gf7I3ZgdU/Us39cffyXRttFgcnRydv6e71HaxAf8c2KiUlGn/HcVJ5GcMmM3plloeQpZQ
 /vbVGiV3ny37MJu/ytp/Hd9cT/D0guwHiYVozfT8Q8+ElD5RKhp7Kjvjy7n5JqOko3T9/SL
 ZIOT0LBMnFqKtJmKQZ6rJSo649ryFoxXk46nDw8r5JX1jxleXsqMgwNVsYOSKIvdksigenT
 yvw6QDw8jz78tqzwc0C1YFBpA4wbqtAOoeeNzMYJdiQ0xs5EMBd5ZpGPCQzpYnBn3fDQQEg
 0iUKXt1k2XUl/hvJTFRfekoaTVEqWTVK0A4cp4yj8F/kD53KXUKbaYt7Dm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789164484; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aGzMo8NomGsnKUwcL2kRK8cd3wySjBWhBx42owGJICo=;
 b=H8ypMdtc9b1RKYxTs7gE2VLXo0TqYpwC7D6IGavNTNe20Zb4Apv2tXZVJ2rdxO9eKIgIB
 ZpzKwunvktSAQOi5qCFr3C7ReVSIu0o4Anq2Uc+0Rj2Qnug2qRcNqUEihiOfGDwd1pWuDiz
 hP/QYlX57n+WWUoER9rEPEH+/BxnYpvTP2WerUTW5uwLySC06JD1b5oTdmJtJo7GzxLNx+X
 C9su91BnyllORyiOm87TLY1AxSANA+scyGkW4C+OSO+lJd7j2K2K1WwdOJZe4756QdZd/G8
 e88JQdfJQhPz/CR/Rlp9qCJ33+Ggy6PacAffBjku8BTN92CfVDnC0oviQISQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A3C1745E50
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 22:08:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDC210E520
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 22:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789165525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aGzMo8NomGsnKUwcL2kRK8cd3wySjBWhBx42owGJICo=;
	b=Yia22E2DJO5hY6gJBXB3j4KVFULQzLyKCY/fOKgl8pV4BVtC9y/UB/ihg1y0Bcj5f8fBU2
	8jdi1nMcBjl0dRymhXAnxSyS7WKQpgKxAnz9dfIE+rEH7p0cf2B+NIk7g4cGsgmFu01Npm
	u5Aa3eYpLPJepRpMWJWVy9ALZiYG+J8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-248-MNkwkAdJPpq9HbiE-0xsGg-1; Fri,
 11 Sep 2026 18:25:23 -0400
X-MC-Unique: MNkwkAdJPpq9HbiE-0xsGg-1
X-Mimecast-MFC-AGG-ID: MNkwkAdJPpq9HbiE-0xsGg_1789165521
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 155741954209;
	Fri, 11 Sep 2026 22:25:21 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 93F6019560AB;
	Fri, 11 Sep 2026 22:25:18 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] drm/nouveau/gsp/r570: Add comp mode workaround from issue
 #3172217
Date: Fri, 11 Sep 2026 17:49:56 -0400
Message-ID: <20260911222428.752641-4-lyude@redhat.com>
In-Reply-To: <20260911222428.752641-1-lyude@redhat.com>
References: <20260911222428.752641-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: nKD23EKw-2SE1oSSa9Z8ufC149MMKvgqKUVQeinnx8A_1789165521
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: TKAOAY5W2ZFHAKT7T3PEIM4OZLWSYBIC
X-Message-ID-Hash: TKAOAY5W2ZFHAKT7T3PEIM4OZLWSYBIC
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TKAOAY5W2ZFHAKT7T3PEIM4OZLWSYBIC/>
Archived-At: 
 <https://lore.freedesktop.org/20260911222428.752641-4-lyude@redhat.com/>
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
---
 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 47 +++++++++++++++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       |  6 +++
 2 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index af5aa5065c3dd..7f5aae0c055b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -26,6 +26,34 @@ r570_fbsr_suspend_channels(struct nvkm_gsp *gsp, bool suspend)
 	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 }
 
+static int
+r570_memsys_enable_raw_comp_mode(struct nvkm_gsp *gsp, bool enable)
+{
+	NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_PARAMS *ctrl;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.object,
+				    NV2080_CTRL_CMD_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->bRawMode = enable;
+
+	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
+	if (!ret)
+		nvkm_debug(&gsp->subdev, "Raw compression mode %s\n", str_enabled_disabled(enable));
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
@@ -33,6 +61,7 @@ r570_fbsr_resume(struct nvkm_gsp *gsp)
 	struct nvkm_instmem *imem = device->imem;
 	struct nvkm_instobj *iobj;
 	struct nvkm_vmm *vmm;
+	int ret;
 
 	/* Restore BAR2 page tables via BAR0 window, and re-enable BAR2. */
 	list_for_each_entry(iobj, &imem->boot, head) {
@@ -59,6 +88,13 @@ r570_fbsr_resume(struct nvkm_gsp *gsp)
 
 	/* Finish cleaning up. */
 	r535_fbsr_resume(gsp);
+
+	/* Re-enable raw mode if it was previously disabled */
+	if (r570_need_raw_comp_war(gsp, device)) {
+		ret = r570_memsys_enable_raw_comp_mode(gsp, true);
+		if (ret)
+			nvkm_error(&gsp->subdev, "Failed to re-enable raw comp mode\n");
+	}
 }
 
 static int
@@ -104,6 +140,17 @@ r570_fbsr_suspend(struct nvkm_gsp *gsp)
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

