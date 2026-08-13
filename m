Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90ECC5B572
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 20:48:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA9110F53A;
	Thu, 13 Aug 2026 20:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O00O0CTp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 43F2C4777F;
	Thu, 13 Aug 2026 20:32:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786653120;
 b=aBs7XNEuYOuOi8zMFGgYTF22WPEraRbK3pFbB+aFB84v93wrAanqjjVOD7IDnEh2KExtY
 UTRwLYtaXOus2NKbAS4GDndvVIVfUVlOSvSSjBBvVobB5A4Mz8sdk6O74fLveUSJzYm9fC+
 KBnQspxnMSC3Id074zPfx0CRpaZ7C0QFcGRGlVnM1E8fZUYvwI2B0wchGEBtva8G9VPI13t
 GcYgbTaNAuj4H7S5up9F15yhBzCv4oexbCE+Hd00i1/6nYwC85Ck8Mbqrv+ddWaFyTgJCAp
 k4DoZPDMOxo2RZfo/nRiVgx76oYGtSiiMgBDQ8X4/mqVNe0e+FOL+RXAr93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786653120; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HM8zvcL/8EecJPDVQT6aSutYylxT/HBspErHsI6olAE=;
 b=Af1IdI1YrU7tMSoIllqzP5MlrhIVogbNbLxTf6v5wNPXCxZ8xCo3/BNHchsstO72lkMZt
 Frgo+02mezIdSCU+cVRZ85xbSwrsBxp3MVuKT5HnaIK45KNCsrnAPhVd903NY4z19lwhYHH
 aS/bjWJOxvXk5DSXuINSgTG1oQ/lLsLcfP4lXSvmpVzpO++43kx9vrk2ZLq18ypM+TzYYuV
 YkrlornQg+wcf9kw3urMd5t34RvNG6fhdNIy/ZucOIqAzdLifuh4J/6oi437sygUtMaACy/
 rkZmKhaE7iDFUcY7tH3gzFpn9eVv7w+GuDd/6jDhAfSOdb46bPPU2D2YFjaQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 15BE04777E
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:31:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2622A10E084
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786654096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM8zvcL/8EecJPDVQT6aSutYylxT/HBspErHsI6olAE=;
	b=O00O0CTpcOQR7n47i/clMeI4rTGiM4aEtR4DeS54j5XfRdv8YoFV/G8uA4jWf7OeBFyR4a
	i37vMCQUeB2sIxbOc1Aj42oPCYA8tJreIQi5nrvvumuHKP8rLdfGmusItLpJ0g310Z1wej
	tS1XUqau2nUFYs0p6GZccs68uMIXa9w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-59-9pI8yLRPO7ymTwB7_EzK4g-1; Thu,
 13 Aug 2026 16:48:12 -0400
X-MC-Unique: 9pI8yLRPO7ymTwB7_EzK4g-1
X-Mimecast-MFC-AGG-ID: 9pI8yLRPO7ymTwB7_EzK4g_1786654091
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D62F8195609F;
	Thu, 13 Aug 2026 20:48:10 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 02446427;
	Thu, 13 Aug 2026 20:48:08 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH RESEND v7 1/5] drm/nouveau: Fix cleanup bug in
 nouveau_drm_device_new()
Date: Thu, 13 Aug 2026 16:46:47 -0400
Message-ID: <20260813204803.2097176-2-lyude@redhat.com>
In-Reply-To: <20260813204803.2097176-1-lyude@redhat.com>
References: <20260813204803.2097176-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: n16xGlG61jp2_Ipqu4hbcvkvpcxNePxFL6sEJ8-jLq4_1786654091
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 4TEIJJOMPSX7HM4GHENPKH5IS3324DSJ
X-Message-ID-Hash: 4TEIJJOMPSX7HM4GHENPKH5IS3324DSJ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4TEIJJOMPSX7HM4GHENPKH5IS3324DSJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260813204803.2097176-2-lyude@redhat.com/>
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
V5:
* Fix silly rebasing error
* Go back to the old style of error handling since we're not using a second
  allocation for drm_driver anymore.

 drivers/gpu/drm/nouveau/nouveau_drm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4d1ad718e09b7..a348115518ec4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -749,7 +749,8 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	drm->dev = drm_dev_alloc(drm_driver, parent);
 	if (IS_ERR(drm->dev)) {
 		ret = PTR_ERR(drm->dev);
-		goto done;
+		kfree(drm);
+		return ERR_PTR(ret);
 	}
 
 	drm->dev->dev_private = drm;
-- 
2.55.0

