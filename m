Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301DCC5CFDB
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 20:37:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C435E10F52D;
	Thu, 13 Aug 2026 20:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EBFQaVao";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5CFFE4775A;
	Thu, 13 Aug 2026 20:21:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786652479;
 b=BeUt3KZxc8n9ItuMXCsNSWTSJAhPlxfAo0q9b2T17+XCnzTMCs1AE5tBHinf9v3zQvi5Y
 9xkcnI0hryPciGWqUJbVHUk0GaiPOWEKNOv42HwLi7kZZZNwUN3d8Ixyn9nb/TZWrBOuTH7
 qi1iFWcSON4Sr0Wlk+GkcuCZhgWTYp/5+i5jolLOZMFg2zyjRqKlQJ0nb22VGWMga7tmHuq
 GFXSGfNn6B9zoipkq5dpZ+4IEdlLydWZh2uXxgimIpCB+XtBvtpCKJFszgZ6uLSNUNdX7nn
 srqCrNu0FuTR4eLtwfmen3LK5D/NSdPY7xP7WkFvxrTi0+hBkXbyf2D5u7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786652479; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HM8zvcL/8EecJPDVQT6aSutYylxT/HBspErHsI6olAE=;
 b=sIgTrvQYifX8eCu6EHVIfFWnDaJTe8GWbRQR1hpnmG1f0exUvFEBbmEVAsWqWaTtr5GfV
 J6Dqh/PqAIM92CeVBhXJ8G4NoANkZ/FPc12EyW7/HoUBUrM3QamQL3h499YMbiNtZUFZyjd
 JV6iPqt90MeKG8uTPEjFlthb6ySEuI7XpdBlc0j9jB3symN5r2dT9BAw0ndQotjxx/G1yHD
 XuW5IqkJS4fOm9QjPmLQTJgUsaGwzAbKP3+nprbETCLeFNpFdTMiZQx5IDelpK5YLAD7FrJ
 RTdJX9Z5qI6a9fHP1eKZkvZD9AeUI9lSuEDcoo7mApzquH8NtyuB7V9JJK3Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 44540476ED
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:21:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4173910E536
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786653456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM8zvcL/8EecJPDVQT6aSutYylxT/HBspErHsI6olAE=;
	b=EBFQaVaoZIMBCAU5tDaqdVwTAji9ebUU69P9Nd5IUNyRwSUOD7zbgrDaEQwA9Tz2THFejd
	2z+fRHYrXR2GTo88VSOI+9GPWqpS+ADMX3AonzlW+NmjEbuhhYwTWigw9Maq9QRRsY7rh3
	HeRLK1TetGlnRlNYr+l8BZS42103eiY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-99-eDDONp3vPnOKQGD-nX5b4Q-1; Thu,
 13 Aug 2026 16:37:35 -0400
X-MC-Unique: eDDONp3vPnOKQGD-nX5b4Q-1
X-Mimecast-MFC-AGG-ID: eDDONp3vPnOKQGD-nX5b4Q_1786653453
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6B3611956096;
	Thu, 13 Aug 2026 20:37:33 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CD5FC195608A;
	Thu, 13 Aug 2026 20:37:31 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v7 1/5] drm/nouveau: Fix cleanup bug in
 nouveau_drm_device_new()
Date: Thu, 13 Aug 2026 16:27:05 -0400
Message-ID: <20260813202833.2051778-2-lyude@redhat.com>
In-Reply-To: <20260813202833.2051778-1-lyude@redhat.com>
References: <20260813202833.2051778-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 4RYQLCh3Oce5CBwfI8zPHLFDIhdnHsqDl7IzmLtfWN8_1786653453
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: NS3GYDBLOQHVKELVRS4L5YA6JG5CZ5HX
X-Message-ID-Hash: NS3GYDBLOQHVKELVRS4L5YA6JG5CZ5HX
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NS3GYDBLOQHVKELVRS4L5YA6JG5CZ5HX/>
Archived-At: 
 <https://lore.freedesktop.org/20260813202833.2051778-2-lyude@redhat.com/>
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

