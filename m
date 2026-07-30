Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C834C5516D
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 20:46:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B61EA10F091;
	Thu, 30 Jul 2026 20:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DmLgKtrc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 773D747546;
	Thu, 30 Jul 2026 20:30:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785443430;
 b=ZtZRwFW+S/XrOy5dSSEzwpvLfVpJm6UpUMrgv4RiVSJHoBH8DazB7yfRrcFMlZEmssuWo
 mr2Ic7VTKb8ydOQlP2wzfaPwNTDfBWkBMCMkY7VmtKojTMPoX4AL0u37PFEkF3Ke/zo+iUe
 5FBG4DopDQH+8XCU1QQY9BAWo8DSZrIz8veFwoctXD9CcPyjZcofdaiiE5N+9GD37I/ys1t
 XTb0JxNUMEM+0B81pkVn4HprwGDHEuYZDJXkrLq2UbxoH4epGmo1CVsdTwh+J5zHUsBN48b
 Bja9buxIK/tpxvTyliWi2wk7crguCXyL0zR7FCOEfhIvrWEAb7LzAieKToEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785443430; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+CyqnIE/H6Md94AP8mw5k3Q4t1GkIXt9RXCb3+b/FY8=;
 b=RSFtigBTZoF8ogY5Up7XwLgpniVKswDf9MWeWiGdw42Qr5dGxu6W4Gn+7JJOTolfSDKKL
 qQ0iWr6rzWyQ0oV0w3rYe4rtW/uitvuKNFYJhBwz6cJwWKhQVG4709m8TMp1LSQI1URVnE9
 5f18iTKepgPGhuT5S+SUOZUa+2549ZfAgM8UXhAQQUO5tPSUId6wRENWR5RVm6a2jNfI+P8
 HFLnkKyagz2aS4n3jejw6yGZiTL4CMHzkIuQGZ9NSNwOGuxiL/D1VXCxSYBeiSC3Iz3YWzt
 I48en/dMu2kOzPTe/l3hiQw8wp45XaoZica9+6wb8DuzQ9uwm3/xQndit+mA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C135F47540
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:30:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB9C810F089
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 20:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785444375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+CyqnIE/H6Md94AP8mw5k3Q4t1GkIXt9RXCb3+b/FY8=;
	b=DmLgKtrcrUTLrvuU9GL02FEWLEI4kT0az4Xs9Ky5HHRYj8QpwZwiq1JjwsVbsZJAybHQm7
	wkiCuxcH18ApBq26l4bxATmclGp4nTpq4DdLblFfWqwlcPH0G2bQCn5pPLdZHTIBwIWL8n
	GTsIGwSsI5m7Swsr0VZw0a3HEww8oOI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572-0uFw8MtfPB2Q-yP9FJhrKQ-1; Thu,
 30 Jul 2026 16:46:12 -0400
X-MC-Unique: 0uFw8MtfPB2Q-yP9FJhrKQ-1
X-Mimecast-MFC-AGG-ID: 0uFw8MtfPB2Q-yP9FJhrKQ_1785444370
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7B8F31956096;
	Thu, 30 Jul 2026 20:46:10 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 025441956089;
	Thu, 30 Jul 2026 20:46:08 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/5] Enable atomic modesetting by default
Date: Thu, 30 Jul 2026 16:45:05 -0400
Message-ID: <20260730204604.1729505-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: oohSzhhyxfrLqxX6KCd34PwEy3e_ZRO2g8WVWGeOmQA_1785444370
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: DAULEFTHCUZRLYSYMAKW3ITLFT5353SM
X-Message-ID-Hash: DAULEFTHCUZRLYSYMAKW3ITLFT5353SM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DAULEFTHCUZRLYSYMAKW3ITLFT5353SM/>
Archived-At: 
 <https://lore.freedesktop.org/20260730204604.1729505-1-lyude@redhat.com/>
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

