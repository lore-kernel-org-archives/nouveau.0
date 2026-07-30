Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4D4C5516E
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 19:55:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 43E4810EFA8;
	Thu, 30 Jul 2026 19:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="T3Itbe8O";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 196E7473C2;
	Thu, 30 Jul 2026 19:40:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785440404;
 b=EKcBvLj/LyurxtrS/nzxfkwhePh1ULx4JbOK/T56M7IUijmJkWyEsWmmLPsge3dluTnjA
 z9kc1MZLBCmse2YD3yD+btrWBKOGIFlbtQUot7yGMEbCN2oSXCUfwVPsXy/OEm4fjwLWtgq
 LzAWd9QxYq6KJUWUFphFJMEI0BckwHMARPlyLUcWJa/eT8TWmY9MYgdKH9J5pZjG4iVUTkX
 uNxsa2BICJ8URclcWlsOiHWBrif/66w3dvsXIMvAX7YRa2nRlrbvlTsdz+ubFO4ZMjiq4cz
 9F9sFOIqgyFmn/GAxWv2CYAfpQ9Ynng8KmZbeFrctem1pDy8TSyo1yE61yvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785440404; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TJja0xVF5yEcxVJEJX5YHQm2Btsqc4GViriEO6krARA=;
 b=nsRf71gMqnnesyPsUiGOsqmjHWRexvq4lnC/AwrrEiE/5Sw9rI79rO6xFwwwDkISKMIli
 D5aaQzs4HI89sc5koBUg1nKIJIcQ/wOogob9qpiW38/V8YAVeQVlPtHSHoeuZnou8nV6mme
 T0R9nYZ5zegAH3QCtAAA7WDFddtNX5bc5OyqKik6taEwl6jPnlVoioazrSGlesfXnWwlrTs
 AgMZEk9TW7xyv/5WypSADs2/KHSrSIAnH4yXnldyoRJNSmC1CHEG0G2FD7c0Zlbde+q3DdK
 3lqiFL16VYG3dLHIesyjafYOmAfc5n/5EpfwMi0W/Nw7uVzHzc3KaCTLjTYQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 581A545288
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 19:40:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 22C7510E681
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 19:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785441351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TJja0xVF5yEcxVJEJX5YHQm2Btsqc4GViriEO6krARA=;
	b=T3Itbe8OKUr+08XqgUVLO6fLl/J5NGtY5PUEBUSf35vGFhvBN09xd4wg0dkg5k1CbzJikY
	czvh4OIELhmvRvGbwvRgQ6WZaBfadR2MysgYfrm4MHx4vb+XUjuju9eY8V6z70fnxdRoOQ
	TYtIL+xkMTNNC60kWxvHzvGh+D05k3Q=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-676-sccg5_l8Oqqhm4osJCPcLQ-1; Thu,
 30 Jul 2026 15:55:47 -0400
X-MC-Unique: sccg5_l8Oqqhm4osJCPcLQ-1
X-Mimecast-MFC-AGG-ID: sccg5_l8Oqqhm4osJCPcLQ_1785441345
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9420B19560A7;
	Thu, 30 Jul 2026 19:55:44 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D79F3414;
	Thu, 30 Jul 2026 19:55:42 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] drm/nouveau: Enable atomic modesetting by default
Date: Thu, 30 Jul 2026 15:51:04 -0400
Message-ID: <20260730195523.1467423-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: eJhocqmMBuMMVngKU0d4LA2kY8AuLXa9qxo-ls0g4Vc_1785441345
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: HYJS2VDBZSLKKIHBEZ5V3SVP3D6TWF67
X-Message-ID-Hash: HYJS2VDBZSLKKIHBEZ5V3SVP3D6TWF67
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HYJS2VDBZSLKKIHBEZ5V3SVP3D6TWF67/>
Archived-At: 
 <https://lore.freedesktop.org/20260730195523.1467423-1-lyude@redhat.com/>
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

This patch series enables atomic modesetting by default, at least for
NV50 and newer. NV04 is left unchanged, as atomic modesetting was never
implemented for it. This series also enforces leaving atomic modesetting
disabled on <NV50, and adds the value of nouveau.atomic to our kernel
debug output.

Previous version of this patch series:

	https://patchwork.freedesktop.org/series/171310/

Lyude Paul (5):
  drm/nouveau: Fix cleanup bug in nouveau_drm_device_new()
  drm/nouveau: Print the nouveau.atomic parameter in
    nouveau_display_options()
  drm/nouveau: Fix drm_driver struct/nouveau.atomic parameter handling
  drm/nouveau/kms: Only allow enabling atomic modesetting on nv50+
  drm/nouveau/kms/nv50-: Enable atomic modesetting by default

 drivers/gpu/drm/nouveau/nouveau_drm.c | 49 ++++++++++++++-------------
 1 file changed, 26 insertions(+), 23 deletions(-)


base-commit: 35b6cf07851a2b430b0eefbcb7b5a856f9030264
-- 
2.55.0

