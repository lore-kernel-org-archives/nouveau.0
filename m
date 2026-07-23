Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33355C531CC
	for <nouveau@archiver.kernel.org>; Fri, 24 Jul 2026 01:56:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A9BE310E639;
	Fri, 24 Jul 2026 01:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dJpw3ln2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 715FD4738F;
	Fri, 24 Jul 2026 01:41:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784857264;
 b=X/PdI8M0EIk2QR0xzzp0Yh7EicCvBh67Q9BxYuxwlWPrjkXoKcIJPkPZK1otTw80327fO
 i7V1cf4QppBakXSM6Q9fLnbO3MMzYSyj9dU6j9VdY27QFyBd29c+V1AUe5N1DswTDVdfFer
 M/qKbSuMy5UN5fI5iYu20iYcDiV6IFNlC6p3kh3eX1cHTG3AnUks9m/AQi/X8/WaFct9Gbr
 pIgSBlNENGRbcoIxGK6zvlH6HqC1J9mzMZG6gPzu/sK7DYcu9Egq4gSsqarWTsXX/Vn+ePb
 2C9U95zgoFeQEh467OTcZ6fApqPfNbOh+jvcsqXfQ+SWIiXVptbIsxJdvcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784857264; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lNzFXtDRL36sjfeetYaoRGkJ3BZXJkrvXWbUMZXEOzM=;
 b=enjxligdtKFwMLYq4iKPzmDZS8GA0YqbdBMytUc20T2U0lVQjbZtISxchJkLYNWbmdeWI
 yh0Zma5Hiaqwxhd0uRxcsnpCwEIUIAKFksaxdMUdHdM80l+CVM4wBhRQoDUqXcQMvQTgsx0
 W6CKTq/BdvE/rSoFQiQ2XXmQUZQK36g9LMUkP2qR17bWYy8l4o7tkGnrTg1v2jg/4TUqY8C
 YmPEDaqAhnsCdMxCAh926M2sv6lZyMEq7vxJJgd4yryKWbXEkzrNbS2Bx3qxrtnDzZpF8TQ
 EGTKW9XMngQFRqnLdEP3PvKFXQi6ndKa0Joh+M1N744LprBMDqTeOInEyC4g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D59314736E
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 18:30:38 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D71F10E117
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 18:46:12 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-385ea3ce80dso961347a91.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 23 Jul 2026 11:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832372; x=1785437172;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNzFXtDRL36sjfeetYaoRGkJ3BZXJkrvXWbUMZXEOzM=;
        b=dJpw3ln24INYgRFwekI0TSy9sVVf1WWotIFCGCwXO0oBOqTFzFFQ8sd8F40o8rKXUI
         gH2TGo1dWMmMd5cn2bb6WGOkok7sTEue8pTJ5dlETz3ZWpaRR8Xz9ZUc3wnFIl2xBC4r
         gqaY6D3p1mA2R67+6BQlh+KUfthqJJF3ipVrDVAH+/STR1jBKnbWEK17n6zEiMrC6HnH
         P++nLImKDLpt/yQBfao6/kZQ7TeAW7WdfxW62nJKkHdFhCEETOrrN8RUR7OcPhZdjfzU
         3hp7WmCrtwjmUVOwvJWa1er0nUH10nU1+Yh+71xQ4+6gx2T6jntAcs5BDo4N8g/KBH8Q
         92DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832372; x=1785437172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNzFXtDRL36sjfeetYaoRGkJ3BZXJkrvXWbUMZXEOzM=;
        b=qpy8sBTivlROmvbp2p6RjWoY65YQwmKywQopsaRB6epqsnPVoVwaupld6lGKJc5MlJ
         fqwAItWX54HdaL+HKtFTsAC1TJQ3lbJ3Z6GDbzkvkFAf9gQUnVjo7uGcbwZP8veofL1D
         4f5kO2qYxi8oGNF4qT9FafzC+2BsLVIJOYX1ywGM6GevcIdrYtFd6GH6OHVBcmrRey3j
         d+6iwHTpjjdtEbonSyeqb3q6iOqMkedjPc99/0GOs4R7XbhJ95raShluDlSWthik/t0w
         1TIgGZTOJvD9/Q+TqXXDxd3yMplmbgBW9ZBj+fSL2gFkdrRaSra2MXSw1VvQ6ZdEyyPl
         +QqQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RovQlmGUpQbsm0J7yxBC7W+hRWd1x+ZPwz8vs7nkcUPbRh90SLOhoGe4EODG6tcZdI49CyuFxnJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCPUZMQcJMuYF+HwEV66VwH421GXyvkR7BQtvmwbJefWJscM3S
	tSEO7pKwEx+EERMp1MOoWYalZUZ9uScuUm3A5hE/fNPhocIqL0VHUgFW
X-Gm-Gg: AR+sD107P7E9JDGh7FYEgqkUNcIuMFXDKEYeI1tHU+UeYXsuW9JgoxEHnvw7n3tTxoy
	I3+sH78We7qkSuOXnd3rKBQ+2UcndlnzTPCDrM2xGM/9oJ8v6xzb332CawjlYtfAh3VTwXHKeuL
	8w6yTQHA/Hr2kBtsWHuafNX3Qat03rgvM9GMu5OdEHjdquzZbKpbs2SghVg4v+bNlidBG7c3iiM
	hZKxhYuQpPBSn/LiXX7CKKidz284VQnn85Si2c8fLbBFuLB7KwwtkvsSrTZukRR6BT8IuMq8ATP
	1Tmq+Y5K9sHZ6P1b65KYWIf6/04UhDX8djphZ8LnTgc2vhM2ALUlj4Fu1xs6ypwZm4tjEBwg2+1
	Jv/EXEiPscf0EkDMCcx5cCzFnYxmbLQ1t6nl+nn41jZUfcFbnjIkCcpOb1jUR8omp9bZLwXf/
X-Received: by 2002:a17:90b:1d02:b0:38d:dfd1:7c1 with SMTP id
 98e67ed59e1d1-38ec6499300mr4568453a91.2.1784832371666;
        Thu, 23 Jul 2026 11:46:11 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:11 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 06/36] drm: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:08 +0900
Message-ID: <20260723184538.3888637-7-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ekffu200098@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 5PTXLOERUOMNFMK4IK675WVBAKDQTDJS
X-Message-ID-Hash: 5PTXLOERUOMNFMK4IK675WVBAKDQTDJS
X-Mailman-Approved-At: Fri, 24 Jul 2026 01:41:02 +0000
CC: cocci@inria.fr, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5PTXLOERUOMNFMK4IK675WVBAKDQTDJS/>
Archived-At: 
 <https://lore.freedesktop.org/20260723184538.3888637-7-ekffu200098@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c           |  6 +-----
 drivers/gpu/drm/nouveau/dispnv50/disp.c            | 14 +++++---------
 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c |  7 +------
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                |  6 +-----
 4 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 51a0ec043248..52a2334be799 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -55,11 +55,7 @@ static int imx_drm_atomic_check(struct drm_device *dev,
 		return ret;
 
 	/* Assign PRG/PRE channels and check if all constrains are satisfied. */
-	ret = ipu_planes_assign_pre(dev, state);
-	if (ret)
-		return ret;
-
-	return ret;
+	return ipu_planes_assign_pre(dev, state);
 }
 
 static const struct drm_mode_config_funcs imx_drm_mode_config_funcs = {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 364227f5456f..e8fde399acae 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -301,19 +301,15 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	if (ret)
 		return ret;
 
-	ret = nvif_object_ctor(&dmac->base.user, "kmsVramCtxDma", NV50_DISP_HANDLE_VRAM,
-			       NV_DMA_IN_MEMORY,
-			       &(struct nv_dma_v0) {
+	return nvif_object_ctor(&dmac->base.user, "kmsVramCtxDma", NV50_DISP_HANDLE_VRAM,
+				NV_DMA_IN_MEMORY,
+				&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = 0,
 					.limit = device->info.ram_user - 1,
-			       }, sizeof(struct nv_dma_v0),
-			       &dmac->vram);
-	if (ret)
-		return ret;
-
-	return ret;
+				}, sizeof(struct nv_dma_v0),
+				&dmac->vram);
 }
 
 /******************************************************************************
diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
index 2334b77f348c..16a02527285e 100644
--- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
+++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
@@ -58,13 +58,8 @@ static int osd101t2587_panel_prepare(struct drm_panel *panel)
 static int osd101t2587_panel_enable(struct drm_panel *panel)
 {
 	struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
-	int ret;
 
-	ret = mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
-	if (ret)
-		return ret;
-
-	return ret;
+	return mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
 }
 
 static const struct drm_display_mode default_mode_osd101t2587 = {
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 1d6c9a423a41..990805f1fea6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -64,11 +64,7 @@ static int tilcdc_atomic_check(struct drm_device *dev,
 	 * tilcdc ->atomic_check can update ->mode_changed if pixel format
 	 * changes, hence will we check modeset changes again.
 	 */
-	ret = drm_atomic_helper_check_modeset(dev, state);
-	if (ret)
-		return ret;
-
-	return ret;
+	return drm_atomic_helper_check_modeset(dev, state);
 }
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
-- 
2.43.0

