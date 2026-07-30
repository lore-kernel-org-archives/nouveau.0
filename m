Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB783C5516D
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:30:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 856E910F093;
	Thu, 30 Jul 2026 20:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E2eWAEAy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5687547518;
	Thu, 30 Jul 2026 20:14:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785442499;
 b=brdHF7gplum5WKm0cCkutLSCDQBMZw2JO7ZubC46PfQHisg7M7yVu7Tj/jDjXqP+lQu5V
 VGiaJ1fHVb8kJZMd1M1+MpF83hC2EzcgixqZwNdRUlb5setPvLiovvubxWaxXJGQPJizsKO
 9YvPylNmkhL2ieq3Tw+BwxTk6wYdd6vMW5IZMKsnq69GpQV3YN+oWYV6IjxNNh/yBsxMIVP
 TJUlO2xtJCGzyr65dulC2YQd6dGDzaO8p1ywrU7OasCHJwtvqLZfNpk9fIHt2NUVV7iQTum
 5aM5SBSmgyRLgrswLq3pAzk9u1tVC5Z6q/i2XEvvcOE6ifCPM4xqZKm9emzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785442499; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3Rslbn4Tu1YwerRYRd6bF7m2/jkRf+QSYz600R8qBXA=;
 b=j3YuUEVMdVoygfpZkxAIQMoX0vL9sa0KvAEHdp9lpPGOZXdbyTr7sOIFNcQ1kI2o3yNNr
 w2pbwpJ9L7mjUndhm+PKQpONOJKhl7sThqKSYQjNfMQq6hsgmar5rku3OAWZQIQDROWRU1A
 1Nt3jvdbtW7HvqOur9wNf4mKJny2v7mOhFJUmBeq/nRiQmqiwzMqCqsLWMnmFZ/hr/eeYBG
 pcruLly7he6YAZA9AwW5iWIFcWfn78kW57XPlgOF1q926zVuHsAO6PpmxWE9sRsulqfhQpM
 ccp2gmc8v3xp3pz5/UqmcKDcRinMR+TRWiIhTXPG0mxJ8Y8Ou0uuU7fMy2Ww==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8A7E647184
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:14:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6566610F094
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785443444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Rslbn4Tu1YwerRYRd6bF7m2/jkRf+QSYz600R8qBXA=;
	b=E2eWAEAydH6AoHrj6eQXhMBiaOMfiuPcY6CRnGfWmtOt+UzOfKLnozU5wIKaCEm7WNBPPf
	dveg3R1fP1okMXf163Ss6PQxTo8Om2PP1tJsFJRRLChDtvft8XiCZaFSuLUMu6wNj4FsZt
	K6FwVL8ZsrKKaROKYdi5s4FK/tL8JmI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-504-f22UFDI9M0u3KOfjH-6Xkg-1; Thu,
 30 Jul 2026 16:30:40 -0400
X-MC-Unique: f22UFDI9M0u3KOfjH-6Xkg-1
X-Mimecast-MFC-AGG-ID: f22UFDI9M0u3KOfjH-6Xkg_1785443438
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 76B721800473;
	Thu, 30 Jul 2026 20:30:38 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1AF72423;
	Thu, 30 Jul 2026 20:30:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] drm/nouveau: Fix drm_driver struct/nouveau.atomic
 parameter handling
Date: Thu, 30 Jul 2026 16:28:06 -0400
Message-ID: <20260730203015.1572240-4-lyude@redhat.com>
In-Reply-To: <20260730203015.1572240-1-lyude@redhat.com>
References: <20260730203015.1572240-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: yooxdpxBT_GDTrOEQYwJqf3ckmzLlWIfPhf2-KKppTA_1785443438
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: M2ILBBHB5OZLW3TS4ZQUTTRH5QLM6OSX
X-Message-ID-Hash: M2ILBBHB5OZLW3TS4ZQUTTRH5QLM6OSX
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M2ILBBHB5OZLW3TS4ZQUTTRH5QLM6OSX/>
Archived-At: 
 <https://lore.freedesktop.org/20260730203015.1572240-4-lyude@redhat.com/>
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

 drivers/gpu/drm/nouveau/nouveau_drm.c | 27 +++++++++++----------------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6940e774ace07..95daf2643e1df 100644
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
@@ -744,9 +741,10 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	if (!drm)
 		return ERR_PTR(-ENOMEM);
 
+	drm->drm_driver = driver_stub;
 	drm->nvkm = device;
 
-	drm->dev = drm_dev_alloc(drm_driver, parent);
+	drm->dev = drm_dev_alloc(&drm->drm_driver, parent);
 	if (IS_ERR(drm->dev)) {
 		ret = PTR_ERR(drm->dev);
 		goto err_free_drm;
@@ -770,6 +768,9 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 		goto err_device_del;
 	}
 
+	if (nouveau_atomic)
+		drm->drm_driver.driver_features |= DRIVER_ATOMIC;
+
 	ret = nvif_device_map(&drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Failed to map PRI: %d\n", ret);
@@ -877,16 +878,13 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
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
@@ -1363,7 +1361,7 @@ nouveau_driver_fops = {
 	.fop_flags = FOP_UNSIGNED_OFFSET,
 };
 
-static struct drm_driver
+static const struct drm_driver
 driver_stub = {
 	.driver_features = DRIVER_GEM |
 			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
@@ -1460,7 +1458,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 	if (err)
 		goto err_free;
 
-	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
+	drm = nouveau_drm_device_new(&pdev->dev, *pdevice);
 	if (IS_ERR(drm)) {
 		err = PTR_ERR(drm);
 		goto err_free;
@@ -1485,9 +1483,6 @@ nouveau_drm_init(void)
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

