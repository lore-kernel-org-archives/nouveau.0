Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259B8C5B572
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 23:58:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 35F9610F776;
	Fri, 14 Aug 2026 23:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nu7ziVIl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6139C47809;
	Fri, 14 Aug 2026 23:42:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786750936;
 b=BTnvXgdeKcLUOuX9Y+iPyI30ti/5rT32S6puzULjlQmhTNy4i/4r6MScJDh7UuwwljEeQ
 SNKWqaT72bfPfzeg5L/EgwS8/ZP1ZBJy453sdMO9aqYI85TkCTy1UKCeYFY9cuibW+COO/K
 grIy3Bu1v0vf/Wo9/LZRV9zgZ38Yoa2ZX6wYcsw8i/xHIxOJQwLiJf8KeEdXtCq6u+4fEsT
 IkeTvO5+6oSbE0+NObHu/bJbSyLeHvmwSN8qxQtIp9HQrGDac5300N1NDfal0NhqQg/PHkU
 l+A+HppPHp7IIOcNr1jVm9JKtF8zEl0U0yymxoyvHZmSWqhr4nqvvmvH1oOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786750936; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IciWU/aDLaHcZt/8OhEMPCWAuQRlBMduwtoNidgedNY=;
 b=b4ii57PwBllJ74+CILMEaNKek/bHzZbzytHGQHBRp8wLi7pxNR8vsBj8uGFGhA/k0Rkap
 i2KcGES4nEQ23LRousYu2RUYVnXHUgMG8v3XhnWiRM22hwbhnt0PDewqV3MLdw5cGg9sLMN
 K00eNAxyjTUBGN/Vb0Pdzfs0EEcW0XzbWAZVMaK7wv1WafJAIXWv/M/TGg5GTRENNl0umZt
 ja7Gy9JrHlzZkySzdCsPfCnGo+imHJL1raVxDnoqMH8A+6GMtzmuiAzK77tP+l03KZVurW3
 jv3Yn+I9PxAw9w4oUAMl4DPpNRqeyhlw7Whj9gbFzJlVdF5TKrUvQZKickMg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CFF4D4779C
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:42:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 86EB910F6BA
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:58:36 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so7275585e9.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 14 Aug 2026 16:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786751915; x=1787356715;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IciWU/aDLaHcZt/8OhEMPCWAuQRlBMduwtoNidgedNY=;
        b=Nu7ziVIlVlN/zzUuTI36dU1iMBmIt062JDlY0KUupQC4+pIn6GUzsnHrurGCxi0O0+
         FvR8PSXChFGFCm9zzmn0PGWP8xciK4+znBcEVYRLAVybEFXCKIjZWaVLjlm6/sJTps9h
         bpnnTcGqCcM/W8B49H7JIR2UhcbGHIrMSyTQDpJw/NOOuJ0uQ8IFofJyPHpx2WCVnkdg
         14Pqx15bl17S0jWalese0KuSoCubDrxGavLzmXvqDMT6+csg8nIgGWbNDp4yM2VnSZuw
         vZOvjIK4a16vFnhVYj2ZmORkmP1L8I4PqCChZt2C/bB1385ye/ozJqfX7JVzXZhBBCbp
         m9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786751915; x=1787356715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IciWU/aDLaHcZt/8OhEMPCWAuQRlBMduwtoNidgedNY=;
        b=pjeAe78XmBPHcEuEoaNk9JO9+HvlpwaJ2QB8CMY2Nn3gFDJnLnuLng7w68wRnmfv9N
         61zhvf8EvBGBeA7OJFh1pvTmIERbXNyobviaJV2TpTvhSjgrXdBvUrsLyG8SruMNfWLq
         NBoKVExQWFEuf3h0P3DZoGZQK5jJi78nkK61rF2ZFr65c+x3w+Tqu/tcpRq6aH/BUXXK
         re1YksByfsJzKuNaSEQsTryMLo1LfpHGGl3oRohmJp7UM0zVSdcuM3RrX/BtPFDhjGLN
         PjMgi29SfhxrnJ0sqqbt4AIyXSrdvMt0ju8fOm3wus+T0W21jGevlOw8Sl+6c9mjGwEi
         SF3g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoXUOkoDWdGzH1ElyRaJaNbm0Su7vYlP0seSk+mgRZVSgVNL6xJiEeGbTl8ajjYT2yJ4ON2Fw9E@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlG4RlPYwdnXawXTfATluyRq9W9kWVq0gLZLnX6CEogfISz0hM
	+UHKQVMmgDexIKfMeKNHUfaQl1lgtVR8577OGVFLLQNxtyLl9MbcgZmP
X-Gm-Gg: AR+sD12lyvjPEk8PsK13DLBHOP9vpbKpO3ejcvnUZF0T7ZAJLPH0fePZX9RjBgruJHq
	QuOrSEOHeH50D9+T4TccdEm9Uwb52kdELmQomUAmg7OfRbqGIgit0geg36Gtth3y5GWe9FlJUno
	t/HemIqEmd9nI8HgC/PjSMXgy9iVwvt4+q8ofeGRGcX+33uw0hkmMsTpse3zOWMZsYo4iO9vKkG
	UL1t1Mf2E/Id2IQ1KcJczY1AMPJXQAufLZ8jN9cA3HJAfnp05MLO0op9IYy9KK0hQeQ4uIvdjsa
	6By+Ewh4wi86LQvWiP5HzHwl/ifS7GtFAL60XFFim8USqM9I2EtlRpcuhCD4Q6Diu67VqGJor+3
	dzwNqs3rUV1s47L8t7BHytLWoroRqf1r2RtL+PC4dgNMNAe3R86vZf9F6bWEFGEEuLpIkuAnshy
	8s+EkM+IQkneFu5Qe19qY8bo0qZOk3oCBHFro1B3zUHDeRMkl5pVF4BvBbZnVPcgD59xVb
X-Received: by 2002:a05:600c:3b23:b0:499:8ae1:b900 with SMTP id
 5b1f17b1804b1-4998ae1bb69mr69497395e9.12.1786751914839;
        Fri, 14 Aug 2026 16:58:34 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899753ccsm77751245e9.0.2026.08.14.16.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 16:58:34 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] nouveau/disp: add GB20x HDMI vendor infoframe writer
Date: Sat, 15 Aug 2026 03:56:59 +0400
Message-ID: <20260814235705.59132-2-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
References: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GWNG4ROXNIJYSBTXAE7FMFGLCDY27F3B
X-Message-ID-Hash: GWNG4ROXNIJYSBTXAE7FMFGLCDY27F3B
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GWNG4ROXNIJYSBTXAE7FMFGLCDY27F3B/>
Archived-At: 
 <https://lore.freedesktop.org/20260814235705.59132-2-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

GB20x (NVDisplay 5.0) reorganised the SF HDMI packet units and the
legacy VSI unit at 0x6f0100 no longer exists. Per NVIDIA's published
CA71 DISP_SF_USER class header, only three legacy units remain (AVI
at +0x000, GCP at +0x040, ACR at +0x080), and vendor infoframes must
instead be sent through the shared generic infoframe units at
+0x130, which feed a 9-dword data FIFO at +0x3f0/+0x3f4.

Add a VSI writer using the same programming sequence OpenRM uses on
these chips (nvhdmipkt_C971.c, programAdvancedInfoframeC971()): disable
the unit and wait for it to idle, clear the SENT status, write the packet
through the data FIFO with a zero HB3 inserted after the three header
bytes, then enable the unit for every-frame transmission during vblank.

Generic unit 1 is used for the VSI, matching the slot assignment in
NVIDIA's nvkms (NVHDMIPKT_TYPE_SHARED_GENERIC2, unit 0 is reserved
for extended metadata packets and unit 2 for the HDR DRM infoframe,
if those are wired up later).

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/Kbuild   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gb202.c  | 62 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |  2 +
 3 files changed, 65 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
index e1aecd3fe96c..98d6ca5ac311 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
@@ -27,6 +27,7 @@ nvkm-y += nvkm/engine/disp/gp102.o
 nvkm-y += nvkm/engine/disp/gv100.o
 nvkm-y += nvkm/engine/disp/tu102.o
 nvkm-y += nvkm/engine/disp/ga102.o
+nvkm-y += nvkm/engine/disp/gb202.o
 
 nvkm-y += nvkm/engine/disp/udisp.o
 nvkm-y += nvkm/engine/disp/uconn.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
new file mode 100644
index 000000000000..8fd72bcb6f04
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Valve Corp.
+ */
+#include "priv.h"
+#include "ior.h"
+
+#include <subdev/timer.h>
+
+/* GB20x (NVD5.0) reorganised the SF HDMI packet units. The AVI unit is
+ * unchanged from GV100, but the legacy VSI unit is gone. Vendor infoframes
+ * are sent through the shared generic infoframe units instead. Register
+ * layout per NVIDIA's clc971.h/clca71.h, programming sequence per
+ * nvhdmipkt_C971.c:programAdvancedInfoframeC971().
+ */
+void
+gb202_sor_hdmi_infoframe_vsi(struct nvkm_ior *ior, int head, void *data, u32 size)
+{
+	struct nvkm_device *device = ior->disp->engine.subdev.device;
+	const u32 hoff = head * 0x400;
+	/* Generic infoframe unit 1, the slot NVIDIA's driver uses for the VSI. */
+	const u32 ctrl = 0x6f0138 + hoff;
+	u8 buf[36] = {};
+	int i;
+
+	/* Disable the unit and wait for it to go idle. */
+	nvkm_mask(device, ctrl, 0x00000001, 0x00000000);
+	if (nvkm_msec(device, 2000,
+		if (!(nvkm_rd32(device, ctrl) & 0x00400000))
+			break;
+	) < 0)
+		return;
+
+	if (!size)
+		return;
+
+	/* Clear SENT status, and point the data FIFO at unit 1's slot. */
+	nvkm_mask(device, ctrl, 0x00800000, 0x00800000);
+	nvkm_wr32(device, 0x6f03f0 + hoff, 0x00000001);
+
+	/* The FIFO takes the raw packet, except that a zero HB3 is inserted
+	 * after the three header bytes. A unit sends 36 bytes.
+	 */
+	size = min_t(u32, size, 31);
+	memcpy(buf, data, min_t(u32, size, 3));
+	if (size > 3)
+		memcpy(&buf[4], (u8 *)data + 3, size - 3);
+
+	for (i = 0; i < 36; i += 4) {
+		nvkm_wr32(device, 0x6f03f4 + hoff, buf[i + 0] | buf[i + 1] << 8 |
+						   buf[i + 2] << 16 | buf[i + 3] << 24);
+	}
+
+	/* No flip ID or scanline matching. */
+	nvkm_wr32(device, 0x6f013c + hoff, 0x00000000);
+
+	/* ENABLE | RUN_MODE=ALWAYS | LOC=VBLANK | OFFSET=1 | SIZE=0. */
+	nvkm_wr32(device, ctrl, 0x00000041);
+
+	/* Audio priority low (the init value). */
+	nvkm_wr32(device, 0x6f03f8 + hoff, 0x00000002);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
index 3ba04bead2f9..8906fe8ef404 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
@@ -196,6 +196,8 @@ extern const struct nvkm_ior_func_hda gv100_sor_hda;
 
 void tu102_sor_dp_vcpi(struct nvkm_ior *, int, u8, u8, u16, u16);
 
+void gb202_sor_hdmi_infoframe_vsi(struct nvkm_ior *, int, void *, u32);
+
 int nv50_pior_cnt(struct nvkm_disp *, unsigned long *);
 int nv50_pior_new(struct nvkm_disp *, int);
 void nv50_pior_depth(struct nvkm_ior *, struct nvkm_ior_state *, u32 ctrl);
-- 
2.55.0

