Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B22C5DF7D
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 15:23:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C122410F2E4;
	Fri, 21 Aug 2026 15:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WKDWFe+z";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1D73B47AA1;
	Fri, 21 Aug 2026 15:06:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787324791;
 b=okPb8XlwDRLO5nYGZkOb8fVYSVtSJZx6FCMmTXnklY0i8BE9LS3J/Hx4luMlOo9lPVqPz
 MLkEc1PehpHlaxFiC2Y1QWoCidxqnYjlf0uOqirdF30lwEk+4+W0DZZQfqmWbzdTursBNk1
 eS5L8oxXauR0o3HvkyEVlHBF2kXXAngxKuK1buXliUe7HAdD4WB4aEPTEfdsrbsJtRXlGlX
 IQAWVmExRx3/9RnDR8FMsi/DN5w08dskwT4J72d6XpUGYxZAsCfHVtuLq3LOHsA6DbvsVFK
 Vh9zSkJmVlGKbFNMkriUrZAaqJFI0l0eVGTZddTiDWoy0LocX7FIYhgd04uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787324791; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Wt70YXWaIggScCHa2VlJmb1FulxNMTZ4XUn6wxtJEjg=;
 b=OotoB9z9pkdTYx5Ur7Y+Whpe5n5mmOa92csxWS/B/5+SUgd+p0463+5PKE0jyPH7zCIW6
 qEHhuvMvFJsJra6VEu7q+JTQZqcxgutZgQIjirVjcc3G0dNSMbyvGu+/Qa3jHrZh7q/FiZy
 5MVbh2+jEQjFGcUid6FKzMj40R8iPKqqm2P6nxueaUHk+1xOfsL5sxu5x7taVgPfYXvFlil
 ZHviQkSQumr8SGh6msk/AhRgUxmcuBYKwcvjbnwR+vPsCEzaC+rEc9KAULO5TEgE2qbkfZx
 rZLLaoBkulLgAe7a/YHGjPjrmTW4wUxjHpYMxhFFuim+h4vJii29aNnIrCDg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8937F47589
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 15:06:28 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD32F10E2EC
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 15:23:05 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c15b51ba80dso10834766b.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 08:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787325784; x=1787930584;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wt70YXWaIggScCHa2VlJmb1FulxNMTZ4XUn6wxtJEjg=;
        b=WKDWFe+znQBoUFd9BORfLDT+tEIoRUF+noRxN294KS9lW5pxDUTh9ftYV+eJlI/8wE
         T6IRreLW8fFFlOiZMdeLd2CiyJGRVZ+qSvRG0EAiXYR2AAx07zHcUstQfGdlqA7LqOp2
         tjKEU6eTjWCzdkHJsb4Gwqb2AMDoBVkByzdjsFgCmUQqGR+hi3jZUpXNXGUXAsZB77E0
         XBbCr4ISni6LLaR8UFMriGEFxhRk0x1V2+i/yo1zCItuYPEF67xjjEzhMJ6jV4LGwy9r
         SOC3g9m/6OtcnLw/L8085NsZkj92x1tnMXeT8cIKrd6tKssPAhaFNfzTk4WqhH+VJOUd
         8dqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325784; x=1787930584;
        h=content-transfer-encoding:content-type:mime-version:message-id:cc
         :to:subject:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wt70YXWaIggScCHa2VlJmb1FulxNMTZ4XUn6wxtJEjg=;
        b=moM6ccnVPSs8td+EunZUINt93uMEdlRS73uGnOuHf3p6klbVCeflqv14UhJ+L0iLfV
         hYbyeu8OCOe8lMqStg4GXoWW895WITmJuEDx9kr5ocw7m67Qr+C9XaZxKgBjrpmaLGSR
         zd2N8QcQJv66HHUGot76uFJk+5/HkFxPosXXMytWzdDkcT0jaD/Tqrx4OW6T2BoZxR32
         2R+Hz7Azfi8QHOkKb1O1hkjM0fowFzm6/3+WJ9o+ehTwNJzuELdyOq+BYi76ej305zM3
         Ei+qRVYytUpnkPZgvKjhdeKYGZ9FiR8FCHEg7J98L7HSM/ZuhzNZAYXjkWqXEOb7f/NG
         TLWg==
X-Gm-Message-State: AFuF++lQ+tBGm+y1XjA6nZwp2DVSX7b94e6/c3YQETNoFNnYvFRn5k4E
	WtzkNeqqq4l/GGaeQNGOcc++fBi55m1rH+agqHoUInlUDZYB8Vk5mi0QPvZx9GfS
X-Gm-Gg: AR+sD1154Pk00fL35jN3XPjSIchaMd634ABHkBmvy7xaaIb+HHc8WL+P6Q8VeNupkaH
	dBNFwJnPHqYort7r0ZiBrsHBXOckcTHmkqYE51IBMqJMT0XazQT2/SILpd6Nnm/xb1MQUBDlDQg
	OW0jsU0Lvw9icN0ZaLRnsoXOqSq0I+zCPmYR5Bjgqt+KgB/yIad+kh+RW8jI6ZKUZKnwsLGFFzi
	p+kZc+dashCOtdx0FuPcR5RhriNjPG3aeFl2+1SlY72xF9dfyE0Yel+Wxj5DdghBOCyw/NqNp+B
	Hb2tr5KyGOGYaAHENl0AYOw1xbhauJluQ0ivlyMhDEYh6WymH2S6brEF1QETf4Z0NG4svrjLXMk
	VLw7qNfK2IReGxf+KaoNo0sLlwk/p1t0B+DAm8zckv9RoFLOGkyid34qAE2VaGu+//qikO1HcDH
	ATX081dHCNHJDeyvFqLtVbdFVZ7oSIOxuSNUuvM1rtfh4WN7xMcHOnMv6S3eV3b+xvIio7Y8S/z
	cWV+r6peCNWZ9qWhgLI/WaAm/AsI0T5/NplT9ttbyYVLN+hlHkbGOG1JqLP3Rok
X-Received: by 2002:a17:907:97c1:b0:c21:764c:9417 with SMTP id
 a640c23a62f3a-c246a2eb944mr404614866b.1.1787325783909;
        Fri, 21 Aug 2026 08:23:03 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c24591dc662sm506198566b.42.2026.08.21.08.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:23:03 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
Date: Fri, 21 Aug 2026 17:23:01 +0200
Subject: [PATCH v4 0/3] drm/nouveau: channel-kill event ordering fixes,
 and lower the gate to NV50
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <178732578167.167481.5619512544301226563@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P67TSIRUMRV44BCG52DJLOJIEKK5EQ33
X-Message-ID-Hash: P67TSIRUMRV44BCG52DJLOJIEKK5EQ33
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P67TSIRUMRV44BCG52DJLOJIEKK5EQ33/>
Archived-At: 
 <https://lore.freedesktop.org/178732578167.167481.5619512544301226563@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is v4. v3 is here:

  https://lore.kernel.org/all/20260812231330.705425-1-mczernohous@gmail.com/

Thank you for the review. Changes since v3:

1/3 unchanged, and now carries Lyude's Reviewed-by.

2/3 rewritten. v3 moved the subscription behind context_new(), which
    traded a half-built fence context for a missed kill. Lyude pointed out
    that the subscription does not have to move at all: give the fence
    context a flag and have the two sides hand the kill over.

3/3 is v3's 4/4, unchanged in code. Lyude asked what testing this has had
    on Tesla and said it will need input from others; the testing question
    is answered under Testing below. It is last in the series so it can be
    dropped without disturbing the two fixes, and I am happy for it to
    wait for that input rather than go with them.

Withdrawn since v3

  v3 carried a patch that demoted one specific CACHE_ERROR to debug
  level and attributed it to a Mesa bind probe. I am withdrawing it,
  because that attribution does not survive a look at the tree. Method
  0x0060 on this class is SET_CONTEXT_DMA_SEMAPHORE
  (nvhw/class/cl826f.h), and the writer is the kernel itself,
  nv84_fence_emit32() and nv84_fence_sync32(), on subchannel 0
  (nvif/push006c.h). The data is the VRAM ctxdma handle that Mesa picks
  (nouveau_screen.c, .vram = 0xbeef0201) and the kernel binds at channel
  creation. All 99 logged occurrences behind that patch read "subc 0
  mthd 0060 data beef0201". Mesa's NV50 Gallium never writes on
  subchannel 0. So this is the driver's own semaphore-context rebind
  being rejected by the puller now and then, and I have not established
  why. I will look at it separately rather than carry it here.

On 2/3, and the two places where it differs from the sketch

  The sketch checks chan->killed before setting ->ready, but each side
  has to store its own flag before loading the other's, or one
  interleaving loses the kill even under sequential consistency;
  swapped, with smp_mb() on both sides, it is the store-buffering
  pattern. And the kill side cannot take fctx->lock, because that lock
  is exactly what must not be touched before the context is built, so
  ->ready is a plain bool read outside the lock, published with release
  and read with acquire. The commit message has the full argument.

On the aside about writing the respin without Claude

  This work is AI assisted, as the Assisted-by trailers say.

  The advice is right, and I would rather say so than let it pass. The
  honest position, though, is that I doubt I would have got to these
  bugs at all without the assistance.

Testing

  Reference hardware: Apple Mac mini Late 2009, MCP79 / GeForce 9400M
  (NVAC), Core 2 Duo, Wayland (labwc).

  Build. Built against the base commit named at the end of this mail.
  The nouveau module compiles and links with W=1 and no new warnings.
  checkpatch.pl --strict is clean on all three patches.

  Deliberate channel kills on Tesla, which is Lyude's question on 3/3.

  The kill path on this hardware has been exercised on purpose, not only
  observed, and under a real 3D workload. A local debug patch, which is
  not part of this series, synthesises a CACHE_ERROR on a nominated
  channel. The victim was SuperTuxKart, with its channel live under
  load. Verbatim, timestamps and unrelated lines elided:

    nouveau 0000:02:00.0: fifo: inject:   ch   2 [labwc[5670]] errored 0
    nouveau 0000:02:00.0: fifo: inject:   ch   3 [labwc[5670]] errored 0
    nouveau 0000:02:00.0: fifo: inject:   ch   4 [Xwayland[242990]] errored 0
    nouveau 0000:02:00.0: fifo: inject:   ch   5 [supertuxkart[1181685]] errored 0
    [...]
    nouveau 0000:02:00.0: fifo: ch 5 fault 1/3 in 10000ms window, skipping method and resuming (Tier-0)
    nouveau 0000:02:00.0: fifo: ch 5 fault 2/3 in 10000ms window, skipping method and resuming (Tier-0)
    nouveau 0000:02:00.0: fifo:000000:0005:0005:[supertuxkart[1181685]] errored - disabling channel
    nouveau 0000:02:00.0: Xwayland[242990]: channel 5 killed!
    supertuxkart[1181685]: segfault at 560800000000 ip 00007f617c0d5ba6 [...] in libgallium

  So on NVAC, with 3/3 in place, the ERRORED event is delivered, the
  handler runs, the fence context is killed, and the compositor is
  unaffected.

  Two limits on what that proves. The escalation that disabled the
  channel is local and not in this series; what this series contributes
  is that the event reaches a subscriber at all instead of being dropped
  into an empty notifier list. And the victim did not survive its own
  channel being killed: it segfaulted inside Mesa rather than handling
  the -ENODEV fences. Without the subscription it would have hung
  instead.

  Games and sustained 3D. glxgears without vsync for ten minutes, and
  SuperTuxKart for a full race, ten and a half minutes, both with 3/3 in
  place. In both runs everything the kernel said came at window creation
  and was the known benign gr DATA_ERROR trap: 71 of those for glxgears,
  three for SuperTuxKart, and none at all once either was running. No
  wedge, no unexpected kill, and the session came through both
  unchanged.

  Soak. Code equivalent to 1/3 and 3/3 has been running on this machine
  since 2026-07-25, across the kernel bumps 7.1.5 through 7.1.8, with no
  regression.

  The 2/3 in this posting has NOT been soaked. What has been running
  since 2026-08-06 is the v3 form of it, which moved the subscription;
  the handover in this version is new as of today. I will report back
  once it has run.

  What the soak does not show, stated plainly: that tree carries local
  patches this series does not, including a cap on the plane-fence wait
  in the nonblocking commit tail. So the soak says these changes do not
  misbehave in daily use. It is not an independent demonstration of the
  failure modes above.

  1/3 and 2/3 are ordering fixes for windows I have not managed to hit
  deliberately; the reasoning is from the source.

Marek Czernohous (3):
  drm/nouveau: unsubscribe the channel-kill event before the fence
    context
  drm/nouveau: don't kill a fence context that is not ready yet
  drm/nouveau: subscribe to channel-kill events on NV50 and newer

 drivers/gpu/drm/nouveau/nouveau_chan.c  | 30 ++++++++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_fence.c | 19 ++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_fence.h |  8 +++++++
 3 files changed, 52 insertions(+), 5 deletions(-)


base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86
-- 
2.54.0


