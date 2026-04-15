Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BE4F43832
	for <nouveau@archiver.kernel.org>; Wed, 15 Apr 2026 14:50:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B4D5710E703;
	Wed, 15 Apr 2026 14:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Npmb+p4u";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3FAF145827;
	Wed, 15 Apr 2026 14:38:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776263906;
 b=wUWciP6oSH++vwa+bp6IWS881xHny4aBe6BkPqrO8mf9OBxAoNCSceRW/2lD5iKxl1uKa
 UfMdrt71Ddy40ZnF2v3r/mf0/jYmBA9T8uuMAxcOyGhrn0iK6VhTL3Pz7tyBrVeyxZA/TiE
 b6oau/TmSJ/cJj7QK3kqs2FE2P2ofZPqcKSPr1gwR8t7K6VOyIG+R6Ctl462RFws7a7i3He
 Q6bVpPxGNBEskGjBqGvzJEsXQL5prEpY/EjJzTpHzXQro6XpAp0uQ2Wxm8RGaetDXY0TtNB
 v5/1txX13LdJUbsKVFVLUsNCjGvmX83Zopci9NEP4ehvasc7Ygyw70Za8gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776263906; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vfKP33/LOBCXSzOdhgMlPtmvszDnS3wiHtztjSPKg44=;
 b=VGU9/fGRMRVNwwXjPIqZNRNZtCcCbN/iUS0gEqzZVAyDUcK6y42rVdUozkkZ/FQ4qFrvw
 xXSYvylyNvNjOari1xBZ96qaPbAwSk6u9/FYxIwwbZYNEXrlnnF+auhu/nYaJx4thzt1DHu
 Z77FRjheZLJC2Qd6uQbCNA1+d1JYK660jEh9ix5yXct70KxvgTxdV+9M1kLwnMwRFCh3iDC
 s7nYSnxexAj2XtNuVYVLCoqTIR4Gm80IRyPfSIIgXeU62pC9dWqjouGbiRWNYhQHZunLvji
 GShmxy6MoA0yUnGE7Aza4pO6nHnJOU6JMNLTFs6yP0zm1WFZFEGT/PfO26uw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DB86640512
	for <nouveau@lists.freedesktop.org>; Wed, 15 Apr 2026 14:38:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 106B510E700;
	Wed, 15 Apr 2026 14:50:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 008B5600CB;
	Wed, 15 Apr 2026 14:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB378C2BCB3;
	Wed, 15 Apr 2026 14:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776264615;
	bh=6+yxKnNGGhecpmezEx7/XdS6MBkimFgFRi3mEAypiVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Npmb+p4uVMIZCdV/T3zYw6MCZk5fcxondB+Jov2zQfMn8+AVhQa/ftu4spz5pjaup
	 WQyKFBB5LhneQqfq29qx5UdDUKTltHF8JxFD30JhVgPulUGcY9erhKExIlyoTJ0o6x
	 O4TkT4abMWhyJyZ+EfbbWrGan5y9rRnJLpK7r+I4+VxZR+6xWVjUhyMTTshwx01CTS
	 iS87RM/zwnmoLKzfqcntNc3PJZdMu0JRPQ4mqi0tCz/dd0vURESP6ZptHGrM+qhNfU
	 TzEKcEH/7uvmemGk4PVbq9SkaKDlm+nCWQ9vcEVOzAHDDTz4P9DAekBWrCuX2BQGVP
	 JJKmF5N+PiYBA==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Dave Airlie <airlied@redhat.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v2 2/2] drm/nouveau: Fix double call to
 drm_sched_entity_fini()
Date: Wed, 15 Apr 2026 16:49:57 +0200
Message-ID: <20260415144956.272506-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260415144956.272506-2-phasta@kernel.org>
References: <20260415144956.272506-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y74E6ODJRRJISJL7RDNHG4KCT2ZU32VB
X-Message-ID-Hash: Y74E6ODJRRJISJL7RDNHG4KCT2ZU32VB
X-MailFrom: phasta@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@kernel.vger.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y74E6ODJRRJISJL7RDNHG4KCT2ZU32VB/>
Archived-At: 
 <https://lore.freedesktop.org/20260415144956.272506-3-phasta@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_abi16_chan_fini() does invoke drm_sched_entity_fini() twice:
Once directly, and a second time through nouveau_sched_destroy().

That's likely undesired behavior and might be a bug since
drm_sched_entity_fini() decrements reference counts.

Fix the issue by using the appropriate function,
drm_sched_entity_kill(), to kill all remaining jobs within the entity.

Cc: stable@kernel.vger.org
Fixes: 9a0c32d698c1 ("drm/nouveau: don't fini scheduler if not initialized")
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Fix commit message (wrong named function). (Guys on IRC, M Henning)
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 7860877d909b..291203121f0c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -176,7 +176,7 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
 
 	/* Cancel all jobs from the entity's queue. */
 	if (chan->sched)
-		drm_sched_entity_fini(&chan->sched->entity);
+		drm_sched_entity_kill(&chan->sched->entity);
 
 	if (chan->chan)
 		nouveau_channel_idle(chan->chan);
-- 
2.49.0

