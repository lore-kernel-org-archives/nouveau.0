Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D561C531C7
	for <nouveau@archiver.kernel.org>; Thu, 23 Jul 2026 10:06:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2889A10F06C;
	Thu, 23 Jul 2026 10:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=u-bordeaux.fr header.i=@u-bordeaux.fr header.b="aC9fw73w";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 61FC94733D;
	Thu, 23 Jul 2026 09:50:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784800258;
 b=X+xaFXmIrt+RIrB/czKq5kvDRcKElfWvaI908BnkJQWamCjW7Tm3Hp7ZyYzsFWR2pCNwR
 o1hmcSMZg2DjFGo9N2k1m/u5w84y6b/8Bkj3rYlik59r6RkeYGbsCGfS4oqFg9wX6JsWAZ2
 z9V60P3rdNUqTBTR4rehyy1vc3Icp6gc7C/5nOaiLqwIPi7JnPGkJYJCAOr1EeGX8XlSp28
 5luKKIPSkGOTyowd3LKAWK/WJmN+OvUXA1FvLosIFlyauXYIke37vCLM+ooc6t7NUwv3RO4
 buToU8y0DDvfN/98KAV4NRNUCN85ZBtcKgfXwgbOzYIo0y28+aew258OQTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784800258; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=21cItyY5SVbKTkz7hNyqC7CX0qWcyQCvSirRm3tfbcY=;
 b=NheTXuGqew85U+O0gv6WHHe5rk5ti8T2qtGL+l1kYOUllm4zHnXab/8sKOsssY0JDAUGP
 7Zz09UEU51OyMbALGYwQVBd9j6gXtNCUqr6yypkjS5lftvbAmauepcwIM3LA++Ke2ggRO4K
 EHI7anSt158UaXw4FDb0wlS76zgaETVZlALvGSPXvraysR7ztabmVcgaOnpaqsjnaRNTyDA
 u3XkV58qoaZtqyNbKwTvCgjCsmLYXfthOtOxGa++xYXH7KXioTQPicfVi+L4rlHr8UZkmaI
 UGIlgJ0ukj70eGtsbSkGYp86j+sONmKYJJCSQTAhu/uxrnE7vY3Mj3Cm1WFQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=u-bordeaux.fr;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=u-bordeaux.fr; arc=none (Message is not ARC signed);
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 40F2346DB1
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 09:50:55 +0000 (UTC)
Received: from v-zimmta03.u-bordeaux.fr (smtp.u-bordeaux.fr [147.210.215.83])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0AD10F065
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 10:06:27 +0000 (UTC)
Received: from v-zimmta03.u-bordeaux.fr (localhost [127.0.0.1])
	by v-zimmta03.u-bordeaux.fr (Postfix) with ESMTP id 389AB180416F;
	Thu, 23 Jul 2026 12:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u-bordeaux.fr;
	s=2025032601; t=1784801185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=21cItyY5SVbKTkz7hNyqC7CX0qWcyQCvSirRm3tfbcY=;
	b=aC9fw73w0HBXPs4WYeNh203bQTTWdi1HkXTtcvRAiYMH/6LH3DPT6bXirMcC0UB1A1nk6p
	Cj9VLwLdNHtAtEQcHo7/I828DZeUT0G87J7q1vFbBMoEcFKowFHCish1pnYdXyvnaYC5BZ
	snAWnaE/0xxwBbdfd9RuXmz+BA8V4LdY16z+WOw71Nqzj4F8Kod1FcCOjBRkFl0wnyVaua
	KQR5UWZOMTNNuKItY5jbo5Shd8NoCfsZLPAZOITVoPP3ssq/LzdjDiKuWPffATErAYNGb+
	NSvpX0t/iCHKV2vw8+q9JQ2/1axaGVOFM0EZRJXlRaxqRBQqhSSlLCqr4pRKcQ==
Received: from [147.210.8.222] (callisto.labri.fr [147.210.8.222])
	by v-zimmta03.u-bordeaux.fr (Postfix) with ESMTPSA id C9C58180416B;
	Thu, 23 Jul 2026 12:06:24 +0200 (CEST)
Message-ID: <1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.fr>
Date: Thu, 23 Jul 2026 12:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
From: Emmanuel Fleury <emmanuel.fleury@u-bordeaux.fr>
Subject: [PATCH] drm/nouveau: Fix NULL pointer dereference in
 nouveau_fence_sync() when prev->cli == NULL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Checked: ClamAV using ClamSMTP
Message-ID-Hash: XLZTFZEYSEKVI5EDZDDPZ6DKRZMT5WFB
X-Message-ID-Hash: XLZTFZEYSEKVI5EDZDDPZ6DKRZMT5WFB
X-MailFrom: emmanuel.fleury@u-bordeaux.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XLZTFZEYSEKVI5EDZDDPZ6DKRZMT5WFB/>
Archived-At: 
 <https://lore.freedesktop.org/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.fr/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

I ran several times into a kernel oops caused by a NULL pointer dereference
in nouveau_fence_sync(). The variable "prev" may be non-NULL while
"prev->cli" is NULL, leading to an unconditional dereference of
"prev->cli->drm".

Prevent the dereference by checking "prev->cli" before accessing
its "drm" field while preserving the existing logic.

Fixes: 1f9910b41c857 ("nouveau/fence: handle cross device fences properly")
Signed-off-by: Emmanuel Fleury <emmanuel.fleury@u-bordeaux.fr>
---
  drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c 
b/drivers/gpu/drm/nouveau/nouveau_fence.c
index edbe9e08ba0f..90e6e89c0911 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -374,7 +374,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct 
nouveau_channel *chan,

  				rcu_read_lock();
  				prev = rcu_dereference(f->channel);
-				local = prev && prev->cli->drm == chan->cli->drm;
+				local = prev && prev->cli && prev->cli->drm == chan->cli->drm;
  				if (local && (prev == chan ||
  					      fctx->sync(f, prev, chan) == 0))
  					must_wait = false;
-- 
2.53.0

