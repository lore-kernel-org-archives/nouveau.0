Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7D3C5DF86
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 16:50:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 488B210F104;
	Thu, 20 Aug 2026 16:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c5ukEF/j";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CE63F479C9;
	Thu, 20 Aug 2026 16:33:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787243621;
 b=OHNhN8D4qws4GNSNXB2fcboB4JvXPS/PObogYj4zItf1wqF+wd12/+pbxgvOgh4oNetKg
 ivr9N96dipiffyp+pvk1wKU6fFsovvjetVA9ldUtb6LoR0UTf/5LN9vETxIPxNY6EfWPi0m
 ttqEM9sfNWZRJ63zggnlV3K3DhttEJIhegRifSla0puKHTuK13zvPnES4kYj25X43d5wMIq
 4TXyZ/g9rFs0nu99G/2Qhx+WVaZlGKkl/aMx1hFoYj8x9e7gDEJh3SIWGFFeE6E73c3ktRL
 HzjjIaK7Do+9xWoJ6VM+V3n3JtMd/p9pJGrHS8SBGajjS0PsiuFjvb5aYTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787243621; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nZ6u9Bl+UeuSLChNk/rtttClrX+K1Z0lpt5z16O5QEc=;
 b=n6ab+P0Xlw808209x91vdxNB20qwoqZ56YfEXw9r3Q7TDiR5B5dVE8n4xv5LoyUzHmuA/
 o5CifAvT46BwoCmFWre+U1HNYPrSvZtmvBSkoSfjR3JPSHBCyKcYNS0z267yMipZ11d94uT
 jV0OT1SpjVFPrjOjKOW6az7X7Q+/dOtBxRMUxFJzmYzU6NVWWNemTtu5vi0stckTCmHEo1/
 ST1VPY3VjRiu/LCrNMFx99hMCtcKvlvw6LJp4txHKfe85VtZXjV/YtE6AZnk8b844tDkP+J
 OTp9kad1okOundze2wrMMukO8HlQVI6Hw6TmQO7c0qDhBETTYkVH+tZgWejw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 07CBA47996
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:33:39 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 597EA10F103
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 16:50:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-499b2981a7bso301935e9.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787244613; x=1787849413;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZ6u9Bl+UeuSLChNk/rtttClrX+K1Z0lpt5z16O5QEc=;
        b=c5ukEF/jL+5EcAD/YfWwQp0BT7WVXyLTx/w/dm5+z9bAtQH5oVIyGrs7Cce+OO3KrT
         r/3ISwo4rPvEgoGsTmU43q5lIvOlHSZ4jXpTeTTzJ9XA4zdAmOlzhtYi6xNBQF6eFMk2
         LBSMjZ/xgwFMUJWgf0YnTy5GUv+QpGEvIWdF0Rdu+H9exzVBgS8l15TSnBZW4nGI5Qs8
         g7K8HJr4qOIUwqGmvIHbR+zGZayH9P+0RMeWjK+DRFp42gDNltuYLr1UInmGHvEZeV8k
         pUSYADlHxKOm3MIM4ld5ATBwwYvWaGcqizibqd52CDLRK6ZnAKd6gPmni6nF9Q+llcA6
         MDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787244613; x=1787849413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nZ6u9Bl+UeuSLChNk/rtttClrX+K1Z0lpt5z16O5QEc=;
        b=Z0R40EAoPcmP+jgwcN34tCZLoNkoRA8tWjaAxCe37z3dCnIdDZOvG1rfGc5+eHfUCc
         80B2WK8TFnnEjWQl+mBAWsxJr3XL6hoT9eneN+ju7qRW4paBUholedG/ZKB31AS0tI7r
         6WeNF9VVJ/XTEjBywGaMWjK9hBI9yIgVOIZMBKFh2chaH2J/3qNhDhh0cAmCOsGnHkNY
         uKD0ZMThfVknPyizcfeL3d3wrrDtdQB/boTL6ihGxETGNRTt0ebV0tjA5+TNstpG/LQ3
         CUfA5mFcdASqsJCcmO9iZDrH6W2k0Jdbz68SKgV3aKyrljZQoQNCp3YZEZdeZBqIErLk
         18cg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp6SLv9a+BfiTMtAv+56TNs/VVmGAanIvmpZvJUBndRlU4q6yqyHgoezcerrc22LH3EuGRTL3I5@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzqu8aQu6PkEVOuN6zWyO+xqhXJM7oxEd50H20Fme0ZMmkoQUTE
	YnDI4RHcewHqQQsx/KL1SYpYdwhoas4OW/2+J0z7T1dB6wow6BUfGxXP
X-Gm-Gg: AR+sD13B7iQavT20d1gi6a2vJxP9B8kUH3HM3ciLaa5T5ChXJOkPYQNZo09uEcoIp98
	b28izL505kW7WHgp6G5fqwwDaInc0XTSiaV/vpjzgAapg684k6ty/kb0nyW4L4qe8WAjtVaKw+X
	hjrwUhVQefchkVMds8ergvsJcBT4fJd7h9Yf+hhA6yk26sPqsvFJZtCqRw4AitbPMb6zqTIW72C
	fTwuMqdnApfqSRFGYeja2kqCGRb6VcD+jH7vhmke/OYyys5XRGcJ9O7SVeUymY4DJldfcniTaVq
	GVJ9P6ExnVO5iFRJ4B1vvC7b3s4IIvuZYh/n65hErxLYu/IDDjQHrFMcwjQRIhDKseccTNLegDe
	b96fI9OFvdkl70fxUq3qFC2FLhlLiIFHt7cBUbWSI9cytrfjWFlQ+0mHt5ossCa8ESfTJnj6KIF
	fRcS/EpfKdzQNzeleh3wpSoECpbw/eCaJ258M8wpyDfRr63MQ6q3ve9pBjOGQh75YGlEk=
X-Received: by 2002:a05:600c:3544:b0:493:f140:c3fb with SMTP id
 5b1f17b1804b1-499b8301874mr4103855e9.7.1787244612602;
        Thu, 20 Aug 2026 09:50:12 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa1111b2sm205307545e9.5.2026.08.20.09.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:50:11 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] drm/nouveau/disp: move GSP head-timing ISR and
 vblank helpers to tu102.c
Date: Thu, 20 Aug 2026 20:49:20 +0400
Message-ID: <20260820164929.17117-2-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BTVVMOTOBNRRL34PFXGUDIF726EZXGXE
X-Message-ID-Hash: BTVVMOTOBNRRL34PFXGUDIF726EZXGXE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BTVVMOTOBNRRL34PFXGUDIF726EZXGXE/>
Archived-At: 
 <https://lore.freedesktop.org/20260820164929.17117-2-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The GSP-RM display code in rm/r535/disp.c owns a handful of direct MMIO
routines: the head-timing (vblank) interrupt handler and the per-head
vblank enable/disable. They program display registers, not RM, so they
belong with the rest of the per-chip register code in engine/disp/.

Move them to tu102.c (Turing is the first GSP-capable generation) as
tu102_disp_intr() and tu102_head_vblank_get()/put(), exported for
rm/r535/disp.c, which keeps calling them by name for now. No functional
change.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/head.h   |  3 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  | 50 ++++++++++++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 52 ++-----------------
 4 files changed, 57 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
index b642729c254f..986043e87554 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
@@ -56,6 +56,9 @@ int gv100_head_new(struct nvkm_disp *, int id);
 void gv100_head_state(struct nvkm_head *head, struct nvkm_head_state *state);
 void gv100_head_rgpos(struct nvkm_head *head, u16 *hline, u16 *vline);
 
+void tu102_head_vblank_get(struct nvkm_head *);
+void tu102_head_vblank_put(struct nvkm_head *);
+
 #define HEAD_MSG(h,l,f,a...) do {                                              \
 	struct nvkm_head *_h = (h);                                            \
 	nvkm_##l(&_h->disp->engine.subdev, "head-%d: "f"\n", _h->id, ##a);     \
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
index a3fd7cb7c488..722ec340e12a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
@@ -72,6 +72,7 @@ int gv100_disp_wndw_cnt(struct nvkm_disp *, unsigned long *);
 int gv100_disp_caps_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
 
 int tu102_disp_init(struct nvkm_disp *);
+irqreturn_t tu102_disp_intr(struct nvkm_inth *);
 
 void nv50_disp_dptmds_war_2(struct nvkm_disp *, struct dcb_output *);
 void nv50_disp_dptmds_war_3(struct nvkm_disp *, struct dcb_output *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
index dcb9f8ba374c..7b70b466fa36 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
@@ -104,6 +104,56 @@ tu102_sor_new(struct nvkm_disp *disp, int id)
 	return nvkm_ior_new_(&tu102_sor, disp, SOR, id, hda & BIT(id));
 }
 
+/* The GSP-RM display path leaves head-timing (vblank) interrupts and their
+ * enables to us. These program the RM head-timing line (bit 1 of the
+ * per-head enable, not the bit nvkm's own gv100 path uses).
+ */
+void
+tu102_head_vblank_put(struct nvkm_head *head)
+{
+	struct nvkm_device *device = head->disp->engine.subdev.device;
+
+	nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002, 0x00000000);
+}
+
+void
+tu102_head_vblank_get(struct nvkm_head *head)
+{
+	struct nvkm_device *device = head->disp->engine.subdev.device;
+
+	nvkm_wr32(device, 0x611800 + (head->id * 4), 0x00000002);
+	nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002, 0x00000002);
+}
+
+static void
+tu102_disp_intr_head_timing(struct nvkm_disp *disp, int head)
+{
+	struct nvkm_subdev *subdev = &disp->engine.subdev;
+	struct nvkm_device *device = subdev->device;
+	u32 stat = nvkm_rd32(device, 0x611c00 + (head * 0x04));
+
+	if (stat & 0x00000002) {
+		nvkm_disp_vblank(disp, head);
+
+		nvkm_wr32(device, 0x611800 + (head * 0x04), 0x00000002);
+	}
+}
+
+irqreturn_t
+tu102_disp_intr(struct nvkm_inth *inth)
+{
+	struct nvkm_disp *disp = container_of(inth, typeof(*disp), engine.subdev.inth);
+	struct nvkm_subdev *subdev = &disp->engine.subdev;
+	struct nvkm_device *device = subdev->device;
+	unsigned long mask = nvkm_rd32(device, 0x611ec0) & 0x000000ff;
+	int head;
+
+	for_each_set_bit(head, &mask, 8)
+		tu102_disp_intr_head_timing(disp, head);
+
+	return IRQ_HANDLED;
+}
+
 int
 tu102_disp_init(struct nvkm_disp *disp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index e77733a5d9c3..8e57bb6519e5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -608,29 +608,12 @@ r535_sor_cnt(struct nvkm_disp *disp, unsigned long *pmask)
 	return 4;
 }
 
-static void
-r535_head_vblank_put(struct nvkm_head *head)
-{
-	struct nvkm_device *device = head->disp->engine.subdev.device;
-
-	nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002, 0x00000000);
-}
-
-static void
-r535_head_vblank_get(struct nvkm_head *head)
-{
-	struct nvkm_device *device = head->disp->engine.subdev.device;
-
-	nvkm_wr32(device, 0x611800 + (head->id * 4), 0x00000002);
-	nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002, 0x00000002);
-}
-
 static const struct nvkm_head_func
 r535_head = {
 	.state = gv100_head_state,
 	.rgpos = gv100_head_rgpos,
-	.vblank_get = r535_head_vblank_get,
-	.vblank_put = r535_head_vblank_put,
+	.vblank_get = tu102_head_vblank_get,
+	.vblank_put = tu102_head_vblank_put,
 };
 
 static struct nvkm_conn *
@@ -1404,35 +1387,6 @@ static const struct nvkm_event_func
 r535_disp_event = {
 };
 
-static void
-r535_disp_intr_head_timing(struct nvkm_disp *disp, int head)
-{
-	struct nvkm_subdev *subdev = &disp->engine.subdev;
-	struct nvkm_device *device = subdev->device;
-	u32 stat = nvkm_rd32(device, 0x611c00 + (head * 0x04));
-
-	if (stat & 0x00000002) {
-		nvkm_disp_vblank(disp, head);
-
-		nvkm_wr32(device, 0x611800 + (head * 0x04), 0x00000002);
-	}
-}
-
-static irqreturn_t
-r535_disp_intr(struct nvkm_inth *inth)
-{
-	struct nvkm_disp *disp = container_of(inth, typeof(*disp), engine.subdev.inth);
-	struct nvkm_subdev *subdev = &disp->engine.subdev;
-	struct nvkm_device *device = subdev->device;
-	unsigned long mask = nvkm_rd32(device, 0x611ec0) & 0x000000ff;
-	int head;
-
-	for_each_set_bit(head, &mask, 8)
-		r535_disp_intr_head_timing(disp, head);
-
-	return IRQ_HANDLED;
-}
-
 static void
 r535_disp_fini(struct nvkm_disp *disp, bool suspend)
 {
@@ -1708,7 +1662,7 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 		return ret;
 
 	ret = nvkm_inth_add(&device->vfn->intr, ret, NVKM_INTR_PRIO_NORMAL, &disp->engine.subdev,
-			    r535_disp_intr, &disp->engine.subdev.inth);
+			    tu102_disp_intr, &disp->engine.subdev.inth);
 	if (ret)
 		return ret;
 
-- 
2.55.0

