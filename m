Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8949DC5516F
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 19:56:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1837B10F069;
	Thu, 30 Jul 2026 19:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ze1Ms3x9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E612D4743D;
	Thu, 30 Jul 2026 19:40:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785440410;
 b=uFr9NcOGls+9lBc2fkQel4//8Bv6AJ0QPwJfyasWpnt2Wpw3cfFwd2xoUgps20lAARMoD
 iN9O+IpJ4hwuXy79HogKRw6oA8tqOwXc1zcIXgBDu7aSackIoVitOmG4X1ni9TIxs3DmT5u
 lWUjQCApUN3bFczigDxy1woOyHvbM5pycJTE/kb1hM3z3tBsrp3D6uLzvHTfiQp5lJ4QTOP
 RgNTPZClv2rFjRcT/O4fXXtgNfv/xoroGEhEq2QN2QknKqDkR/FK35m5NH3IOqr1MuyWWgH
 /tMJiiadeOhcF6f1048LO6U5ADRCKpnYixMMQjY+8lYlK4+PTJPSQON8hPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785440410; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0QCsJvIGOdp8Bwbzkzk6kplLB3t8cjLE/GCGMM34q3Y=;
 b=zfyeY0zssOFOOvgpMOQ9yKTRt3zw713FjBPmtIeuQ4reEGDoWTZZ4rqFLkllS4M8dYA4P
 UtMHJbcFLpxE8mq0mDz3mPM1gOq3AnovLaBZtOnqObIEy5Vk+ONWmAcYGITvCbrWhdnyYbr
 CfyiDvh2anjdauBr5yIPLn8TZWzqB5RtSNJnomJ//jtVUmQXNMuhsxoQUXEB2831B2YAzeA
 s67PqyTG+0MpqliX2us9hcbjSvzgtQPWMLdr1z6MDbkGIwW2id8iImYPLGKyLtF8DUA4RKe
 rzLqMuDJM0htywPd1tj1DHACkQws3SWxkrmct8C7jB3AvXuJUhxpcAcD+oQg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 125FD4716E
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 19:40:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E3A0410E681
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 19:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785441356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0QCsJvIGOdp8Bwbzkzk6kplLB3t8cjLE/GCGMM34q3Y=;
	b=Ze1Ms3x9vXjoRfDyCL9AfeJJVx8cbzog/LwpVGCXVm2aCD9z9ibHLBg6pDIlljQdZ+DHaH
	Hc4sBXiWAHMAa9+2b+FovbFe/INyKNyf+bsuWSqcJOXzQ0gLtNJdDPXYHOA6mZ3AJShI/0
	LtaDGFtQ6YKx4mxWuIS0N+x+ciYGbdQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-DbAJwYDwMrSBLww-MxGrFA-1; Thu,
 30 Jul 2026 15:55:53 -0400
X-MC-Unique: DbAJwYDwMrSBLww-MxGrFA-1
X-Mimecast-MFC-AGG-ID: DbAJwYDwMrSBLww-MxGrFA_1785441351
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BA9271956046;
	Thu, 30 Jul 2026 19:55:51 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2D178414;
	Thu, 30 Jul 2026 19:55:49 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] drm/nouveau: Fix drm_driver struct/nouveau.atomic
 parameter handling
Date: Thu, 30 Jul 2026 15:51:07 -0400
Message-ID: <20260730195523.1467423-4-lyude@redhat.com>
In-Reply-To: <20260730195523.1467423-1-lyude@redhat.com>
References: <20260730195523.1467423-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: Ly65sl20TMXqrzcWvqRtCZLMvt3ULkGiVtCI_SJXghY_1785441351
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: KM5SVEGETEUICKHU5YOMDINIDZXQOJYN
X-Message-ID-Hash: KM5SVEGETEUICKHU5YOMDINIDZXQOJYN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KM5SVEGETEUICKHU5YOMDINIDZXQOJYN/>
Archived-At: 
 <https://lore.freedesktop.org/20260730195523.1467423-4-lyude@redhat.com/>
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
fix this. Instead of sharing driver_pci and driver_platform, we move over
to dynamically allocating a drm_driver structure with devm to use, which
copies the contents of driver_stub. We then convert driver_stub to a const,
and move the handling of the nouveau.atomic module parameter into
nouveau_drm_device_new(), and conditionally add the atomic modesetting
capability to the dynamically allocated drm_driver struct.

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

 drivers/gpu/drm/nouveau/nouveau_drm.c | 30 +++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5565cf2367aa9..ae489dc1b1943 100644
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
@@ -726,8 +724,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 }
 
 static struct nouveau_drm *
-nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
-		       struct nvkm_device *device)
+nouveau_drm_device_new(struct device *parent, struct nvkm_device *device)
 {
 	static const struct nvif_mclass
 	mmus[] = {
@@ -737,12 +734,18 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 		{}
 	};
 	struct nouveau_drm *drm;
+	struct drm_driver *drm_driver;
 	int ret;
 
 	drm = devm_kzalloc(parent, sizeof(*drm), GFP_KERNEL);
 	if (!drm)
 		return ERR_PTR(-ENOMEM);
 
+	drm_driver = devm_kzalloc(parent, sizeof(*drm_driver), GFP_KERNEL);
+	if (!drm_driver)
+		return ERR_PTR(-ENOMEM);
+	*drm_driver = driver_stub;
+
 	drm->nvkm = device;
 
 	drm->dev = drm_dev_alloc(drm_driver, parent);
@@ -767,6 +770,9 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 		goto done;
 	}
 
+	if (nouveau_atomic)
+		drm_driver->driver_features |= DRIVER_ATOMIC;
+
 	ret = nvif_device_map(&drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Failed to map PRI: %d\n", ret);
@@ -870,16 +876,13 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
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
@@ -1356,7 +1359,7 @@ nouveau_driver_fops = {
 	.fop_flags = FOP_UNSIGNED_OFFSET,
 };
 
-static struct drm_driver
+static const struct drm_driver
 driver_stub = {
 	.driver_features = DRIVER_GEM |
 			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
@@ -1453,7 +1456,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 	if (err)
 		goto err_free;
 
-	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
+	drm = nouveau_drm_device_new(&pdev->dev, *pdevice);
 	if (IS_ERR(drm)) {
 		err = PTR_ERR(drm);
 		goto err_free;
@@ -1478,9 +1481,6 @@ nouveau_drm_init(void)
 {
 	int ret;
 
-	driver_pci = driver_stub;
-	driver_platform = driver_stub;
-
 	nouveau_display_options();
 
 	if (nouveau_modeset == -1) {
-- 
2.55.0

