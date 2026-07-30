Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B38C55167
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:30:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 49CB010F092;
	Thu, 30 Jul 2026 20:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eRsGqGEt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 165EA47510;
	Thu, 30 Jul 2026 20:14:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785442495;
 b=qzdqJVpCEqnAfY7HOlb2VPvgz7Ppce3IXrNKRURTMisyQTZs1Y+FNJvhlInTTG5cSzwK/
 8axhSadJoba903QdF0wfirumE4dkAHw9vXiwgXgWlSU3jv7VKo4w8YTYiCRIAqNr8CZTUKB
 JDRZBWbCFZWqJnUAW42ysGdhA5rGeaPAzi1v7Ut79oKAQBJdmuDkov3eyqMCsWsvzHmT1EB
 6ebK/Dn8UkXBMYRtCBO+bA+/A+ZWgeWhlil/bPLkghrpEfGJZ6hSBli3PMafmMD06dCz20f
 VIsaQBHTFZ25xZ2sir8ZGImoEAWV18d4/Loqu3jommljA1c1q0dYFc1FPWRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785442495; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2gwla5Iow9keC3LIa++F5i/nMXpP28FwdNmiA+kgV98=;
 b=HYNL34BwgrttM6VvuDNL5T/In9lSyKqmAJVi6VIj7NJ1DdfLho8S9fqgUfXmUGF59VP5L
 z+w5nl9m5jO5YMn5W/q1r8xtalJekUVsTrLYcdAlsjl9QznO4eql/tkwoFtI8mLYMiKwwH6
 Ay3zHupfjFb+tNIGvTdkgHn0qip4rxnGmREOUFfJDHL+GOQt6nUanVZBF0NKEiRPMZJEhUU
 rNIu+hvzlBqS2s1dblkb8i6r19cXxWWGMfyxqtoz6J5hzWxWePWFLkLmxvsDQqB3k6KvHYI
 fmBXCNkKrhDFKrBZ8VHTov/O7iaY6fpFxfsJ/q9aCw2iFSyyBTwdJmx6DWGA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 14AB64750D
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:14:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E37E810F086
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785443441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gwla5Iow9keC3LIa++F5i/nMXpP28FwdNmiA+kgV98=;
	b=eRsGqGEt+9povWSVdahF2x+5iEJwAnMDHmwwsR61xlNG66mQ0iVp3eR0yCk9ogH6GNzk9K
	o4ia3upB+/CyyBifdRlIBDRiyFcO9gO+UCSwG1UTYD1cskB5kHezo7W2BeUJ/U0HLimSVe
	Jd1495DHetsOv8hMknHIU8Vn3jmNeuo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-S2GJUaIoOX2fLRtAZz4V9w-1; Thu,
 30 Jul 2026 16:30:35 -0400
X-MC-Unique: S2GJUaIoOX2fLRtAZz4V9w-1
X-Mimecast-MFC-AGG-ID: S2GJUaIoOX2fLRtAZz4V9w_1785443434
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1D94D180035C;
	Thu, 30 Jul 2026 20:30:34 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B24CA423;
	Thu, 30 Jul 2026 20:30:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] drm/nouveau: Fix cleanup bug in
 nouveau_drm_device_new()
Date: Thu, 30 Jul 2026 16:28:04 -0400
Message-ID: <20260730203015.1572240-2-lyude@redhat.com>
In-Reply-To: <20260730203015.1572240-1-lyude@redhat.com>
References: <20260730203015.1572240-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: jpCLiq_m2cJbvWrCEsKWq8V_JRIr3UYDTl68P345WI4_1785443434
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 5JXQA3N3HUSJ6XRZJ6OTQ6IHQORLOZQD
X-Message-ID-Hash: 5JXQA3N3HUSJ6XRZJ6OTQ6IHQORLOZQD
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5JXQA3N3HUSJ6XRZJ6OTQ6IHQORLOZQD/>
Archived-At: 
 <https://lore.freedesktop.org/20260730203015.1572240-2-lyude@redhat.com/>
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

