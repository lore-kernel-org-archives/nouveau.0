Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E9DC5B572
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 20:37:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6DA10F52F;
	Thu, 13 Aug 2026 20:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UsW8eDng";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AFBDA47763;
	Thu, 13 Aug 2026 20:21:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786652489;
 b=UskyeN5yHDQeeq6vcgo2gF98UWKjboQ0f7Of3jUujbNa2kqKtlT5s2jD6FrynPuHloyYa
 HxIanJXJj2YKP1kI8UI5OzvaWQI9/i2Bh+lv7tpF0HV0Poczjff2Bkd/c+pN6AIl7rwFS4i
 13Z4RNUJpIVVAMvntp+ye9KIhjHjtKwmjbjJiPIN/tN3kLWGBB4ETI2KbxHV5p6cldX11rA
 kDUQWChxLA1C/65bGLBAkiDK4pRfh+cnBOX59+uQuLbyu7j+VDrqD/cjllLAXCYItkpqbCd
 KQiHspDybvafM4D3e7VahUecnU7XJztx6THmo5PnDWVsLB01XiBLlsNo329A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786652489; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=a17nsuStiS7IsQuNSpzGOKtORn1O8u7fu4ZIRonx//w=;
 b=iZLwtGAm57Ag3esPavf6o8ocZxL56vok3vDUBsZ6t3RKqle97Tay9igna3dqpfDySOwuI
 yL/MzjwITNB7961RcE93RWiZ51N0RZnD+r5+EK0puh6mUPVNKk/gu6GEFAElQsltwfRhlfi
 k9e7LWAuCt/iN9h/8BHCvO4CkT+jLeunIE4ixh8vkWMwPpRGghzu4VO1sWlNvbgJN+tq8HE
 xLoEAxcmWumUJUgkVkz4BzxAM35VuvFid0jvi/p958E5O8SZN5tJF+jmTRav2wdQwvCuz9U
 gEo+sLhqdaAfwFpWLAMK4Sx7zIsIUGJxyHF/g2V0UgSpPNfjTsyuvE+4nbVw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8C79C476F0
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:21:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAD610F541
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786653465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a17nsuStiS7IsQuNSpzGOKtORn1O8u7fu4ZIRonx//w=;
	b=UsW8eDngyHABjSLzJ5rXxkSGjCcRT+biCEpvGYP7rdB6wv3Fhc5b6s+NyGXsFeo6ewNRNx
	ULMm534D3X6lydHIiOzta0BEBNc5AOXzCuEJ/6HKrsdVxyZa5Bby0uyMNadnhl9mRbVO5T
	JWNaTtgBwzzvpWUxowO34SdWmmyOu8Q=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-cq8hJroVPgSFZFM2-UumdQ-1; Thu,
 13 Aug 2026 16:37:42 -0400
X-MC-Unique: cq8hJroVPgSFZFM2-UumdQ-1
X-Mimecast-MFC-AGG-ID: cq8hJroVPgSFZFM2-UumdQ_1786653460
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6C8B5195608B;
	Thu, 13 Aug 2026 20:37:40 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 09071195DF9A;
	Thu, 13 Aug 2026 20:37:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v7 4/5] drm/nouveau/kms: Only allow enabling atomic
 modesetting on nv50+
Date: Thu, 13 Aug 2026 16:27:08 -0400
Message-ID: <20260813202833.2051778-5-lyude@redhat.com>
In-Reply-To: <20260813202833.2051778-1-lyude@redhat.com>
References: <20260813202833.2051778-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: aHN2t4KMjfOK9k8ykMTemFwpec7sE0XZHQCAFpXxAQE_1786653460
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 24VZ2RX62TCPYO2I6FALPGMMBNYWP7ZQ
X-Message-ID-Hash: 24VZ2RX62TCPYO2I6FALPGMMBNYWP7ZQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/24VZ2RX62TCPYO2I6FALPGMMBNYWP7ZQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260813202833.2051778-5-lyude@redhat.com/>
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

