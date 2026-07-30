Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AD0C55167
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:30:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CB6EB10F09A;
	Thu, 30 Jul 2026 20:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CqJNTSql";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9EB9347511;
	Thu, 30 Jul 2026 20:14:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785442499;
 b=E+u9uky4fQFDiynCPX1uHkxEd6vffZrMIpdbH4cLLgdJQuudxmwDBhiX00rIw6uCBQYE4
 p3OBN+bRMSmVA8H3lKTlwQvKc7DwNX/zSTfZFwqsPFMEwmgPphSNM0SvChjekn08lILG2mi
 DFWh9xVBKMGx7Qnelv0JRFfHznOTGl03+HwWizoXDvJRgK1hq+0HecOmF+q0slKiTFYUA/1
 lpx+s4LY9PBEhlXMX8tV+g6/5I8uVrA2I2UkhurFaKM7L/HBCIIsfbI9vbJ+D36c2YYnBH0
 DqohKqGhz7yCaw/E4ErHRHFULlAogYvQ8DIGSefYSuVo/7EMgjH46AfDxC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785442499; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=a0Vnf4/19USBFTlqv77vYzY2h1S97v1HFhMISx7jNUM=;
 b=DZIxngcWgtyYAtV2QBJl4yLnLcEX+u8qY/hz7G7B+nnq7PNNWuV111CuJ1kxsQ5yOQc3Q
 pUbPbeyFkDrw5qq/IcIBmREcu7nlHyo9SFoxp0CJNPRTg+QPvQ30MbFsJyRWELkT83go4UF
 6FqwuAF8LbLQIs0vogTiAiBE+UTSCHfbH1Z4WO4tLzbsv5xlAzVMR8jNoia3GiorXumJMM0
 Tfhxj+SptHCVj9RxNCiHIqVB47KbH82c4/AnfULxJdRMYPwwyCpFW4dRjbVUFe8R3z6Zlz4
 Kw8fbM2K5C/KPo2zm9pvUJtcdgj1S5lfMBYHgLB+Uu7HeBbooPqOjGsHcQEA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 347444750D
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:14:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 17EE010F094
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785443445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a0Vnf4/19USBFTlqv77vYzY2h1S97v1HFhMISx7jNUM=;
	b=CqJNTSqlqJ1tklZ7u6qEVii/MHktczprgyH/X2+smzrtggnCV0hy/KxctHWrlXd0Tto+Zc
	vc1UWfwRd4xyz6aJBm0tRbpLOgekcgb/AVlMYW8yGs0pKc3rWTvKwvBlX7vMvzv9i4m2dK
	7DlaqHdZF1ius3Ko0cw5ATRKOeXiE28=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-7YKZcPhYPI-VqzRR23q8aA-1; Thu,
 30 Jul 2026 16:30:42 -0400
X-MC-Unique: 7YKZcPhYPI-VqzRR23q8aA-1
X-Mimecast-MFC-AGG-ID: 7YKZcPhYPI-VqzRR23q8aA_1785443440
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A435319539B4;
	Thu, 30 Jul 2026 20:30:40 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 49036414;
	Thu, 30 Jul 2026 20:30:39 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] drm/nouveau/kms: Only allow enabling atomic
 modesetting on nv50+
Date: Thu, 30 Jul 2026 16:28:07 -0400
Message-ID: <20260730203015.1572240-5-lyude@redhat.com>
In-Reply-To: <20260730203015.1572240-1-lyude@redhat.com>
References: <20260730203015.1572240-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: JeSZA0QSb0qEX3ArOJw2br2RzINgpQpYgWEddshHw_Q_1785443440
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: XI2SY4B3K5AG7BZDRC7DALGCUCDVEOCW
X-Message-ID-Hash: XI2SY4B3K5AG7BZDRC7DALGCUCDVEOCW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XI2SY4B3K5AG7BZDRC7DALGCUCDVEOCW/>
Archived-At: 
 <https://lore.freedesktop.org/20260730203015.1572240-5-lyude@redhat.com/>
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
index 95daf2643e1df..80fdedc27189f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -768,8 +768,12 @@ nouveau_drm_device_new(struct device *parent, struct nvkm_device *device)
 		goto err_device_del;
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

