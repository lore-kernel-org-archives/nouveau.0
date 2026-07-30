Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CFBC55167
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:46:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5F19C10F09C;
	Thu, 30 Jul 2026 20:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R7I2ql+Q";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2D1C047529;
	Thu, 30 Jul 2026 20:30:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785443434;
 b=JQp2PL5R7TMV6ZBypl2U9ABxoqPqrUHELK1EjxEHpWRDxvBmNgem+lKPd2kXTKv9NzcJb
 q/+2NDVVkG7bun9Y4GZ9SlcrKK3J7hWLtOQSsmZmDFwWM00196lQtRqkq4Sg62oeQMmlXJn
 W+7JzW8t5UhRCKH3Rdmr0kHjfJaLa0vAdh9YiMXpqQV2zUwesLDoZHtnCZaxCjANSrAKkJz
 ghNf872ESAZryoBGko5ZxkHM3mFmqYKnoQp6ZkrmKf+wmnmjvjsFFlbMh0g2tWTv11qU0BK
 KySqYZFN5vt3OfEYGnNja75Y71bv2xdf90qPFqdC9gaapO72ag6ft7E+RMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785443434; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HM8zvcL/8EecJPDVQT6aSutYylxT/HBspErHsI6olAE=;
 b=zk/JRfdh+ieFztohlx2F35HELuV6H9tiyy7Sbml6miG+Twy96iyuZ9OVse1xGQ9pvIV4O
 sqI7F2uTpzNJuVq3xX+6ei6W/22smWTIhX4UQLvku19X4rxA0WjMrqrwfRPouYKMkdYI3GO
 20VX+MptH4JABPE7qFdSxWRz8GGcaxlW8GfwPgluSFg/zftcS7G46dTnq7nJp6I0MiCuzDo
 q4kG0XcnqlbEhwhFQDh9EhqaWpypNBf/hzJ0DGnGbPY6fvlFo5Zev5WPKMliCS1ca/eHbUr
 +UYhiAVcD7UJ+tgl3MSXK5pyOeEfbceE0UNdQEWYg92JMqngLwlfqCzHLjsA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EAC9A47540
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:30:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D9B2710F08B
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785444378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM8zvcL/8EecJPDVQT6aSutYylxT/HBspErHsI6olAE=;
	b=R7I2ql+QP1MF+Fo42b8bLUIJZEnD/mQZQdGQYHagFSWThTWkeI4YRjBA5pXYc/aJSW/z9O
	6uLs9VhYuaCOWi0g4j+4NhoVqXrhkqFpQlfBmNDxQw5354/n/HQzTCZ5r8WCSAPSrqKonH
	wMKPLV7UtcbUKnqr8kh+j2RwSKt4a0Q=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-326-G3_UlRhPNJCbbYze2ETfPQ-1; Thu,
 30 Jul 2026 16:46:14 -0400
X-MC-Unique: G3_UlRhPNJCbbYze2ETfPQ-1
X-Mimecast-MFC-AGG-ID: G3_UlRhPNJCbbYze2ETfPQ_1785444373
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B54601800352;
	Thu, 30 Jul 2026 20:46:12 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 313DA1956094;
	Thu, 30 Jul 2026 20:46:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] drm/nouveau: Fix cleanup bug in
 nouveau_drm_device_new()
Date: Thu, 30 Jul 2026 16:45:06 -0400
Message-ID: <20260730204604.1729505-2-lyude@redhat.com>
In-Reply-To: <20260730204604.1729505-1-lyude@redhat.com>
References: <20260730204604.1729505-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: dsgb7O_sKgx5QZy8fgvHwyrGzbObHnVJgmnF8OAda5Y_1785444373
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: AZ7YTYCQE6XUFAQDL5XWXK4OEUYAVNRY
X-Message-ID-Hash: AZ7YTYCQE6XUFAQDL5XWXK4OEUYAVNRY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AZ7YTYCQE6XUFAQDL5XWXK4OEUYAVNRY/>
Archived-At: 
 <https://lore.freedesktop.org/20260730204604.1729505-2-lyude@redhat.com/>
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

