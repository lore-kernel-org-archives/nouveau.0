Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86169C5516D
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:30:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5E71710F08E;
	Thu, 30 Jul 2026 20:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YkoPp9fc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2A64347517;
	Thu, 30 Jul 2026 20:15:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785442502;
 b=HyK+Ovup78XS5nbx3rqj8lLHHI283xenyE70OfKOp75mgaA1USiKdJ566gSbOi9nyevn8
 NF50ytGJjIHp8ThMfhGTJ3bRSmhk7zAzDccMCtjBwloOsaOepdH9p3qTGyXq82J8lEtIF83
 iOxCv4Bzz+4kNeENjNChRwcvbw1z4gCoEyMvfBzJsRSAKRGqpP8ZZGdrnQtgyqaqgH1UH3f
 sHzFYyrX5xyaiaapnQGST0KVoyZ/OVqmtSu5Hz4ylj8gsml00eJ8kMihvFJMHATZZAN3ozq
 Z3v6FrQh9FQlxh2q38iNa/moOFJsGNgsBtmuWL+Da8glq4QLekLqro8lADuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785442502; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lNTuaDjx3z1DUxuUacr72ReXO5T+NfTzTweEjVHjhKI=;
 b=Zlbvay3IhTxBZLiIimu3Z0Ac0lPcJMST2HnLsxtlHbBtgBzEw1T+zKx1IcgLwcggW9SbB
 dEjsEPQIll7UTwOpbWhiN7AT6Dqk6QLhX3ijKObl9vfYLxe5TDR3LVchn/3U6BckSalMjaZ
 /e06Dt0IKyRVF05IsijwY4LpoCNt329tw4x2mZb67AArPjBgp2KTXgvD6qgJF9u13jkePo3
 4aM507ON6Df38/rk3C+EWBcKohyXVDCDcYjR42lpEzM2juNULiosQfqag11XBLdBv2h/3xw
 khL99SR1p6VEtBusdPobcI/L9VdN8/aWsZ1bUUoBUqytjUUX2s6rUY9xv6/g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 26EF6474EA
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:15:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 165C610F096
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785443448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNTuaDjx3z1DUxuUacr72ReXO5T+NfTzTweEjVHjhKI=;
	b=YkoPp9fc1ls5r6Fw11cLBhyn2j+PvI7qD5q/xZPRUsjtcorv1AXeYgCHYriGHdoFwt3WWM
	PZ0IWUN4zoYftlywiJkOLmX+oTeHxB9/ete9BRe90ITDUD6ylJQQJxhF3pab7+0dCnjRCV
	k7sIY9OBsXTQ0PehFwUBJjzDUct+NQE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-29--bNThpnNNzWO9-lF6nPqOg-1; Thu,
 30 Jul 2026 16:30:44 -0400
X-MC-Unique: -bNThpnNNzWO9-lF6nPqOg-1
X-Mimecast-MFC-AGG-ID: -bNThpnNNzWO9-lF6nPqOg_1785443443
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 116201800350;
	Thu, 30 Jul 2026 20:30:43 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 756EF423;
	Thu, 30 Jul 2026 20:30:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] drm/nouveau/kms/nv50-: Enable atomic modesetting by
 default
Date: Thu, 30 Jul 2026 16:28:08 -0400
Message-ID: <20260730203015.1572240-6-lyude@redhat.com>
In-Reply-To: <20260730203015.1572240-1-lyude@redhat.com>
References: <20260730203015.1572240-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: gjsychvWT91CxMMwk9n2kPLFUuoElcXG1y33dWT3i40_1785443443
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 4MPBUMADOTC5SEWAZZODUHNB777UKUPH
X-Message-ID-Hash: 4MPBUMADOTC5SEWAZZODUHNB777UKUPH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4MPBUMADOTC5SEWAZZODUHNB777UKUPH/>
Archived-At: 
 <https://lore.freedesktop.org/20260730203015.1572240-6-lyude@redhat.com/>
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
index 80fdedc27189f..b3b90d354b5ca 100644
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
@@ -768,10 +769,10 @@ nouveau_drm_device_new(struct device *parent, struct nvkm_device *device)
 		goto err_device_del;
 	}
 
-	if (nouveau_atomic) {
+	if (nouveau_atomic != 0) {
 		if (drm->device.info.family >= NV_DEVICE_INFO_V0_TESLA)
 			drm->drm_driver.driver_features |= DRIVER_ATOMIC;
-		else
+		else if (nouveau_atomic == 1)
 			NV_WARN(drm, "Atomic modesetting not supported (needs nv50+)\n");
 	}
 
-- 
2.55.0

