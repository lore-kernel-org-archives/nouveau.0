Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32550C5CFEB
	for <nouveau@archiver.kernel.org>; Wed, 12 Aug 2026 23:13:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 96C0310F164;
	Wed, 12 Aug 2026 23:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hcv7mW8/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 453EE47713;
	Wed, 12 Aug 2026 22:57:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786575442;
 b=X7lXABGyLcWFPOumH3dbcfjNMT1adeapKZMDLmKzrgLHhRPideYoPPxgdYwh56WxeGDgF
 VIUB4riU3o0DLw65sE5YnGL6dCeNSc0rgI9XMb8TqWF0J+mhMUbqQB/bPAX6wORnxAJ6cYm
 WdLquAZB384mQ5M0yeH8fe1WcRiNiwHENcbsYwnXI9J+iFZlTMu8jcrXlej1vLZT/BScb9N
 Pj0A/fKm1beAvtEjSlHhc4CMWAci0oGNvA6Zzq+4+8NLdMFnDmWjNyO8Cgw/ooEalH/FGMZ
 w1chr4Nfrk+OEN/nhnMj1O5Jh+uqVfBJ4eqK6xOU3wVoKL3bxhB+UtTWNYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786575442; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=b4ewDgBabacjDaP8NBVKD5QYsXGYuSL6SciAIvMhBJc=;
 b=qxSQCLOoPHNeqJX80CpPey/cDz/YDHihH1po2yswk/ZohkGWYh7cTmLbrgyc8u6fa0sbY
 fsmgJGSdPNyP4DhIRLOK9fZxtESx5ClunAQkohekNzU11VZOn71OPBdWDcw9KY+IZ49icIj
 DhO/0/U68ew2cEzUsODOpc4dL9BQt59b4IB/pwdO/ZUJp4RfMHWicQw3ieBfO3DwfRtrqp8
 qw6LxEhypQgf2IOmkX3oE36YJ3kdMy6EBslOub6LgrjKFcf4mDPju64TDhzKBekQ/5hzk+b
 fSgYqoZesyNq7PMyhov4rZLnci0aZ6inClXICSNsG1kbkSUEhJjBWgK5/2eQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C8F1F47704
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 22:57:18 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 036A010E486
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 23:13:36 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4994d41ceb9so1329395e9.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 12 Aug 2026 16:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786576415; x=1787181215;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4ewDgBabacjDaP8NBVKD5QYsXGYuSL6SciAIvMhBJc=;
        b=hcv7mW8/lCqCsDCVJqJGJLsDBJVQLnP8lyCiBmLCgZAz78AoSFqMtCFjAlGIsNOqNi
         KIVOFro7jdOPK7wZAfd4m6MqI+ewuW/2eCSJ7Ue/RxQrcafpwPIUwLV4b63jqB/uPkxr
         hr14B2QocQ/FOQDbTHxsdQMXZrTOr3LbN25ZVKaV4fuZM5ieNVvf2Ikt4ii4sgJIneb8
         ndQphOybYsHdhw5Fpoxhs7CjaNQwOsCO/E+OHC46S2hO5gGsXliBHce6epI1L8qiBCPK
         PxrcOTSgCguDFo57FYycLnnzsBvv5ICWRZhREnhN0MwUhBuit+uT8mSO2nnyFoquG3SC
         kzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786576415; x=1787181215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4ewDgBabacjDaP8NBVKD5QYsXGYuSL6SciAIvMhBJc=;
        b=k+GjMcOUdf1fbRa4YPfEYVUGZIGAW16jOjRBpxvV7EubRyygusEFS6nLIauQQLIMdU
         8Qvj/kEzzel8HQzHdDTqX2kMOWDpV99geAXgJCOYkm6TRyP5ksHEo+Vo/9jSmzcDxD/0
         HdvkV1JdRetH5/xuGv5jdvteRgS2wPJu+0l8ls3fYmICdAo8QlqYlf7GlF4k3NBax+aN
         WkiAUgoHk+pJFJdq0dZlv8zILyUDbFCKHT4La5NOB5f9S39p0rYim5/dEwYB6Z0ADqI1
         rsxE9skxRkghwPxwSnMeUuYCSuJsw0sdwvb6wN7Pup1kO3xQCYmfaRuDjOlfjG0XOlN2
         BPiA==
X-Gm-Message-State: AOJu0Yy04Y1J2D9yLslsfx8E+dbrc5OiNkvCwUG9TQ9aY4+WkoDI+7Nc
	yidC+5jLspnQW9Ore4lAYhWNgTfCVL5Cd7m+SAUgQeK/TifhxlKz9useqXDKTnEx
X-Gm-Gg: AR+sD10F4xCZM/WFIDMkY1Y4+WA/xriRhTbvwDRJmRhT5M8vHRGilePG7pfmtx0zPBc
	bPiAgeJot9EfWUP38WNYT4XaP8L01Syi0mfyv4UwMEHLDqY/dC2opcB0IhzlF+j4mCf1eMfRVGD
	l9kw/6GhHnH5PKxDGrt6nL70l5Nm7SUgqk6dwpRtej3JZr95GSYZ/XGaAUo3pMHppCl9m8MEnfC
	U6Q7izcxpA490UBbSFcVpELbUnCq//8iVDBvMzQcALe20kwzrUXZu8qft4Wf28klaDfXodlT3b9
	YRQ1zhke0aJ5f7XAw8lz6Vmq1Bj0wWAwI/tJFcv2HAqUGaONdMMbjoTWDe9xPGwm1D/V4bsbJHE
	kMVApyrVAkgNdCgPtnxtlv0+RtVW7sYFvq/akicjvhvM1oLnS+1iBCgYcG6vc6LURhuZIGAFoHy
	wbR3UV9r1BoHKpBQTIuDsVnAo4Woci/ldLKbl7HFRo/GONCUPgNRYrfAUdMu2hWpQqyRGQUMmkM
	mAgmGAZy0i3V0SqG6Ezy/IHG4G2CfqBuu/y3UF75nbZqEDpY2EH12A=
X-Received: by 2002:a05:600c:e547:20b0:499:4d41:cd13 with SMTP id
 5b1f17b1804b1-4998212ee6amr4162105e9.0.1786576415303;
        Wed, 12 Aug 2026 16:13:35 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b631c1sm44532245e9.14.2026.08.12.16.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:13:34 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm/nouveau: subscribe to the channel-kill event after
 the fence context
Date: Thu, 13 Aug 2026 01:13:28 +0200
Message-ID: <20260812231330.705425-3-mczernohous@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260812231330.705425-1-mczernohous@gmail.com>
References: <20260812231330.705425-1-mczernohous@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EQCKPPFR5UQY7CPKFGWFSS5CYIUVDEBR
X-Message-ID-Hash: EQCKPPFR5UQY7CPKFGWFSS5CYIUVDEBR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EQCKPPFR5UQY7CPKFGWFSS5CYIUVDEBR/>
Archived-At: 
 <https://lore.freedesktop.org/20260812231330.705425-3-mczernohous@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

nouveau_channel_init() arms the channel-kill subscription early, right
after mapping userd, and only creates the fence context at the very end
of the same function. The handler it installs, nouveau_channel_killed(),
reaches nouveau_fence_context_kill(chan->fence).

The NULL check in nouveau_channel_kill() does not cover the window in
between. The backends publish the pointer before the context is usable:

	fctx = chan->fence = kzalloc_obj(*fctx);
	if (!fctx)
		return -ENOMEM;

	nouveau_fence_context_new(chan, &fctx->base);

and nouveau_fence_context_new() is what runs spin_lock_init(&fctx->lock)
and INIT_LIST_HEAD(&fctx->pending). An event arriving after the
assignment but before that call finds chan->fence non-NULL and unusable:
nouveau_fence_context_kill() takes a lock that was never initialised and
walks a list head whose next pointer is still the NULL left by kzalloc().

Move the subscription behind context_new() so the handler cannot observe
a half-built fence context. The failure path is unchanged in effect: the
caller drops the channel with nouveau_channel_del() either way, which
since the previous patch unsubscribes before freeing the context.

One behavioural change worth naming, and it is not free: a kill
delivered while the channel is still initialising is no longer observed,
because the subscription is not armed yet. That window does not close
here, it moves, and on Fermi and newer it grows by the span between the
old subscription point and context_new(). What changes is what the
window costs. Before, a kill landing in it reached a half-built fence
context; now it is missed, and the channel is left blocked with
chan->killed still 0, so nouveau_channel_idle() and the checks in
nouveau_gem_ioctl_pushbuf() and nouveau_exec_ioctl_exec() keep treating
it as alive. The missed-kill window is not introduced by this patch either:
nvkm_uchan_init() already calls nvkm_chan_allow() and nvkm_chan_insert(),
so the channel is schedulable before nouveau_channel_init() subscribes at
all. Closing it properly means subscribing before the channel becomes
schedulable, which is a bigger change than this fix.

As with the previous patch this is unreachable below Fermi today, and
the last patch in this series lowers the gate to NV50.

Fixes: ea13e5abf807 ("drm/nouveau: signal pending fences when channel has been killed")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 55 +++++++++++++++-----------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index f142f6310596..07b0bd1bc519 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -370,27 +370,6 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	if (ret)
 		return ret;
 
-	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
-		DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
-				sizeof(struct nvif_chan_event_v0));
-		struct nvif_chan_event_v0 *host =
-				(struct nvif_chan_event_v0 *)args->data;
-
-		host->version = 0;
-		host->type = NVIF_CHAN_EVENT_V0_KILLED;
-
-		ret = nvif_event_ctor(&chan->user, "abi16ChanKilled", chan->chid,
-				      nouveau_channel_killed, false,
-				      args, __struct_size(args), &chan->kill);
-		if (ret == 0)
-			ret = nvif_event_allow(&chan->kill);
-		if (ret) {
-			NV_ERROR(drm, "Failed to request channel kill "
-				      "notification: %d\n", ret);
-			return ret;
-		}
-	}
-
 	/* allocate dma objects to cover all allowed vram, and gart */
 	if (device->info.family < NV_DEVICE_INFO_V0_FERMI) {
 		if (device->info.family >= NV_DEVICE_INFO_V0_TESLA) {
@@ -494,7 +473,39 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	}
 
 	/* initialise synchronisation */
-	return nouveau_fence(drm)->context_new(chan);
+	ret = nouveau_fence(drm)->context_new(chan);
+	if (ret)
+		return ret;
+
+	/*
+	 * Subscribe to the channel-kill event last.  The handler
+	 * dereferences chan->fence, and the fence context is only complete
+	 * once context_new() has returned: the backends assign chan->fence
+	 * from kzalloc() before nouveau_fence_context_new() initialises the
+	 * lock and the pending list, so an event arriving in between would
+	 * find a non-NULL but unusable context and walk a NULL list head.
+	 */
+	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
+		DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
+				sizeof(struct nvif_chan_event_v0));
+		struct nvif_chan_event_v0 *host =
+				(struct nvif_chan_event_v0 *)args->data;
+
+		host->version = 0;
+		host->type = NVIF_CHAN_EVENT_V0_KILLED;
+
+		ret = nvif_event_ctor(&chan->user, "abi16ChanKilled", chan->chid,
+				      nouveau_channel_killed, false,
+				      args, __struct_size(args), &chan->kill);
+		if (ret == 0)
+			ret = nvif_event_allow(&chan->kill);
+		if (ret) {
+			NV_ERROR(drm, "Failed to request channel kill notification: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 int
-- 
2.54.0

