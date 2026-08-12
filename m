Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFDCC5DF65
	for <nouveau@archiver.kernel.org>; Wed, 12 Aug 2026 23:13:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 642ED10F174;
	Wed, 12 Aug 2026 23:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ie73yMB5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 155094770D;
	Wed, 12 Aug 2026 22:57:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786575443;
 b=G5mHsRt/9py94KP0RLy8v0g/FdllPjPhg/hlVdRva+BRfH/17pCUxpnlugsJcoSFxOBuG
 zWHT8jBOOLVzICvScooEgOqy6Iec+cvjJxLs5W2YcqLtg9LT0lK4HkXYTEft/3E0Dm4PLmM
 P6AuBKexlikxUWyZat240XB3UdTbqzqVx8xK7FUDfHctJXVZd5IlZUeLCdxyuve57Onxn/T
 VrTr0WDK0gqToK3OFt60lWv1L8r0p9XI92prkJMRpPwnGJUjrSxD6jFsyy0vhV32fTOSLZf
 FeHGECt9H520+hou8gZsg8su+IHwW1r6ejpfCs5GXBGxWyVY+v6LTz+aU4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786575443; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Z565EJ0GnjhReuEzH6bow6YJdlk7vm6R+vte4T3cg/Q=;
 b=CiWHxcI0a2BIxfyvdJOpmEygenz5ahrKvqLjQVfI7ZZj87B5CEPCEmYXi7pnPcCJevag0
 9B3PSs1hjFnVI5a+SueTDEeVA35r47UNmk8CIKBQ6pP1Wc+JfAzFHyQ9zSeJ+LbeDhjwvJb
 pKGNXlA/CD9Ir+t+2Yw66SlEjnoMmMYoWv0eqID/IvEAuIyI46BqOtwuAWkSTYw0Bo7kNq3
 2LVpMZ7vN0HZu62EWx3200Hi5BjaXtjAw/2RKZ4h2a3Ola/lwgKoDi1zuQ/tFpPfJxAEYfJ
 2hhwPNmBuK6mIK/BL3qSWsbj8DFWfIZGXpn29Vsx5f3TYGnlOTddIM73mmoA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 05F754770E
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 22:57:21 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 35F2310F161
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 23:13:39 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47fe76491b8so95407f8f.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 12 Aug 2026 16:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786576417; x=1787181217;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z565EJ0GnjhReuEzH6bow6YJdlk7vm6R+vte4T3cg/Q=;
        b=ie73yMB5rj3mGqDcq5LCh8U2gGxw4yaT+LUiu517budxa0ec93VNnHr0gyEuP3+Ecl
         ihevJxJxkuf7uY8F2ElyHzN74oORObXf9ZsEn7zg5TayS2xZtLv+eA0qLcfQa4kXqGn+
         nlE2KjCECu3Wsd/k5RawRN77H0FCkGWBLKNZG9XHc+WQ35bbIWmfcbnUV93k7HRYutLt
         aA1uAF1j3HhvrjlgJp/cFt1Y2OdwYhObfMRoxCgMhz7yAUlOfj1IhKK8MupNTmwokjNn
         vlC9hky5Q8zyQsxPQ3WvPrtNzZ+zsDbdNLJfufERch/P2bV7TRrAQVgxF6l1S0VTMoRs
         5jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786576417; x=1787181217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z565EJ0GnjhReuEzH6bow6YJdlk7vm6R+vte4T3cg/Q=;
        b=JnzhcL146/yq1L1jmyTFrldIUEvat2dISA/DDCwWdOiCM3tUABfKVdF92csGD8LyX/
         tc01XPuLmOMxbXQUXUIKB1EHUIKUlsaYmQ7g2QIgA8Iz4Q/9zXDYxIMLkLOWR2sQFJuv
         K8CSKFxxEuQPMlTI1MQhnleI7RJ+mWhPUUx/1XteJ2pgI6hOF7tcBLFYO0NuA0NArluG
         jKYFmcvfa7LJ1jJPsZ6sudHq932ZenpsCB8dD6OYqbrxcqEEvUjUu01tTKQHOEEpLHsY
         oMxO1xuZW3QgOP6AMhge76vpytm2QC9jwlmmepJSa7kS0W1tLSvRsq5F8Vl54ZkHfPiu
         bIzg==
X-Gm-Message-State: AOJu0YxLgWri2ySQMcLXdJZ2KJLLmJ5Q5lrA+DO7GhSDCol05k6hAtmu
	n79lmbbBpnUuwPUi4O5QbaEXDcAD4+pICCBphGSohJuT0Q26ssczuGWQCvalRha3
X-Gm-Gg: AR+sD12NkND/8y5YifWDb4wJ4/eqf90OMI9hCygBeBUojfYPB7mZNTV3v3GcMiswdx8
	SmzliAeTIXkPG00pOGJ+yOlMkbnldtnmsbB19g+x0BcTnD22gfNrKQoSLH6v+ZlxfdcbpSf3iVR
	18R6/b+ockOdZwJ6ru1ZV5eytPIs5kMOw6vmzLE8QSJ4c3fXaPfZdN+Fg6u9OzpfGleax5NGD8u
	WtkXhBK6Gsqw7l4zIFC+FGmHD8KcL3NbcWTTWm8gipKHbAAaMU8Gj8hnYLBuO79ELe5XbXdxXHa
	RnuFKYDEdauM/PWmVG1FDQ4dRgXc54uxLsFKnBPTz17008VY3S4BiJf7L8Zg+R2JmQmKqUbzvE9
	s4SPMN9Q25ht7bbwkeTMT2z++ziZCQiBTYLqchvgmpsUEp06s0HTjAStoGx+gyEdV9VoIDa7Dk2
	K0hz2RlNEh81uw0sfYBqMbKQoAZeEXpP+zw0oVCxOSEZWgQ6Daz6GKR5DnLwi2a/fkYwsVhHgqh
	2jSJHEabMJfj4SFW6usixI4IUZ5A87yjloJorNuOfEPX+XcpcEYZhY=
X-Received: by 2002:a05:600c:b93:b0:499:59da:12b9 with SMTP id
 5b1f17b1804b1-499825cefdcmr4797315e9.0.1786576417330;
        Wed, 12 Aug 2026 16:13:37 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b631c1sm44532245e9.14.2026.08.12.16.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:13:36 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/nouveau: subscribe to channel-kill events on NV50
 and newer
Date: Thu, 13 Aug 2026 01:13:30 +0200
Message-ID: <20260812231330.705425-5-mczernohous@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260812231330.705425-1-mczernohous@gmail.com>
References: <20260812231330.705425-1-mczernohous@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XRXACE5YQANLZOGRTHZCE2JEFPGD64G5
X-Message-ID-Hash: XRXACE5YQANLZOGRTHZCE2JEFPGD64G5
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XRXACE5YQANLZOGRTHZCE2JEFPGD64G5/>
Archived-At: 
 <https://lore.freedesktop.org/20260812231330.705425-5-mczernohous@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

nouveau_channel_init() only subscribes to the channel-killed event for
FERMI_CHANNEL_GPFIFO and newer. On NV50/Tesla the subscription therefore
never happens, and nvkm_chan_error()'s NVKM_CHAN_EVENT_ERRORED is
delivered into an empty notifier list.

Today that is harmless, because nothing kills a channel on Tesla: the
only nvkm_chan_error() callers are the Fermi and newer recovery paths.
So this patch changes no observable behaviour on its own, and that is
deliberate: it removes a latent trap before anything can fall into it.
I am carrying a Tesla recovery path that does add such a caller and will
send it separately once it is ready. Without a subscriber in place the
consequences there are severe: nouveau_channel_killed() never runs, so
nouveau_fence_context_kill() never runs either, and the pending fences
of the killed channel are never signalled. Everything waiting on them
waits forever: drm_atomic_helper_wait_for_fences() in the display commit
tail waits uninterruptibly and without a timeout, and the TTM delayed
delete workers wait in TASK_UNINTERRUPTIBLE. The user sees a frozen
desktop on a machine that is otherwise alive, and nothing in the kernel
ends that state: both waits pass MAX_SCHEDULE_TIMEOUT, so the fences
cannot time out. They are signalled only when the fence context is torn
down, that is when the DRM client owning the channel closes its fd and
nouveau_fence_context_del() runs. Killing the client, or rebooting,
clears it; waiting does not.
That is also a dma-fence contract violation: a fence must always be
signalled, with an error if necessary.

Lower the class gate to NV50_CHANNEL_GPFIFO. The nvkm side is already
class neutral: the KILLED case hangs the notifier on runl->chid->event,
which every fifo owns since the runlist rework, and nvkm_uchan_uevent()
does not discriminate by class. Pre-NV50 chips keep the old behaviour,
so NV04 to NV40 are unaffected.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 07b0bd1bc519..5c2f4b9342b7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -485,7 +485,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	 * lock and the pending list, so an event arriving in between would
 	 * find a non-NULL but unusable context and walk a NULL list head.
 	 */
-	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
+	if (chan->user.oclass >= NV50_CHANNEL_GPFIFO) {
 		DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
 				sizeof(struct nvif_chan_event_v0));
 		struct nvif_chan_event_v0 *host =
-- 
2.54.0

