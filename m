Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58886C5DF66
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 20:48:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3B310F548;
	Thu, 13 Aug 2026 20:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JU50pzMJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0100147787;
	Thu, 13 Aug 2026 20:32:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786653127;
 b=FrhozuLqGUZi41EyIl3LDNbZaLPjgM8sPW1OeQ2WL34MFmogRUY+7gR/yVnkQ0JcrbFbj
 tsLOvSrzgwJNvrPDN36mk/COXJF5pRTF7ot1maH/Z7cArknoWFf7OtzLC0bi0FDIDbrAQ1J
 d6dqLsx7ulCtG22iNZYQ4GoL+Wmkc5M72RMDlF4MDK/3oLzC1mqnDzy5RbR/LN6oXfgU+oY
 QP0dmW5aTg8q+DvLIKSQhxKZU+wH0bTOvGMjawsBncqXmOA8uE9kz1/TpTbiEI1RckQnV5c
 8+e6QwlCRb8a5VackM6SWll3AYuIdTYr70WJqmw1YpvfM1keim5bCZO9+fmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786653127; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=a17nsuStiS7IsQuNSpzGOKtORn1O8u7fu4ZIRonx//w=;
 b=UZAPmaPF8WjsFSEutd6kJLTlSc6BLtAZS/01PLVvEfwKlIpSjgz0TeEmTTISi7xnfHwFD
 QcttIrGUnus7nTWehltucjc3goGEorMRe9fg9E0p9U+GjBaDfMKNPTAAaAaEZQIA4b/LPA/
 Tc7pzMLjtsrGbeD3xjxoTNf/rHyoySmbf2T8vaox2SDCCwsjh4tgT81O7RGqW2hQMEsjwXI
 AWzSemvAAzUqM5zY9ikSg5mYXfy28m/yOpwCvD553yiOkmiYwpyA+PvAeY6bv9A9pZ2D3F7
 eivZsLPQJ8H7s8Z2B7w9nyhJm1GtGf3dh00gIm4uipzmIL+dPNs9WFzcbeWw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 635484777B
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:32:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4A710F545
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786654102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a17nsuStiS7IsQuNSpzGOKtORn1O8u7fu4ZIRonx//w=;
	b=JU50pzMJMZ/41rMpG9QAPC3nGULXE+s7+iAX9fJSVcFGciLzKOhE5TmcaGjM0CaYe8gyoN
	hlPLvGOCQH/49wvasFb0/8nxbwlTECwV3wHMMkMBIvhvQyAzQz5GyUJOkvgcQyW1hxQnoc
	2rwrYqf5SY35qw6bgxvUNOuJC8Whq1w=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-EyatDvqVOm-8OVPrq4__Gg-1; Thu,
 13 Aug 2026 16:48:19 -0400
X-MC-Unique: EyatDvqVOm-8OVPrq4__Gg-1
X-Mimecast-MFC-AGG-ID: EyatDvqVOm-8OVPrq4__Gg_1786654097
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CB8211956040;
	Thu, 13 Aug 2026 20:48:17 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 597E4422;
	Thu, 13 Aug 2026 20:48:16 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH RESEND v7 4/5] drm/nouveau/kms: Only allow enabling atomic
 modesetting on nv50+
Date: Thu, 13 Aug 2026 16:46:50 -0400
Message-ID: <20260813204803.2097176-5-lyude@redhat.com>
In-Reply-To: <20260813204803.2097176-1-lyude@redhat.com>
References: <20260813204803.2097176-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: MOsybcDcsBjtommfgIMyPUy00NoX0UbWQo7BKIAyNCQ_1786654097
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: CGP4SJC5MUVDOICQKCXITC7DS6K7A6Q3
X-Message-ID-Hash: CGP4SJC5MUVDOICQKCXITC7DS6K7A6Q3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CGP4SJC5MUVDOICQKCXITC7DS6K7A6Q3/>
Archived-At: 
 <https://lore.freedesktop.org/20260813204803.2097176-5-lyude@redhat.com/>
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

