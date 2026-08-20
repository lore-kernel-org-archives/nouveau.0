Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A448EC5DF81
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 16:50:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6216C10F118;
	Thu, 20 Aug 2026 16:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JrSn0lXp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DF255479E3;
	Thu, 20 Aug 2026 16:34:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787243647;
 b=W/2ezGS3p0fZxDGTo/7nH/c7ae6DFtK+ZENv6nrYv96r2taUmDd7OnLqbiC+PRSGAX6kq
 8hXINfzi7c0RFViRYlfza/GvuULYPrKQDdpcimlsfaQuXL/tkE2EQ2ZhX8HNdIu2IbF4D3W
 P2UinRR2+c+a5iRbdNvLBExjUQ/ZMUihJ9DhOUxX8/snEfIWGKtQL553PqFT32QB3Ka8dE/
 01op3e4p0xXVZSx1mpIXzeYB6ICrYVkKkaVLyIs9kl2z3rBFKftUZuVl7ITWXWrzyBPjOCb
 psXfxY50JDCiJMIRWJXpmQA97CrtfBYwB6AvGzef/iICGTcO9yC5HU/zdGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787243647; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Y+Y9y81hA9Cad/KoflpAlEdybDJIGHGo0qSz9MnRnh8=;
 b=VvMBtODaQWPULqFihZIqOzHZ7HCY74DupNG2yDmQlB6B16zJ13+Djwx1ajymz+ZULmcYO
 0wdsv3b0Qim0S3EI08NUep6/j+QWMAolc2v3Os1KCUVwz2fjfD4WseNAFKrBT7pzehTkdm/
 p6fapANK2pPne0zJTByCnphY8hKUk/wv1/cSG97jgkb41P/cwhs0sOQlIuHlg6NMbT9drxI
 L7ZAYsvI2aDwRha5fJFAP84BXFHWzH+X6P4wiKbUdNNU/kqBGAU1my/XovarosxWTyf0n0l
 /tlq4qpBaHKnX9WqyXNHSiDH+SiOk9YRU61GwE56hkvRhTI7grUAByR+2STA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 744C847960
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:34:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C473810F10F
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:50:40 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-480033bdcf4so78602f8f.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787244639; x=1787849439;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+Y9y81hA9Cad/KoflpAlEdybDJIGHGo0qSz9MnRnh8=;
        b=JrSn0lXpN1kgEvx9VvzPpkQceZWdz5GogdmA10gAQJNKj9tPksmXzcQ6+jWl8EOWCA
         VK9OBB28VVSYygZAA3k6MAWW0HuYF+bqXEiI9R6JqFx4NvWgY/czKsXqnHHXm9afXwCo
         ct/lIj0ASuvxj7OVuIhZs/9B3jbfC0HgkXRbJoP7DDTp+n6kpgQMPx+4pzJzQL7b+a7m
         JlNcf9GcJR82WR63i5y2ZKSkGnnwM+gOXRh4SIgg7TjrOrQBf9ss+nUsODRy1wQf+xnV
         X9J20fmIKTlqQ7zM0ZC+ddBeO9Jmi0MnItJ8sxTQVV1dKNE/eWgw9r+aoMrXn1MlYoGr
         y97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787244639; x=1787849439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+Y9y81hA9Cad/KoflpAlEdybDJIGHGo0qSz9MnRnh8=;
        b=WD/xixIEmBJg+0GpPHR3RKPcUMLrn5g0O/cwIKQ06Z/Tx9YWT9dwkSPcwzViV5ZVEC
         UxT7q5P82eb5rj2rgu30sIruXKACAJvvvtka8ZlywWwa9K9z9e5zfiprXXAYsQN0E2dm
         kbHjY74bezlx7F15AhRvEjOC6HO9e5sVzV8f00MCeYVAklJ2hY8D4BvIlGNDvWz/VWib
         AgiAkoshte8wEb6rccK/YLnkhg9pDtAOOTLDHTQKaVxUQkIC5mqzX1nc3Q93BLFInk9P
         QUmZiW51kVVvkslaaIwFnNHh/KG1433OPwRFXTzb8EQL6uAgMu9uUYNgruLE1g7jYpJW
         zSUA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro7/RpB1SBSJ7YoK4svmelUNtc3xHSWUXF4urzJ6RaRnOaxBALk4FYZiZ5FKtkELchTJzDwkwg8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkVSwDWvDCf2sxUYM/tty5XEtAQqftHRBZj5kHyuT7867+Wj2J
	kwjLSg7KXYAdAlpMK7nxvKdathaCrv5Xto7nr48dX0wnJ06LMHNGlNvd
X-Gm-Gg: AR+sD10ytcyV6cDCTWhZzkjWMGTOpTUYQNMSN1THKYES1tZmUzuDYPjGdKOrYoFISht
	C3gEbKa7W68vOxzg44woEq20i311VtbpoM3mULvqQUaiWS0JX96btKTT7SyvE8B24ErA66FkQSi
	R4RvOiO9TuXIzrtPeQXg5DlZdJj6XQ1gcmwbRmAVScBkejHkSCPB+NoQJWjG5D9EFE8ej7gBc43
	vtmL3tmosK9Qtc8pyZbwkbrRRL7E0Mdb8Jd4fHUaT7cf1ZIq6cLB5VVCEERwZs/R9DoWqXB1Hdb
	Fp7d7893V/yZVeOoHcDK/w4m+FJbNrtPenta8tTyDypp/7anqwUC2Uuv/6uh3CCgMBndQ7TDDCJ
	iWkfiCDYGmnFwX5evPLbwXwRmOJqVRdwM8jJ1ddVTynQb8zqiHX/tRGXxCFVWTBgz9yMowDocY6
	3BOZg/oJKeSnzZVWnfYpA4SAdTvYNuvLbOzTq0q3LoyHIqLdErjMEc+e5taypyqOnWMAU=
X-Received: by 2002:a05:600c:19c7:b0:499:484a:81d0 with SMTP id
 5b1f17b1804b1-499b82e84aemr4300455e9.9.1787244639062;
        Thu, 20 Aug 2026 09:50:39 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa1111b2sm205307545e9.5.2026.08.20.09.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:50:36 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] drm/nouveau/disp: fix HDMI GCP AVMute register
 offsets on GB20x
Date: Thu, 20 Aug 2026 20:49:24 +0400
Message-ID: <20260820164929.17117-6-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SG2RMCG5IQHF63UDIRORJAQG4CZL3RGL
X-Message-ID-Hash: SG2RMCG5IQHF63UDIRORJAQG4CZL3RGL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SG2RMCG5IQHF63UDIRORJAQG4CZL3RGL/>
Archived-At: 
 <https://lore.freedesktop.org/20260820164929.17117-6-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The GSP path brackets audio enablement with a General Control Packet
AVMute toggle. r535_sor_hdmi_audio() calls the gsp.hdmi_gcp hook, which
every chip so far serves with tu102_sor_hdmi_gcp() and the legacy GCP
unit at 0x6f00c0/0x6f00cc. On GB20x the SF packet units were compacted
and the old generic and VSI units are gone (ACR keeps slot 2) and the
GCP unit moved from slot 3 to slot 1 (control 0x6f0040 and subpack
0x6f004c from NVIDIA's published clc971.h. The same offsets are also
used by OpenRM's hdmiWriteGeneralCtrlPacketC871() on these chips). The
old addresses are reserved on GB20x, so the AVMute writes were silent
no-ops and mitigated only by the equivalent GCP r535_sor_hdmi_audio()
already sends through the SET_OD_PACKET RM control.

Add a GB20x GCP writer using the new offsets and hook it into
gb202_gsp_disp, keeping the direct MMIO path in sync with the hardware
as on earlier chips.

Only SB0 (the AVMute bit) is written. On NVD5.0 the subpack register also
carries SB1_CTRL (bit 24), which selects where the deep-color CD/PP
fields are generated (hardware or from the driver, with the default being
HW). hdmiWriteGeneralCtrlPacketC871() likewise writes only SB0-SB2.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/gb202.c  | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
index fa83aee35ae7..4863b2b36db0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
@@ -65,6 +65,24 @@ gb202_sor_hdmi_infoframe_vsi(struct nvkm_ior *ior, int head, void *data, u32 siz
 	nvkm_wr32(device, 0x6f03f8 + hoff, 0x00000002);
 }
 
+/* General Control Packet AVMute bracket. The GCP unit moved to slot 1 on
+ * NVD5.0. Only SB0 (the AVMute bit) is ours to write so we must not do a
+ * full write here: SB1 carries the deep-color CD/PP fields, and SB1_CTRL
+ * (bit 24, new with clc871.h) controls where their generation happens (HW
+ * or driver) on these chips, with the default being HW.
+ */
+static void
+gb202_sor_hdmi_gcp(struct nvkm_ior *sor, int head, bool enable)
+{
+	struct nvkm_device *device = sor->disp->engine.subdev.device;
+	const u32 hdmi = head * 0x400;
+
+	nvkm_mask(device, 0x6f0040 + hdmi, 0x00000001, 0x00000000);
+	nvkm_mask(device, 0x6f004c + hdmi, 0x000000ff, !enable ? 0x00000001 :
+								 0x00000010);
+	nvkm_mask(device, 0x6f0040 + hdmi, 0x00000001, 0x00000001);
+}
+
 /* GB20x is GSP-only. This table supplies the register programming the
  * GSP-RM display path needs from the chip.
  */
@@ -77,7 +95,7 @@ gb202_gsp_disp = {
 	.gsp.head_rgpos = gv100_head_rgpos,
 	.gsp.vblank_get = tu102_head_vblank_get,
 	.gsp.vblank_put = tu102_head_vblank_put,
-	.gsp.hdmi_gcp = tu102_sor_hdmi_gcp,
+	.gsp.hdmi_gcp = gb202_sor_hdmi_gcp,
 	/* The legacy AVI unit is unchanged on GB20x. */
 	.gsp.hdmi_infoframe_avi = gv100_sor_hdmi_infoframe_avi,
 	.gsp.hdmi_infoframe_vsi = gb202_sor_hdmi_infoframe_vsi,
-- 
2.55.0

