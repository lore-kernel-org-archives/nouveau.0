Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2558CC5CFEB
	for <nouveau@archiver.kernel.org>; Wed, 12 Aug 2026 23:13:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 31CA010F15E;
	Wed, 12 Aug 2026 23:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tu1feQhY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D73C44770D;
	Wed, 12 Aug 2026 22:57:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786575439;
 b=Mblo+dhQu1mY/0FQHJfoyoS9VR4pac+53/k4stmkt6lC2hAiu5k0Edgsqkm53+LntDoYW
 XO4U2g8oRZUppzTXuOr2jl2l7ZCdH9M0t3LhYMYTGNem21p57MW47pMWbp5j3sNVXeyqluj
 lsDgZ+AKfZ6ykYFV3s0vU+3LmPZ1m9o/8SKfoEIbZEFdRmBTHyD3BxJJcgADMyJnChGNe5v
 0ai/sld8bN3S3kHPwd7IVrtbZ24+FlcYXI41U02aqK+GYnOQ+0uZjcdh2RK1g5IjUYucHp6
 7Pw7R4987Dyh3zlCRdVn3PwZs35TLzG43XHnFAzp/iRBSJZR8b85KZUIA/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786575439; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AEqCe/HJ702G2+cOJ6AJfXRuzYV9ZGHajSHLyVpChGo=;
 b=IFCRoec0foVrwxWerUIXYaXKAO5Lc+Ui425Uysx0Gp4fOjTHPfjBD3EUZ36f34Ce/LnrC
 FCXFi6czAEOiROW6f4sdRlEU1ZLQCCobdxK8BfZlo5yeYsI2rMjr24jg+mUxgCYSxQQCfL6
 3CsnG2OXNVmV7tsS+tkgQpF5Z0jjKJ2JWSiwwCLYyD5lrxGzoRAGS3/gxxw1OxIHtn2ULID
 Riy82h9KvfRTdL7Lj3IjdzPgwLJMrrhI3okwFa+GBpd5t8Jy20CZ1lGp2kohVf4Ke6EJdMr
 KWDU5b3v46A647VS6H7k65HJPNqhl2qvVaku+VU9EWfSTEOStvyUZLSO+zBQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3C25547706
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 22:57:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF8910E46F
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 23:13:35 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4954c08a7c8so1337625e9.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 12 Aug 2026 16:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786576414; x=1787181214;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEqCe/HJ702G2+cOJ6AJfXRuzYV9ZGHajSHLyVpChGo=;
        b=Tu1feQhYvwAsDgMvzz6UgcveQYzfU7m4OPehVi862PJM/jkpnj/js4r8WITR8iAG+B
         nHvA2D7MLXPnp5fb56eU7mIkn8JGUBWsv/L7P6ptPCQngVK3LK/p3jTKVSYHH54TncxU
         ZPxjYAbRlmxRHYQNwdjsiqx9wQVM6XVzUIx36T3bxJppGn9xg0Z8XdqUpvkUrQUWeGDN
         E88swdTKY0wPy16XiGJwIACuZqfXXIi/5NCiictHWjpRvXzwY1CExQAIQSq6pbvlHoJM
         h66lViZM/1AWL0y6bz4mCX8Nv4J+IFZ2Y1tAw9db8p2XjxLCikRL6buec1CY3qMYIy0F
         emsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786576414; x=1787181214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AEqCe/HJ702G2+cOJ6AJfXRuzYV9ZGHajSHLyVpChGo=;
        b=WTPZVOOb7hstcHdva39tyShVRBcNDefoZd4Lumx14Fwfodk0WpoTddLpQ/SeXB+UcZ
         CnbvQt010r9j7UMTjTFKVrrX1k+QLhmocxITeiazdFjfEgpN6YSpaXMcEXKy5jCFogDm
         CaMUu2bfqaS2qpexG/zXJzKz75J9gsgf/xIcYsPlgFAbH9yw8gEQ33ryuUGcO0WNbKlT
         i0kO5ejUwhmh8ZXqa0klqx18dreXEP3XkYKRccTfn4IbyHRFrAZh311hMF63EdIrJJ5Y
         UeB3MBUD5yZgLsXNO9dkdG9Ak1rFHFtHliOXYgVII+eNLi5kq5/ntKS8ugP6Kq1f5PAG
         u3Mw==
X-Gm-Message-State: AOJu0YzDWTNubuvsDcCnA963tuRnhBGR0MSSNkfil3JQQZ/++Glxx+H7
	r/bdZcib3XtTW2JSS+kfFMIfPoGBMwk5ZUnULaz5e61fKkKla0sVb08ePjb7kNMh
X-Gm-Gg: AR+sD134v6bLv5icFKiG06zhG60EP0HQlqBKBcrf8EVudYiXoEc/NnRJKFXG+tima7n
	xfPGAx8raxqXbpIskHVarTA5evgSVsLmZHa/5Csp0ZOB8+nxVtw5G3z8OsZMz3x9Ya2g5zxjr6d
	QC+9TMv5EiI1+26HHAzOLHyyBhouO8Fm0zjq987DWCWzW82dMEPYRX0Bc8OruTjs59p0GJQyp5c
	BMt14BPRmxHy07JsIOc026pMJI8720Uw7M3KcF7czyb8fVb85a8lg2k/P/cxxEr/JGcGOQnDI8f
	32ODn3fLap99GfVLptVhrFBZ/sa3wPDPHBwXBEm6yTm8gmzwFRB5QpREVO2JQlx7QjwmYIOQ/BL
	LR0G3iVQI8lLlnV4QlWy6Vi+HiddxdaFwT8oE/oBf+R4j2TtlHy/Zj6f6k/EPVvFlutfZ+8tGqL
	keYkZ9Ik6bC6p6tEsTNARHlUfq9TqTr0YjW3HlVhcz63n5O14JfHhsN2MrD9MvZOJKD+jioJlIz
	0ykCM7jpI56MDRu2U3GwVP5eqU5JGJz8c+E0bVa5FiJe5MYIV9E3R12lgk/Npt0pA==
X-Received: by 2002:a05:600c:a05:b0:495:7561:a9cc with SMTP id
 5b1f17b1804b1-499821e762dmr6690785e9.4.1786576413605;
        Wed, 12 Aug 2026 16:13:33 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b631c1sm44532245e9.14.2026.08.12.16.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:13:33 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/nouveau: unsubscribe the channel-kill event before
 the fence context
Date: Thu, 13 Aug 2026 01:13:27 +0200
Message-ID: <20260812231330.705425-2-mczernohous@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260812231330.705425-1-mczernohous@gmail.com>
References: <20260812231330.705425-1-mczernohous@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OEHQHN526GTN5XH25ZVZCQETTJ56YEMW
X-Message-ID-Hash: OEHQHN526GTN5XH25ZVZCQETTJ56YEMW
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OEHQHN526GTN5XH25ZVZCQETTJ56YEMW/>
Archived-At: 
 <https://lore.freedesktop.org/20260812231330.705425-2-mczernohous@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

nouveau_channel_del() tears the fence context down first and only drops
the channel-kill subscription later, in the middle of the nvif object
teardown:

	if (chan->fence)
		nouveau_fence(chan->cli->drm)->context_del(chan);
	...
	nvif_object_dtor(&chan->vram);
	nvif_event_dtor(&chan->kill);

The subscribed handler is nouveau_channel_killed(), which calls
nouveau_channel_kill() and from there nouveau_fence_context_kill() on
chan->fence. A kill event delivered in that window takes fctx->lock and
walks fctx->pending on a fence context that context_del() has already
freed.

Nothing reaches this below Fermi today, because the subscription is
gated on FERMI_CHANNEL_GPFIFO and nothing kills a channel there. On
Fermi and newer the window is real but narrow, since a kill has to land
exactly while the channel is being destroyed. That is reason enough on
its own, which is why this carries a Fixes: tag. The last patch in this
series subscribes Tesla channels as well; nothing kills those today, so
it does not widen the exposure now, but it is the groundwork for a
recovery path that would, and the ordering is better fixed before that
lands than alongside it.

Drop the subscription before anything it depends on is torn down.

Fixes: ea13e5abf807 ("drm/nouveau: signal pending fences when channel has been killed")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 598513f60449..f142f6310596 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -90,6 +90,14 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 {
 	struct nouveau_channel *chan = *pchan;
 	if (chan) {
+		/*
+		 * Drop the kill-event subscription first.  Its handler
+		 * dereferences chan->fence, which the fence context teardown
+		 * below frees, so leaving it armed across the teardown leaves
+		 * a window for a use-after-free.
+		 */
+		nvif_event_dtor(&chan->kill);
+
 		if (chan->fence)
 			nouveau_fence(chan->cli->drm)->context_del(chan);
 
@@ -100,7 +108,6 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		nvif_object_dtor(&chan->nvsw);
 		nvif_object_dtor(&chan->gart);
 		nvif_object_dtor(&chan->vram);
-		nvif_event_dtor(&chan->kill);
 		nvif_object_dtor(&chan->user);
 		nvif_mem_dtor(&chan->mem_userd);
 		nouveau_vma_del(&chan->sema.vma);
-- 
2.54.0

