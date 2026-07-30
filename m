Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD58C55167
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:37:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCDA10F098;
	Thu, 30 Jul 2026 20:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BG5zwU6u";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D1BD147528;
	Thu, 30 Jul 2026 20:21:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785442909;
 b=G6GpTIqoytjdBC1t6iJolprs2vHp/TIcD9vtZpHof/k91QXpp6cXDct3YZ9lQqYy3c0Io
 y89EVah2zyF4A5a93kpWcTkOz+Qs5EHB0JIFiHfbU6UC5SNkVGhp5csAgjzJlQ5TTOcTuxE
 ZAZtN7QJOOwIjiS3toyhLYowKAOBbsOEvvXEd7CHRuRjTzHP+nj9SPd0QeJB8ipHJSjl+ga
 wsOs9KnbFvhY8hH+YYt77lxZKCxj/NgpPZ1p6SGvZNrgJ1uQYw3GOah2J4XiFFxGmAK98D7
 Gi0eT+UjNh7DJ7TLDk7qRwZHY0wHaREFbImjESPp1SALELL4BdtA9XkbwaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785442909; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2gwla5Iow9keC3LIa++F5i/nMXpP28FwdNmiA+kgV98=;
 b=dLqEMH/P1Ex1KYi6HFSs9pPYRyjXABBgdeI9qr90DGdgOLQJyC4uPbNAkWc1uGUozZ5l+
 RBXaapHenZ2xt/9DErR+hSvYAxA1T3kspHTAqM+ClSdiLldMB5ckp3G0WvNaLNnlEEWg9lj
 lonS1Twet2K45LTNSrj3Ev3lbA34/FIcykx6E2uw8xqq598NgH6877p2Nti66OhA3i1bous
 kG+Bb8TM/mGwYwmx9K8/E49cnOOwFNBho/GLxo60R56HBz+iaHSXn5eItcOy7Z5SBiw12E5
 oPERhiQ6shoWcNQUoxDWALthy8repHF5wqN8zw1Ys135cDFcc7+rQyZxzJYA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3398347525
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:21:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 193AD10F096
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785443855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gwla5Iow9keC3LIa++F5i/nMXpP28FwdNmiA+kgV98=;
	b=BG5zwU6uvel7WR+FyxTb5sVdiZqAn9H2AK+YMX2+8dQVc8aQlFpesIO4cEsgHA72eIATxz
	c6h7cv9qBJeDXr8eRQsvpybM7UIAzsudyXTnf6roNkIM5SV6PwyZa+uOcYwCyeT/BWXkMF
	fAJi5SYwT5tPy4YWTwqiJi7g9h0KemQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-Mq-bKcKsOxCWWGUa05cpww-1; Thu,
 30 Jul 2026 16:37:30 -0400
X-MC-Unique: Mq-bKcKsOxCWWGUa05cpww-1
X-Mimecast-MFC-AGG-ID: Mq-bKcKsOxCWWGUa05cpww_1785443849
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 52E70180047F;
	Thu, 30 Jul 2026 20:37:29 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A4F9B1956089;
	Thu, 30 Jul 2026 20:37:27 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] drm/nouveau: Fix cleanup bug in
 nouveau_drm_device_new()
Date: Thu, 30 Jul 2026 16:36:09 -0400
Message-ID: <20260730203723.1649433-2-lyude@redhat.com>
In-Reply-To: <20260730203723.1649433-1-lyude@redhat.com>
References: <20260730203723.1649433-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: h7gm715e0QR3rILoWC1BJaYlX5ygYsrpIWwXlvE1E8Q_1785443849
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: NRBLHFGXJXHROKAW5AQJ5N4WEAZPAKLE
X-Message-ID-Hash: NRBLHFGXJXHROKAW5AQJ5N4WEAZPAKLE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NRBLHFGXJXHROKAW5AQJ5N4WEAZPAKLE/>
Archived-At: 
 <https://lore.freedesktop.org/20260730203723.1649433-2-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Sashiko caught this while reviewing the patches for enabling atomic by
default - if we fail to allocate the DRM device pointer, we'll attempt to
free the error pointer that it returns rather than the actual struct.
Let's fix this while we're at it.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V3:
* Don't use devm, that will just break during unbind (Sashiko).

 drivers/gpu/drm/nouveau/nouveau_drm.c | 28 +++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4d1ad718e09b7..3dfe21cd4bde4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -749,7 +749,7 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	drm->dev = drm_dev_alloc(drm_driver, parent);
 	if (IS_ERR(drm->dev)) {
 		ret = PTR_ERR(drm->dev);
-		goto done;
+		goto err_free_drm;
 	}
 
 	drm->dev->dev_private = drm;
@@ -762,39 +762,43 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
 			       nouveau_name(drm->dev), &drm->_client);
 	if (ret)
-		goto done;
+		goto err_device_del;
 
 	ret = nvif_device_ctor(&drm->_client, "drmDevice", &drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
-		goto done;
+		goto err_device_del;
 	}
 
 	ret = nvif_device_map(&drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Failed to map PRI: %d\n", ret);
-		goto done;
+		goto err_device_del;
 	}
 
 	ret = nvif_mclass(&drm->device.object, mmus);
 	if (ret < 0) {
 		NV_ERROR(drm, "No supported MMU class\n");
-		goto done;
+		goto err_device_del;
 	}
 
 	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", mmus[ret].oclass, &drm->mmu);
 	if (ret) {
 		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
-		goto done;
+		goto err_device_del;
 	}
 
-done:
-	if (ret) {
-		nouveau_drm_device_del(drm);
-		drm = NULL;
-	}
+	return 0;
+
+err_free_drm:
+	kfree(drm);
+
+	return ERR_PTR(ret);
+
+err_device_del:
+	nouveau_drm_device_del(drm);
 
-	return ret ? ERR_PTR(ret) : drm;
+	return ERR_PTR(ret);
 }
 
 /*
-- 
2.55.0

