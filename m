Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D41C5DF6A
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 20:37:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5389D10F54B;
	Thu, 13 Aug 2026 20:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jAxj3Caf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E789E47767;
	Thu, 13 Aug 2026 20:21:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786652492;
 b=rjDO8g4skH6AiucaPy06oZ6Cqey+EoJobFyctGou4vlXOKHyKA6ATKlan1DaikrC4lxrf
 C+QJKA1pzN+ymOFdvb3Jv7UIxoOYhSHY0EaD4BKrTUze2I3721mmDmp4RWh+8W2ieAlzOiX
 Wt9jFshzEQ93zg5DkBOnnEROeW8i3Ynww/SdjCSMg7APJmNGvf03y7UmoGJmZ82qjh0phzI
 u+pfLlKW5O2/0l9NYId3nGovsnC206UJQEiAdFYNa1gv5tuz5gPkH+yp62TnmoHYUyIXcSv
 lHMbngetELG97F3/lZAE+KaGrltQreAcXWu+XAqq5DSqAjfyRASNvf9KfC7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786652492; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5Vrk3PlFsrHnHDBdU/h3yMx32mf+J1iZRQWJGUt9qu0=;
 b=FB08SqK4Eh5daN77wjAXki7yqg9OCu09MlnL3Wu77jQVX78RCvq2KVz+JGWF81VVh6bdT
 TNSHuWFZ/sA6IypW3qc5NLKDyMLbA0GqWzY1mQvTjdOR2M3/tXoVTkIS+DBdVrz/wd8DcPs
 +vfmrytrZGTE450O0bUEBVJ+85ja3R15jmE5iXHv1m8qeZEhpxQuDfJ147Y0gDBJ86iMf0l
 C5HqO9Fagq7ZTv9z7EOGOLjxmYHwdANfpYza1u2vezrA1y38geSKz868oXxTtMXJo7Zmoxg
 f4i2PcCKBul/BVWBsn+jkDMQnQtXvuMsV3s8XmsisJieOG4Ji8XB8MnP3OeQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4A1A34772B
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:21:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 52EC010F548
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786653469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Vrk3PlFsrHnHDBdU/h3yMx32mf+J1iZRQWJGUt9qu0=;
	b=jAxj3CafojTZMXc8p8/ZkXt3AvvIrJfkiAKme95RJ5/wkinkqtTTbgQns3PnRZwaNFT4jS
	OPTE7c19qKRGJjZv6qsx2UDA604Kud3YrPS3+8EYasn8CfzZ0RwOs8Hswav6gFTLxa80mv
	6mKSZTLl1JIR21l8UqypV+HZg38rM1M=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-04hwDPV1NK2-0cOpJ_I0aA-1; Thu,
 13 Aug 2026 16:37:44 -0400
X-MC-Unique: 04hwDPV1NK2-0cOpJ_I0aA-1
X-Mimecast-MFC-AGG-ID: 04hwDPV1NK2-0cOpJ_I0aA_1786653462
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8FA19195605E;
	Thu, 13 Aug 2026 20:37:42 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 365E2195608A;
	Thu, 13 Aug 2026 20:37:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v7 5/5] drm/nouveau/kms/nv50-: Enable atomic modesetting by
 default
Date: Thu, 13 Aug 2026 16:27:09 -0400
Message-ID: <20260813202833.2051778-6-lyude@redhat.com>
In-Reply-To: <20260813202833.2051778-1-lyude@redhat.com>
References: <20260813202833.2051778-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: cEqe_rqfSUMFJ2GkoIJAojpslQgBiMGQjWCNj77X7r4_1786653462
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: W5IMVKGIA3ECSDTE2OSZKUHCDP3NTARS
X-Message-ID-Hash: W5IMVKGIA3ECSDTE2OSZKUHCDP3NTARS
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/W5IMVKGIA3ECSDTE2OSZKUHCDP3NTARS/>
Archived-At: 
 <https://lore.freedesktop.org/20260813202833.2051778-6-lyude@redhat.com/>
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
V7:
* Re-add patch hunk that changes the default value of nouveau_atomic, it
  got dropped somehow?
* Correct nouveau_atomic check so we don't spit out errors on old hardware
  by default.

 drivers/gpu/drm/nouveau/nouveau_drm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 82a8061e6d3e2..b0f9fb10a74dd 100644
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
@@ -745,7 +746,7 @@ nouveau_drm_device_new(struct device *parent, struct nvkm_device *device)
 		else
 			driver = &driver_legacy_kms;
 	} else {
-		if (nouveau_atomic)
+		if (nouveau_atomic == 1)
 			dev_warn(parent, "Atomic modesetting not supported (needs nv50+)\n");
 
 		driver = &driver_legacy_kms;
-- 
2.55.0

