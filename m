Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30ACC61DB9
	for <nouveau@archiver.kernel.org>; Tue, 25 Aug 2026 20:05:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9F110E1BF;
	Tue, 25 Aug 2026 20:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LnyXkxaL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9607647BD5;
	Tue, 25 Aug 2026 19:49:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787687347;
 b=QtiHePhrzbHYLWGeW7BzAcEB8f/gsv4K3V6D+pTcvZP0LjV1Wxv1W8ScvYeCzgowhH1OL
 8hN7dvKZ0Uk7/07ZpIuILEY4AUcRL4qIkKNQ5elT9VlViw5r0W3v1SoTqViFdoEIUxq33FS
 rmgdFvsyOr54ol9eA6yLkCi0rRvx49ZGyRggs4QOwb7oIUSqZixiZOMpoPbMVP1QTawNw0v
 taHCjiulqsVX2C9iT5xaAiOV15SBXSfULL6yRyJMJNv22rzfNiZwSclSYg0XXLcVILS/Fx4
 7E1sDXTMUJtg6aUeqhbIxkFGTHmebqapTKGfToNjC+QpmQTdvM6B2L8uhjXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787687347; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RuAEk+4LiQhkycCwL92SfZ2A4rYOkzcfHz0DHKAe0bE=;
 b=GPe88Zx+IUcbIA5IuIm2VxpTCRt5R4z/e+8XORoHTatkIeKWFIlZT0F7efUdqy8D20RKu
 IXxM2bnosXYaZc/7fSaaR5SoS0/v2O4tPmJwsTIlIkmtpOeuq9uBo/TPWwrEYXwIIqOKKgg
 yexTiSM5zzgEfw6X2DP/CECK1HDZJKq+bTjDB5puCpn1TnwFLJk3+D2De5WR+ydY0FYhQgq
 7YAPY+D9uPqmyG8bQPQRvXSWE3dLC2k50oAGY6t5giHliskWEvkpKzowCbi0xZGPPRZLKLm
 5NPFQMv8f8YJGskyP92jzzt0sF2WVoF4NJdeKem11/Y4A/9L25187Fk2rsvA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7A6BD45C7C
	for <nouveau@lists.freedesktop.org>; Tue, 25 Aug 2026 19:49:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 833CF10E1CE
	for <nouveau@lists.freedesktop.org>; Tue, 25 Aug 2026 00:14:43 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4996f1ee4a4so28222235e9.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 24 Aug 2026 17:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787616882; x=1788221682;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RuAEk+4LiQhkycCwL92SfZ2A4rYOkzcfHz0DHKAe0bE=;
        b=LnyXkxaLzaH0oBnJ+ZzfVWWPeN6ALihZRkI1UKYOMjXr4I3INNwzJ64jHreuw5rXYT
         Kx773Zp2gM8q6d52uq+kcmRvziAf1q2ztFCP3vYAzH2hLXI1me9vzmmVuXQoVD4o293S
         qd+toQRMkBaNnXyepSaAE1x8352ouOr1h0O0mUR/lJkXsfhjbM2vK9nATk1HcyHjZbYe
         W6FWtoR801px2vJ5p/ilSd3En2d/KkFjZ2OPpGmoeJvvuq2IJki4GPnMQsmBg5XqFWdt
         y5+exM7dIJy8lNxNTwSON/JJ1CQfBwzpsKUunAN5rjwynUgBkXoLLdus3540dhxemNYC
         lbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787616882; x=1788221682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RuAEk+4LiQhkycCwL92SfZ2A4rYOkzcfHz0DHKAe0bE=;
        b=TyEAir25wqnQ7Q5jzI0sjJrGsb0/HHORRkTe/wEaujEuC93m0Eu/5gmk2odxANozut
         Ot8otr47BCyTfZwthOrjUnaG12GUmVMafUDa3+NrgtLRaY+V5yri+g/XkPLRf1WAR/xD
         wwkcb9ASIdY70GT6cupBlCkM7P84GaHUaQ6zF5vHQ3OaUvGWGZJf8NC2csPUAgNpN83i
         tKkcXRz/TSQtufQHKQNF9Sht2gDk05bY8bQIEUTh1rANcORjIhK6p8hWibzAXhU0LrAZ
         c38fT9EpcRt7TyWXZkaWgyY5Z05wSVAR44Cac8eE45Dq32f4MidoQm6WvSyh5OKoJ/4q
         L+Ow==
X-Forwarded-Encrypted: i=1;
 AHgh+RoZJ48Rd3bHYWqVSBxAu1sWEs9fSIf/B7Y+DN41Ha3HiLkTek6CeAsZD4tmjddZnSVrEYp7c2NE@lists.freedesktop.org
X-Gm-Message-State: AFuF++nSMeHsxQrzkhoh+Mq52o4eDql6+/GU4Kz2ECla2JBHO4QKY+CV
	TQ1ah1dFQuFLxnU8GABMs0mbo4xCRoprgsmiKuQsjCzIXkKZMii62JTK
X-Gm-Gg: AR+sD12qEe3yim5efX4zqWJMvrvYLmUcZn2cQI64hRqnhPreYrkDET6l1dcTDVil6Jc
	z2hs3i9fUZsGVVR/q1BZ8BA6tnRH5lxZg97vXVTnT/jAiD+M7fEPtZ8htrAMQmGpsC/FsGMXmjv
	2ztfB7bQVNuhrV6OAI0DkbNmkMcMN5MqRDo7Iv2ufZt8gEZUQmPG5f/oS7MqBJDwZYnQ0cCqDAl
	MmnZ5nc/L53XrSJylbGOxYblRRd8FeEkXBGObA2I/NafpIKmX7K9I9l47gtwPT6bx2Nk3+x41Jc
	UuPNWpNCZq/iXPAzNRtf+bSUpIeBAvxVXfEJJqMWCnG7esyqYmU7KrhfjoKdy2WQH61BNw0EXIN
	xDGFTcavhprFcF6Gqjut2zbT/80rPd3vteJR9qaUtO9QjfTcOdH0zXK5JaMX+WvN8CTNDoYBT7/
	jbArZ1gRjeMmc59+lFMscy9E6LL5f0425AgZQnJFfxfu633uFa7+tjsGPKj3WOTNflUluNYbXBD
	K/BRA==
X-Received: by 2002:a05:600c:474a:b0:499:b65d:124f with SMTP id
 5b1f17b1804b1-499b845709amr367619755e9.11.1787616881745;
        Mon, 24 Aug 2026 17:14:41 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482c9b78ebfsm9770676f8f.12.2026.08.24.17.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 17:14:40 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/10] drm/nouveau/disp: move GSP head-timing ISR and
 vblank helpers to tu102.c
Date: Tue, 25 Aug 2026 04:13:59 +0400
Message-ID: <20260825001408.14219-2-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825001408.14219-1-mohamedahmedegypt2001@gmail.com>
References: <20260825001408.14219-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TSTJBDMR3MKETNILKUCL3V2Q6EVDEJBH
X-Message-ID-Hash: TSTJBDMR3MKETNILKUCL3V2Q6EVDEJBH
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TSTJBDMR3MKETNILKUCL3V2Q6EVDEJBH/>
Archived-At: 
 <https://lore.freedesktop.org/20260825001408.14219-2-mohamedahmedegypt2001@gmail.com/>
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

Fixes: 6cc6e08d4542 ("drm/nouveau/kms: add support for GB20x")
Cc: stable@vger.kernel.org
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

