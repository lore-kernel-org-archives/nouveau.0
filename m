Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1956C56203
	for <nouveau@archiver.kernel.org>; Thu,  6 Aug 2026 08:52:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BC0B910E2E3;
	Thu,  6 Aug 2026 08:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l5xi+l5T";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ED3384760F;
	Thu,  6 Aug 2026 08:36:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786005393;
 b=Ui2teOYaGYv7hGqNDuKlXfC2u3vJaiZWJYpnTFhxubcks7fzo7dW4uKVqmB2+yWpvbkwH
 O9Df8ktHqvjqMxmeugHaHOW5lEWawNt3kyL4IYvBtEF412BW1VC2PwR8OCj0ZIV+NdlBwnE
 Q546ZoisoUZDe3DPJjWXr2F/TORbvjuAvJrcM3YtjN8MoFe4K3/QSKb17TQlS6JEwO2zyXw
 KjafDs4EWw+4aW8zZLAd/yrCq3Bnznk406/dBi/DB3oi3nYyy3bnlC0dkoa+vDQ55OI9ogr
 bbm6wBtqmpK/kT5EFheSkPYaWwVEDQT19oW9o9mqwNs5cWIvMQLfC+q0PUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786005393; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7S3jJC+DP/AnGr5qI74fY2tvCMpx6q3cXdfEjvlQVLM=;
 b=P5i57D0BxMJBO29Pme37NvNxF9pFVETBENA8DADbYDVtW0/fOHxqjIr7H6gmB1zu4c0o6
 63wZDE/6X9DN3PVRXlCeVRTGjDjYNCPR0Gu+ocirj3egPkctlcI3/WDQF+t/vWwLSZz5o97
 iOfc3fAdqaEtISsyEVBbqo5oG+Ls0AYNGzKBGzGPdwBZfGccsNE5Z97R2k5409uEW9/twlc
 02rYcjkWydF+lvVax0ztZzdUcQWnE9UmopHo+9NaD76ieE9CIgAPXJ0omyeeZLFS14oplFA
 gSFRbzj3FwMOJRMalCw9kE5yM4/TAj5IdmuWBXAsQuhyA3ocn90YpQcp1xlg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A6956475ED
	for <nouveau@lists.freedesktop.org>; Thu,  6 Aug 2026 08:36:29 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 24B3210E2B9
	for <nouveau@lists.freedesktop.org>; Thu,  6 Aug 2026 08:52:33 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49544f26c43so1304805e9.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 06 Aug 2026 01:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786006351; x=1786611151;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S3jJC+DP/AnGr5qI74fY2tvCMpx6q3cXdfEjvlQVLM=;
        b=l5xi+l5TgK7S900g23guaoryepGn9/zfVf3XhFMp44LOwnPue3oe9ffiegEZT1bFIj
         4OwQ56oF6Y68gZiH2ehmhncVWfVSAX3E+UQmb81Ip9tRBTioJtJV0znvd4ZQ/2jhkukm
         NanqTJOt/vQT3qb9DXtpvpIrAXNVr5bEBTm4FH07wBSlYJVMGoEKeGsAW1TABUM+mJmC
         b3tiQVIpKWbJBhbVFfWW6UniTv94XnLDYzCq9ywQhu1mrG+kLRKT0gqNhLo/iyP5+OTH
         ZnOiGKTLMvcC0pNzXFM7wWUzmu2YP4ZUfh8Tw6P/5QtATialWIVB3oTZuA7tljUtJZNb
         sS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006351; x=1786611151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S3jJC+DP/AnGr5qI74fY2tvCMpx6q3cXdfEjvlQVLM=;
        b=VPSYYdWvPejQ/G6drQz9JFbYyhO/AmgffMrLkCFBEOUzxzH9VjDjZJAyWaLeVK7a/K
         HGwTGT8Qm/9ItQ5nvdb3mozUi2851SDjHgmbWz+t3Cb3o4Owbg6TsFDxNBhUE6tgYFXP
         Ki0Uj+AQfw7byxqvOC/UB/qaiU09W0gANXp48M74L/S6olfcEsF1tZYgCqVCtKHzdQ/x
         Q2LVdRI0D/LU+tQ2aL9BJjCXxgpRi2J6goELkNggKyRWCmus4uvmtT3hRLElV7SOvRgI
         emDCeSNnaUj5Jil6jqA/vSVLhRt4DPIZ86+lg3KM+mTRfYkAm7KwO+WakvPWnf/GZd3o
         YolA==
X-Gm-Message-State: AOJu0Yxdc99r/VNW3ApMScyqg1/lpVDgOIoOozb6GVghcABYNoXWbkcT
	w/1EJA+sHMW1UaQsaxB6BAy4yxxUAfpuXgfXC/u1rRjcSnNcjihDI3EAX+itDbnbBT0=
X-Gm-Gg: AR+sD12xSTNgguDBP0e6NnS5A+/HC7Bun8xyy1sxap4OMTGEbVR46ka5LF9EkJJpfpk
	N2cDf2ERpiljHk8FaWZzez4lUlrOdgNzWc0bs1eAIsvWflLCs+2YMhx8ruG57KwbjjTfnSH5obH
	In7KvLIXupLmPCQtstyb2dXqwLWAC9bW4Ru2LnhyAuaxuwP5bva/F2tX7nVYulMWM7Cy3LCmpqY
	QC5gzcKjqVXLH9HL6T/Zr/Du8jH7JjKUbGR+Xxd6WpjwTBqWrV0e1EfxUs8AqWsccyw2b9UO1SS
	vVCusNV38mDJeWC57RUBPMDyCbIiVsCp4RF+H2iUbpRmI7YT1W50zBBjlmGKat36/ZAAIfQ4MHs
	evhv9MS8GSZMp131KSyh1+urfXcAtoYXZRdrbeMbtkfDUeD+P3zAHcimWEX8Y4KLHMtHrgnf6rh
	eQYVour0/99AtP/ZavoyB7QuvYx41oUdx5ugETwS4Ad6LaUsR8aUUYjGS2qPnq8I9QTaRivm9d1
	N6oQbZQc82Xpk3gGlvxPHazTlUajBwdhgqRwu9T5Vzp1oVC9+d6r5E=
X-Received: by 2002:a05:600c:3487:b0:499:52d5:8c14 with SMTP id
 5b1f17b1804b1-49952d58cc4mr36792715e9.1.1786006350885;
        Thu, 06 Aug 2026 01:52:30 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995420cb4esm45985355e9.2.2026.08.06.01.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:52:30 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/nouveau: nv04 FIFO cleanup + recovery for Tesla
Date: Thu,  6 Aug 2026 10:52:25 +0200
Message-ID: <20260806085228.1848994-1-mczernohous@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3OMJZN37X4SAKCN3XFKJPXW6V2L3YVXH
X-Message-ID-Hash: 3OMJZN37X4SAKCN3XFKJPXW6V2L3YVXH
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3OMJZN37X4SAKCN3XFKJPXW6V2L3YVXH/>
Archived-At: 
 <https://lore.freedesktop.org/20260806085228.1848994-1-mczernohous@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

v1 of this series is here:

  https://lore.kernel.org/nouveau/20260513175014.96599-1-marek@czernohous.de/

Please do not apply v1. While running it on the reference machine I found
three defects in my own patch, one of which is a guaranteed kernel panic on
exactly the hardware the series targets. v2 fixes all three and adds one new
patch as a prerequisite.

What went wrong in v1, and how v2 addresses it:

1) NULL pointer dereference in interrupt context (fixed in 3/3)

   v1 called nvkm_chan_error(chan, true). nv50 and g84 channels have no
   .preempt callback, and the call in nvkm_chan_error() is guarded only by
   the preempt argument and not by a NULL check, so preempt=true dereferences
   a NULL function pointer under chan->lock in interrupt context.

   This is not theoretical. On 2026-06-02 it fired on the reference machine
   (then running 7.0.10-p1) during a deliberate VRAM stress test, captured
   over netconsole:

     fifo: CACHE_ERROR - ch 2 [labwc[3950]] subc 3 mthd 0f00 data 0000007b
     nv04_fifo_intr_cache_error+0x111
      -> nv04_fifo_recover+0x80
      -> nvkm_chan_error+0x99
     RIP: 0010:0x0

   The oops escalated to a full panic because nouveau's drm_panic scanout
   path ioremaps in panic context:

     nv50_wndw_get_scanout_buffer -> nouveau_bo_map -> ttm_bo_kmap
      -> __ioremap_caller -> __get_vm_area_node
     kernel BUG at mm/vmalloc.c:3212

   That is a separate, pre-existing problem which I have not yet reported;
   I will do so on its own. The hardware watchdog then reset the machine.
   v2 uses preempt=false, which is what the existing caller in
   nvkm_runl_rc() does as well.

2) Killing the channel on the first fault is wrong (fixed in 3/3)

   v1 killed the channel on every fault. But there is a single PFIFO cache
   puller, and on a fault it names the channel that is *resident*, not
   necessarily the one that caused the fault; nv04_fifo_pause() documents
   this ("incorrect instance offsets to PGRAPH"). On the reference machine
   this killed the Wayland compositor twice for somebody else's fault, on
   2026-06-02 and again on 2026-07-22.

   v2 keeps mainline behaviour for the first faults (skip the method or drop
   the push segment and resume) and only escalates to the kill once the same
   channel object has faulted NVKM_FIFO_KILL_COUNT times inside
   NVKM_FIFO_KILL_WINDOW_MS. The streak is keyed on the channel object
   pointer as an identity token, never dereferenced, and dropped in
   nvkm_chan_del() so a reused channel id cannot inherit it.

3) A killed channel is not survivable on Tesla (new patch 2/3)

   This is the reason for the new patch, and it is the part I would most
   like reviewed.

   nouveau_channel_init() only subscribes to the channel-killed event for
   FERMI_CHANNEL_GPFIFO and newer. On Tesla the ERRORED event is therefore
   delivered into an empty notifier list, nouveau_fence_context_kill() never
   runs, and the pending fences of the killed channel are never signalled.

   Today that is harmless upstream, because nothing kills a Tesla channel.
   Patch 3/3 introduces exactly such a caller, so without 2/3 the series
   would trade a recoverable fault for an unrecoverable hang. On the
   reference machine this presented twice as a frozen desktop on a machine
   that was otherwise alive and reachable over ssh. The stacks as observed:

     kworker/u8 events_unbound: dma_fence_default_wait
       <- drm_atomic_helper_wait_for_fences <- nv50_disp_atomic_commit_tail
     12x kworker/uN ttm: dma_fence_default_wait
       <- dma_resv_wait_timeout <- ttm_bo_fini

   The ttm frame is reported as ttm_bo_fini; the wait that actually holds
   those workers is the MAX_SCHEDULE_TIMEOUT one in ttm_bo_delayed_delete,
   which is static and in the same file, so the shortened frame is
   consistent with inlining. Either way both waits are uninterruptible.
   The desktop stayed frozen for minutes until the fences timed out, after
   which a compositor respawn brought the display back; a reboot cleared it
   immediately. Leaving a fence unsignalled also violates the dma-fence
   contract, which is why I think the subscription belongs on NV50+ even
   independently of this series.

Testing

  Reference hardware: Apple Mac mini Late 2009, MCP79 / GeForce 9400M
  (NVAC), Core 2 Duo, Wayland (labwc) on Mesa 26.0.8.

  Fault injection. I restored the debugfs-style fault injector I used for the
  original validation (as a pair of write-only module parameters this time)
  and drove nv04_fifo_recover() directly on a throwaway GL process, so that
  the compositor was never the target:

    ch 5 fault 1/3 in 10000ms window, skipping method and resuming (Tier-0)
    ch 5 fault 2/3 in 10000ms window, skipping method and resuming (Tier-0)
    fifo:000000:0005:0005:[fbo-stress[13247]] errored - disabling channel
    Xwayland[4931]: channel 5 killed!

  (The last line is prefixed with the DRM client rather than the faulting
  process because the test program is an X11 GL client; NV_PRINTK names the
  client that owns the channel.)

  That covers all three defects:

  - The channel survives the first two faults and only the third one inside
    the window escalates, so an unrelated process is no longer killed for a
    fault the puller misattributed.
  - A fault 18 seconds after the previous one counted as 1/3 again, so the
    window expiry works.
  - The "channel N killed!" line is the one that never appeared before patch
    2/3. It proves the event is delivered and the fences of the killed
    channel are signalled: no kworker ended up in dma_fence_default_wait,
    no TTM worker was left in D state (there were twelve during the freeze),
    the compositor kept running, and the display commit never had to fall
    back to any timeout.
  - The victim process died with a SIGSEGV inside libgallium. That is the
    known Mesa nv50 limitation (no GL robustness on this generation), not a
    consequence of these patches.

  What the injection does not cover, to be explicit: it enters the recovery
  path from process context, where the real fault arrives in hard interrupt
  context. The locking is the same, but the context is not, so this is
  functional coverage of the recovery path rather than of the interrupt path.

  Soak. The v1 patches ran on that machine from 2026-05 onwards, which is how
  defects 1 and 2 were found. The v2 code, including the escalation ladder and
  the widened event subscription, has been running since 2026-07-25, twelve
  days as of this posting, across a kernel bump from 7.1.5 to 7.1.6 with the patch
  series unchanged. Since every channel now subscribes to the kill event, the
  interesting long-run question is channel churn, so the soak is ordinary
  daily driving with a browser and GL applications rather than a synthetic
  loop.

  One difference between the soaked code and the diff below, stated so it is
  not a surprise: downstream I carry the widened subscription behind a
  module parameter (default on) so I can fall back to the Fermi+ behaviour
  without rebuilding. Patch 2/3 as posted does it unconditionally. At the
  default the two are behaviourally identical, and that default is what ran
  for those twelve days; the parameter itself is a local debugging aid and I did
  not think it belonged upstream.

  Compile coverage, precisely: the changed translation units build clean in a
  downstream 7.1.6 tree that carries equivalent code. The series is rebased
  onto the mainline base commit below, but I have not built it there, because
  my mainline checkout is sparse. The full module, in the downstream form, is
  built and booted on the reference machine.

  A note on MAINTAINERS. Patch 3/3 adds a new file
  drivers/gpu/drm/nouveau/nvkm/engine/fifo/recover.c. The change is covered
  by the existing nouveau MAINTAINERS section (drivers/gpu/drm/nouveau/),
  so no MAINTAINERS update is included. checkpatch.pl flags this as a hint;
  it is not load-bearing.

AI assistance

  Lyude asked on the v1 thread whether these patches were written by a human
  and pointed at Documentation/process/coding-assistants.rst. The answer,
  repeated here for the archive: this work is AI assisted. I use Claude
  (claude-opus-4-7 for v1, claude-opus-5 for v2) as a coding and analysis
  assistant. Every patch carries an Assisted-by trailer accordingly, and no
  Signed-off-by is added by the tool.

  Nature of the assistance, so you can calibrate your review: the assistant
  did most of the code archaeology and drafting. I described symptoms
  ("the desktop freezes but the machine is alive", "the compositor gets
  killed for a fault it did not cause"), asked for the mechanism to be
  traced in the source rather than guessed, and asked for each claim to be
  backed by a file and line. The register dumps, kernel stacks and the
  netconsole trace quoted above are measurements from the machine, not
  model output. The assistant also reviewed its own earlier work
  adversarially, which is how defects 2 and 3 were found. I reviewed the
  result, I understand the code, and I take responsibility for it.

  One consequence worth stating: a first draft of this cover letter
  described the fence-context teardown ordering in nouveau_channel_del() as
  a use-after-free worth its own patch. On closer inspection most of that
  window is harmless, because nouveau_fence_context_del() empties the
  pending list before the event is unsubscribed. I dropped that patch rather
  than send an overstated claim. If you would still like the reordering as a
  hardening change, I can send it separately.

Changes since v1

  - new patch 2/3 (subscribe to channel-kill events on NV50+)
  - 3/3: preempt=false instead of preempt=true
  - 3/3: escalation ladder instead of kill on first fault
  - 3/3: per-channel streak dropped in nvkm_chan_del()
  - 3/3: chan_killed tracepoint moved to the actual kill
  - 3/3: comments that had slipped through in German are now in English
  - rebased onto current mainline
  - Assisted-by trailers added, as offered on the v1 thread
  - defects 2 and 3 reproduced and their fixes verified with fault
    injection; defect 1 was reproduced organically before the fix and is
    covered here by the absence of the panic under injection

Marek Czernohous (3):
  drm/nouveau/fifo/nv04: filter benign CACHE_ERROR from Mesa NV50 bind
    probe
  drm/nouveau: subscribe to channel-kill events on NV50 and newer
  drm/nouveau/fifo: add recovery path for Tesla cache_error/dma_pusher

 .../drm/nouveau/include/nvkm/engine/fifo.h    |  31 +++
 .../include/trace/events/nouveau_fifo.h       |  58 ++++++
 drivers/gpu/drm/nouveau/nouveau_chan.c        |   2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  29 +++
 .../gpu/drm/nouveau/nvkm/engine/fifo/Kbuild   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |   3 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |  14 ++
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv04.c   |  29 ++-
 .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |  10 +
 .../drm/nouveau/nvkm/engine/fifo/recover.c    | 176 ++++++++++++++++++
 10 files changed, 346 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/trace/events/nouveau_fifo.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/recover.c


base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86
-- 
2.54.0

