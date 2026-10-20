Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4F4606A31B
	for <nouveau@archiver.kernel.org>; Tue, 20 Oct 2026 17:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=k/Pu9fQr
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD8110E3B0;
	Tue, 20 Oct 2026 17:53:24 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9963948B4E;
	Tue, 20 Oct 2026 17:34:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792517673;
 b=pk5961KxGqbIx4xx0NV5XQfiOXguUc+i0xA8IhwaO7w5ZkVW/N+YTje9YbEQZZp9DtfDM
 DVhMK9E+r6xj5D6SJrBp6XcQ9jgbzyYsJTQi+sDx0f899o9IjwLrP7MaH6cWZlnulncpY5V
 lCv/Zn1CgjJpFWSR8UJ5Xhf4UDzZVepJOH1RoNq8x3cFcttQJRFrGixTizy7+Xone0McILY
 7RFJ1vjK8to92dLKKftl5btGnemyrbOyfpPWwfHH018IJkoetIp1PAC7JpWndDVKpjf/cUr
 Lrk9lFeE2bSf9iGYgbEe61Gk1HYvKFnktG+plQeXGP1pK9w24YMH8QFwJZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792517673; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Y0Vtm/ADE7KmOIdpmnsidnESC11fnafsTwZQ5s+7Btg=;
 b=ryT/pqMmC1RVmmv5kpyePuw2GXkGBO9Wycx147pwRa0WMdyHgwPHuc+zPdGOeX8rl+JnH
 LNRK0U+FZvu8Rpkbk/LwDG/CtjeqBwA0xmQFWhi0lU3Xv0Jamkh7S9pF3glQTjxpO42S7Qw
 CGwEMqZ5gOo3ZiLsZ6vfpI9g84SaWlONx/B+tzr8wazRZraaNPMOIWWGYATxojy5PCk1ks/
 3j3q71t8t2oE7+mHlKDdgubvoMrkVgmFYYrJBtu5T4UdRs+ozLuWMBn4LgDB7ppI8oksGog
 ra+Iw9+G5pDLdmiWoFGagquUlq4oGxPzKUk95SvkKv7kFX/irn3Fw2aQTKRQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4E16147642
	for <nouveau@lists.freedesktop.org>; Tue, 20 Oct 2026 17:30:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BB41E10E027
	for <nouveau@lists.freedesktop.org>; Tue, 20 Oct 2026 17:48:56 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48dfdd0678dso2385454f8f.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 20 Oct 2026 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792518535; x=1793123335;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0Vtm/ADE7KmOIdpmnsidnESC11fnafsTwZQ5s+7Btg=;
        b=k/Pu9fQrWpsamDxMdEk2njkDs0gRsC1eI90aIUMXJp5rbaLRmdvUtY76fEb7dekJf5
         xmsySCf0+BlGfv6HFGNfRAyTO4xYhSY77PurBZd5yYeTnoM8zbLil0DzpCVY7xhdNQaH
         GIVgkjN+UXleo1gqk/opzRkTe4YkbnFdo+HIZeWlvXcRDXr4AXHI2koPc7HOmw7a3Y+8
         s5J1P5K8qjZGZ6BQlGwA6DwVWEC2BAn59lZos1pcIexKS8FjLb36bKJjPRa61LyWUPaI
         awF0ZkiD5LC9tn34KjQPrsXe0JsaWh8pKa8+kxuTNMvZv/0sapSFiY4tXzxMp5A18SSL
         jxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792518535; x=1793123335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0Vtm/ADE7KmOIdpmnsidnESC11fnafsTwZQ5s+7Btg=;
        b=wbTyf/+OKsFpS0Wdm1GwVJT/Zc6j8AtkvwHB7uNAPJcfqK5oxdrHOD3rJZ0FdNXW8V
         ZnLZ1J6vBV090SLSpCMq+jum3ide3K4/9GXvPtuWHzAcWLT/qA0XstQVqRoAvPWGA1FK
         ycDPOhYPFT95BgKqJskxnVPqj2+W++84EKUPYzsZutz2wJAqzKOnxvFnZ98MXb6GyVjC
         nhrpzSCU7CxHh100ePKwEUbu4rB/z5JXLPT/+34+qhBmAuIyTUrDNjSnPTFmsnQkkPde
         ExKvC7rXHiaEo4eltAYgpIkG54JtpV6LmaB3KGzRCFTo6D+iw9PwXBuObnRV9H3nez5c
         2aXg==
X-Gm-Message-State: AFq9FYIx0lWzVgnhEsR1gBNgclONxJdvCvN/UuOw3aBUzKe9C7dvTEOy
	3ERRxOylSunqouJUwN0n+xbxecKOIEa4dL9tzesTlLEA6RFXOLYJ2koJtt4h6h0uMbc=
X-Gm-Gg: AYBFou1Uj7a5S5gCZgdad9RyyI++rCXQNHMZ74OMNYDJM3lL1e4q+eeR1yDk4D4WxVL
	vApkVLIC62TcHF0TRBE03qejaeGEJi8xuxbYZCBJ6X64zUdFlapXz/3J/8b/44liCrTKYtoys4s
	GujS4b9et5VIKbIIoXlBrShgywQyUXAI8cuazFR7xCcCcAy1IAME6FvG5BNuD5Md28Fxt69juPw
	NSZrK/XmUvibVDFcEDLuWMn31knDD2nMdrSoS5wCnplLJ2k+EK4LRyCbMq7ZLg6P2m6uAAn+ZUw
	Xj/QIItEcqWO7z1PxrjpsU4emN8nrliW9vlLIAkCanJK7feGNIcg5JXUHv3w4/cg7c8/XxiN6Xy
	kWsio7y8uiitslscQT0g80RuhstewD0F2vM8o5tElHUZVCCrfnkLmlp6L7NS0wH9RxQB64sex/F
	pvsbzJJxLF9sZVBsbOVpW48di+vb5dmEL+NeUwirPgveqYmXxEQdlODeLOpEPFBhR7k++Mq/XkO
	JOZ
X-Received: by 2002:a05:6000:46d6:b0:48d:ba3b:af36 with SMTP id
 ffacd0b85a97d-48e07fa415amr15481519f8f.37.1792518534973;
        Tue, 20 Oct 2026 10:48:54 -0700 (PDT)
Received: from TimsUbuntu.lan ([2a0c:a741:55:dd00:e8a1:89b4:8207:6a6])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d838dd6sm7597643f8f.58.2026.10.20.10.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:48:54 -0700 (PDT)
From: Matt Harding <majaharding@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] nouveau: Fix rerunning VBIOS on GF104
Date: Tue, 20 Oct 2026 18:48:00 +0100
Message-ID: <20261020174800.178426-1-majaharding@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: majaharding@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 3MO2ICPEXUURFAPF2U6RK2RVWNQVRJZU
X-Message-ID-Hash: 3MO2ICPEXUURFAPF2U6RK2RVWNQVRJZU
X-Mailman-Approved-At: Tue, 20 Oct 2026 17:34:31 +0000
CC: dakr@kernel.org, Matt Harding <majaharding@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3MO2ICPEXUURFAPF2U6RK2RVWNQVRJZU/>
Archived-At: 
 <https://lore.freedesktop.org/20261020174800.178426-1-majaharding@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In 2016, in commit a6a0f67ca7aae2e6 `drm/nouveau/devinit/gf100-: detect if BIOS invoked devinit`
Nvidia engineer Gnurou changed how Nouveau detects that the VBIOS has
already run for GF100 GPUs and newer. This was by reading a bit called
NV_PTOP_SCRATCH1_DEVINIT_COMPLETED in a register at address 0x2240c.

However, on my Nvidia GTX 460, a GF104 card, this register doesn't appear
to exist or behave that way. This results in Nouveau re-running the VBIOS,
when the card had already been initialised by the BIOS at boot time. This
causes the hardware to get in a bad state, causing symptoms in the system
log such as an MMIO fault with the message:
`nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at 13c1d4 [ PRIVRING ]`
among other MMIO faults, and a stack trace in:
`drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c:305 nvkm_outp_inherit+0xf5/0x140`
among others.

I've seen another report of the same problem on the ubuntu mailing list:
https://www.mail-archive.com/ubuntu-bugs%40lists.ubuntu.com/msg6269141.html

My proposed fix for this is to revert the GF100 preinit subroutine to
nv50_devinit_preinit(), and to push the logic in gf100_devinit_preinit()
up to gm107.c.

I also have a laptop with a GTX 630M, with a GF108, and I note that the
register bit in question appears to exist and function as expected on that
chip. So it appears that it exists on some GF chips, but not all. So it
may be be possible, with enough investigation, to make this more snuggly
fit the exact chips which support this feature. However,
nv50_devinit_preinit() seems to work well enough for both of these chips,
and as it was used for this family of chips before the bug was introduced,
I think reverting to it is acceptable.

Fixes: a6a0f67ca7aa ("drm/nouveau/devinit/gf100-: detect if BIOS invoked devinit")
Signed-off-by: Matt Harding <majaharding@gmail.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c  | 16 +---------------
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c  | 16 +++++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gm200.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/gv100.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h   |  2 +-
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
index 5368e705e7fd..069f64283b45 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
@@ -87,23 +87,9 @@ gf100_devinit_disable(struct nvkm_devinit *init)
 		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 1);
 }
 
-void
-gf100_devinit_preinit(struct nvkm_devinit *base)
-{
-	struct nv50_devinit *init = nv50_devinit(base);
-	struct nvkm_subdev *subdev = &init->base.subdev;
-	struct nvkm_device *device = subdev->device;
-
-	/*
-	 * This bit is set by devinit, and flips back to 0 on suspend. We
-	 * can use it as a reliable way to know whether we should run devinit.
-	 */
-	base->post = ((nvkm_rd32(device, 0x2240c) & BIT(1)) == 0);
-}
-
 static const struct nvkm_devinit_func
 gf100_devinit = {
-	.preinit = gf100_devinit_preinit,
+	.preinit = nv50_devinit_preinit,
 	.init = nv50_devinit_init,
 	.post = nv04_devinit_post,
 	.pll_set = gf100_devinit_pll_set,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
index 271bfa038f5b..caabd6975a92 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
@@ -45,9 +45,23 @@ gm107_devinit_disable(struct nvkm_devinit *init)
 		nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
 }
 
+void
+gm107_devinit_preinit(struct nvkm_devinit *base)
+{
+	struct nv50_devinit *init = nv50_devinit(base);
+	struct nvkm_subdev *subdev = &init->base.subdev;
+	struct nvkm_device *device = subdev->device;
+
+	/*
+	 * This bit is set by devinit, and flips back to 0 on suspend. We
+	 * can use it as a reliable way to know whether we should run devinit.
+	 */
+	base->post = ((nvkm_rd32(device, 0x2240c) & BIT(1)) == 0);
+}
+
 static const struct nvkm_devinit_func
 gm107_devinit = {
-	.preinit = gf100_devinit_preinit,
+	.preinit = gm107_devinit_preinit,
 	.init = nv50_devinit_init,
 	.post = nv04_devinit_post,
 	.pll_set = gf100_devinit_pll_set,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm200.c
index f30718d7e61a..86e6585244b7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm200.c
@@ -177,7 +177,7 @@ gm200_devinit_post(struct nvkm_devinit *base, bool post)
 
 static const struct nvkm_devinit_func
 gm200_devinit = {
-	.preinit = gf100_devinit_preinit,
+	.preinit = gm107_devinit_preinit,
 	.init = nv50_devinit_init,
 	.post = gm200_devinit_post,
 	.pll_set = gf100_devinit_pll_set,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gv100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gv100.c
index b4d1688517d5..2c20460201a8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gv100.c
@@ -64,7 +64,7 @@ gv100_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
 
 static const struct nvkm_devinit_func
 gv100_devinit = {
-	.preinit = gf100_devinit_preinit,
+	.preinit = gm107_devinit_preinit,
 	.init = nv50_devinit_init,
 	.post = gm200_devinit_post,
 	.pll_set = gv100_devinit_pll_set,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h
index 8de409c084c1..8697c2cbd409 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/nv50.h
@@ -21,7 +21,7 @@ int  gf100_devinit_ctor(struct nvkm_object *, struct nvkm_object *,
 			struct nvkm_oclass *, void *, u32,
 			struct nvkm_object **);
 int  gf100_devinit_pll_set(struct nvkm_devinit *, u32, u32);
-void gf100_devinit_preinit(struct nvkm_devinit *);
+void gm107_devinit_preinit(struct nvkm_devinit *);
 
 void  gm107_devinit_disable(struct nvkm_devinit *);
 
-- 
2.53.0

