Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C3CC5DF94
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 15:23:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4148310F329;
	Fri, 21 Aug 2026 15:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UzqebzCV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9B00047AA5;
	Fri, 21 Aug 2026 15:06:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787324802;
 b=dZJjPtbgmzgFR7qD8yrqka1hZBCO1VBqgEm23q6T+SkKHtkRs50HbuH666AldQWHm+kG4
 ZGeh6FaNg6AoiAkadhCST3mgI6mqv3T+ktAtnUHSpmj74mtw1cpdwg3JAIqAwOGfd7IHDa+
 xT/NVLZovUUQ9gtj8hRjw5SjtDJc2LVe0NED3dJvXp4/Sqn28emB3gKhTaF2dLgcsoZ54ba
 TcMoa4ItnP84H7AzH6wxi3ROtwNPxdSb3tAA4Ei4rQOHN8PgP0eViswv/GnCQZPBipToJjj
 1IBWGdf9fsvJ2hMOyGTcBD5OzFZNCCCp7t4SKIAmk+0BZIsj5eUeR7DeTLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787324802; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8sdbNeUe6ctrJEy+VKy4nn9z2qBfoh++mokomXoK9cc=;
 b=TMweQQiLEGRi4s9s3Fx59hWL97dh0Z48NMwA74ZIbvy7k3CFQMFcHBcdiPDIOQpXN3E38
 ztrMmm1P2zGYB7jQGc3gKqp7f8MTFbWBh2ScpuquTt+BP/knr57K5LfU09covyEU//AWRFi
 Aam9b+iUIZUvzPdt9ussBrv8+nPgX9G8ItLI7rUgL07P23N6uPUGAzHbpd03Q8cIntH7wYf
 jEDtClAvETwoUmb/DTpRe3gZGnGDY8tMngehKy2upn9CyAB28cVUgttvyFJ+S3JCpgo42Bj
 DLtwg67dzxZCISQ6mvu5OOqURZ4hN2gNr5/5RUocBsv15EY0wIGFRG8HnWDg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B60AE47A8E
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 15:06:38 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1B79B10F325
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 15:23:16 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c16111a9b8dso13355166b.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 08:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787325794; x=1787930594;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:cc:to:subject:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8sdbNeUe6ctrJEy+VKy4nn9z2qBfoh++mokomXoK9cc=;
        b=UzqebzCVOknGyf51vMABsWIPh7BBkmuLg70pw9RHHUBx8FxEDBhmYtDbvaMA0Xstzl
         rMxBQukf6tJBBW1lsQWpPrSziwX5faVHDIxSC9/R5go8Bkz5TiCo8c5B8J9iPVwpmzkz
         4lRrX+Qpd26Cco+Ylut/j0KIShzk3mB8HjKpIKFFcvet61dKRRlNPwG+ETygOGu7cwTn
         lMpX5RetEy72jYY7C2L8dAn4ZtvweERhhJ0VDjyT8vog19l5j1vqDPl59Vawz382CG3Y
         ycHHjhppXB7juqXPRlNir1JF/v5s5NP22F6yNz/nP/ewRq/DCHmagnla5XrmRFXprlPD
         k/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325794; x=1787930594;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:cc:to:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sdbNeUe6ctrJEy+VKy4nn9z2qBfoh++mokomXoK9cc=;
        b=HyEMhlzcBprjIndgVBen+VcCkVOC/XeH5w6kS8SIjrRAUN6Kkksas57UXfiqMkGBm5
         fXNHPX0/1z3VmU4xvZS5kFLoUXsfrBSBQO7F1fb7NVSrR/0lORNyRsxPyAaBODXxEwY6
         hFKH+DBwRCzHucmta/zRd2NPNNwkQeZD4vHdVB4/Vi8Y1FoxmJXMah3OxKuBmh6asWP6
         RGUeXO1rDdiuhILG/Uo4H1XpjhHdpCmsjKlzmM5W7aNdpghVPwvG42Gx4qI2N+EM5ywp
         c/KmfkRpoxYQzBhuRwrxDt94N4nyJKhUjs4frbSag8uBNq1U0tSqjUTbFrUf6NifeUwW
         i4bQ==
X-Gm-Message-State: AFuF++kbFMflVHAjozizPR2rvoi0VxiegLF2Ri+Rf47c+I2n5i/HmFa6
	adAGUgjU08xoCfEXLCbkGIhzDwuNeoHB015TxiKtamdpVTAXsNh6nyLhlwWbq18o
X-Gm-Gg: AR+sD10F1Xdxr8iqVJJp+Rz8dU9uJFEaW7kMTIiNDsjDNWEqWhKJh2uK35V7ptqjXLh
	XTMF1iWy9NKZEJpBLAIUAnHj01LgpAp9KA7ngLhHtp4lbyyg/ARvZL9R+Kq8AiaaeXALPrrUQTI
	pea0R/FTaPMl12Jrasu807w+r9wwp2cl8DLodH6QH8abspEd2VjRw/7Osycayp5eNPhZLfb5Mt9
	00nX1TmIV9Sz4J3RDvexeGw5ubk5NYvJKa4ZGyXVnfX6m1+V8xhPSkOhc84w4j0komBWejiRyWS
	sS8lqv/rg/oPqGsV2po0ndEsVowOWp1+TWSYNhC5LU9nIJZCEtQgyoQMQC/VOQbjEDowKh59GKE
	twqz3rgEM4grPSKSZ/90rESWST9niR14wbC5BHZpRIfQ6L3r3BZ3dk10D8dH2uoerXagNEHX/gA
	wF3Uqd7TrR4jpoC8Mz0rCJvv+hRuZOH1uOxHkyzZt4obKqnF8J9oKe8uqq6mDXowV1VBjtx2HL5
	rNC49wec1ZpTL9DpO/b+3XxY79gJouyYbRt/286YQ==
X-Received: by 2002:a17:907:cd0e:b0:c15:ccda:26d5 with SMTP id
 a640c23a62f3a-c246a63d6b3mr388498966b.4.1787325794415;
        Fri, 21 Aug 2026 08:23:14 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24591dc662sm506198566b.42.2026.08.21.08.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:23:13 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
Date: Fri, 21 Aug 2026 17:23:01 +0200
Subject: [PATCH v4 3/3] drm/nouveau: subscribe to channel-kill events on NV50
 and newer
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <178732578167.167481.2178147998794444181@gmail.com>
In-Reply-To: <178732578167.167481.5619512544301226563@gmail.com>
References: <178732578167.167481.5619512544301226563@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GN6WI5IB4CRXI4M47NKDX3GO3TUEG3VU
X-Message-ID-Hash: GN6WI5IB4CRXI4M47NKDX3GO3TUEG3VU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GN6WI5IB4CRXI4M47NKDX3GO3TUEG3VU/>
Archived-At: 
 <https://lore.freedesktop.org/178732578167.167481.2178147998794444181@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

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
index 605ce74c0d15..54e2202cb852 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -378,7 +378,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	if (ret)
 		return ret;
 
-	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
+	if (chan->user.oclass >= NV50_CHANNEL_GPFIFO) {
 		DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
 				sizeof(struct nvif_chan_event_v0));
 		struct nvif_chan_event_v0 *host =
-- 
2.54.0


