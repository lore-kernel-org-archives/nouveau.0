Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C6EC5DF85
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 16:50:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EF98C10F11E;
	Thu, 20 Aug 2026 16:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="loIKSPy4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7ABBE479ED;
	Thu, 20 Aug 2026 16:34:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787243660;
 b=0svlrxEtQcO5r4lASZpFplTactX6IRnAAYqsdVntc6uCaIGgg7PYHqDAC4CPEr5ww/ecE
 YNUkZ5PZwAZfqtRJHGy4dF/6lnOs9mLAvPww1Mj4tPxL8xcBEX30qkTS+g3miFYyi50MuOX
 fsRG/rdcwqNpmJNEMnOvcIlGyoGgXjLbUN3tSugP1K5CHVrdG0w3iC8r0ddFAFqsyMokDWg
 fT9eY3qM3Qy4Tyz68IDlxANCkhUfbq2sWI8TzVzwCAkf66rzdiH8oGGbjaGAVFQpON+02wt
 tuWHzgnbz8UQlkAkxOKf0VipDM/ijPjQaE1a+tpu8DY5KaZY0upOkgy1bLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787243660; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YE7qcApQ+Obk30eKV1C+kC93MwiUbUNOYm/DV2i4pE0=;
 b=ZZAwUvbtsNal1xV6WUu1/s6cuAbC36P3oDqLIwRX42waK+bhS9E+3RKYpz4kb8d81su6e
 OvSlK/Ri3TGugjaXyNgQuI4mL8JbikwSBg6pKlbsef8g80QeuS43K3gbAUY+zpOG6JkoyDL
 idWZehLS8dbOsAdci5OTSLkVIRQe6pH6WZ7eK6oMI2VMmbouWYoony8ZOXY/OqMfGIWNfj/
 u4NbT4wezp2jYK7csl2OW+jXUipOJL+bozlCYesloTCiKNMemn7mqJDMdqfBGQzfqxgpSBK
 hjR8moy+jffNNorCuySzdcrau5/ndMP2GNbKJ5c4NG4/zQOUrOwQlzCOh5HA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5164A47960
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:34:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A2D5810F119
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:50:53 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4956869750eso298235e9.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787244652; x=1787849452;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE7qcApQ+Obk30eKV1C+kC93MwiUbUNOYm/DV2i4pE0=;
        b=loIKSPy40dyLkiqjl9+er/uz+O55y0n429vwjCdHEMVh6cU0IxVMK4AYcp/K8AIo9Z
         n0mXk5kGesUdBwSffYKYDQ6g2ME1J3/irPbMqKVKhtDhAqDsY3q5PwfSLvB+udntXffl
         uXIXeIQ0NYodh+SjNFZDYbXFRILL9eYc0Wfev6Ed5eCClkb6tZYqK7RDCAHWuBlPM1eE
         296CBnNeN25pe9BeaBR3UuTiMfYHPrWYqgbewk8EHNGF1Urdp0fIgDcA2sr+hnOVMvfY
         iZNe43YOAtRtuXMyaqOqjM+HMGGcPvXeKWpv76m+ePHQP7BfIb2gIGyLCd+VGRbmoz8c
         2IFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787244652; x=1787849452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE7qcApQ+Obk30eKV1C+kC93MwiUbUNOYm/DV2i4pE0=;
        b=jADOontM1S4K3j6KDjRZm3HqFTpjb9vi6jkONERIccMHB+lwjDiQ751KBSvXfmPEDY
         GSDbm6P+pRMJZWGvQpmB1hmWINzDDyeHcZAkCxDD5OAdfwKEoZxTutC7O3u0X4MQ2nGG
         X7vVlB9XzwtvkJmNAxdeDn53LA6GhYrj/XMo9Hhskd5S1Fem6suBp+0IfZY48/U54WSX
         ZrFimPREzKpWSb20InaX7+Da6MQ+tDQsOUD/By4LQ/Ymx0b7VQJi8OWWyJzxzPAJssUg
         7/p/cQkXTku4S3hqIcBCDpu7PEOipkj1CLg4QSfljnJfRr+3NK4ztuHClVu1KXkMuXYd
         39DA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp78Ts1jb7h5qINpl3O4/eSmDPXdyGaskXA9lB0b5YB3ASt6KZl1/Ls96wib/213QVgaQCkAZE2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXZ/d6oJ6c3tVs90g1nkOD8xp+M7eVC9Z5+OFi5v1z/32LfPER
	AQyshwJTwCS9kT4ZvdbaYNguhcdoDCdQCyZo7dLRJwU5m41Kzf37ggDz
X-Gm-Gg: AR+sD12E8RTBfRHnf8HY6KnWYmMq3GV6Ym+9JZyzc9XJrWgmEx8umD5O0eIymFt2HiI
	GYhKnKUAOSn1KNyqVoAJtqm8ZWyRsTdnWPXAsLD4+b5SgGdrJWjDoEFoRJGR0NzdnzzkE7tdF0R
	3YhmtIzJwOoAMo0fc4rv0GqGmPktEF4vHVtJkJ+WsbffGOgekd/oyZkTs1wf5RCN01ZBSPMbG1N
	3EoNbeVKm6rix54gBpolXdep9IyhRDgVuzxsZpzau6Qv6n0QmXDJSlsDGMI+KBO4vLeH4Ap0QMi
	A7sThYeLjLn/8/fa/vLCZA/RoX1hXuGn2cuMh5pblpxRn84oPw2cXm9rmTsYmlI3S1RjjfyuXYl
	ydNEHdMhngrhiPvEHfjST29DDPl08tJqrFq6m7IHoKHiGeIiRDCytisFe/3hNLj5/XourJD2s2y
	uZf1HcTmTZWqieuxA+Lms5yRxT0Lo84al/EVBWTpo+W7otMHGQMmRvHkp1POTWxkqjEvg=
X-Received: by 2002:a05:600c:4e8b:b0:499:872b:abd4 with SMTP id
 5b1f17b1804b1-499b829ef81mr4294175e9.6.1787244651755;
        Thu, 20 Aug 2026 09:50:51 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa1111b2sm205307545e9.5.2026.08.20.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:50:49 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] drm/nouveau/disp: fix head state readback on GB20x
Date: Thu, 20 Aug 2026 20:49:26 +0400
Message-ID: <20260820164929.17117-8-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FQDXY3JIHOQ5NWBLLK47SLNK6QFISYY4
X-Message-ID-Hash: FQDXY3JIHOQ5NWBLLK47SLNK6QFISYY4
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FQDXY3JIHOQ5NWBLLK47SLNK6QFISYY4/>
Archived-At: 
 <https://lore.freedesktop.org/20260820164929.17117-8-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The GSP path reads armed head state and the RG scanout position through
gv100_head_state() and gv100_head_rgpos() on every generation.
gv100_head_state() reads the core channel's state mirror at a 0x400
per-head stride, which NVD5.0 (GB20x) doubled. Per NVIDIA's published
CA7D class header every HEAD_SET method sits at 0x2000 + head * 0x800,
while the mirror bases are unchanged (assembly at 0x680000, armed at
+0x8000, per OpenRM's v03_00 channel-user-base HAL which is still used on
DISPv0502).

Add gb202_head_state(), the same readback at the 0x800 stride, and
supply it through gb202_gsp_disp.
gv100_head_rgpos() is kept. The RG registers keep their per-head 0x800
stride on NVD5.0, and OpenRM's kdispReadRgLineCountAndFrameCount_v03_00
still reads NV_PDISP_RG_DPCA on DISPv0502.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/gb202.c  | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
index 4863b2b36db0..a66c820be9fe 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c
@@ -83,6 +83,53 @@ gb202_sor_hdmi_gcp(struct nvkm_ior *sor, int head, bool enable)
 	nvkm_mask(device, 0x6f0040 + hdmi, 0x00000001, 0x00000001);
 }
 
+/* Same core-channel state mirror as gv100_head_state() (assembly at 0x680000,
+ * armed at +0x8000, per-head method offsets unchanged), but NVD5.0 spaces
+ * heads 0x800 apart (see NVCA7D_HEAD_SET_*(a) in clca7d.h).
+ */
+static void
+gb202_head_state(struct nvkm_head *head, struct nvkm_head_state *state)
+{
+	struct nvkm_device *device = head->disp->engine.subdev.device;
+	const u32 hoff = (state == &head->arm) * 0x8000 + head->id * 0x800;
+	u32 data;
+
+	data = nvkm_rd32(device, 0x682064 + hoff);
+	state->vtotal = (data & 0xffff0000) >> 16;
+	state->htotal = (data & 0x0000ffff);
+	data = nvkm_rd32(device, 0x682068 + hoff);
+	state->vsynce = (data & 0xffff0000) >> 16;
+	state->hsynce = (data & 0x0000ffff);
+	data = nvkm_rd32(device, 0x68206c + hoff);
+	state->vblanke = (data & 0xffff0000) >> 16;
+	state->hblanke = (data & 0x0000ffff);
+	data = nvkm_rd32(device, 0x682070 + hoff);
+	state->vblanks = (data & 0xffff0000) >> 16;
+	state->hblanks = (data & 0x0000ffff);
+	/* Bit 31 is ADJ1000DIV1001, not a HERTZ bit. We don't have enough bits
+	 * to add the full clock in hz on Blackwell (35 bits), but state->hz
+	 * is unused and obsolete under GSP so this is fine.
+	 */
+	state->hz = nvkm_rd32(device, 0x68200c + hoff) & 0x7fffffff;
+
+	data = nvkm_rd32(device, 0x682004 + hoff);
+	switch ((data & 0x000000f0) >> 4) {
+	case 5:
+		state->or.depth = 30;
+		break;
+	case 4:
+		state->or.depth = 24;
+		break;
+	case 1:
+		state->or.depth = 18;
+		break;
+	default:
+		state->or.depth = 18;
+		WARN_ON(1);
+		break;
+	}
+}
+
 /* GB20x is GSP-only. This table supplies the register programming the
  * GSP-RM display path needs from the chip.
  */
@@ -91,7 +138,7 @@ gb202_gsp_disp = {
 	.uevent = &gv100_disp_chan_uevent,
 	.ramht_size = 0x2000,
 	.gsp.intr = tu102_disp_intr,
-	.gsp.head_state = gv100_head_state,
+	.gsp.head_state = gb202_head_state,
 	.gsp.head_rgpos = gv100_head_rgpos,
 	.gsp.vblank_get = tu102_head_vblank_get,
 	.gsp.vblank_put = tu102_head_vblank_put,
-- 
2.55.0

