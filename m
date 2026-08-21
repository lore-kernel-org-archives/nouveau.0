Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B37C5DF94
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 15:23:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BEC2C10F31A;
	Fri, 21 Aug 2026 15:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MkE4Lcu2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3333D47AA2;
	Fri, 21 Aug 2026 15:06:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787324797;
 b=vSbkWdCTkujcMWJ9GH1JSgDX98sKsO+W2erG7gAjA9/4RvWXp17KWKUCiRs8RYUeLOaDL
 ifermX60RZkeFANTS4EkbG4wcmH7Uhe3k8UcUSCoNNFtqVbdk2YjiDGnfGVntX4sE1nrYD8
 3hY+zihIMojy/rlLEysX6HogcCDu5nC70YFpHvYSeEz2I+1zm2SlycSPDkvmX68xakHmFy5
 tj6jD/u/qob1VXQZFjFKOHk25HLb2hIDVCCdkoj+LmGoOj07EO6TjSAle5cBNrSHI3p6s2c
 ZSEws/SdGA2AMxNt9F/77CvAhZo535/5tQ6QZ1yasDqNmU8mMjx/z51wA6Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787324797; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vYeEFSz/we+8LtDsD3eJWBaG2LH+3C5IKZLmMvYVchk=;
 b=rX7e5jus8HBktWBf8ohD7BpW4nmzkesIVtwUJvGptG+X7b/yep6rBlTx56X8PfWoCR2yQ
 IIGYa6bwB1w8FSIPgeUR6qvJoCfuwgLFGOY8gXmv3QF6R5qcAuUuTpUikN+BKr0GGCy+ZQg
 T0dUPxsVQvuywqeSW6CL9IbH/tBH5jqyLf+0HD02VwGAVpSYWbjpOKjK0NflmO6LGBi7bmY
 Rd40iRXWHz8ki0adTv7AYpLLzU1Aar7gJft5Y2mERcvYhkV2MoZ93smSwpGZ+iZ0oJAdbcZ
 bjS+FBjxl+we64QLRyzDjp2ukFIk4NxcWU5jRGylzsoODadSchsM9xKPY1+w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AB78147589
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 15:06:35 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F3BEF10F31E
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 15:23:12 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6a1541ea780so210653a12.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787325791; x=1787930591;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:cc:to:subject:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vYeEFSz/we+8LtDsD3eJWBaG2LH+3C5IKZLmMvYVchk=;
        b=MkE4Lcu20P3nbKBTVvbv+P+o+lO0ADxQZfj2cQejOubfdG+80HZFM2R0XYZuZtVYo1
         0OINcrTeYAkmMwniuH3eni/Kgrv3pgVzFPNqNpCBsifb4OvooOG2+Msemph+cNO7+cgk
         RYCIqXvJWpRE83VszBska0P/GJCIBGdEBbplxrlKBmPLITrCpIeKkXNxjBzS9XuK79ph
         FLT+E7UtSQq9bpoXDmf1FtsdqlPyW+t7LSfs78Hfztw9GLjd6QeeEu+Rqx/EtTodXT9Z
         o3T5gYLwnITE2b2/gOApy/EoQYTEPORLEjoUrF8ns1h8vZrh5/RWTY1/g/p8hcR3Nm1r
         2u1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325791; x=1787930591;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:cc:to:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYeEFSz/we+8LtDsD3eJWBaG2LH+3C5IKZLmMvYVchk=;
        b=AqLk5LD1QcOBgSmkv0H9E3IA2yqc3bgjmuuebk57YKoGPefDMaNW1twjjzTN1mBFna
         x2ZEd4OjZtMesBQWm+4UC+EPe4nTkTyOoGD4o+RlJg1+XYSNeJmgZA/xf4ejA7h9P2XR
         83WyGyt1B+d92MdpsVxiE17ecbGvfx4NgY4bXRFx/U9UmP/+sCAi9MPSlzvs2df3bupR
         iilZrkhmhl4+M2Gixwamqd+Sx6QxDg+oVmkMS/ifvUoCvt90sms+NurOY9XSGajqrbos
         mV5Mzr760Rtp4M66VqrVeQ3siltwvHQm+D2g8TZCtGBBueutd/H0N7bakpdyh0T12kQW
         cr+Q==
X-Gm-Message-State: AFuF++mK6PN05IWpgGOOGwbPQriCcWo22O7fanxGeP238hJO8eSAvLKb
	BfROptDC0y9FPmML/UhKyTGtcY02B62Jp7H1hYwrgQGdjMM6xm99Fjqry35cV42n
X-Gm-Gg: AR+sD127uQvyLIGdMVBtRfPV7OahHp3VtuekJGURrRmUNnH/F9NwohvN0pevns6FlM9
	jim4w11LJGArpklzaBwyp8N9VjVle3zDFDEbVzpyVkDpIIBmesqL2I2NkzwJhgzRNjXgr9Oamap
	8LEFgfGXgjhLfwagXyjx6IEpCXpQVNr1xZA3u9O9ekgMcMsddzjI0S7DrKeli76+uMgZvHQSl+5
	FU8JsmL+CZLyMjD01/Nc+sDi4+uOUbjJHB7OmrqUqQ9moCO7fXCjhl0YnOzivUtAHMmYwvJp9O0
	Jqj1H+a9knqVScA/yONUodKQ9LJp6r2rY68Ao6lnOBVUNb8RMJ5Yql0U/4g7AZdHwoyA8Kn+hk5
	axfclrE7sIwQ4GiTvNVowvaZH1gPBamneBUGpcM464hv3Eq9HMs6nkhti6GEP9OS/qyt7yGsBZU
	wzb/euCliBpeEKnFIhqgZb4vX3ewwVhRfvMyvEiAb9Wx/ShFSCUSwmOelSWc1G+u5MTxhm8xhf0
	6zub3eSiJ52/KypmA/CEw+acGrJmRWlAA/YtUlF8g==
X-Received: by 2002:a17:907:84e:b0:c20:7897:bc67 with SMTP id
 a640c23a62f3a-c246a6a8e0bmr384314166b.3.1787325791134;
        Fri, 21 Aug 2026 08:23:11 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24591dc662sm506198566b.42.2026.08.21.08.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:23:10 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
Date: Fri, 21 Aug 2026 17:23:01 +0200
Subject: [PATCH v4 2/3] drm/nouveau: don't kill a fence context that is not
 ready yet
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <178732578167.167481.4590474568281802870@gmail.com>
In-Reply-To: <178732578167.167481.5619512544301226563@gmail.com>
References: <178732578167.167481.5619512544301226563@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7T3FC7MQTIZ7JEDN5L2DKQHDTYMOWNRL
X-Message-ID-Hash: 7T3FC7MQTIZ7JEDN5L2DKQHDTYMOWNRL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7T3FC7MQTIZ7JEDN5L2DKQHDTYMOWNRL/>
Archived-At: 
 <https://lore.freedesktop.org/178732578167.167481.4590474568281802870@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_channel_init() arms the channel-kill subscription early, right
after mapping userd, and only creates the fence context at the very end
of the same function. The handler it installs, nouveau_channel_killed(),
reaches nouveau_fence_context_kill(chan->fence).

The NULL check in nouveau_channel_kill() does not cover the window in
between. Every backend that can reach it publishes the pointer before the
context is usable:

	fctx = chan->fence = kzalloc_obj(*fctx);
	if (!fctx)
		return -ENOMEM;

	nouveau_fence_context_new(chan, &fctx->base);

and nouveau_fence_context_new() is what runs spin_lock_init(&fctx->lock)
and INIT_LIST_HEAD(&fctx->pending). An event arriving after the
assignment but before that call finds chan->fence non-NULL and unusable:
nouveau_fence_context_kill() takes a lock that was never initialised and
walks a list head whose next pointer is still the NULL left by kzalloc().

Give the fence context a ->ready flag and hand the kill over through it.
nouveau_fence_context_arm() sets the flag once nouveau_channel_init()
has finished building the context, and nouveau_channel_kill() leaves the
context alone until it is set. A kill arriving while the context is
still being built is no longer lost either: it is recorded in
chan->killed, and nouveau_fence_context_arm() acts on it as soon as
there is a context to kill.

The two sides hand over rather than exclude each other, because the kill
side must not touch fctx->lock at all before the context is built, which
is the very bug being fixed. Each stores its own flag before it loads
the other's, so at least one of them observes the other. Both observing
it is harmless: nouveau_fence_context_kill() then walks a list the first
caller has already emptied.

This does not close the other window. A kill delivered before
nouveau_channel_init() subscribes is still not observed at all, and
nvkm_uchan_init() makes the channel schedulable before that point.
Closing that one means subscribing before the channel becomes
schedulable, which is a larger change than this fix.

The approach is Lyude Paul's suggestion. It is implemented with two
differences from the sketch, both following from the same detail.

The sketch checks chan->killed before setting ->ready. Both sides have
to store their own flag before loading the other's, or the interleaving
loses the kill: arm() reads killed == 0, kill() sets killed and reads
ready == false, arm() then sets ready, and neither calls
nouveau_fence_context_kill(). That outcome is reachable under sequential
consistency, so no barrier can forbid it and the two accesses have to be
the other way round in program order. Swapped, and with the smp_mb() on
each side, this is the store-buffering pattern of
tools/memory-model/litmus-tests/SB+fencembonceonces.litmus.

The sketch also holds fctx->lock across the handover. The kill side
cannot join it, because reaching fctx->lock is exactly what has to be
avoided until the context is built: on those backends chan->fence is
published by the allocation, before nouveau_fence_context_new() calls
spin_lock_init().
So ->ready is read outside the lock. That answers the open question in
the sketch as well: it does not have to be atomic_t, but it does have to
be published with release and read with acquire, so that a caller that
sees it set also sees the initialised lock and list.

Fixes: ea13e5abf807 ("drm/nouveau: signal pending fences when channel has been killed")
Cc: stable@vger.kernel.org
Suggested-by: Lyude Paul <lyude@redhat.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c  | 19 ++++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 19 +++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_fence.h |  8 ++++++++
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index f142f6310596..605ce74c0d15 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -43,9 +43,17 @@ module_param_named(vram_pushbuf, nouveau_vram_pushbuf, int, 0400);
 void
 nouveau_channel_kill(struct nouveau_channel *chan)
 {
+	struct nouveau_fence_chan *fctx;
+
 	atomic_set(&chan->killed, 1);
-	if (chan->fence)
-		nouveau_fence_context_kill(chan->fence, -ENODEV);
+
+	/* Pairs with the smp_mb() in nouveau_fence_context_arm(). */
+	smp_mb();
+
+	fctx = READ_ONCE(chan->fence);
+	/* Pairs with the smp_store_release() there. */
+	if (fctx && smp_load_acquire(&fctx->ready))
+		nouveau_fence_context_kill(fctx, -ENODEV);
 }
 
 static int
@@ -494,7 +502,12 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	}
 
 	/* initialise synchronisation */
-	return nouveau_fence(drm)->context_new(chan);
+	ret = nouveau_fence(drm)->context_new(chan);
+	if (ret)
+		return ret;
+
+	nouveau_fence_context_arm(chan);
+	return 0;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index edbe9e08ba0f..2fed631d44ba 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -93,6 +93,25 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
+/*
+ * Declare a finished fence context killable.  A kill can arrive while the
+ * caller is still building the context, so this and nouveau_channel_kill()
+ * hand over through fctx->ready and chan->killed.
+ */
+void
+nouveau_fence_context_arm(struct nouveau_channel *chan)
+{
+	struct nouveau_fence_chan *fctx = chan->fence;
+
+	/* Pairs with the smp_load_acquire() in nouveau_channel_kill(). */
+	smp_store_release(&fctx->ready, true);
+	/* Pairs with the smp_mb() there: store-buffering, one side always sees the other. */
+	smp_mb();
+
+	if (atomic_read(&chan->killed))
+		nouveau_fence_context_kill(fctx, -ENODEV);
+}
+
 void
 nouveau_fence_context_del(struct nouveau_fence_chan *fctx)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 183dd43ecfff..d9fede5dcba6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -53,6 +53,13 @@ struct nouveau_fence_chan {
 	struct work_struct uevent_work;
 	struct nvif_event event;
 	int notify_ref, dead, killed;
+
+	/*
+	 * Set by nouveau_fence_context_arm() once the context is complete.
+	 * Read without fctx->lock, which nouveau_channel_kill() may not
+	 * touch until it is set.
+	 */
+	bool ready;
 };
 
 struct nouveau_fence_priv {
@@ -71,6 +78,7 @@ void nouveau_fence_context_new(struct nouveau_channel *, struct nouveau_fence_ch
 void nouveau_fence_context_del(struct nouveau_fence_chan *);
 void nouveau_fence_context_free(struct nouveau_fence_chan *);
 void nouveau_fence_context_kill(struct nouveau_fence_chan *, int error);
+void nouveau_fence_context_arm(struct nouveau_channel *chan);
 
 int nv04_fence_create(struct nouveau_drm *);
 int nv04_fence_mthd(struct nouveau_channel *, u32, u32, u32);
-- 
2.54.0


