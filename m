Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E49606A320
	for <nouveau@archiver.kernel.org>; Thu, 19 Nov 2026 21:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wX45sKT/
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3A61B11273E;
	Thu, 19 Nov 2026 21:26:55 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 838D4404F7;
	Thu, 19 Nov 2026 21:26:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795123606;
 b=uLGGFB1WoxchjQ9NJwFyWCbZlTfa4qkp/+Oluhsvxeb3S4wg5BTrNl8jtnZEHlANPFW0W
 nttfZIoKTSxE6cp2TgZkSLG9ASWxpuu57LgJAcltFo+h+JqWBSZ6a8K+31KDg+aSSJIUatK
 0WFk7SOfBlx0ZiRwGQZBVkonRgbfXGO9tmxqEkPul6UKLIDAV58g/Rap84DMrTABMsJSE7N
 MJ7QTsIvZVEKF8lgwgPxKXEJV6qum7GH7DQrDyeqJFrO3TB9PsjyelcXU2IxOJWo+fPgp9Q
 Nac4/g9tlfhd74bMtX4DwYBHej/h5D4z9+eSWu3lFrFkX5PmNpXSGtE/2v1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795123606; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u/T6aa6iCWFrqHcoyuakH1O4XrX3XcHQl1IIpLYEGug=;
 b=dmk2YYju0VGNWq72TkD0NG35Hwf9QTGN0NbOeteNXWJRIXPbdTzg+MellxrNKyfPTcHea
 k2xJxwuQfg6ykUYeb/t3fzmNrbYPkeZoT5S5952EtYj4xDGVzcjjCLYS+Wv+oaez2CIt3mv
 SF1Szyq61uKnKt4N1Ch3oztD4r1k+uH/eeWj2R/8cWABSJWdJkdedKGVys5r5ITfRtR13V1
 qXsiqK1L9lIf43Z2nusDMqFMVc0iTbY5d00VqO3sM/7AoTsr2Y8KsTnSpFWmVlpVGYL9pHf
 jmcF0QG+DpEDoNWtUTikc8ydoAoGktbx6ddgIZ6SFRApAeiA+mJMPJffgaEw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
 arc=none;
 dmarc=pass header.from=gmail.com policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B130240409
	for <nouveau@lists.freedesktop.org>; Thu, 19 Nov 2026 21:26:42 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com
 [74.125.224.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA04F10ED03
	for <nouveau@lists.freedesktop.org>; Thu, 19 Nov 2026 21:26:37 +0000 (UTC)
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-67db23d8892so355261d50.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Nov 2026 13:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123596; x=1795728396;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u/T6aa6iCWFrqHcoyuakH1O4XrX3XcHQl1IIpLYEGug=;
        b=wX45sKT/EjD7M/w5RtM1ffurmZTs8VP/DMlP7YhoGUCmQvvab3LvfqOO7NdZ0LOr6x
         fJS6l+hWRXl0igoyAt+uxxPkTPrG+gg4S2sMYIeRk5ztokC8t3bFYHTJ39SxHSt9jmHw
         JzEA9utWLrtDJ4RmGBkjCAGFh3/vZuoXFDxgwC6mjRicP24BScCQgVMPszIHwToaxZgg
         jl/3RvpHfW8Y8erToXBtHmus90UIa2eUAtA71cPPDMqHWCEAOlOa2c4WdTLv3jp2IzQy
         +DfiXnSdD0FDVxGxA3iEkOp3FBr3/hpM4o1kkZ1zFKEAVR4EhPF1Eb62IEDxzgPUytFV
         x/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123596; x=1795728396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/T6aa6iCWFrqHcoyuakH1O4XrX3XcHQl1IIpLYEGug=;
        b=tMpmvb+OH9g9WDvOW+SX2XPyWLdkV5YvENS6LaE+W3zl7csdO3WShTkio9U5P0vyhC
         672c+cGka95E7fjk7UtnHQXP0TMcIPXrW9gJ2IKYLwAGo/wZNI1BMnvLSHjyZKRR+kNA
         A2coI8kM5SppOfqd1iZsBSPVZW7oEkz82jw803ludYPFvVXNdh2Z4LBEc12w/Gu2hnkf
         lWah2NBQdtMh2SLhnWiPOuadVNW79WTHL437WqLRy38yk2dQ4Ep92f31F+Xl3un2qvHb
         42pMLlRKLEGUfwREiaScSKS1N+DrCNbYA62O8gWTyv56cbK4NWIpiuLWzMiDkh9ZG/hY
         f9/w==
X-Forwarded-Encrypted: i=1;
 AL+hErHzPEdUJkdEQevnJIrXvVlmx31uqttNvbu9BYw/tp4dlqpK3ZTOwi1jAkPW7IUhpbTxmFls5nRg@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+gjzwO29iqjQ9GsjV8ja+7pxEFYXKkZZVmZk80qixpeot2Of1u
	uAPXqmRYoZO/pie7J9Iis3va9bVxyra5DEekgoYvwYGZMqdv0G6HNNNd
X-Gm-Gg: AZFdTZcLQgzYmLgRxWz83/sFD/eVCW0W52B1aPxSMD+gEzzuLJMYsKq8V2UzOW5qoLt
	sQCbiYBfE3pgYcIhGkmI2dZDAd3UVmoPJqGAKTnBjqbkXdQnVJ51ldzUlRdbZct3eUU/i3I5ksz
	MgHKQjvutoYzwDhJL1C4Uzf7oM2Me9h8rXReT7GbaQEljHRvoP70L81rh9h3jvRCW/9buNBJSu5
	IGK7oD4VT+fZJXxM0mTqxEYDu7/05vb9WGM35S6TXU7X8OLtdXm+P79NZaRr8MAXVK7C1W0hAj5
	l+tebz5siST94XWivV567SjW7OtFhrWMpzKCoi9R1dJcAfMbRT2Iaii8Y4CkICv99qQWSYzpGrB
	htRW1l1YDRrzG9zOFOxwyMy0BnJlx2jdDCJWB9ArbchVNvv/ZBnNA39xNK9iGq2ic2KQ7mmiheh
	F7hGLqyQkEaSr1vPuvgI9raj+ggZFqhTJEMuFEu9oHP3JohK5YrPU4K0Z1QjdNO/IEwjKTkHX5Z
	GTtv1y/UWE5wirb+SwA3ledqjxuqrBUm2gd1i9k6lGSt4ZtpP10kr/5J5ZdFeVgogMh65gR3LqS
	n1H6gBN6bKIrc3u7tPTtCKTMu+x/LXUl5HfVqyyrSqP1alKRRm1OMEUZUgwekgS/z5dYtEWoQoa
	vRuB9jSBU7OgKFjtqVMhUBvprcc7JOc6E0u76vUalr/Jh73FfQU+S3K2qj2gGy+M=
X-Received: by 2002:a05:690e:1094:10b0:67d:bdd4:e44 with SMTP id
 956f58d0204a3-67df44b0b15mr275383d50.98.1795123596293;
        Thu, 19 Nov 2026 13:26:36 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-67df338e8fesm658337d50.16.2026.11.19.13.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:26:35 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Thu, 19 Nov 2026 16:26:32 -0500
Subject: [PATCH 1/2] drm/nouveau/dispnv04: Restore Apple backlight PWM on
 resume
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-nouveau-pmac-sleep-v1-1-360c08654a25@gmail.com>
References: <20261119-nouveau-pmac-sleep-v1-0-360c08654a25@gmail.com>
In-Reply-To: <20261119-nouveau-pmac-sleep-v1-0-360c08654a25@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4744; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=uadQHS718gQ/DHTMJAZSo4vKONsVxecudR5BmvozqCU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+Z3asXt6nLdEw84Wu9+Lqyb4fdrte3rwmRutwtxvns
 sAXfFMXdHxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1+xYzMnQ3J7f+3s
 5yVrVA4PK7EOX4NXbX09fYRkWnZLN8u65cuI2R4a/M+jMr05lOJaZVOrmsLHhjG96WOOlwXu5y2
 5nWdne1GAA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A
Message-ID-Hash: IEASTVQJFPFOFM5JZNDKIHTQEB4L4KDH
X-Message-ID-Hash: IEASTVQJFPFOFM5JZNDKIHTQEB4L4KDH
X-MailFrom: mattst88@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Matt Turner <mattst88@gmail.com>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IEASTVQJFPFOFM5JZNDKIHTQEB4L4KDH/>
Archived-At: 
 <https://lore.freedesktop.org/20261119-nouveau-pmac-sleep-v1-1-360c08654a25@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the Apple GPUs handled by nv04_dfp_update_backlight(), the panel
backlight PWM lives in NV_PBUS_DEBUG_DUALHEAD_CTL. Open Firmware sets
it up and nouveau only toggles bit 31.

nouveau runs the VBIOS init tables on every resume, whether or not the
GPU lost power, and on the iMac G4 (PowerMac6,1, NV34M 10de:0329) they
write 0x7fff to that register. It reads 0x83e60535 at boot and
0x80007fff after waking from PMU sleep: backlight enabled at zero
brightness, so the panel stays dark although the display is otherwise
working.

Save the register when suspending and restore it on resume.

Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/dfp.c  |  6 +-----
 drivers/gpu/drm/nouveau/dispnv04/disp.c | 27 +++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/dispnv04/disp.h |  2 ++
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index 00eb2aacbe93..33b5a3398460 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -485,16 +485,13 @@ static void nv04_dfp_commit(struct drm_encoder *encoder)
 
 static void nv04_dfp_update_backlight(struct drm_encoder *encoder, int mode)
 {
-#ifdef __powerpc__
 	struct drm_device *dev = encoder->dev;
 	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
-	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
 	/* BIOS scripts usually take care of the backlight, thanks
 	 * Apple for your consistency.
 	 */
-	if (pdev->device == 0x0174 || pdev->device == 0x0179 ||
-	    pdev->device == 0x0189 || pdev->device == 0x0329) {
+	if (nv04_display_has_apple_backlight(dev)) {
 		if (mode == DRM_MODE_DPMS_ON) {
 			nvif_mask(device, NV_PBUS_DEBUG_DUALHEAD_CTL, 1 << 31, 1 << 31);
 			nvif_mask(device, NV_PCRTC_GPIO_EXT, 3, 1);
@@ -503,7 +500,6 @@ static void nv04_dfp_update_backlight(struct drm_encoder *encoder, int mode)
 			nvif_mask(device, NV_PCRTC_GPIO_EXT, 3, 0);
 		}
 	}
-#endif
 }
 
 static inline bool is_powersaving_dpms(int mode)
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index f71199a39bc4..7d44d18e1b88 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -35,6 +35,20 @@
 
 #include <nvif/if0004.h>
 
+/* Apple GPUs whose panel backlight is a PWM in NV_PBUS_DEBUG_DUALHEAD_CTL. */
+bool
+nv04_display_has_apple_backlight(struct drm_device *dev)
+{
+#ifdef __powerpc__
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+
+	return pdev->device == 0x0174 || pdev->device == 0x0179 ||
+	       pdev->device == 0x0189 || pdev->device == 0x0329;
+#else
+	return false;
+#endif
+}
+
 struct nouveau_connector *
 nv04_encoder_get_connector(struct nouveau_encoder *encoder)
 {
@@ -74,6 +88,15 @@ nv04_display_fini(struct drm_device *dev, bool runtime, bool suspend)
 	if (!suspend)
 		return;
 
+	/*
+	 * The VBIOS init tables, which run on resume, reset the backlight
+	 * PWM that Open Firmware programmed. Save it to restore on resume.
+	 */
+	if (nv04_display_has_apple_backlight(dev))
+		disp->saved_backlight_pwm =
+			nvif_rd32(&drm->client.device.object,
+				  NV_PBUS_DEBUG_DUALHEAD_CTL);
+
 	/* Un-pin FB and cursors so they'll be evicted to system memory. */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct drm_framebuffer *fb = crtc->primary->fb;
@@ -126,6 +149,10 @@ nv04_display_init(struct drm_device *dev, bool resume, bool runtime)
 	if (!resume)
 		return 0;
 
+	if (nv04_display_has_apple_backlight(dev))
+		nvif_wr32(&drm->client.device.object, NV_PBUS_DEBUG_DUALHEAD_CTL,
+			  disp->saved_backlight_pwm);
+
 	/* Re-pin FB/cursors. */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct drm_framebuffer *fb = crtc->primary->fb;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.h b/drivers/gpu/drm/nouveau/dispnv04/disp.h
index 85ec0f534392..2f84287a3521 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.h
@@ -88,6 +88,7 @@ struct nv04_display {
 	struct nouveau_bo *image[2];
 	struct nvif_event flip;
 	struct nouveau_drm *drm;
+	u32 saved_backlight_pwm;
 };
 
 static inline struct nv04_display *
@@ -98,6 +99,7 @@ nv04_display(struct drm_device *dev)
 
 /* nv04_display.c */
 int nv04_display_create(struct drm_device *);
+bool nv04_display_has_apple_backlight(struct drm_device *dev);
 struct nouveau_connector *
 nv04_encoder_get_connector(struct nouveau_encoder *nv_encoder);
 

-- 
2.56.1

