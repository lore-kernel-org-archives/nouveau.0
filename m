Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9A8C54FCD
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 01:09:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF9D10EAF7;
	Thu, 30 Jul 2026 01:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Hh33Sn71";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BF00B474C2;
	Thu, 30 Jul 2026 00:53:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785372793;
 b=a2Vp+hd5zVTeEB6602UC81/rYAwQPicMH6rahA8YS5LLLtgzFAQQuvI/hbfFNo0ejK67H
 b05475noEYN44PD/LLpJyt+kEmXlP17leKVkOB6+K1MFaVY8Qm8AT+MLst4iITTnV9mWiVo
 qixLcsNnFWbITZItE2O9aQLYoAeW6hTf7gGuUWiQgcNv40o5ogRGXQnclG1f+PXbCZUC2C0
 t2j4jAMzWRjucVgQAPRwg08Gie4JL7P1Dli+YmAgzefsoAD7Ciughln/NF4YzjPVv2J1bqy
 UU9cfu1FSkGVS5PvZjyj/8UwtXIHifGlqteRayGSEz1/Rj2grQZYurbRBc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785372793; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=z0K9Lp7UADP4wYPa/RXQEAJmBrdbhPM47EDJUICqwMY=;
 b=JUH+0fSrpBHKYtYzbKjVSfe7u0+xWWkWiEzlrfWzEn4/QltDmSJ9kLxwUNfzZnh9Fm4OT
 8vmpjALRmVkxDRGssslujfMRg2Zmi14l7GRFxooeAn8TX5xMNu3xXRTjznJS1bPUe1LDhuz
 2ngQEOZs/4R1qCBnQ5zbJl0/KpCTfu0OeiXECopF2UXWzy0CYnaGCpanA8LlWqZTOkqlX6j
 HvO70lWNSqBhG5eVnVNaMiecjO0x9dTNTrygWKmGghiiBIJOG3lpt7y7vl2I4fd1avVfGqo
 keKQ8qdEyBKOQ2vHP1w1hZuCJuUhqzRMqqcd+UV11wuzQFsA6Xee/y5JKgvQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B061646ED6
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 00:53:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D303110ED0E
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 01:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785373738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z0K9Lp7UADP4wYPa/RXQEAJmBrdbhPM47EDJUICqwMY=;
	b=Hh33Sn71hyp/sbm0RaDbJw0ggAOUWTdPuAD5L5PNOZDNJWQPHWcBW4d89r22qsakDRssny
	7IAJrsLCcPsGjcfCWRmrULnRheGkBUmz4pB8hX29fKcpl+8dDeYUv2f43G9g+2PkrH7C7+
	oE50K3MwG3/VaYayIEovhIKOzNDcM38=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-459-SFKlX7xCMDyb1dhJO8kbBA-1; Wed,
 29 Jul 2026 21:08:54 -0400
X-MC-Unique: SFKlX7xCMDyb1dhJO8kbBA-1
X-Mimecast-MFC-AGG-ID: SFKlX7xCMDyb1dhJO8kbBA_1785373732
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AE9A219560A7;
	Thu, 30 Jul 2026 01:08:52 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 59D3B1800480;
	Thu, 30 Jul 2026 01:08:51 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] drm/nouveau/kms/nv50-: Enable atomic modesetting by
 default
Date: Wed, 29 Jul 2026 20:56:10 -0400
Message-ID: <20260730010828.1056397-5-lyude@redhat.com>
In-Reply-To: <20260730010828.1056397-1-lyude@redhat.com>
References: <20260730010828.1056397-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: XnL1iETzfkqmrwW0-ljeODluAl8Fp5nF-yDDmDJQc-o_1785373732
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 6N4QXKREEKXDJAQVR4EBQGNZCP2SEN7U
X-Message-ID-Hash: 6N4QXKREEKXDJAQVR4EBQGNZCP2SEN7U
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6N4QXKREEKXDJAQVR4EBQGNZCP2SEN7U/>
Archived-At: 
 <https://lore.freedesktop.org/20260730010828.1056397-5-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Nouveau is one of the very few modern hardware drivers in the kernel that
doesn't have atomic modesetting enabled by default, in part because when it
was originally written by Ben there wasn't much in the way of good atomic
modesetting clients to actually test things out with.

Nowadays however, atomic modesetting is very much the norm - and support in
userspace for non-atomic drivers is starting to bitrot a bit - leading to
its own set of issues. At the same time, many of those issues are fixed by
just turning on atomic in nouveau. Plus, I've been running nouveau with
atomic modesetting on by default for most of the machines I work on, and
I've already fixed quite a number of issues to the point where things seem
quite stable (excluding a single screen flashing bug on my desktop, which I
am not particularly convinced has anything to do with atomic modesetting).

Now that we've protected against breaking things for chipsets where atomic
isn't supported (<nv50) - let's enable it by default on generations of
hardware that support it. We'll leave the module parameter around for the
time being, as turning it off may be helpful in the possibility that we hit
regressions.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index b959d79f7e1c7..5580ac9c782ba 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -103,8 +103,9 @@ MODULE_PARM_DESC(modeset, "enable driver (default: auto, "
 int nouveau_modeset = -1;
 module_param_named(modeset, nouveau_modeset, int, 0400);
 
-MODULE_PARM_DESC(atomic, "Expose atomic ioctl (default: disabled)");
-static int nouveau_atomic = 0;
+MODULE_PARM_DESC(atomic, "Expose atomic ioctl (default: auto, "
+			 "0 = disabled, 1 = enabled)");
+static int nouveau_atomic = -1;
 module_param_named(atomic, nouveau_atomic, int, 0400);
 
 MODULE_PARM_DESC(runpm, "disable (0), force enable (1), optimus only default (-1)");
@@ -770,10 +771,10 @@ nouveau_drm_device_new(struct drm_driver *drm_driver, struct device *parent,
 		goto done;
 	}
 
-	if (nouveau_atomic) {
+	if (nouveau_atomic != 0) {
 		if (drm->device.info.chipset >= NV_DEVICE_INFO_V0_TESLA)
 			driver_pci.driver_features |= DRIVER_ATOMIC;
-		else
+		else if (nouveau_atomic == 1)
 			NV_WARN(drm, "Atomic modesetting not supported (needs nv50+)\n");
 	}
 
-- 
2.55.0

