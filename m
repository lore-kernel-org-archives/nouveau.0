Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C03C5B572
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 17:44:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB4610F4B8;
	Thu, 13 Aug 2026 17:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zz4cM9M6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6CC4347737;
	Thu, 13 Aug 2026 17:28:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786642105;
 b=slLqfiOkf69CRmoT/j52xMPt0rgfaaMcMJYO8N4FwaM8bIQy0TyRlkF0bmEzWqI55b/Cm
 tYWXCeidAm87jx+KPk7VXXt2H2CEjj1QDJUqr7nmVKXNLGVkz+xdMcVBtFlVGIvtNNHzaSs
 /pQ0nHlFHa+AXdlnoR2HKMRxtq6sIecUjIHzuyqNl85vRW3ftzKRN8Z7KH81f9cJpYjcmcN
 ObkRGmA4WvSbm5jgpQ+1jptaNO9DIvfKo14GnlmoyF7v8X6JjjOXGG45vK0WHBOpE20lO1g
 8ZihaG0PM58YFJRHcAJhv7p7zDzTu5recBXJpUhoHjzM2Y+4Pf6t7dB3gYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786642105; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=a17nsuStiS7IsQuNSpzGOKtORn1O8u7fu4ZIRonx//w=;
 b=Fp+7NIonHT7ibol+222tmlbdU2PXr0YwePWyS4m5X0AiEeAZ0VHX1k5SMuEATSgoCYTA3
 x8DQXPcBNippNxx1DW86SYv7RKU852DkaETcPshNtifHezZF7QIv2UUkiXyCuX3mJUPfC0q
 PTYrPMa1X1D3yLI2MP2KwP7z0s1qh5KXU/AHXWJT+LWg/LZ/qCXlhpgGAa2deVK/BtRWiFz
 rKI/0R7YdRB7V5LOYVRQApmv0E66ygPDgS5CJTqsyik4rxOTlSSFWADbMh6mfGfU6hSm7V4
 c1wKc3vUQ4bLSVFd6/5Rxj6yGtMB4lVdB0m6OquPR/oz8RSC1eq637C0M3rQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7DE0647708
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 17:28:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B33510F49F
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 17:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786643081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a17nsuStiS7IsQuNSpzGOKtORn1O8u7fu4ZIRonx//w=;
	b=Zz4cM9M6mtaX+W0Y5atei/mmGnK7oQeI3lb7+Gtxyw8+mm5uKs1AFph0iRKgRpPg8cQ7Qu
	BWYdqxMQD3AkcQyH7n+kctHt7DHqpxtsxur5ezo5N+VbqYZWCluj7b1kCUcZInvvrE19n8
	CpiTDaPLWPSlC3cUzU0rl633T3YmEEo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-se-oAB3mOCq_R7iWyeTgUA-1; Thu,
 13 Aug 2026 13:44:36 -0400
X-MC-Unique: se-oAB3mOCq_R7iWyeTgUA-1
X-Mimecast-MFC-AGG-ID: se-oAB3mOCq_R7iWyeTgUA_1786643074
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 58AD019560B2;
	Thu, 13 Aug 2026 17:44:34 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9C9D8195DF9A;
	Thu, 13 Aug 2026 17:44:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v6 4/5] drm/nouveau/kms: Only allow enabling atomic
 modesetting on nv50+
Date: Thu, 13 Aug 2026 13:42:55 -0400
Message-ID: <20260813174416.1812656-5-lyude@redhat.com>
In-Reply-To: <20260813174416.1812656-1-lyude@redhat.com>
References: <20260813174416.1812656-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: VaxmTnBEXE26gGpk5wK6IFZ8Wpo9PgAcJbG7wHlRgVo_1786643074
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: HZ32LYOV64FMOVY3NH6BXSE4FFPRZHSN
X-Message-ID-Hash: HZ32LYOV64FMOVY3NH6BXSE4FFPRZHSN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HZ32LYOV64FMOVY3NH6BXSE4FFPRZHSN/>
Archived-At: 
 <https://lore.freedesktop.org/20260813174416.1812656-5-lyude@redhat.com/>
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
V6:
* Check against device->card_type so we can perform the check before
  setting up nvif

 drivers/gpu/drm/nouveau/nouveau_drm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index d021a3049be1a..82a8061e6d3e2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -739,10 +739,17 @@ nouveau_drm_device_new(struct device *parent, struct nvkm_device *device)
 	struct nouveau_drm *drm;
 	int ret;
 
-	if (nouveau_atomic)
-		driver = &driver_atomic_kms;
-	else
+	if (device->card_type >= NV_50) {
+		if (nouveau_atomic)
+			driver = &driver_atomic_kms;
+		else
+			driver = &driver_legacy_kms;
+	} else {
+		if (nouveau_atomic)
+			dev_warn(parent, "Atomic modesetting not supported (needs nv50+)\n");
+
 		driver = &driver_legacy_kms;
+	}
 
 	drm = kzalloc_obj(*drm);
 	if (!drm)
-- 
2.55.0

