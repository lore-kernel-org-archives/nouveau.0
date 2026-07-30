Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A29EC5516D
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:37:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D48A310F086;
	Thu, 30 Jul 2026 20:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X5ylEduA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9632647529;
	Thu, 30 Jul 2026 20:21:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785442908;
 b=gAWVKV+2OdrjKPV02B0hqASOvcFEPQeMF+ZmAbuoxWQmxRXhrV7aNfcf3Z7jUp5oL/CvF
 fgSDaFqljw4aGOQmo1l33IXIGlk6V4dIApUo/69TEZ+a6g0jYiAUrNRxcdRBeoxkb8tVpTR
 d1/OkAVHhz45wsOPgvT5XQsOTQkUQlxoK6TTDTBubZFX+BWwLi0Qb5LDr5avU9GQBKqdfkV
 8ML12uRWJQlrRmwmyohC/1radx35ItUHv7rgTIlBY6QNeI3Joa0XutcJy4ZHkn2oeylvGNE
 E/gjugipc+DO/fz5o28/PoI1enwXivxOqqg4penJlMkzF1Zq18/TKhIewCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785442908; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+CyqnIE/H6Md94AP8mw5k3Q4t1GkIXt9RXCb3+b/FY8=;
 b=JNpPM86g4YOQR9B+5pi+fUw+BoI7XT1sBiieo+LRHrbtUdDxaTn1Dnnj/qfvHIgKnyDcq
 AU2qDUxozE4oNyb1gCNSAt7EcrPyJluXeJ3Pt3LAzSjc3kPRzJDfl7rMGvIRSgWALNbNf8G
 Beu/ye99Tm9HKMmUgnzDAFqCPb5qyCBOlzrLkqQ1E2gsftj8inBytT5yerCoZ8fBJ4hsT61
 ZP4nGs4H5g3UQRYa0S1hMOvqWpQxlGg5yJB6baqnuh2RfRLxf8c2uXXvaf0luFOpjwi2KZ0
 LL6Tqc9V+kuowrzxODLKtwJ8hNmiq/h3yoKF5m0uBEt+Aw+XmWvd6QRmukag==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E28934716E
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:21:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CCC5810E11B
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785443853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+CyqnIE/H6Md94AP8mw5k3Q4t1GkIXt9RXCb3+b/FY8=;
	b=X5ylEduAeR+a7CUWb/Q5KKTsM5csfLUfl9z32yj1aIb1ODALOd1XSVu0sKsfjTWNp1EEte
	0oD0pY05hNNIKc0Pk1TZqFlNPHcOcDAq/lVuY9WkUJvprwmp+UtZVK1b4Ot2hUy7Y6G93+
	oTq98R+zkhQsdVzgPxFZjp7AoYwFU24=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-261-foYEZHuJOqCrOXzit5Eq-w-1; Thu,
 30 Jul 2026 16:37:28 -0400
X-MC-Unique: foYEZHuJOqCrOXzit5Eq-w-1
X-Mimecast-MFC-AGG-ID: foYEZHuJOqCrOXzit5Eq-w_1785443847
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E926F1956095;
	Thu, 30 Jul 2026 20:37:26 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2584C1956089;
	Thu, 30 Jul 2026 20:37:25 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/5] Enable atomic modesetting by default
Date: Thu, 30 Jul 2026 16:36:08 -0400
Message-ID: <20260730203723.1649433-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: j1U9HEOYbqO-yARAcOpeLnV7y245hY46xLO5D8at_rE_1785443847
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: OMJAI3GMJO57DGPYRL73E34MHALP54R3
X-Message-ID-Hash: OMJAI3GMJO57DGPYRL73E34MHALP54R3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OMJAI3GMJO57DGPYRL73E34MHALP54R3/>
Archived-At: 
 <https://lore.freedesktop.org/20260730203723.1649433-1-lyude@redhat.com/>
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

 drivers/gpu/drm/nouveau/nouveau_drm.c | 40 ++++++++++++++-------------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
 2 files changed, 22 insertions(+), 19 deletions(-)


base-commit: 35b6cf07851a2b430b0eefbcb7b5a856f9030264
-- 
2.55.0

