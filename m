Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB36C5516D
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 19:55:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 775E210EFA1;
	Thu, 30 Jul 2026 19:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K2bknje4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 56697474BC;
	Thu, 30 Jul 2026 19:40:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785440409;
 b=LSQ0kQ36WTyUqt5+3vmgdpuEN43vA5PpFj1ClGdcV9iHUnIKamQOd+AKXZ68E0TIyNnyz
 MkbLpNcy/V5NrAo/iFJdm+vLqd5HIVCY0r3REfy8Qos7hPea5m7GjYS7MB+aYZYyF0q2Zd+
 qLkoyrxk8YrplPu9xGNt2l01iKXKl0+sxNWuGBTZPuHJc93CvkCZBH79dykRUKez25DymYp
 gATnmD4FJWVK8OvhjFZE8fD7vfvBkv0+apQPi7cqinqIdAr8TiVyhMwJXs7DcKjJHQFgUhq
 CkwDbk2i6lARoD+vaaEtokpmnJ62IsJbFcfH5Raol2mxCF26b+GretJjzYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785440409; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/pz8u2PCNU3eOGp8lK0CAqX+n/JHdMOCrvaZNNO/A7E=;
 b=Bmwxn8GP5UiuD36GAM4+8v0K8TKOjAjnMZjFY7xfY1A96mzmSbYUI5Jfrcmv5M7Mf08d1
 3H655r9DBkGE5edYEoDyyjaL/NM+opQgN57g38YQNWxsUwngkXIE0GVGfbdU28Kr1xnYs11
 rEasE+rF2eU2RnOQsU4pu0epXDx1M04ZEZ8vP3MLtZVIWuku4aq8WNBtFdKTYRpNFKvqY6i
 MxNAKP8Bd6naVzDQISvlnZpqo8rxOQij/DalovOINYL7BFqsXMjWX53jDp/uIEA0EUkZeyf
 BFqxFHDAlth5sAfF6lnuy7gBC1Kx0kpTRTJvgrpxsJTQnsB2fIKft2dVNYfA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DBC4B45288
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 19:40:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B5D9710EFB0
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 19:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785441353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pz8u2PCNU3eOGp8lK0CAqX+n/JHdMOCrvaZNNO/A7E=;
	b=K2bknje43FsaPGjCU7erXtaCl47uMvP49UqnIdW4DOKjZ47BFhLRFdFFv0MtZOV+QIlTZ5
	wi1SnmIOqXfcFLvCduK1wTdYuW24TrsIB7XtDblRPwboIBPrEHRsUt3K8AsfwBtzSrrCjZ
	x43fKasu3qnmDBjRsfhATyPEjI0E9wU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-35-zPNRc_WzMX2CG44a7SXSSQ-1; Thu,
 30 Jul 2026 15:55:49 -0400
X-MC-Unique: zPNRc_WzMX2CG44a7SXSSQ-1
X-Mimecast-MFC-AGG-ID: zPNRc_WzMX2CG44a7SXSSQ_1785441347
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CAA58195609F;
	Thu, 30 Jul 2026 19:55:46 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 59EA4423;
	Thu, 30 Jul 2026 19:55:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] drm/nouveau: Fix cleanup bug in
 nouveau_drm_device_new()
Date: Thu, 30 Jul 2026 15:51:05 -0400
Message-ID: <20260730195523.1467423-2-lyude@redhat.com>
In-Reply-To: <20260730195523.1467423-1-lyude@redhat.com>
References: <20260730195523.1467423-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: Fs-XdeOlQO6WTXJIlI-5LvkIqGMJjapecs5len8RFxY_1785441347
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: FEFZFW4ND45OWIGSXQCMXFPSQDBS4WOQ
X-Message-ID-Hash: FEFZFW4ND45OWIGSXQCMXFPSQDBS4WOQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FEFZFW4ND45OWIGSXQCMXFPSQDBS4WOQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260730195523.1467423-2-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Sashiko caught this while reviewing the patches for enabling atomic by
default. Trying to fix this properly would be a bit of a pain, and we're
going to be adding another pre-DRM allocation here anyway. So, let's
instead just convert the initial struct nouveau_drm allocation over to
using devm so it is freed automatically.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4d1ad718e09b7..9570850656126 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -723,7 +723,6 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 	nvif_parent_dtor(&drm->parent);
 
 	mutex_destroy(&drm->client_mutex);
-	kfree(drm);
 }
 
 static struct nouveau_drm *
@@ -740,17 +739,15 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	struct nouveau_drm *drm;
 	int ret;
 
-	drm = kzalloc_obj(*drm);
+	drm = devm_kzalloc(parent, sizeof(*drm), GFP_KERNEL);
 	if (!drm)
 		return ERR_PTR(-ENOMEM);
 
 	drm->nvkm = device;
 
 	drm->dev = drm_dev_alloc(drm_driver, parent);
-	if (IS_ERR(drm->dev)) {
-		ret = PTR_ERR(drm->dev);
-		goto done;
-	}
+	if (IS_ERR(drm->dev))
+		return ERR_CAST(drm->dev);
 
 	drm->dev->dev_private = drm;
 	dev_set_drvdata(parent, drm);
-- 
2.55.0

