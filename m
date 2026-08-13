Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA10C5DF67
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 17:44:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E63E010F4BC;
	Thu, 13 Aug 2026 17:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bRVM81SS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D887A4773A;
	Thu, 13 Aug 2026 17:28:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786642106;
 b=E773sgWhNORGDMRut8QduLXxyoFtA+b//z0rybHKBvXthcliSL01J/IuUPz6tWgAL/9Bc
 gMO7IzIi2toaeajSFWftuz7wQQlR65qXBpgGsGivg6xu/CgTqoSpHsMHY0ek6qhFv6Mw8Ma
 sX9AoyWC8jG6ExWhvohyX+d0yWB7oCiYmH5YnxNtk70Sn7aaS+u9mWy7pcfXWRZBLX1xpfg
 BSOFf3GbkKnwQ6kdfJjj1d1yIVtuLm+FjU8/SDjCkI38kVBH1jc+xjFdSyKjaHSbQimPnoI
 vkkoCDX6SxbaW5zoM4Lw7LAlfOLTDL8Au+yqz4KJ22V8AYDqDFQAiVSpX9RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786642106; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XZ/w9x7ar3zo3vN5AX5ttHkyzzQLo6ZYRxnrGe//FUU=;
 b=lKRgdbrcJblodLYCxJAbKy6oewxw6li/X2x3NqZW05FaG0aiscFzI9ZlSdNF/eUUPfgeU
 DPBs6efb/e2cCqnU1o8IJ0+luyl1JzIoq22TXPFTLjj9CA4/d7bYfl1ive2RCeTiEwtF5Cj
 V//kkGIcKj8uohnXkQfCO29Kbe5rfI6lsYUfAuxyFO+r6fX9hgbIVYoY0mDgbrkI3GjVFrZ
 BJmaNqvp+bkGpiEp7dmBN/29wULE1v2MYoYDqstiAX+99p7F53whd26IRMeJmFQo6YXxFiE
 f6eC7EyIUnxQB5Rahf55EauLD68PrdEWua/tsw5Gy5xhxPjhaM4hIIfTGyxw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B6AF447708
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 17:28:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 788EE10F4AF
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 17:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786643082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XZ/w9x7ar3zo3vN5AX5ttHkyzzQLo6ZYRxnrGe//FUU=;
	b=bRVM81SSGTYY9V+ABpQUcU+L2eg1m2kBEf2LNRSaLiOj0rLzRaTn+Gy1qz7hUHPnthyo2U
	6Ign0hf7D5et9nT8aucXXg8zZjQXpXIxt4G9toI4w+wIrsFtg8efuYprcAZ8rSNgtB/R2Z
	jiK2xN1uV1uLkAt7dZsuOw9kBwcbDT0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-EX7Il46UPWKJr_ukDuWezg-1; Thu,
 13 Aug 2026 13:44:38 -0400
X-MC-Unique: EX7Il46UPWKJr_ukDuWezg-1
X-Mimecast-MFC-AGG-ID: EX7Il46UPWKJr_ukDuWezg_1786643077
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CFBFD1800149;
	Thu, 13 Aug 2026 17:44:36 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1F1E9195DF98;
	Thu, 13 Aug 2026 17:44:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH v6 5/5] drm/nouveau/kms/nv50-: Enable atomic modesetting by
 default
Date: Thu, 13 Aug 2026 13:42:56 -0400
Message-ID: <20260813174416.1812656-6-lyude@redhat.com>
In-Reply-To: <20260813174416.1812656-1-lyude@redhat.com>
References: <20260813174416.1812656-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: -RHlIW5kW3PNUpcd1bRRLExtj4-WGY41ec1nzn9Fk-o_1786643077
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 6JZI5CZH3L3S25IC3BQD5CKV4RLDS2FM
X-Message-ID-Hash: 6JZI5CZH3L3S25IC3BQD5CKV4RLDS2FM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6JZI5CZH3L3S25IC3BQD5CKV4RLDS2FM/>
Archived-At: 
 <https://lore.freedesktop.org/20260813174416.1812656-6-lyude@redhat.com/>
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
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 82a8061e6d3e2..8ee36c5d79fdb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -745,7 +745,7 @@ nouveau_drm_device_new(struct device *parent, struct nvkm_device *device)
 		else
 			driver = &driver_legacy_kms;
 	} else {
-		if (nouveau_atomic)
+		if (nouveau_atomic != -1)
 			dev_warn(parent, "Atomic modesetting not supported (needs nv50+)\n");
 
 		driver = &driver_legacy_kms;
-- 
2.55.0

