Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35658C5516D
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:46:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 104B710F097;
	Thu, 30 Jul 2026 20:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="La0wFl86";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D06A54754F;
	Thu, 30 Jul 2026 20:30:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785443439;
 b=EbY9K5cZizzbwy+18zFVqnpHl5BUB2qI3W7BS5R4aKtzTzC5Wfj9IYaJ94UgS/o8duH9x
 iawC8s7x/S+/nyMSxMpE96IQrbBc9oVEw6Tgg3yZ/8KWvNrJyP4COEwbrS42UrKzQLp4qT5
 szBPTmRM7ox6V8L1dwpZmVDZgG01PFhD20YMYfMrYpDy/OV/coKGJhBqC28UKP6U7Qlh1Xd
 jq0ac90vLSwHRCADzNk9p4oHoHzHmpiCRBmRszNonKDS2naks8iq6L1M8NLQL1g3aY3oX4C
 e1fBMvG6duJZKTU34MDntv7YNs+pHNIP22jv6ELLhnwjGzdhrte1UrAiT0Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785443439; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iHo1fNYCfA2pUUad8d3A7yhR0sK0qRAEvCx1qYV41lo=;
 b=o2INwKt1AY+UdQJhcYiZGc3Y2gZiXC0VJdbJvyGjH5yQd3wnQE9ucliYbfiW3i3Jty+JC
 oLlOnyu/UwFhZqBrIF/Du15TAV3a64BuO1xZHslbBdOTBgMdG2xiw8/kVvbpdplxCE6NKIo
 Wn6RgZnScwHkFJ0J6kL91MLslhx4yPY3UcX6RRzJF1nNKyIM/ihxIHuGRJoIDCOZwTq3SDy
 S2Rp1rqbAa44W899xpxv0JbEsqDEJ5Zmi6kFUan95QFr9KLTa7zIwH1MOszeSYDJPddCjQP
 Is5STA0EwmU5/143AGEHVfKqjs2uQYJbNzxUfCG2MPeTobCou+j4SeVqhIGA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CFD0047529
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:30:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C34C710F093
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785444385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHo1fNYCfA2pUUad8d3A7yhR0sK0qRAEvCx1qYV41lo=;
	b=La0wFl86l4IVPc/zxzilB0l34htqUElHWG4Zzyzwb0OjPUdF6aqr98REo1Tl0GUGecyx1Z
	D7rEy+LBN750quac4T+c4H1r+ln5aFDGBhRNfnn2IaZCO0DVwj50fl/ohciGR9Gd1y9AqC
	ahItG60/p1NSBlhWKPbK2i2XVjlchrY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-w2pNU1gBMUaRYzW82OLINA-1; Thu,
 30 Jul 2026 16:46:21 -0400
X-MC-Unique: w2pNU1gBMUaRYzW82OLINA-1
X-Mimecast-MFC-AGG-ID: w2pNU1gBMUaRYzW82OLINA_1785444380
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 40B33180044D;
	Thu, 30 Jul 2026 20:46:20 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0671D1956089;
	Thu, 30 Jul 2026 20:46:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/5] drm/nouveau/kms: Only allow enabling atomic
 modesetting on nv50+
Date: Thu, 30 Jul 2026 16:45:09 -0400
Message-ID: <20260730204604.1729505-5-lyude@redhat.com>
In-Reply-To: <20260730204604.1729505-1-lyude@redhat.com>
References: <20260730204604.1729505-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: D5MBh04KgPVgjJv2G2w5SOKJPZfQKM0-iu00yFtJzzY_1785444380
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: X3I4LPDRBM3WCMZENLRQBNJMH3LQEKCM
X-Message-ID-Hash: X3I4LPDRBM3WCMZENLRQBNJMH3LQEKCM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X3I4LPDRBM3WCMZENLRQBNJMH3LQEKCM/>
Archived-At: 
 <https://lore.freedesktop.org/20260730204604.1729505-5-lyude@redhat.com/>
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

