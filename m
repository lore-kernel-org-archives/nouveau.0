Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDBFC5DF70
	for <nouveau@archiver.kernel.org>; Sat, 15 Aug 2026 19:54:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19DE810E60D;
	Sat, 15 Aug 2026 19:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="moa2rCJo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 650CD47845;
	Sat, 15 Aug 2026 19:38:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786822685;
 b=Dr6tsBg59GPof09Kh9QGc32jjQPBhOECvjL1JeH9aeLz3M0UpOMNwAeNzUSmAhce7X2oC
 rUYvWAPW0UH+Aq0qcXyosJrV5q05x/Yf6NLvCaTKtuht646gBJEUx55j1Yj61W/dmD/vigK
 +NnpLVY6hs0INGzHgzG3WCmqVStTHDYA2IYJa18q2aumEYXheKCEwJmYsDIdXsQQSGzXrTX
 O7hNPHJY1Wks654HE4i6eECSsEy3vZORQ9t57sus2XG6YUfuSMRxWoS46/JL5Wr8vtLyeEy
 vTccthX+QDLppOdU5m+Qb8pBU29EgOMEEHe3cfJBazsvVFp4ISO8Q9EcOerg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786822685; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FxobjEeJRawVMzSAB2ltdXyzVXZZsToR6chxQbXYXeo=;
 b=gkSbNO1hWwakFP5MKik4H77bVRNwTyhQNfcdRa7/a9/182/i0hJ4fUjxRZp9svRWRClvP
 IfmP2VLngYZITBu/42GPF50SQ+6AgEUmUNHJeHC+Tif9uGtMMXnyg0qGRUDOcX7OaguBFTt
 KPWXz4Q60NIu8wCtHZXwRkxT3PWnr1gb44qGm1Mbr8ZZTpjVwWfVGaQtGxvQiddVmHz35zC
 /QZpfuWHNpOJmGIBRSWFLb7RKJhuXU0lCP+lO5hDAp2DllJR+6mc0VvURIpJf0CTQIlUytR
 6xqzBguA6zHOOjOFgMSJYngsAGQBEDWFAix0sNevsh39B8grFAbUJW4iIyHQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 40F5A477BA
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 19:38:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C15AD10E485
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 19:54:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4956d1d9fb2so2950565e9.0
        for <nouveau@lists.freedesktop.org>;
 Sat, 15 Aug 2026 12:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786823665; x=1787428465;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FxobjEeJRawVMzSAB2ltdXyzVXZZsToR6chxQbXYXeo=;
        b=moa2rCJo+WIptiTWUHkZHQ9A0olY8ROLj7OEch7IAUYFwvenbu6a+qUcopNGZpNMDO
         PE6L8Micmv3kuLDTU0pqjlYRJ3/uUwDojz3PMsRXJ6cqYliVoN2LuLTiAMb9AVw7powe
         wcFHGpPHTtGdj1Ed6KOiyHELrQbJhKsS5rsJ4vQxTdu6pfbdNI3rdWQHK9TgH6FJCwYm
         YyE2x6O/yijTbZl/IHpFTgZEIXFveiNCfzOy5PEkxZ8wclx9tG2wH8v4cZ0zgYGb1GhC
         qaju6OTyYHR2IOKM3UFyK3j+VbVhcGsiV+pbzMdy93K1ySYeugCwvGPaqbQwb7agJpYz
         Gjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786823665; x=1787428465;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxobjEeJRawVMzSAB2ltdXyzVXZZsToR6chxQbXYXeo=;
        b=dzMhGHgDhTix+lTpXeKaTIFweQeBRL1EMQZY4Wt3RU5VcqpvrSoTrsXkXWRuIx5WS0
         f+ol+DeVYRDpPhjkNsh0t68UJSSmm2vL31lRoiIt2BZcPyMP2agT1J7Zhn3W9NE8rU7M
         EbVU89QX6/6Ysua65AVmD8kYd4b8CBBfPWRl/bmBUmMNvvl77pVnjEa2RLJMba+rS3mn
         YLRubCHnbNc7JcI7xRQAvwTczG72rtX+HuVEp9M2vC22ylw1mlp+Fp/4cgikSUrCqNty
         g83rINFZw4bX0pcCgCFZjxW+vY2YoKHGbKMH3MdivxTicGs10dvFb5VsRDXF4T55VheS
         kKZg==
X-Gm-Message-State: AOJu0Yz5Gfq6is0rxKKQsqhfbz8HGoiuWiZjuQ7s84+zNqFABOdewv+Y
	aGTQIg5/m3RBu4u1SvfWXGoNQtMRNgX6y6Xtb+LdOEQ3V73SaODEnrnHPDAYkcil
X-Gm-Gg: AR+sD12mUaP64cWJbkHIIGT+55TatQFGysvl76tcXYRIZwd7y4zmcmFNxmCUBWyF71f
	xUpwhVYtQ0eOvNYSHgHc3GShgqi/gPC9s8pNy3IBM9loIj0ZUTJ1CgtVDKlbGjoGwmasCdr7qhJ
	SqexCEzWEqJXXlG36e0IM48Vn2sbwxvlYcWwGws4zcNIzDTaVXl1S8Dg2HUCHP/FEGKgVkFj9Ph
	7s7UkLkMGChRTJw/4TjwkKI/eg/xQsdFUicm8wvXPLpdejoVLXpNIaBY53WtzLg91pAyiQZmyDP
	jVWT6QAe0UfNcKPebPJX7yYkGu2kFZ6hLDpYnF3iowFMr4+a5nn5W+PqXFreCVQUPVKZXKfzDRg
	UckSJjM3TYfSwmOxjbsxVHeI0CIBvWzx9uDr3+28c/hEYbFtXaTUbnb31Mva50ouBtzNYsfvjkI
	krbq0+SkOFCuk4I7cOFW6iJRJBW5quTGX2gtFOvgPWoWgs/TfOBjshue40ahe1xaO7SKLgDPgKN
	rLsWPjgRNUM6w1AyTUpaNBcIYVkswplyIFl+iuTeg==
X-Received: by 2002:a05:600c:a47:b0:496:bbce:ef with SMTP id
 5b1f17b1804b1-4998796ca48mr110524505e9.3.1786823665137;
        Sat, 15 Aug 2026 12:54:25 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899bff2csm133743775e9.7.2026.08.15.12.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 12:54:24 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: 
 [PATCH 1/3] drm/nouveau: destroy the fence event before cancelling its work
Date: Sat, 15 Aug 2026 21:54:20 +0200
Message-ID: <178682366002.3748010.12779628082366287968@gmail.com>
X-Mailer: python-smtplib
In-Reply-To: <178682366001.3748010.7798811159846779765@gmail.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID-Hash: IP56BUL4CLAJ4CWGK4PQU365WWQXIKJQ
X-Message-ID-Hash: IP56BUL4CLAJ4CWGK4PQU365WWQXIKJQ
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IP56BUL4CLAJ4CWGK4PQU365WWQXIKJQ/>
Archived-At: 
 <https://lore.freedesktop.org/178682366002.3748010.12779628082366287968@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

nouveau_fence_context_del() cancels the uevent work first and only tears
the event down afterwards:

	cancel_work_sync(&fctx->uevent_work);
	nouveau_fence_context_kill(fctx, 0);
	nvif_event_dtor(&fctx->event);

Between the cancel and the dtor the event is still armed, and
nouveau_fence_wait_uevent_handler() queues the work unconditionally:

	schedule_work(&fctx->uevent_work);
	return NVIF_EVENT_KEEP;

So a non-stall interrupt arriving in that window re-arms the work that
was just cancelled. The callers free the context immediately afterwards,
for example nv84_fence_context_del():

	nouveau_fence_context_del(&fctx->base);
	chan->fence = NULL;
	nouveau_fence_context_free(&fctx->base);

nouveau_fence_uevent_work() then runs against freed memory, taking
fctx->lock and walking fctx->pending.

Only chips from G84 on can reach this at all: nouveau_fence_context_new()
returns before nvif_event_ctor() when priv->uevent is clear, and
nv84_fence_create() is the only place that sets it.
nv84_fence_context_del() is the context_del for all of those, because
nvc0_fence_create() and gv100_fence_create() build on nv84_fence_create()
and override only context_new.

Drop the event first, so no further work can be queued, and only then
drain what is already queued.

nouveau_fence_context_kill() keeps its place after the drain. It can
still touch the event: nouveau_fence_signal() returns true when a fence
that had enable_signaling() called on it is signalled and
fctx->notify_ref drops to zero, and the loop then calls
nvif_event_block() once. That call runs in the same thread just after
the dtor, where nvif_event_constructed() is false and it is a no-op.
Blocking an event that no longer exists would be pointless anyway.

The reordering does open one window, so it is worth saying what closes
it. A fence holder that reaches nouveau_fence_enable_signaling()
between the dtor and the kill gets a silent no-op from
nvif_event_allow(), so that fence will not be woken by a non-stall
interrupt any more. It does not have to be: the kill runs immediately
afterwards, signals every fence on fctx->pending under fctx->lock and
sets fctx->killed, after which nouveau_fence_emit() refuses further
work with -ENODEV.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260812231330.705425-1-mczernohous@gmail.com?part=1
Fixes: 39126abc5e20 ("nouveau: offload fence uevents work to workqueue")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index edbe9e08ba0f..4a3698dc2cd1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -96,9 +96,9 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 void
 nouveau_fence_context_del(struct nouveau_fence_chan *fctx)
 {
+	nvif_event_dtor(&fctx->event);
 	cancel_work_sync(&fctx->uevent_work);
 	nouveau_fence_context_kill(fctx, 0);
-	nvif_event_dtor(&fctx->event);
 	fctx->dead = 1;
 
 	/*
-- 
2.54.0

