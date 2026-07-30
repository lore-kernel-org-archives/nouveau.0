Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD02C55171
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:37:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B839F10F094;
	Thu, 30 Jul 2026 20:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LptW1p26";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 889754752E;
	Thu, 30 Jul 2026 20:21:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785442916;
 b=xsRNLLW3KB7slYIPI4BzxPXNtTISbp/OanrfaxQiS225R9p5PlpRaetBEPUew1SYDf7CX
 JETvNZ8UbGQ2roWyLPy31jrEqG8VbrhhnbCVp7nYcQprnak4XaqST7al0YvthDEZ0fkQgZ7
 7lc43/q1oB7UZkpfcZBrEZJ8ONXdAZWdXvUIVKVPbWNgdjiD/+51MF6tPBObF/WcMweQslA
 IxN6qvKBTEJU++fSYSbciSOQEahS9K4MwMor463MZ0fUe8AcgF6PYmhI92GPlcdNywKKixJ
 ZBwNKhjK4Sy9Q9FPnWltAGP6X5PX6+89S2m+PXHwC7Yr9pYiIaliSJhT7lJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785442916; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iHo1fNYCfA2pUUad8d3A7yhR0sK0qRAEvCx1qYV41lo=;
 b=i5S+WGCNxxB6nlOGKjE/8yAGTJ0nhNr9Hy8qQ4+/jc2soxcNFPyYtGVbzYDhxVegkFwb9
 0ELjqX2V+mo5boRTcZak5W2J5dDUx0KNSgtS+KMY/bXy8XD3l37TKkNfnjqHFqXHUboXk0S
 tphDkbi27mPOR3JgnD8e4Voa34XyvrMKgGVj+1rJOrA8kqtnB3ZSM4RY9C2VrWbKoWpaUXV
 RBt/YBlXeOAanYVCCZWU2QwDM4Kb4IBkwghaLFHovzX69AlbrsaX6rdEOWedMZJZCBB79S5
 mDlR5LosNc1Vx035QwTyB9i9af4sUbLt7fZDAzt//4F+8QjRW7OKdY8dVf2g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3DA6547523
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:21:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1E210F082
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785443861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHo1fNYCfA2pUUad8d3A7yhR0sK0qRAEvCx1qYV41lo=;
	b=LptW1p26Ps5ND7Fp2H/6TXz34LrDAkb4eHfVEP7Utge2cghkduGJ08DhYO1zLY+EEFsnfm
	6tafqaS174ZDU1qxDdGwrEEIbRFWwiaejE7+ws+Mhs5WVQupppz17sUVGGloHzQIZRf8+Q
	k4utWOzFiF9q4BOskShHGQ0X29O10mc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-hBIIakE8NRWWlgVShU2ANA-1; Thu,
 30 Jul 2026 16:37:38 -0400
X-MC-Unique: hBIIakE8NRWWlgVShU2ANA-1
X-Mimecast-MFC-AGG-ID: hBIIakE8NRWWlgVShU2ANA_1785443856
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 705B019560A1;
	Thu, 30 Jul 2026 20:37:36 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F25B71956089;
	Thu, 30 Jul 2026 20:37:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] drm/nouveau/kms: Only allow enabling atomic
 modesetting on nv50+
Date: Thu, 30 Jul 2026 16:36:12 -0400
Message-ID: <20260730203723.1649433-5-lyude@redhat.com>
In-Reply-To: <20260730203723.1649433-1-lyude@redhat.com>
References: <20260730203723.1649433-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: fE87IckCQFZQqcKCIEFGu3abD2Z7js2uvLGVsX4pLKw_1785443856
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: M2BRVOD6YNGPNHTBT5V23F3VXBOVUIBJ
X-Message-ID-Hash: M2BRVOD6YNGPNHTBT5V23F3VXBOVUIBJ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M2BRVOD6YNGPNHTBT5V23F3VXBOVUIBJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260730203723.1649433-5-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Atomic modesetting support was never added for pre-nv50 chipsets, so make
sure we don't allow it to be forced on. Additionally, print a small warning
when it's not supported.

Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Check against info.family, not info.chipset

 drivers/gpu/drm/nouveau/nouveau_drm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 9cd12ebc7e449..bfe9d6fe450a5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -769,8 +769,12 @@ nouveau_drm_device_new(struct device *parent, struct nvkm_device *device)
 		goto done;
 	}
 
-	if (nouveau_atomic)
-		drm->drm_driver.driver_features |= DRIVER_ATOMIC;
+	if (nouveau_atomic) {
+		if (drm->device.info.family >= NV_DEVICE_INFO_V0_TESLA)
+			drm->drm_driver.driver_features |= DRIVER_ATOMIC;
+		else
+			NV_WARN(drm, "Atomic modesetting not supported (needs nv50+)\n");
+	}
 
 	ret = nvif_device_map(&drm->device);
 	if (ret) {
-- 
2.55.0

