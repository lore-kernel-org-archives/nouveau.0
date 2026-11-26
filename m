Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3B7606A31E
	for <nouveau@archiver.kernel.org>; Thu, 26 Nov 2026 22:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ideco.ru header.i=@ideco.ru header.a=rsa-sha256 header.s=ics header.b=Klx2pfGi
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6A27C112758;
	Thu, 26 Nov 2026 22:03:39 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6A4D6403E1;
	Thu, 26 Nov 2026 22:03:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795730614;
 b=NfIFPxRMsMEhPPXpgdaHiYOzW3Mdz+yY0hiJUkG3yTSAvwyMid5ggoQTgxB0EspWBcTJy
 CohKVkwwEbKP6Ul50lliRVy5JpIW7NAnRqxFr3HKu/y5m36Q09G82MRnflZHP0g94fxYKfE
 53vxpQIWt88NaS3K3RJ8pdkCB+V16ZT6JtlsCyOObbg+eInrtzf0u+28TMVrZCV5K+WHROq
 32BNl4pMo4b5bDf9QnY6gByeU94tzFRQ2vLfTELge06fdV3pmoAmu2B7EOIiVY6/gMrqPAv
 aIrwM8CdtgQpf+fVMkeUhq9Uw/pEoGRCgbQm8Ftk51vR4OuAAr53S6T43U5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795730614; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r3XTDI4uvFScG85tMDMU/IHVWWOtOx9qSgxsnYpPNkY=;
 b=dMrS0NuL1K/FBKNAVJS2XQswQgeUmbFghVf+RDExuDaQTeElaIPaD231OdJB2towwJhni
 yRHeEosXrMVzjJ5/oeI/RUUAasb1t/eTA5z/af9lE1/Pkcb8RXVL0YmKCPEc5YHPuqOL4vs
 dXWiAqntKz/CzklWgiy6VbBlCediKULXKuUt3x8mY+W/qy0hX3bO944mlpUYBXyYn8vCXam
 74JhOd/q//wWLgYGtKe5mCI9XDJW9CAtS0fRxX8YdRZQOGk+LtkGNvLiUO62ijdSG8e/Em0
 UuDWFzVBjrgA8eI7CR09HIJcY+LOF4LWKLBefAhIXwMqptyM4avQhwZ/Edjw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ideco.ru;
 arc=none;
 dmarc=pass header.from=ideco.ru policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ideco.ru;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=ideco.ru policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 018AB40348
	for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2026 08:35:06 +0000 (UTC)
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA79F11214E;
	Thu, 26 Nov 2026 08:35:00 +0000 (UTC)
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 66818202F354;
	Thu, 26 Nov 2026 13:25:10 +0500 (+05)
Received: from fedora (5cfcd9fa.dynamic.mv.ru [92.252.217.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 868242032A51;
	Thu, 26 Nov 2026 13:16:40 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.ideco.ru 868242032A51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ideco.ru; s=ics;
	t=1795681003; bh=r3XTDI4uvFScG85tMDMU/IHVWWOtOx9qSgxsnYpPNkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Klx2pfGi/iKt+nQoFHAuol3STv+RiQlnGrsgpoZkOD9ypvD74RT3MrGINtzkuZRkY
	 uotvHdF3hQ0Hs88riF2MMVTO2K34NQcgNCWtsXlBfykVsf5GVD2D7CwYzYIeHeZWZS
	 JyDuoiww+sUw1tyx/ZQM/W2SJ2Lue8Qi5v0dO5uFBxJQzmVQQKJruUctiy5VBBNVOk
	 WhI6ahgQG0qewFWzTe+S60LlRThJ2UVejU++xzkPl9yMS8BhXjDzIqmkZbvGoP3yGA
	 Mp8y37P2xHUcmxSHdD2+5gTNolNRhP86JiJkaYS6KhEMRRyp7AQKPcRCgqogpq7v5Q
	 hQlQgLGrOJsHg==
From: Alex Kazinsky <a.kazinsky@ideco.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 4/5] drm/connector: Handle scaling mode property allocation
 failures
Date: Thu, 26 Nov 2026 12:15:59 +0400
Message-ID: <20261126081602.2901498-5-a.kazinsky@ideco.ru>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126081602.2901498-1-a.kazinsky@ideco.ru>
References: <20261126081602.2901498-1-a.kazinsky@ideco.ru>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: a.kazinsky@ideco.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
Message-ID-Hash: KM2UXSY7HIMV6RIZJ2CT7NREYVSANFCN
X-Message-ID-Hash: KM2UXSY7HIMV6RIZJ2CT7NREYVSANFCN
X-Mailman-Approved-At: Thu, 26 Nov 2026 22:03:30 +0000
CC: Alex Kazinsky <a.kazinsky@ideco.ru>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Lu Yao <yaolu@kylinos.cn>,
 Jani Nikula <jani.nikula@intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Eric Anholt <eric@anholt.net>,
 Jesse Barnes <jbarnes@virtuousgeek.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KM2UXSY7HIMV6RIZJ2CT7NREYVSANFCN/>
Archived-At: 
 <https://lore.freedesktop.org/20261126081602.2901498-5-a.kazinsky@ideco.ru/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

drm_mode_create_scaling_mode_property() returns success even when
drm_property_create_enum() fails. Drivers then continue initialization
and may pass the NULL property to drm_object_attach_property(), causing
a NULL pointer dereference.

Return -ENOMEM if the property cannot be created and handle the error
in Nouveau, AMDGPU, Radeon and GMA500 before creating connectors.

In GMA500, create the property during modeset initialization and
propagate failures to the driver load path. Remove the redundant
creation call from the Cedarview output initialization.

Fixes: f453ba046074 ("DRM: add mode setting support")
Cc: stable@vger.kernel.org
Signed-off-by: Alex Kazinsky <a.kazinsky@ideco.ru>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  6 ++++--
 drivers/gpu/drm/drm_connector.c             |  5 ++++-
 drivers/gpu/drm/gma500/cdv_device.c         |  2 --
 drivers/gpu/drm/gma500/framebuffer.c        | 17 +++++++++++------
 drivers/gpu/drm/gma500/psb_drv.c            |  4 +++-
 drivers/gpu/drm/gma500/psb_drv.h            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c   |  5 +++--
 drivers/gpu/drm/radeon/radeon_display.c     |  6 ++++--
 8 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 677d199ca931..79ce4414a32f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1576,7 +1576,7 @@ static int amdgpu_display_setup_abm_prop(struct amdgpu_device *adev)
 
 int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 {
-	int sz;
+	int sz, ret;
 
 	adev->mode_info.coherent_mode_property =
 		drm_property_create_range(adev_to_drm(adev), 0, "coherent", 0, 1);
@@ -1588,7 +1588,9 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 	if (!adev->mode_info.load_detect_property)
 		return -ENOMEM;
 
-	drm_mode_create_scaling_mode_property(adev_to_drm(adev));
+	ret = drm_mode_create_scaling_mode_property(adev_to_drm(adev));
+	if (ret)
+		return ret;
 
 	sz = ARRAY_SIZE(amdgpu_underscan_enum_list);
 	adev->mode_info.underscan_property =
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 5ab121860050..af3dbdcaaca5 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2495,7 +2495,8 @@ EXPORT_SYMBOL(drm_mode_create_tv_properties);
  * instead to correctly assign &drm_connector_state.scaling_mode
  * in the atomic state.
  *
- * Returns: %0
+ * Returns:
+ * Zero on success, negative errno on failure.
  */
 int drm_mode_create_scaling_mode_property(struct drm_device *dev)
 {
@@ -2508,6 +2509,8 @@ int drm_mode_create_scaling_mode_property(struct drm_device *dev)
 		drm_property_create_enum(dev, 0, "scaling mode",
 				drm_scaling_mode_enum_list,
 				    ARRAY_SIZE(drm_scaling_mode_enum_list));
+	if (!scaling_mode)
+		return -ENOMEM;
 
 	dev->mode_config.scaling_mode_property = scaling_mode;
 
diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index fd6ea8998dbe..2a9e9b323005 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -41,8 +41,6 @@ static int cdv_output_init(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 
-	drm_mode_create_scaling_mode_property(dev);
-
 	cdv_disable_vga(dev);
 
 	cdv_intel_crt_init(dev, &dev_priv->mode_dev);
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 37a9f666c0f2..02d892a146fc 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -43,8 +43,6 @@ static void psb_setup_outputs(struct drm_device *dev)
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 
-	drm_mode_create_scaling_mode_property(dev);
-
 	/* It is ok for this to fail - we just don't get backlight control */
 	if (!dev_priv->backlight_property)
 		dev_priv->backlight_property = drm_property_create_range(dev, 0,
@@ -98,14 +96,19 @@ static void psb_setup_outputs(struct drm_device *dev)
 	drm_connector_list_iter_end(&conn_iter);
 }
 
-void psb_modeset_init(struct drm_device *dev)
+int psb_modeset_init(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-	int i;
+	int i, ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
 
-	if (drmm_mode_config_init(dev))
-		return;
+	ret = drm_mode_create_scaling_mode_property(dev);
+	if (ret)
+		return ret;
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
@@ -125,6 +128,8 @@ void psb_modeset_init(struct drm_device *dev)
 	        dev_priv->ops->errata(dev);
 
         dev_priv->modeset = true;
+
+	return 0;
 }
 
 void psb_modeset_cleanup(struct drm_device *dev)
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index d17cb5b4a4bf..6321cbc305bf 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -386,7 +386,9 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 
 	dev->max_vblank_count = 0xffffff; /* only 24 bits of frame count */
 
-	psb_modeset_init(dev);
+	ret = psb_modeset_init(dev);
+	if (ret)
+		goto out_err;
 	drm_kms_helper_poll_init(dev);
 
 	/* Only add backlight support if we have LVDS or MIPI output */
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index db197b865b90..416c9db65e5a 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -589,7 +589,7 @@ struct psb_ops {
 };
 
 /* modesetting */
-extern void psb_modeset_init(struct drm_device *dev);
+int psb_modeset_init(struct drm_device *dev);
 extern void psb_modeset_cleanup(struct drm_device *dev);
 
 /* fbdev */
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 04e9a512eaec..1e24829e0eac 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -656,8 +656,9 @@ nouveau_display_create(struct drm_device *dev)
 		return -ENOMEM;
 
 	drm_mode_config_init(dev);
-	drm_mode_create_scaling_mode_property(dev);
-	ret = drm_mode_create_dvi_i_properties(dev);
+	ret = drm_mode_create_scaling_mode_property(dev);
+	if (!ret)
+		ret = drm_mode_create_dvi_i_properties(dev);
 	if (ret) {
 		drm_mode_config_cleanup(dev);
 		drm->display = NULL;
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index aac6733ddd82..c4397edc5913 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1410,7 +1410,7 @@ static const struct drm_prop_enum_list radeon_output_csc_enum_list[] =
 
 static int radeon_modeset_create_props(struct radeon_device *rdev)
 {
-	int sz;
+	int sz, ret;
 
 	if (rdev->is_atom_bios) {
 		rdev->mode_info.coherent_mode_property =
@@ -1432,7 +1432,9 @@ static int radeon_modeset_create_props(struct radeon_device *rdev)
 	if (!rdev->mode_info.load_detect_property)
 		return -ENOMEM;
 
-	drm_mode_create_scaling_mode_property(rdev_to_drm(rdev));
+	ret = drm_mode_create_scaling_mode_property(rdev_to_drm(rdev));
+	if (ret)
+		return ret;
 
 	sz = ARRAY_SIZE(radeon_tv_std_enum_list);
 	rdev->mode_info.tv_std_property =
-- 
2.56.0


