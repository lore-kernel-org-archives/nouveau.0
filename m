Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D64F9D0CA
	for <nouveau@archiver.kernel.org>; Tue, 14 Apr 2026 13:38:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C70C010E613;
	Tue, 14 Apr 2026 13:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LIa3WnO9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9C18645823;
	Tue, 14 Apr 2026 13:27:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776173223;
 b=CL3X/VaHivZxJvcJY/7uznaWGSVtWWfQ+7oVbqiRD716ylJyn7ywaeWcdyxw/R+QCAmtx
 FvzbgGustCyg8T9DO1WHW24/T/Bq+uWZV8aqbEvKUcMn3x6A309mnAxpPpnUPWoicQrbN/n
 gYx9YuKe0Z6kn/68QI4iCdykLZmG9fJypg9ln8gfrd9Ll8EXCEe+Mp9SsWWWBIEA8O4eLr5
 4QphR3o2TwrjVv8wzC89uFtP7yrQGA1Fq1BrtZZdAurFRiq+BlTY9sTHvWq7ZttqwI7sqt+
 bt9VKJfz4tFBwZZZcqeu+fDCU06TAxMqQ5ghd5IMbXFXjHekTLYTZdyYLftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776173223; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mXSJl8goVqCOPq8+SixoeSU8BQbVm/HAcGSAnfCdrCc=;
 b=liFeYhYa1+BmNb+JCBii99FQ4XZfcG59js7ppEfWtJ8KjTYQ1GNQH3sJX7H7x8iXEEKIC
 pRTcawx6oazh+FyIkfwJA6jE8P3c0FmTUvGqjQYR4FaovYeEpGa7WkSnWEmg9GaxZzS3VIX
 G3CuKkElq1OqGqvUZPGGbSfK31twp8x6QNcDBs0TZiXxAFNK2Pxfx4AM0yks14315c7GKNA
 5vKYPa5RA3DMkSSrnsMYWZCuRKbEk5gFP+sDKhePd1ijeAXraKw1UkXXrpHr4F0UShsKsCu
 k0Wpi/KlvK+OD0YJrJ1KHPJ8wXkafc6Zl9ARIOibhBH38zz+o6q79NpqI6Wg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3306D44894
	for <nouveau@lists.freedesktop.org>; Tue, 14 Apr 2026 13:27:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD3D10E60E;
	Tue, 14 Apr 2026 13:38:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21C2543FB1;
	Tue, 14 Apr 2026 13:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E806C19425;
	Tue, 14 Apr 2026 13:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776173933;
	bh=Kku6nJKrBYOq+QAdCBbdd+MU0pFbD9UDQdUDbtSpiVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LIa3WnO9MAjxllNO5O9RRgVcE+n1pQW3gYwB7LDlPyGmPFe68WMbgUbczs8M+RJVH
	 WAenISCputl55ibCQT5cpqHGZzzbX1RiNnq5evLNDqR9q3pRaLVPTlpfLWhEYPaZnl
	 HJgPIm6V97vqVclk6P1oXH1Xef0uBnfZTqVC3eJJSq4DaRqP2rloT1Mg5K1NyKvQPM
	 hMA58tKQWxb6Uh8UDVJ9VPKFnlx8w5BgseWD8044lnYsa1LL1DAsAdZVvy/5XqGr6I
	 f2vp6HZuE2mIBwyjeP4aWo068TmHgNK8ZFLFMMPW49cRqRd9MFCfrt1jF+txAZuFQD
	 9fJJ3JW/qr1Xw==
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
Subject: [PATCH 2/2] drm/nouveau: Fix double call to drm_sched_entity_fini()
Date: Tue, 14 Apr 2026 15:37:35 +0200
Message-ID: <20260414133734.130115-3-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260414133734.130115-2-phasta@kernel.org>
References: <20260414133734.130115-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YNHEFVIDDG7ZHNOAGJOXHGBGD3Y54I7W
X-Message-ID-Hash: YNHEFVIDDG7ZHNOAGJOXHGBGD3Y54I7W
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YNHEFVIDDG7ZHNOAGJOXHGBGD3Y54I7W/>
Archived-At: 
 <https://lore.freedesktop.org/20260414133734.130115-3-phasta@kernel.org/>
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
drm_sched_entity_flush(), to ensure that the entity becomes idle.

Cc: stable@kernel.vger.org
Fixes: 9a0c32d698c1 ("drm/nouveau: don't fini scheduler if not initialized")
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
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

