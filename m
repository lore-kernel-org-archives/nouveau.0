Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B259C5DF96
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 15:23:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 50B0810F318;
	Fri, 21 Aug 2026 15:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z/y22Gub";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B858147A8E;
	Fri, 21 Aug 2026 15:06:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787324794;
 b=rAD/ZEDhn0FD5aTIdJPR26F8TkrZNv0QPOksYN9kE8y5DWZNAGP0UsFWJGxZoyJBIW/xR
 Qkws5qcEv2eWXw8lrWDSDzTz4ZPJKWyFfiqXImtUzpsfxaU/MeJxR54QYEZxvXX+7Gl3Mm3
 Lk6Z51jeaIAPzTTVk5JTbyal8adwdx9OlE3bOAejmmp5ysbMJ1Y3VDTpgAwzPQI+Nnbq0nx
 7x0ccPN4ZDhfEaRSg8emvT/Gf+SZ9JTWChYwyX/t8LjIQdvVuA/gK90hpM9YS3caLbdLIQ2
 LDdMvegWzMBFn7ri6D0QwZ2gQwVodN1gGCv8olxf/2niQmZ+KjwEJw2EgwwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787324794; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YGnVjNNQSxXEhjGwV8/5Y2JvucgSZxjVxoUzS+hSzcQ=;
 b=JLgfTU0eveDKgLnblkbk2CLM1IwW5Un/ixwY2VXvIW6+xNWkXoTr0TCQA60jOu0m4L8a5
 KYuRcYv+ZTSiGFDqWZi8HaQdc4SUTy6JpBFwMPhRdrRxaT0gZ5XHZw3gvLTUW4c+66Nomk+
 vzmSdFDTS6ecD/skInk6XXXC68kmYdPdadk/oi1imAMeJ57KAoZ7+YCvhhX8ls7DUG1xDpg
 rFf4XX27243Lq6Y0X+CUcKgNwJSkcZh3Kxp7nPmJKH8kGGkR0umdKr0Yrrz7Rp2udH97c1T
 zAPttY9nkjfLMY9XuGJQ3nM3TwAnVdIVQR2goJ2u/1XA2B+4skiEXo46SLtg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E93EC47A9F
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 15:06:31 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 57C2810E2EC
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 15:23:09 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c082647cd0dso11699266b.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 08:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787325788; x=1787930588;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:cc:to:subject:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YGnVjNNQSxXEhjGwV8/5Y2JvucgSZxjVxoUzS+hSzcQ=;
        b=Z/y22Gub4YgjAxwD5wHrDelj+d7iCI5pbMLgW1kpp2J5Fw2pFLHdzchlp1V4YhGfmQ
         7uNSYgdUc/7jP/4fUmn0ECXdq6qMzhZv0t52bVU/CT5GupGn/t0IrMs087xZhO6OqeIz
         VYXxLBx84UqD901tFleqiUq0Se8OTDBFYN7xs4gibTh153gUcozHW16A03S7Up49tyRk
         P+HjBWry5hH8uSDQXYV2Y5tBc0VRs+XKiIrtCwhg8LG0BhsCE1JeJgKTFSv+x0hN+7lc
         vuHQgpjXz8SA8jEYvJQ8dikxfECjIf/D3hrekU5k174wmhk6cMeXGpXE6z3m/wN3Fy+9
         hKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325788; x=1787930588;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:cc:to:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YGnVjNNQSxXEhjGwV8/5Y2JvucgSZxjVxoUzS+hSzcQ=;
        b=kPWbk51SZB+0OlklNsaP2ROtZnNPXuQMQtkim+Zo+BIJLu76HVdY6HmPVdKVna5GUh
         qzL+UsJR2D4j3K5Dg+fbP5a46jcl7lFOAQplsYIFS6JShaxMkjrGL6R2f/+K3YESKh2y
         cEUvxzRsds/Bl7JeaWVv1OzWuKJoi4HcMp1aPMOVN7vvWlFWlqXmOpCv8rqeJzzzygSh
         oZQW1OD9WiG9k9/p/ryn3y6yhP9XQXh7xWo1MjMDzbtMtEy3TWpw4LfqLkZSAxIeTquW
         O7/Gm2Gp4Ywl1nOU/4y34FpxbThur5rhtU8TlC2/GIAiVHd6HOB/Jw+6fvGEs48dQN7o
         VAwA==
X-Gm-Message-State: AFuF++m00cujx8uCDv2xa1iwUZMm/GF7EABxHwcXIGRvSo1wsbaleoNN
	KUp1agtN0BC0ZBy0HY4wzBAXdSoEDf8PHVgics/pb5mEJgJ1EkpkQwaAAQfS6kwX
X-Gm-Gg: AR+sD11SJFBHwTHWrg0LtNzpxx+aK2d5wCWBx1SNPQ553rLtgiuq8u20Xlpx9LlfgVL
	CcvfgofHEtd4q3ba00MwqPE4SuylJ62Ym54cy+1pMs6XRKliOk/4nhAq0G3mOqDhEg5i1fELyKF
	2M+AGoLut70oKRIQ1KqGgD4PfPLrVPnkTa7LqJGQZGgPFlluJuWVOTihBZ+zzi5fPx220RvNbfc
	tXw5+I5WOvuVZnqphYImDukRtugLYn5TAWkhidW+ojz9ig4QEpseM/UTRVBpdfkvFSrQERV+jkK
	gsVxXF267ke03ZQKwfq3SK7WaDwRbMYZLKh5iRddfF+QpS2b2x9jxqNXlP+AGYjG51qKHISXbYx
	g4XnBDis5lGiX1oYCK+81REO4yRvYWt9PSWoVA7Egl2y4blRV5/nAojMVnOAF27+BSqQpv8j9aC
	9/TrK4VhV7DMFRYP0nREbtpwY6PoGLM50/vCdskuMx0Bo2SmstiUzIyagdJgdnF8o5itL9ArqAC
	8RYxowEeZeFrS+FmeoaMAQox+hKx7QdfDvozpPA/w==
X-Received: by 2002:a17:907:6d20:b0:c15:9f0c:8d31 with SMTP id
 a640c23a62f3a-c246a5f67f3mr391862066b.2.1787325787404;
        Fri, 21 Aug 2026 08:23:07 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24591dc662sm506198566b.42.2026.08.21.08.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:23:06 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
Date: Fri, 21 Aug 2026 17:23:01 +0200
Subject: [PATCH v4 1/3] drm/nouveau: unsubscribe the channel-kill event before
 the fence context
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <178732578167.167481.14789825868710929167@gmail.com>
In-Reply-To: <178732578167.167481.5619512544301226563@gmail.com>
References: <178732578167.167481.5619512544301226563@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HG2ML2F3E3EZRPMCH4JI2XEUIPJ4CDQ7
X-Message-ID-Hash: HG2ML2F3E3EZRPMCH4JI2XEUIPJ4CDQ7
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HG2ML2F3E3EZRPMCH4JI2XEUIPJ4CDQ7/>
Archived-At: 
 <https://lore.freedesktop.org/178732578167.167481.14789825868710929167@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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


