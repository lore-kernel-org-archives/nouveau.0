Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB83C54FCD
	for <nouveau@archiver.kernel.org>; Thu, 30 Jul 2026 01:08:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 70B4710E8B3;
	Thu, 30 Jul 2026 01:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QjLOR3B/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 05C25474C2;
	Thu, 30 Jul 2026 00:53:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785372785;
 b=Mr4i2xGZSP6UvdQBqrqm6kQBALZ5GPzWORAt6dhCjos/21NcNwkbUCoUn3mh4lBVSe/ii
 Kr99Iz9f0d7DmdPh3YlWt5IYI0eE586jZH1rrCMlzjNQmuwbb1yZMDipIUXmU82bFRVASYY
 IQXz+mEddMOpsV65fbQkJ3V1ZPm7KPwEuz1LpPmO1OEbwHR3+lEpxxZaZbOoig38ypYEy68
 +SQd8EgSTwN33WyBOt9dgpgxqrnj8gD7pnpHvGN651Um6XLk4TSxSroaUX2uedFtju89Abi
 +no30vuIU2dgJPhXPGaOYr7eERvEr8qmZln6YUuvGTBH7xVEg9aJskq2C23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785372785; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Ex3nFZJaVFsnX7P2oVwQs6OELlPAj7ZOVqFa3pkVtDA=;
 b=GPXEqUdb428iPYWTiuQLNARKQZM+jV8M9GNrS9q1bHABURbCc0pSzLseTLyb6Ao0rJp8U
 XUz+prHcAY0MobyQw+DPJdRUxsu6Hj7vNepICGATznsPfItoyvQi/YIEmqTzmsPsTZtPp3X
 lvHPaKOzDULD/IH5OqjMQgOTkc6s9wcql0LOHVkB8glRnGjLGMX99hG6TZtR4c/0Vvb1S52
 byTIsDrWJdulYjaX2K2TfSZu7BNvFYPHEAKnQZ0+q830O06C4gZHZYQuejv2KiMOfKdMyeg
 FCXqQvXi3v1ISUF464CKHKC69tiNXzuOXEX9vmtMgWsFy+cgDMp0UQuqlB0Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3319046ED6
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 00:53:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5029410E0DC
	for <nouveau@lists.freedesktop.org>; Thu, 30 Jul 2026 01:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785373730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ex3nFZJaVFsnX7P2oVwQs6OELlPAj7ZOVqFa3pkVtDA=;
	b=QjLOR3B/klJ/0BttogfPoqj4p9gNDC0exNHueJhqS+iAjuCLruKamLVskcwVusIDpevfNk
	CLdiSnDZaUl0SVzoXvOWxdXkExUt8k+npsHZlrI5Y4cSaTrDhZlY2FnhiJ9ZNiZTd1RjU4
	0JJnYKFa+FDLlpW8uGC0bUOJRBm/Xn4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-117-i0Db3R6DPJiVCFy43aRA0w-1; Wed,
 29 Jul 2026 21:08:46 -0400
X-MC-Unique: i0Db3R6DPJiVCFy43aRA0w-1
X-Mimecast-MFC-AGG-ID: i0Db3R6DPJiVCFy43aRA0w_1785373725
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 55FAF195608F;
	Thu, 30 Jul 2026 01:08:44 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.35])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4B9F81800480;
	Thu, 30 Jul 2026 01:08:41 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm/nouveau: Enable atomic modesetting by default
Date: Wed, 29 Jul 2026 20:56:06 -0400
Message-ID: <20260730010828.1056397-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: VT0qwK7fULn80_k7L3OeHsxreGN_jIl3dRMe2R8vz2Q_1785373725
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: SG3Z3XSPILC2UAWYZ5J344PLWCY4PQKH
X-Message-ID-Hash: SG3Z3XSPILC2UAWYZ5J344PLWCY4PQKH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SG3Z3XSPILC2UAWYZ5J344PLWCY4PQKH/>
Archived-At: 
 <https://lore.freedesktop.org/20260730010828.1056397-1-lyude@redhat.com/>
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

Lyude Paul (4):
  drm/nouveau: Print the nouveau.atomic parameter in
    nouveau_display_options()
  drm/nouveau/kms: Check nouveau.atomic parameter after
    nvif_device_ctor()
  drm/nouveau/kms: Only allow enabling atomic modesetting on nv50+
  drm/nouveau/kms/nv50-: Enable atomic modesetting by default

 drivers/gpu/drm/nouveau/nouveau_drm.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)


base-commit: 4d49f1adfbf226c26ebba2958cc184f787abab41
-- 
2.55.0

