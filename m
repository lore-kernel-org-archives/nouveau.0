Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AC8C5516D
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:37:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 59A4610E121;
	Thu, 30 Jul 2026 20:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fBF6YzWA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 27B934752A;
	Thu, 30 Jul 2026 20:21:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785442912;
 b=mqDysqTnl9ZcgYqB/Mdv7DpFuFqEMy7jpOTm+1LCDPnU1Mb1QgZQFKtgryv51K/Hc3pW6
 PI15f/Lr85cYRvBi7Z0c7O7qzskBHK2xu/s61dktN73510LAqUgn0xGm95VLzvwqysImlVn
 kmNfGQ5dsPU44EvG/fjGBa28MUwmFudLnCRQ6xwjo+n3qrrRDL+sdGcgBGZfoLgP89lujIV
 eEhhwesq4h3wzrV2ULc3id9JLG6KHZP2rdjANdUoGwK0z4GfTARYPmpFtFP8k7tkfJ1LAsv
 yld9v+a1yZLnZWw68StxuMyAUPlvYX6ronBXr63o5LkANl/7oYLHDFj9HqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785442912; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PObe7Ix594OsA5uN4VbzMdSwrnYhNYKh+klZ/TrQB8M=;
 b=D4n7uOm+2BSdnkn9N7Sot+xp0rYgtWktxpNJReuTVyINqv227oNuB93VmgGcRWwLeQhTx
 /NrYy9AblIQZIutvgo6NsG+frkT373jySolSHEFfUaPL6E23DbQorLzelyG+PtM/1kgSlGm
 VtA1531Fx/BmP+RwNYu9WmOKDOldHWzl/Y8yzj2zpXbriGTuuv9+K9ffhwCevNR6NSNQkpX
 VuzgzbBPwDJx3Z5zXSCWgYqxu98WQK979UZtgqI0644T6714KXD484v6GQlj9AnssuTM/5a
 dc4akOpEpBG/lqUTfCsScur3MKDPdDncTYZWupp5VAw1H3rdtl4dJyW9HdDg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1C69447523
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:21:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0830210E107
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785443859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PObe7Ix594OsA5uN4VbzMdSwrnYhNYKh+klZ/TrQB8M=;
	b=fBF6YzWAo9oWdbdVRuy+nObh6a+T1LHgZr3W13M25vyH1RFIC4grY9pyVA38g0Fx+gD2oF
	cA9cVnnV9fQJgF0OyVufZ0DzDgDsQv0v7uvKmWcjT4VZDAc2eMHWFNYd8v/9DnkhNIfZzT
	G9vgYOD7l920PrM7ABK5Yt5PoYq+9A4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-oHykMC99OByY6GVSViCBkw-1; Thu,
 30 Jul 2026 16:37:35 -0400
X-MC-Unique: oHykMC99OByY6GVSViCBkw-1
X-Mimecast-MFC-AGG-ID: oHykMC99OByY6GVSViCBkw_1785443854
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 42025180044D;
	Thu, 30 Jul 2026 20:37:34 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5CE401956089;
	Thu, 30 Jul 2026 20:37:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] drm/nouveau: Fix drm_driver struct/nouveau.atomic
 parameter handling
Date: Thu, 30 Jul 2026 16:36:11 -0400
Message-ID: <20260730203723.1649433-4-lyude@redhat.com>
In-Reply-To: <20260730203723.1649433-1-lyude@redhat.com>
References: <20260730203723.1649433-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: ld5qde3hmUef4hVqbMBzFpCw8fJTuFZCoTImbDgFbhU_1785443854
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: SC2ADWGP5JIBLVVBX36U3JOX5CVYIPMR
X-Message-ID-Hash: SC2ADWGP5JIBLVVBX36U3JOX5CVYIPMR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SC2ADWGP5JIBLVVBX36U3JOX5CVYIPMR/>
Archived-At: 
 <https://lore.freedesktop.org/20260730203723.1649433-4-lyude@redhat.com/>
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
fix this. Instead of sharing driver_pci and driver_platform, we move the
drm_driver struct we use over to the nouveau_drm struct, and then copy the
contents of driver_stub over to it. We then convert driver_stub to a const,
and move the handling of the nouveau.atomic module parameter into
nouveau_drm_device_new(), and conditionally add the atomic modesetting
capability to the embedded drm_driver struct.

Doing this is also preferable, as the next step for enabling atomic
modesetting by default will be ensuring that we don't enable it for legacy
devices that still don't support it. This requires only checking the atomic
modesetting module parameter after the NVIF device is ready, as this allows
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
* Go back to the old style of error handling since we're not using a second
  allocation for drm_driver anymore.

 drivers/gpu/drm/nouveau/nouveau_drm.c | 56 ++++++++++++---------------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
 2 files changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6940e774ace07..9cd12ebc7e449 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -111,9 +111,7 @@ MODULE_PARM_DESC(runpm, "disable (0), force enable (1), optimus only default (-1
 static int nouveau_runtime_pm = -1;
 module_param_named(runpm, nouveau_runtime_pm, int, 0400);
 
-static struct drm_driver driver_stub;
-static struct drm_driver driver_pci;
-static struct drm_driver driver_platform;
+static const struct drm_driver driver_stub;
 
 #ifdef CONFIG_DEBUG_FS
 struct dentry *nouveau_debugfs_root;
@@ -727,8 +725,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 }
 
 static struct nouveau_drm *
-nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
-		       struct nvkm_device *device)
+nouveau_drm_device_new(struct device *parent, struct nvkm_device *device)
 {
 	static const struct nvif_mclass
 	mmus[] = {
@@ -744,12 +741,14 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	if (!drm)
 		return ERR_PTR(-ENOMEM);
 
+	drm->drm_driver = driver_stub;
 	drm->nvkm = device;
 
-	drm->dev = drm_dev_alloc(drm_driver, parent);
+	drm->dev = drm_dev_alloc(&drm->drm_driver, parent);
 	if (IS_ERR(drm->dev)) {
 		ret = PTR_ERR(drm->dev);
-		goto err_free_drm;
+		kfree(drm);
+		return ERR_PTR(ret);
 	}
 
 	drm->dev->dev_private = drm;
@@ -762,43 +761,42 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
 			       nouveau_name(drm->dev), &drm->_client);
 	if (ret)
-		goto err_device_del;
+		goto done;
 
 	ret = nvif_device_ctor(&drm->_client, "drmDevice", &drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
-		goto err_device_del;
+		goto done;
 	}
 
+	if (nouveau_atomic)
+		drm->drm_driver.driver_features |= DRIVER_ATOMIC;
+
 	ret = nvif_device_map(&drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Failed to map PRI: %d\n", ret);
-		goto err_device_del;
+		goto done;
 	}
 
 	ret = nvif_mclass(&drm->device.object, mmus);
 	if (ret < 0) {
 		NV_ERROR(drm, "No supported MMU class\n");
-		goto err_device_del;
+		goto done;
 	}
 
 	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", mmus[ret].oclass, &drm->mmu);
 	if (ret) {
 		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
-		goto err_device_del;
+		goto done;
 	}
 
-	return 0;
-
-err_free_drm:
-	kfree(drm);
-
-	return ERR_PTR(ret);
-
-err_device_del:
-	nouveau_drm_device_del(drm);
+done:
+	if (ret) {
+		nouveau_drm_device_del(drm);
+		drm = NULL;
+	}
 
-	return ERR_PTR(ret);
+	return ret ? ERR_PTR(ret) : drm;
 }
 
 /*
@@ -877,16 +875,13 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 		return ret;
 
 	/* Remove conflicting drivers (vesafb, efifb etc). */
-	ret = aperture_remove_conflicting_pci_devices(pdev, driver_pci.name);
+	ret = aperture_remove_conflicting_pci_devices(pdev, driver_stub.name);
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
@@ -1363,7 +1358,7 @@ nouveau_driver_fops = {
 	.fop_flags = FOP_UNSIGNED_OFFSET,
 };
 
-static struct drm_driver
+static const struct drm_driver
 driver_stub = {
 	.driver_features = DRIVER_GEM |
 			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
@@ -1460,7 +1455,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 	if (err)
 		goto err_free;
 
-	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
+	drm = nouveau_drm_device_new(&pdev->dev, *pdevice);
 	if (IS_ERR(drm)) {
 		err = PTR_ERR(drm);
 		goto err_free;
@@ -1485,9 +1480,6 @@ nouveau_drm_init(void)
 {
 	int ret;
 
-	driver_pci = driver_stub;
-	driver_platform = driver_stub;
-
 	nouveau_display_options();
 
 	if (nouveau_modeset == -1) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 5fc75dc750ed0..5cc0001134e74 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -216,6 +216,7 @@ struct nouveau_drm {
 
 	struct nouveau_cli client;
 	struct drm_device *dev;
+	struct drm_driver drm_driver;
 
 	struct list_head clients;
 
-- 
2.55.0

