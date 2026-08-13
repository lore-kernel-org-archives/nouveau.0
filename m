Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C4FC5DF6D
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 20:37:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D0B6210F541;
	Thu, 13 Aug 2026 20:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MYZF7S6H";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5FD7547768;
	Thu, 13 Aug 2026 20:21:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786652492;
 b=J4zh267GAa/P7HI4qOtZDrFKlP0VpozFdP29gAiSXRGc8/5nwCAb+12sXjcRe33jlxelw
 Uqn5n97EZHoeuiaNvsMcmBJl1iBRgn0hl21nb3GzqHAOX8TqD7tBEQkO/ZB+enlkga5btuy
 iysGyd6P0LmuOjI4APdqQsPXNqsIgZ8/xvXMPRP5rAA3qlB3tdxIaZzrVwksKtpBT9CdHDG
 f3apBExAjrN+hZ0p05BWz30fnbQIJFCsTmpaNclb8S45Ssa5LZwHOql4fGrtG4ldQATNf0g
 od9pRn2Cz/eZHreKcK+VX+BQEYuBaw6x2jASZ+XsQXu/xo17wySkdX3TdIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786652492; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Hh27rO9R8DtQJsuiE9nKE16dIfxBWJQ1z/2NAuDC/us=;
 b=IOcnIbymqeATiI6T0tSuhcyMQiVBP16CqiLcaV9talinjwAEx0LdYihduwxABKg0g03BS
 wxR/CKhrVZWJw1Gu1rkdtV5dU8cxOBvsmwsmWFJeUKUvsMCJWM/tOPa56xVnyzpJXJul3X4
 0wjEFpNqIfgoGGjDp6qWRKx0iGdy8MzDToxnPVTW6J4VKqNrURbTgeS8+BiSVVSHsveHOC2
 Wvjk9NZdxaP3FiRKUpIGe1GwKEnsXzIrAD5YmTXq9JWUtXt+WM3Fi7uKXP5I17scSkjvJts
 9NYOuS6vuSPyNmFDHTB/Ign+KucXtrnwcgantDk+WCdfDSMBVmCccppN3rxQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E5CD64772B
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:21:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ECABF10F52F
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786653468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hh27rO9R8DtQJsuiE9nKE16dIfxBWJQ1z/2NAuDC/us=;
	b=MYZF7S6HoJtkqWtB0lZ3jmPToeqZYxC8G6rbwG0H01ejOBGxKyZQ0ufYsVOxP7krEyyf8Y
	O7/8F4zewAY+OnN7T1jOvmW6LwU6lzRVyUUMpFQ8YHRs4RQixDoyNwPcgXNggZ5vgxa9VG
	/kVJ5KvSK3XADOhwnCPeO5Oi9JzX+nQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619--5Lyhn0CMQCjIdm7ZvXxxw-1; Thu,
 13 Aug 2026 16:37:40 -0400
X-MC-Unique: -5Lyhn0CMQCjIdm7ZvXxxw-1
X-Mimecast-MFC-AGG-ID: -5Lyhn0CMQCjIdm7ZvXxxw_1786653458
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 53D18180034A;
	Thu, 13 Aug 2026 20:37:38 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7FC82195DF9A;
	Thu, 13 Aug 2026 20:37:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v7 3/5] drm/nouveau: Fix drm_driver struct/nouveau.atomic
 parameter handling
Date: Thu, 13 Aug 2026 16:27:07 -0400
Message-ID: <20260813202833.2051778-4-lyude@redhat.com>
In-Reply-To: <20260813202833.2051778-1-lyude@redhat.com>
References: <20260813202833.2051778-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: EMDKsrPpIbi5Gta0TzUSOFfNj6d2PS0ba-kjlBmICCI_1786653458
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: WAKNAHGHGPEEMI4N5LMD2OA2CN6HET32
X-Message-ID-Hash: WAKNAHGHGPEEMI4N5LMD2OA2CN6HET32
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WAKNAHGHGPEEMI4N5LMD2OA2CN6HET32/>
Archived-At: 
 <https://lore.freedesktop.org/20260813202833.2051778-4-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The way we handled the nouveau.atomic module parameter before was fairly
broken, and had a number of issues:

- It was only ever actually parsed in the case of PCI devices.
- When nouveau.atomic was enabled, it would add the cap for atomic
  modesetting to the global driver_pci structure. This meant that if one
  GPU on a system supported atomic and another didn't, it would still get
  enabled for both.

Looking into this exposed further silliness in the way that we actually
handle the drm_driver struct. We have one global structure for platform
devices, and another for PCI devices - both of which are literally
identical.

So before we start preparing to enable atomic modesetting by default, let's
fix this. Instead of sharing driver_pci and driver_platform, we instead
create driver_legacy_kms and driver_atomic_kms, each of which is identical
except for the DRIVER_ATOMIC capabilities flag, and then assign either
depending on the nouveau_atomic module parameter.

Doing this is also preferable, as the next step for enabling atomic
modesetting by default will be ensuring that we don't enable it for legacy
devices that still don't support it. This requires only checking the atomic
modesetting module parameter after the NVKM device is ready, as this allows
us to check the GPU family that nouveau is running on.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* s/driver_pci/drm_driver/
* Dynamically allocate drm_driver struct, get rid of duplicate global
  driver structs to fix another Sashiko issue.
V3:
* Don't use devm (sashiko)
V4:
* Don't return 0 by mistake (thanks C)
V6:
* Don't embed drm_driver into drm_device, just create two separate
  hardcoded structs
* Move the check earlier

 drivers/gpu/drm/nouveau/nouveau_drm.c | 100 +++++++++++++++-----------
 1 file changed, 58 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 451009adee0de..d021a3049be1a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -111,9 +111,8 @@ MODULE_PARM_DESC(runpm, "disable (0), force enable (1), optimus only default (-1
 static int nouveau_runtime_pm = -1;
 module_param_named(runpm, nouveau_runtime_pm, int, 0400);
 
-static struct drm_driver driver_stub;
-static struct drm_driver driver_pci;
-static struct drm_driver driver_platform;
+static const struct drm_driver driver_legacy_kms;
+static const struct drm_driver driver_atomic_kms;
 
 #ifdef CONFIG_DEBUG_FS
 struct dentry *nouveau_debugfs_root;
@@ -727,8 +726,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 }
 
 static struct nouveau_drm *
-nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
-		       struct nvkm_device *device)
+nouveau_drm_device_new(struct device *parent, struct nvkm_device *device)
 {
 	static const struct nvif_mclass
 	mmus[] = {
@@ -737,16 +735,21 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 		{ NVIF_CLASS_MMU_NV04 , -1 },
 		{}
 	};
+	const struct drm_driver *driver;
 	struct nouveau_drm *drm;
 	int ret;
 
+	if (nouveau_atomic)
+		driver = &driver_atomic_kms;
+	else
+		driver = &driver_legacy_kms;
+
 	drm = kzalloc_obj(*drm);
 	if (!drm)
 		return ERR_PTR(-ENOMEM);
 
 	drm->nvkm = device;
-
-	drm->dev = drm_dev_alloc(drm_driver, parent);
+	drm->dev = drm_dev_alloc(driver, parent);
 	if (IS_ERR(drm->dev)) {
 		ret = PTR_ERR(drm->dev);
 		kfree(drm);
@@ -874,16 +877,13 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 		return ret;
 
 	/* Remove conflicting drivers (vesafb, efifb etc). */
-	ret = aperture_remove_conflicting_pci_devices(pdev, driver_pci.name);
+	ret = aperture_remove_conflicting_pci_devices(pdev, DRIVER_NAME);
 	if (ret)
 		goto fail_nvkm;
 
 	pci_set_master(pdev);
 
-	if (nouveau_atomic)
-		driver_pci.driver_features |= DRIVER_ATOMIC;
-
-	drm = nouveau_drm_device_new(&driver_pci, &pdev->dev, device);
+	drm = nouveau_drm_device_new(&pdev->dev, device);
 	if (IS_ERR(drm)) {
 		ret = PTR_ERR(drm);
 		goto fail_nvkm;
@@ -1360,35 +1360,54 @@ nouveau_driver_fops = {
 	.fop_flags = FOP_UNSIGNED_OFFSET,
 };
 
-static struct drm_driver
-driver_stub = {
-	.driver_features = DRIVER_GEM |
-			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
-			   DRIVER_MODESET |
-			   DRIVER_RENDER,
-	.open = nouveau_drm_open,
-	.postclose = nouveau_drm_postclose,
-
-#if defined(CONFIG_DEBUG_FS)
-	.debugfs_init = nouveau_drm_debugfs_init,
+#ifdef CONFIG_DEBUG_FS
+#define NOUVEAU_DEBUGFS_OPS .debugfs_init = nouveau_drm_debugfs_init,
+#else
+#define NOUVEAU_DEBUGFS_OPS
 #endif
 
-	.ioctls = nouveau_ioctls,
-	.num_ioctls = ARRAY_SIZE(nouveau_ioctls),
-	.fops = &nouveau_driver_fops,
-
-	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table,
-
-	.dumb_create = nouveau_display_dumb_create,
-	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
-
-	DRM_FBDEV_TTM_DRIVER_OPS,
+#define NOUVEAU_DRIVER_OPS                                              \
+	.open = nouveau_drm_open,                                       \
+	.postclose = nouveau_drm_postclose,                             \
+                                                                        \
+	NOUVEAU_DEBUGFS_OPS						\
+                                                                        \
+	.ioctls = nouveau_ioctls,                                       \
+	.num_ioctls = ARRAY_SIZE(nouveau_ioctls),                       \
+	.fops = &nouveau_driver_fops,                                   \
+                                                                        \
+	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table, \
+                                                                        \
+	.dumb_create = nouveau_display_dumb_create,                     \
+	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,                 \
+                                                                        \
+	DRM_FBDEV_TTM_DRIVER_OPS,                                       \
+                                                                        \
+	.name = DRIVER_NAME,                                            \
+	.desc = DRIVER_DESC,                                            \
+	.major = DRIVER_MAJOR,                                          \
+	.minor = DRIVER_MINOR,                                          \
+	.patchlevel = DRIVER_PATCHLEVEL
+
+static const struct drm_driver
+driver_legacy_kms = {
+	.driver_features = DRIVER_GEM
+			 | DRIVER_SYNCOBJ
+			 | DRIVER_SYNCOBJ_TIMELINE
+			 | DRIVER_MODESET
+			 | DRIVER_RENDER,
+	NOUVEAU_DRIVER_OPS,
+};
 
-	.name = DRIVER_NAME,
-	.desc = DRIVER_DESC,
-	.major = DRIVER_MAJOR,
-	.minor = DRIVER_MINOR,
-	.patchlevel = DRIVER_PATCHLEVEL,
+static const struct drm_driver
+driver_atomic_kms = {
+	.driver_features = DRIVER_GEM
+			 | DRIVER_SYNCOBJ
+			 | DRIVER_SYNCOBJ_TIMELINE
+			 | DRIVER_MODESET
+			 | DRIVER_RENDER
+			 | DRIVER_ATOMIC,
+	NOUVEAU_DRIVER_OPS,
 };
 
 static struct pci_device_id
@@ -1457,7 +1476,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 	if (err)
 		goto err_free;
 
-	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
+	drm = nouveau_drm_device_new(&pdev->dev, *pdevice);
 	if (IS_ERR(drm)) {
 		err = PTR_ERR(drm);
 		goto err_free;
@@ -1482,9 +1501,6 @@ nouveau_drm_init(void)
 {
 	int ret;
 
-	driver_pci = driver_stub;
-	driver_platform = driver_stub;
-
 	nouveau_display_options();
 
 	if (nouveau_modeset == -1) {
-- 
2.55.0

