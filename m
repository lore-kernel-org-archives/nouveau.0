Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B96C5516D
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 19:56:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C5E3C10F031;
	Thu, 30 Jul 2026 19:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R4UhSUbl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A18CA474EE;
	Thu, 30 Jul 2026 19:40:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785440416;
 b=SBS+Mui6YbjBpZvDQXi9SN806Ssjt796e29TI0Xg+r+8sLjqfGzcB4N9rpmpnuFChwL9z
 bhOrrFbHFz3VxmDfty2eoQZfoEOPAs/YB+3s6XnvxSVUzd20710rrVNZDT7WUL6NWqOh7UE
 oWcZeX6mRpNxMgYJVE7h0/ju3sgDAZwGO9xgfbkHIycZXqrYJyY2OhUCgy5rbMcBRpZ+96t
 y5VZ12k3V4y4dkcC7p75VCeariAoAb4WEtCI4kha50yfOfjWNjdUzm5Bfel5nTMzbRBvEaf
 4SS2jBT9MhsaHJSp3kklXHuvLvkogE9KabLFL4oGT/GX7t3grs3BFS1BLJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785440416; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=s2pWr6FDrLfR5TEyfoazdJ2qFxzrYbwO/WWxngqJPT0=;
 b=Npoog4v76CWPVSQEtfVkxnvSGxFjKw91DeSzcoOY4SABcRxn4/47gYDBwi+4Y4jqZhHLT
 PdsAYKOy38DpClKuYYH97nZ/ufHWMo5iBNwrFdUEvhs+kTLFnn3vLfr62vP74bytjN2izaT
 TYIq/OJ/39GtQJ2jJeY0k1iYsVWrG2y+1XsTxMpNLorU463cwbdaYLTdP8NOQi+ZYyd3Bam
 ziI9bfDpsnd5oD7UoAdhRCSF0WQyzgf5gvh+wgPxtpuPA7zUH+cJwPmGuiOleUUfGXIV5g4
 Q9QOwZ0wFTOBXDPPpGekNbyr8bStu9n2eBOCzx+gRObUJDmUI0KDZkPJZfmw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DE1144716E
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 19:40:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BFD0410EFB9
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 19:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785441363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s2pWr6FDrLfR5TEyfoazdJ2qFxzrYbwO/WWxngqJPT0=;
	b=R4UhSUblGIFrINc/rKR4kPocJ58UAlx4zC15FDrmtJRSIcw3CGYXBhYITmuQESiwqsReX5
	UHn7UoNo3HOLd3NY1IEDjyXlIdDXrJvk19GBReVy60e1OpQZb/vKZ56SJlM01H9Mo0AFz8
	N91WWex2XAT5dEDLA5NQ9Temum0oscg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-34eK-XZVNfqNC8-zl4_LUQ-1; Thu,
 30 Jul 2026 15:55:57 -0400
X-MC-Unique: 34eK-XZVNfqNC8-zl4_LUQ-1
X-Mimecast-MFC-AGG-ID: 34eK-XZVNfqNC8-zl4_LUQ_1785441356
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0015B18004A9;
	Thu, 30 Jul 2026 19:55:56 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 97EB6423;
	Thu, 30 Jul 2026 19:55:54 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] drm/nouveau/kms/nv50-: Enable atomic modesetting by
 default
Date: Thu, 30 Jul 2026 15:51:09 -0400
Message-ID: <20260730195523.1467423-6-lyude@redhat.com>
In-Reply-To: <20260730195523.1467423-1-lyude@redhat.com>
References: <20260730195523.1467423-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: WLPvduMmYnZZDJ-_WLzmlAor0X5iqL9bbbv630zsoSc_1785441356
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: T5QVO5V67MJFUYRPZESOAC6C5QCFW6KZ
X-Message-ID-Hash: T5QVO5V67MJFUYRPZESOAC6C5QCFW6KZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/T5QVO5V67MJFUYRPZESOAC6C5QCFW6KZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260730195523.1467423-6-lyude@redhat.com/>
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
index 33f60f5d4d9f3..6da38d2e77c82 100644
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
@@ -770,10 +771,10 @@ nouveau_drm_device_new(struct device *parent, struct nvkm_device *device)
 		goto done;
 	}
 
-	if (nouveau_atomic) {
+	if (nouveau_atomic != 0) {
 		if (drm->device.info.family >= NV_DEVICE_INFO_V0_TESLA)
 			drm_driver->driver_features |= DRIVER_ATOMIC;
-		else
+		else if (nouveau_atomic == 1)
 			NV_WARN(drm, "Atomic modesetting not supported (needs nv50+)\n");
 	}
 
-- 
2.55.0

