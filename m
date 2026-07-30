Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD77BC55162
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 01:08:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DDE1310ECFD;
	Thu, 30 Jul 2026 01:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TmJ8GOQn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 804FE474C2;
	Thu, 30 Jul 2026 00:53:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785372788;
 b=ye6D/FHmWFM2SUJbsXlyAhOaHvU8/BU7FQr5XBWSzFru/gFSyeZAG+YGABp1+YVhFvajr
 o80kp3beFVd0kbEukIE/8D/92aR5GHu5E8spFSETPlpVIX1KGq9xan4SIGD6moUBOpfFcGp
 cl4Jnh9zFNnXw2w6kpq+Gugqye2eD9X33cXbF5Q4//2/osCFoYKVOsBbL7S75IwRbYM0FSK
 TcKIFrrBeyZ9q1TppTTrgHPdxD2AMoCMsYfuTT+9DbWpE3gQAKJt6Q133NgwlzKSNa/qL9q
 B05QN/Q2Gqt/RpoKqi2/WQPvgFNyyRJ7pFfusydcB2z6xyj88TinE+MBVB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785372788; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SkWNKPrbSggGlE5xxJvOBDKhVHqxI+6ofz9WoGQEXGM=;
 b=XmC3/L1COVfOqlqfMW+yNgTGKBKXgr68KWAzfE6kuCNf7EcGDBRfqodzwcaDlOyEFbPdX
 oXN+V/GoqYWs+GCRhfDHh/GkbMW/VN4cgQcOPosSTvzTuMEnlCRf/jzlGC45w0jJ0vlh/Ez
 L1JOhtG7zRlPJg5d9jMJhWkJRGdtecW35TbujKEsA75qFTY+qk0lI5OgDbeuE7VfvKdABbA
 fuvK3vzR5+cWd+3iNQS6zhWKXirnUlmNzY1Mf8yY5TO3l/cQxHrwYqHrz86h4so5ch0z6JH
 rc7JeayIZ/PK14hrIxxt2FF/G29rQ+M9XMQaugmZ9LS7ULDxOLigSHm4SpAQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0D7CA474C3
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 00:53:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2517810E63E
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 01:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785373732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SkWNKPrbSggGlE5xxJvOBDKhVHqxI+6ofz9WoGQEXGM=;
	b=TmJ8GOQnWFoFJ8YstpXhhNtXNLRbxH1eMnetOVLFfWq+iAXZkVuRTCJGrzz1IbGlZcfaqK
	+gtyH8JNh5Rs0aZ9mXfSzeF2e67Pz0G6N0Qng9gjn7GjLTPLxcRcodl5Axq7gfa8+YhBGE
	w2uIucbtb7zWMSnTW9ezb40EYW/Kz4c=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-ECZ0wZzkPP6lq68OyepV0Q-1; Wed,
 29 Jul 2026 21:08:50 -0400
X-MC-Unique: ECZ0wZzkPP6lq68OyepV0Q-1
X-Mimecast-MFC-AGG-ID: ECZ0wZzkPP6lq68OyepV0Q_1785373729
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BC53C195608B;
	Thu, 30 Jul 2026 01:08:48 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 46DAD1800480;
	Thu, 30 Jul 2026 01:08:47 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/nouveau/kms: Check nouveau.atomic parameter after
 nvif_device_ctor()
Date: Wed, 29 Jul 2026 20:56:08 -0400
Message-ID: <20260730010828.1056397-3-lyude@redhat.com>
In-Reply-To: <20260730010828.1056397-1-lyude@redhat.com>
References: <20260730010828.1056397-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: -9Cy-1JWfvnaQ6Y4iyq7xNhMNxnAKuaMi2tqRxYAmAM_1785373729
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 5D3K2HIBWURQROEBLGZIUYAZCE24G5Z6
X-Message-ID-Hash: 5D3K2HIBWURQROEBLGZIUYAZCE24G5Z6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5D3K2HIBWURQROEBLGZIUYAZCE24G5Z6/>
Archived-At: 
 <https://lore.freedesktop.org/20260730010828.1056397-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Waiting until the NVIF device is ready is preferable, as this will allow us
to factor in the chipset generation into whether or not we enable atomic by
default.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ad693d2849bec..8899f009f825e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -727,7 +727,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 }
 
 static struct nouveau_drm *
-nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
+nouveau_drm_device_new(struct drm_driver *drm_driver, struct device *parent,
 		       struct nvkm_device *device)
 {
 	static const struct nvif_mclass
@@ -770,6 +770,9 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 		goto done;
 	}
 
+	if (nouveau_atomic)
+		driver_pci.driver_features |= DRIVER_ATOMIC;
+
 	ret = nvif_device_map(&drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Failed to map PRI: %d\n", ret);
@@ -879,9 +882,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 
 	pci_set_master(pdev);
 
-	if (nouveau_atomic)
-		driver_pci.driver_features |= DRIVER_ATOMIC;
-
 	drm = nouveau_drm_device_new(&driver_pci, &pdev->dev, device);
 	if (IS_ERR(drm)) {
 		ret = PTR_ERR(drm);
-- 
2.55.0

