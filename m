Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09367C5DF86
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 16:50:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D422410F10B;
	Thu, 20 Aug 2026 16:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JU5S7prK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 632B1479D8;
	Thu, 20 Aug 2026 16:33:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787243634;
 b=hs1Q/wxAigTeJIF9L8KskxCi2hki+Q+pBP/3MNayjoaXpBORFSYxHL10TDqkEAVtaZ149
 g1YRgwucjR+4smS2IgDfWjyWdPKcs/3enq3rrEUK0vrMerpLqkvgIPuMj0gqOhHa8vn3CFP
 GoXqiSgTQIFHnCz+TqhKkRgq52k/zu4YGm54fGO8O9OFLryF3A9XYCoL41C+5UXHw+aiMzX
 xxTWNxur1VXdbnDdRGj/ByPfOT5njA6ojG3HOriGwH9xxXxTUiOAT/zYx2BtitxeZLOyV7s
 nQXnS4PhcLIPi4xdA6e9YZyDjATOiKUrhqAmJGLsh5MfLbQ4YgYJtTRM9gXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787243634; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uA+ttixfTL8eQL/cabSDvzDeSAF53vHarfWSrokRJJI=;
 b=J2LxuHtUmqUD/kcXR4BHqyIj+wPDIv65POuqWd561W3lv2koUnx/k//NBTK5nE1iUp1lc
 YHf03TgHdf5fHXVJfX4Pb0jkQHzbIZcIAAouhjNlJAiP15kG+3FOMiNtxYMy4LC56DKsOMr
 ufQQrQIqfDyKxAzat5FNXwRnY+G0+mhHEYXr3SrZ0fdUzDhg2IAauIAFeNhR+t/JTdjFfv7
 367OgwpJor/WW3DtInc3O0/FNomsElVRERxZEZ/wvZ5XbMY9rZJ0+hx2WNUt/hDecsDlogQ
 9usMWRdc1YC0v5pausnmhVJWQpajB/gU0Ua5F2pulTI2o89wEU4i4XfgxsNw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id F23C647960
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:33:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 49D6C10F100
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:50:27 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so296795e9.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 09:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787244626; x=1787849426;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uA+ttixfTL8eQL/cabSDvzDeSAF53vHarfWSrokRJJI=;
        b=JU5S7prKelmGhhv6sXtKEncmaP9Wn133oHFXt9H1RnuxSiqNZ+J3gPfSPAmpUeaKGS
         HCciOnA+1fs1fqHAiTxBoem9PaCyz+SYfWzX2kY6+UZLlaC3aQbBGggfHzO8ennQDypd
         Yt6EBNn7IO5BQhjPGlOv8WYnFAcQ+YntUWv9i2UXsKGW0/qILtnREf9qrrKXbXshK48j
         nbCcYYQJ0yu8I2pzGDcrgJNAMUEzbqsV4WJgCpOAS9uk5eyZyd10WGEai8lL7OC/tnLv
         5l93nY/V+uXfz0Cj3OZjbYcL4n+0avf2gONcnmASjNHV1Bqnwrf5h3scU7adxvEuqyd3
         zTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787244626; x=1787849426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uA+ttixfTL8eQL/cabSDvzDeSAF53vHarfWSrokRJJI=;
        b=N13Mi6tKv/c8kFqAqdkQabUmmcW3TlvedpAzgvxwbPFSr9rwnY2De6yZPpOR6L4suE
         a8CUDTjWVHt7xnJoe5Cj7moA8KizO0bhIsheTFcbOaFIjoN8rTldPtV/qd6nl0EpT/LG
         3EQUSEXS8wMEbdDozxGYJXz42YzQNaaOcsgiR4QHmPh5TsyeddzUHOQicpAUXTX16SWl
         T/92Qd5eJODyuB64CsreGxvHHpREIZQX2FqjGL+klVNUxx5uO1myssP+rd48H3aKCYQE
         mKpab1UEN2v+qVxvbvB3BRJvQDOyx0jvO5SR9b8+Kp4F0kIqCVsmpmYZuBE5sTsz4EZa
         OnzQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rql8nGn2bANkKRMkP19yCa+9fPypwsJMvSTtLhiiEoTiJb6KF+vvCDbmb2pd6R/c/p3R6Vd08Qh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGNM7sL+n7skgBq1lX3zKYkJ8CUkSOsFtTGA3sJdWIydAxmnKL
	LdiihTScsAtKIJAKMfK8Q/wIlQ2Qfzr5xww9hrvOVPbLJOLfe3iqYf9P
X-Gm-Gg: AR+sD10hK4Y85pSyT7YBSAQLHwAMioQmJQEnUIDUDt8o7E5ELXwIH5bqbXbeQQr6cSM
	8n7hdiL0fnA2q/jaIz7adc6erxzEFXFEcfRO55B8smDTREn9rJyNW15grASRlWhsNJrCHcDI6aB
	e8CTxQmiQS6Y57h/grcmnxx1/cvPUfrDkoc+pubmUS+B762G2HhbI8dyYNQb2WuThfvog1serzs
	mKaRjbV3SpVQABaz08yB8TurEi6fECSQcDY2espRlQb4NLMQVydvWleYZfgr5KBJ3ut9YhO0Dny
	6mA/lB8cQTY1+U6o/12N0uE1a59MYVH6VQ/HlSjd6lJqSqmbbb48XpU7tybAA6EQlOy4UiX6BvR
	3y6MvSvLVr7kYodrAOrPBgUzPJzBRsGB3xzaVPh5yhzMhVtZzKejTJ/dKHVtH75bbgkIy3/eikE
	R4DSGNCl4r6pD8SkU0jdXRMIqps49vkhI7apfxIsiKlDS7sHiBGVOlDWvsGGb3lpzQ/CE=
X-Received: by 2002:a05:600c:4e91:b0:499:7a15:fcec with SMTP id
 5b1f17b1804b1-499b83547e9mr2734665e9.13.1787244625397;
        Thu, 20 Aug 2026 09:50:25 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa1111b2sm205307545e9.5.2026.08.20.09.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:50:23 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/10] drm/nouveau/disp: route GSP-RM display MMIO through
 nvkm_disp_func hooks
Date: Thu, 20 Aug 2026 20:49:22 +0400
Message-ID: <20260820164929.17117-4-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6UYFCR54JAVUUGACMTY2B4BRL5PMKH5I
X-Message-ID-Hash: 6UYFCR54JAVUUGACMTY2B4BRL5PMKH5I
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6UYFCR54JAVUUGACMTY2B4BRL5PMKH5I/>
Archived-At: 
 <https://lore.freedesktop.org/20260820164929.17117-4-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The GSP-RM display code in rm/r535/disp.c borrows a few
register-programming routines from engine/disp (the head-timing
interrupt handler, vblank enables, armed head state and scanout position
readback, the AVI/VSI infoframe writers and the GCP AVMute write) and so
far picked them by name, which means it has to know which chip it runs
on the moment a generation changes any of them.

Give nvkm_disp_func a .gsp table that each chip fills with exactly those
hooks, add tu102_gsp_disp (TU1xx) and ga102_gsp_disp (GA10x onwards)
carrying the current functions, hand them to r535_disp_new() instead of
the full hardware tables, and make rm/r535/disp.c call through the
hooks. r535_head becomes four forwarders, r535_sor_hdmi gets infoframe
forwarders, r535_sor_hdmi_audio() calls the GCP hook, and the interrupt
handler and its vector come from the table (intr_low_latency selects the
second DISP interrupt instance for chips that raise head timing on a
separate vector). The tables are per chip even though the two currently
coincide, so a generation that changes a hook only touches its own file.
rm/r535/disp.c no longer contains chip-specific register code, and a new
display generation only has to provide its own table. No functional
change.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  | 16 ++++-
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   | 19 ++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  | 16 ++++-
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 60 ++++++++++++++++---
 4 files changed, 100 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
index ab0a85c92430..b48ed7146396 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
@@ -144,12 +144,26 @@ ga102_disp = {
 	},
 };
 
+static const struct nvkm_disp_func
+ga102_gsp_disp = {
+	.uevent = &gv100_disp_chan_uevent,
+	.ramht_size = 0x2000,
+	.gsp.intr = tu102_disp_intr,
+	.gsp.head_state = gv100_head_state,
+	.gsp.head_rgpos = gv100_head_rgpos,
+	.gsp.vblank_get = tu102_head_vblank_get,
+	.gsp.vblank_put = tu102_head_vblank_put,
+	.gsp.hdmi_gcp = tu102_sor_hdmi_gcp,
+	.gsp.hdmi_infoframe_avi = gv100_sor_hdmi_infoframe_avi,
+	.gsp.hdmi_infoframe_vsi = gv100_sor_hdmi_infoframe_vsi,
+};
+
 int
 ga102_disp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_disp **pdisp)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return r535_disp_new(&ga102_disp, device, type, inst, pdisp);
+		return r535_disp_new(&ga102_gsp_disp, device, type, inst, pdisp);
 
 	return nvkm_disp_new_(&ga102_disp, device, type, inst, pdisp);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
index 722ec340e12a..3cb903741fb8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
@@ -5,6 +5,8 @@
 #include <engine/disp.h>
 #include <core/enum.h>
 struct nvkm_head;
+struct nvkm_head_state;
+struct nvkm_ior;
 struct nvkm_outp;
 struct dcb_output;
 
@@ -34,6 +36,23 @@ struct nvkm_disp_func {
 		int (*new)(struct nvkm_disp *, int id);
 	} wndw, head, dac, sor, pior;
 
+	/* Register programming that the GSP-RM display path (rm/r535) needs from
+	 * the chip, everything else on that path goes through RM. Every hook
+	 * is called unconditionally.
+	 */
+	struct {
+		irqreturn_t (*intr)(struct nvkm_inth *);
+		/* Head-timing interrupts arrive on a second DISP vector. */
+		bool intr_low_latency;
+		void (*head_state)(struct nvkm_head *, struct nvkm_head_state *);
+		void (*head_rgpos)(struct nvkm_head *, u16 *hline, u16 *vline);
+		void (*vblank_get)(struct nvkm_head *);
+		void (*vblank_put)(struct nvkm_head *);
+		void (*hdmi_gcp)(struct nvkm_ior *, int head, bool enable);
+		void (*hdmi_infoframe_avi)(struct nvkm_ior *, int head, void *data, u32 size);
+		void (*hdmi_infoframe_vsi)(struct nvkm_ior *, int head, void *data, u32 size);
+	} gsp;
+
 	u16 ramht_size;
 
 	struct nvkm_sclass root;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
index 6cfd52c9056f..9db3cac487e3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
@@ -295,12 +295,26 @@ tu102_disp = {
 	},
 };
 
+static const struct nvkm_disp_func
+tu102_gsp_disp = {
+	.uevent = &gv100_disp_chan_uevent,
+	.ramht_size = 0x2000,
+	.gsp.intr = tu102_disp_intr,
+	.gsp.head_state = gv100_head_state,
+	.gsp.head_rgpos = gv100_head_rgpos,
+	.gsp.vblank_get = tu102_head_vblank_get,
+	.gsp.vblank_put = tu102_head_vblank_put,
+	.gsp.hdmi_gcp = tu102_sor_hdmi_gcp,
+	.gsp.hdmi_infoframe_avi = gv100_sor_hdmi_infoframe_avi,
+	.gsp.hdmi_infoframe_vsi = gv100_sor_hdmi_infoframe_vsi,
+};
+
 int
 tu102_disp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_disp **pdisp)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return r535_disp_new(&tu102_disp, device, type, inst, pdisp);
+		return r535_disp_new(&tu102_gsp_disp, device, type, inst, pdisp);
 
 	return nvkm_disp_new_(&tu102_disp, device, type, inst, pdisp);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index cd4451e62512..f3e55253bcbc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -547,7 +547,19 @@ r535_sor_hdmi_audio(struct nvkm_ior *sor, int head, bool enable)
 {
 	r535_sor_hdmi_ctrl_audio(sor->asy.outp, enable);
 	r535_sor_hdmi_ctrl_audio_mute(sor->asy.outp, !enable);
-	tu102_sor_hdmi_gcp(sor, head, enable);
+	sor->disp->func->gsp.hdmi_gcp(sor, head, enable);
+}
+
+static void
+r535_sor_hdmi_infoframe_avi(struct nvkm_ior *sor, int head, void *data, u32 size)
+{
+	sor->disp->func->gsp.hdmi_infoframe_avi(sor, head, data, size);
+}
+
+static void
+r535_sor_hdmi_infoframe_vsi(struct nvkm_ior *sor, int head, void *data, u32 size)
+{
+	sor->disp->func->gsp.hdmi_infoframe_vsi(sor, head, data, size);
 }
 
 static void
@@ -575,8 +587,8 @@ r535_sor_hdmi = {
 	.ctrl = r535_sor_hdmi_ctrl,
 	.scdc = r535_sor_hdmi_scdc,
 	/*TODO: SF_USER -> KMS. */
-	.infoframe_avi = gv100_sor_hdmi_infoframe_avi,
-	.infoframe_vsi = gv100_sor_hdmi_infoframe_vsi,
+	.infoframe_avi = r535_sor_hdmi_infoframe_avi,
+	.infoframe_vsi = r535_sor_hdmi_infoframe_vsi,
 	.audio = r535_sor_hdmi_audio,
 };
 
@@ -601,12 +613,36 @@ r535_sor_cnt(struct nvkm_disp *disp, unsigned long *pmask)
 	return 4;
 }
 
+static void
+r535_head_state(struct nvkm_head *head, struct nvkm_head_state *state)
+{
+	head->disp->func->gsp.head_state(head, state);
+}
+
+static void
+r535_head_rgpos(struct nvkm_head *head, u16 *hline, u16 *vline)
+{
+	head->disp->func->gsp.head_rgpos(head, hline, vline);
+}
+
+static void
+r535_head_vblank_get(struct nvkm_head *head)
+{
+	head->disp->func->gsp.vblank_get(head);
+}
+
+static void
+r535_head_vblank_put(struct nvkm_head *head)
+{
+	head->disp->func->gsp.vblank_put(head);
+}
+
 static const struct nvkm_head_func
 r535_head = {
-	.state = gv100_head_state,
-	.rgpos = gv100_head_rgpos,
-	.vblank_get = tu102_head_vblank_get,
-	.vblank_put = tu102_head_vblank_put,
+	.state = r535_head_state,
+	.rgpos = r535_head_rgpos,
+	.vblank_get = r535_head_vblank_get,
+	.vblank_put = r535_head_vblank_put,
 };
 
 static struct nvkm_conn *
@@ -1650,12 +1686,17 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	if (ret)
 		return ret;
 
-	ret = nvkm_gsp_intr_stall(gsp, disp->engine.subdev.type, disp->engine.subdev.inst);
+	/* Chips that raise head-timing interrupts on a separate low-latency
+	 * vector report it as a second DISP interrupt table entry, exposed
+	 * as instance 1 by the RM engine-index translation.
+	 */
+	ret = nvkm_gsp_intr_stall(gsp, disp->engine.subdev.type,
+				  disp->func->gsp.intr_low_latency ? 1 : disp->engine.subdev.inst);
 	if (ret < 0)
 		return ret;
 
 	ret = nvkm_inth_add(&device->vfn->intr, ret, NVKM_INTR_PRIO_NORMAL, &disp->engine.subdev,
-			    tu102_disp_intr, &disp->engine.subdev.inth);
+			    disp->func->gsp.intr, &disp->engine.subdev.inth);
 	if (ret)
 		return ret;
 
@@ -1688,6 +1729,7 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 	rm->uevent = hw->uevent;
 	rm->sor.cnt = r535_sor_cnt;
 	rm->sor.new = r535_sor_new;
+	rm->gsp = hw->gsp;
 	rm->ramht_size = hw->ramht_size;
 
 	rm->root.oclass = gpu->disp.class.root;
-- 
2.55.0

