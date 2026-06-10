Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD6D2CD98C7
	for <nouveau@archiver.kernel.org>; Wed, 10 Jun 2026 08:26:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD91610E7E2;
	Wed, 10 Jun 2026 08:26:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D7euH2ph";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8C680469E2;
	Wed, 10 Jun 2026 08:12:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781079156;
 b=QZCyuMTsWp2zgxjnDOXCZEkAPd0f88UuGE9QdI5JNIGVPY/wttX8tPozDMi8ZvB9ZCN4s
 wVgKU0KdJ+KzJC3l3U3bViQVCOT4yiD0YSBX35KgQDKsNSvfdoIrdX7tUK/JL2sAvaBLBW4
 5vbivbisItms+6beCnM8V6L5JpgITvHvS2UBe9ghOBsUlVpwkxBTianE0h66ZARvObIhdDC
 1+/aJeHpBhz9cV48p5vY2CWWb7fOYNW1A+/e9lscOdph9CsZpEL0gewGKd+FUfoeCQyd4nk
 FE8mfEWWupR5TZawZj4gUvcJdBbPQw17VugHFffbIBgAZOWshfq96aSw7yMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781079156; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=N/meOR8qXZA62uzXKo7V6ddIdrYaFI08nRHNwkyigvU=;
 b=JvojQ2MzO6OGUQ1xFFrih/nDVWmNUDGAuCDWREkD9ysvQP9luEE+bVNMcC1OhnNjBRSti
 dguVu2Uo4Br4Uwrf3j8xUA4kmGYmaXP0ybGK4+Hf74KEuBtI72LCIPhyCskLsEatHF+8uuc
 VPzNuEJTo2ohl57NFUFIW9A0+VJNWc/hM6SS+iQ2dawAlEDIZIdrjE5rOin9Gkgvrx108B3
 25TmjuQbGWsbABhLfCnIceje83H/dUXnRJ/gRsrufEIPMEJ+rui/k1yTsF7ywddHszjFHO/
 j0Yz+vF2yTTLg1eIVqtgBA0kYuRtjy/Vdoq439FrC4qqsFO82zELvqEosMkg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6E17846700
	for <nouveau@lists.freedesktop.org>; Wed, 10 Jun 2026 08:12:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4978410E7C0;
	Wed, 10 Jun 2026 08:26:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F6146001A;
	Wed, 10 Jun 2026 08:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BD31F00893;
	Wed, 10 Jun 2026 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781079989;
	bh=N/meOR8qXZA62uzXKo7V6ddIdrYaFI08nRHNwkyigvU=;
	h=From:To:Cc:Subject:Date;
	b=D7euH2ph0IRx5agO0gaC8kNCg/qxTzdB45LZ2MgtRE8hNgp+rHYbfSzV/BxQenHYt
	 TP2nltVdTft9SDuhDqRmw+wQooocWHUmfwcB8HKm0aGCpn9O8THjjXKx0m1CS3OQ/J
	 sDMYRZHbhlRkW+zLElSrMNaPRwOQLgtfkOa9F3Ar6CgvH5ieWV7/ghVK59n5TzAkZJ
	 Ylsrhsj0BVWhyC2wLCW0w6GpNIuAitcUz+uJTaq3WGymLeW3a8oqNWgPUe9oyPGLfd
	 Innx51sYQo1imPN23H03RIBohDSnnK3GykmMCvai/IYofIUQ2AnOq2vTtMGYVXY5mF
	 aLmhVJm61TNhA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/nouveau: Document weird looking bugfix
Date: Wed, 10 Jun 2026 10:26:03 +0200
Message-ID: <20260610082602.1292853-2-phasta@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BRKYSSEOTNU6EZOSOFX7LTG7XPKKF2UF
X-Message-ID-Hash: BRKYSSEOTNU6EZOSOFX7LTG7XPKKF2UF
X-MailFrom: phasta@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Philipp Stanner <phasta@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BRKYSSEOTNU6EZOSOFX7LTG7XPKKF2UF/>
Archived-At: 
 <https://lore.freedesktop.org/20260610082602.1292853-2-phasta@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

commit c8a5d5ea3ba6 ("nouveau: fix client work fence deletion race")
fixed a race. To do so, it replaced the automatically locking
dma_fence_is_signaled() with manual locks plus
dma_fence_is_signaled_locked().

For someone browsing through the code, this reads very much like a
cleanup or rework leftover. Future contributors and / or new maintainers
not familiar with the history might be tempted to remove that bugfix.

Document the bugfix.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
(I did not test this)
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 42a81166f3a9..519a0c164a72 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -159,6 +159,13 @@ nouveau_cli_work_ready(struct dma_fence *fence)
 	unsigned long flags;
 	bool ret = true;
 
+	/*
+	 * This is not a cleanup / rework leftover, but a bugfix to prevent a
+	 * race with someone signalling the fence. The locked
+	 * dma_fence_is_signaled() cannot be used. The dma_fence implementation
+	 * is not fully synchronized with locks, but also uses atomic bits,
+	 * which can cause the dma_fence_put() below to be executed too soon.
+	 */
 	dma_fence_lock_irqsave(fence, flags);
 	if (!dma_fence_is_signaled_locked(fence))
 		ret = false;
-- 
2.54.0

