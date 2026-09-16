Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D0FC982C1
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 22:35:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E70B710E417;
	Wed, 16 Sep 2026 22:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Pw826OEk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E6DAA48155;
	Wed, 16 Sep 2026 22:18:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789597098;
 b=G2Xxyxgh2+hrSaEqXVFX/8tfuGmT6mVnr3SbJqaJd04vEK9LTiwE6DJfol12duYYK3405
 k1U0tOdrAvlSvrb81rtFgVzlleqNQEsgVyxy5gjFzBiY83xGCpB9xHwyqjy0Uy5otzo5Cet
 yRIaakLOcFxJRcpkJo9xFuWqVmcCEu4RqBirOWCcv9VJKyraoEwwmTfvHV5V8Q25O7lp0iM
 ao7NLEFhLDYUSlU8xicb8m3obWjl0sVPKzDqdiVNtzB+aAfPxC0S2uyAnF6tbgsItPa//Dm
 iEI0+YQmAozIXwyppuFSj1KNQzNWb06JmPv8Uin+cZiw/RJrWrPB/6n8cNJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789597098; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0O0ldd1Us+19/r2rRjhTUavxxLCXkOyGxU3ENiH5tws=;
 b=tPyltXC3kVMzdxeD2Op1zsn4XW5eCtv/7io/bQ1TjtyGbejZBtWy9JXnf2KGui3XP2vuD
 7OXG1VmpSi98AxVDs3ImYZ65DDf+CTegWmAVs7tzpVaXbu1Xt/cepLEAyv/nTd/qE5TDArb
 z2JVMY54APk3mNfHoHHnr8nJMrUADpu2cQ+bLCnSk3GY7QcqsD8Ws1kwIl1bWhNLYXq1YUR
 roYOBGyH8P2zxj/WNnPy8etnu99xm3cg88qQc/VdPTrOqbC3yXQlmqKZ0E7GOYhmccT0JWM
 EbLDPGhv//Rrl+Jmk33YWIrDo/CVDX0qZxcrjA2A3RF3NbRbP0wndFm32knw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4233D480F6
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 22:18:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66B5C10E0A0
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 22:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789598150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0O0ldd1Us+19/r2rRjhTUavxxLCXkOyGxU3ENiH5tws=;
	b=Pw826OEkHqXpav1o6c6ghrXolIHc+eraLUJu36qkE13oTKgQcNhCVwHwIy+vdH5qKoFiuu
	GpbGLu9+YuTJUHK/Khmx3YgoArA0ccJ7/wzLwHScTe/XWn+HspEO4k9AulcRczIbe3qvkB
	hR7NYnOG13yQS5tD/qjCh16a6OIT+iI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-91-R0I4f_zvMmO4nCwbW5c0MA-1; Wed,
 16 Sep 2026 18:35:44 -0400
X-MC-Unique: R0I4f_zvMmO4nCwbW5c0MA-1
X-Mimecast-MFC-AGG-ID: R0I4f_zvMmO4nCwbW5c0MA_1789598136
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 412BA18007EA;
	Wed, 16 Sep 2026 22:35:35 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.52])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 91B2A180036E;
	Wed, 16 Sep 2026 22:35:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] drm/nouveau/gsp/r570: Add comp mode workaround from
 issue #3172217
Date: Wed, 16 Sep 2026 18:25:07 -0400
Message-ID: <20260916223358.507351-4-lyude@redhat.com>
In-Reply-To: <20260916223358.507351-1-lyude@redhat.com>
References: <20260916223358.507351-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: o4uanSMPQTm-cqCBR7D4tpHOtuLreC8Sn8g0E_MjXKY_1789598136
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: XGZQ42OQGDLRCOGTA5V5NOT4A5ALXXHP
X-Message-ID-Hash: XGZQ42OQGDLRCOGTA5V5NOT4A5ALXXHP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XGZQ42OQGDLRCOGTA5V5NOT4A5ALXXHP/>
Archived-At: 
 <https://lore.freedesktop.org/20260916223358.507351-4-lyude@redhat.com/>
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
V2:
* Fix gsp object mismatch in r570_memsys_enable_raw_comp_mode()
* Clarify debug message a bit in r570_memsys_enable_raw_comp_mode()
V3:
* Enable raw mode before rescheduling FIFO channels

 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 48 +++++++++++++++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       |  6 +++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
index af5aa5065c3dd..fe618a94461dc 100644
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
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.object,
+				    NV2080_CTRL_CMD_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->bRawMode = enable;
+
+	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.object, ctrl);
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

