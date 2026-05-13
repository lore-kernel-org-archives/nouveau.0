Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E365CD37AC
	for <nouveau@archiver.kernel.org>; Wed, 13 May 2026 17:50:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C99FB10EFB2;
	Wed, 13 May 2026 17:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WGdjWHHC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C78F541C76;
	Wed, 13 May 2026 17:37:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778693844;
 b=AQAJ4paRSNf+rMYRx7bBuw3KkX+GeauYzYArqQT8t0mMLwFGAMcs2f8vDdDy1pghdwTdC
 VWakszXjDdeX6UNnKQs6Mu2GBMtahRyoXmBJDb63RkbDV9SrFjEjtnekn3z1MKsUHK+hGiy
 fRpigO2wpDRNEE2pgDpc+rob95hTwiSek13cvXGDDrpvsFlo2qaqS6ypcl6wHp1/Tfu6fsj
 0vYOfC44tja9z/PDItLvDyMiBD+GTl3/iaXdt06gDeJyODdCPg06vZnIpuXSs8YTYt/RZZM
 AxH9xilqZS+6CeTiBpa+o5uR+pXmJwx7P8mRVKsRZOkym3FcsQMNG1aiFO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778693844; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qH/V54VhhqPOZledFsLbM+R0VpSJHUS2eyEFY9ZqlwU=;
 b=0NcyxHGR9w6GAvR7iej7ibrWUmlddjK5w6eALQMSlwCkvj3aEJzwSZ1M5d0F4WWA6FhkB
 XCCib/GHNE/5Aw8yW1XYrvacjkisE34pM1ToNHaxld+IHYi6RYD5pGCZxL3J9rfm+aSSQst
 1lfFauLKQRXlTEVEs1UvvBIlzQQiOR5QjakI/Bh9P0w1BhfCyQhyqHz17Q8hmU7ULQJYZ3c
 XwApXJ6g7XdD1ZKx/0jj/CekABhJATRTlKssEm5s0G8uJ3yXMGbz1+/lWLU0gQ/V3Qh6GrM
 ZvKmbGLs1u38voQpJH0IRhcE8hpEKz/8oQaIRCxgl2lL77lSPi95Cw1C3Y1Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F22AA40564
	for <nouveau@lists.freedesktop.org>; Wed, 13 May 2026 17:37:21 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BE62510EFC0
	for <nouveau@lists.freedesktop.org>; Wed, 13 May 2026 17:50:17 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-44ad87a57f6so752057f8f.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 13 May 2026 10:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778694616; x=1779299416;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qH/V54VhhqPOZledFsLbM+R0VpSJHUS2eyEFY9ZqlwU=;
        b=WGdjWHHCH+KjBCGLaqxf35P01XmiCQNQI/DCKZQBIEjkQGMR4xKlUarPxsiw87DxaR
         czcL2lz6a5lOl275qPcNwilpH9M7HA3+BLdfGUNi4XyFVzNQs76Myd+wwh6AP7EDVQtV
         2Q5ixFpTLlJsRVTzthKzlBcQ7My9VGVuHfGTS9DOx8DGFmHKemswSkhNSm/rrx1G/Q/6
         MXw5/+2PjhIh318IoIiK81too9Oe2wYJfmTouVTylKqWDTb6IK3/RZBG+0PxWm4HSpHZ
         snSxxkqjh7E6USD6SEWKKI8c4HnEBBbbMhMVJydCrPXCE3+mQqnAdvyN3l9PKyIqX3Jb
         N6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694616; x=1779299416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qH/V54VhhqPOZledFsLbM+R0VpSJHUS2eyEFY9ZqlwU=;
        b=WInUIwuR0AlV7AWyi33oJlwE90+s2o7bO25tTxdvw5UM9IJ/qJozvDmNHNJw3mOgDa
         bQtfJBahIUx5W+3o1EBdunS//wDted1p66lp/m0GfzWbJCmQhs1E37Hp9OLParl4gIiQ
         6ysN4Md6fi3UP5xOpppwrHp0k5P4RlJoS4rijMzS90FTLxnxnQbhYkpWgwcXa7Uo8+Kv
         gHIp7IV4WWPVC5WWe9dkp1JvSv/dTOQS3h8NdjCfAfR2VFRjnE/X89ttHlaksP97H/X2
         BgUxs9oH0LXjycDdw2HjtqQp8FKUiarxhmVa566CAlLbMp7zRk9UOPd8AVVThoE3MZmg
         Pj7w==
X-Gm-Message-State: AOJu0YxyCoYzMuJAGk+3UbE8ONegbxSMVVO/lD5MoSoK0PLWy9DodRXQ
	edx3sCeDn1eDmak/rc0f/w77tlcqYt7+m72w1ZqPNS2GU+deZK/bVcKrJKYVMv1LNX4=
X-Gm-Gg: Acq92OFa/kNxckHIe+qnCio6PpdlTtgDdr2Qa6x5QrN81t6kmLActdQV+303lij2I7f
	3YS3Vaocexv/TCXL5xWoQMqY8cxLwjTPZ9M7ChZtVahlMBYPNPgmvHzHK3lf2kO9qWz8WhKGzZi
	s6DrLVvvwxzmPTMr0IdK5/pG8AXSEuyrDeY8YbBL6sdlUg3oZ7LMbd4bFsg9FcAsFjVQL8XSGAd
	SDbCJ41yOAeyFOf5Knccaipz4QdtTPi/+o6ezSvnKf2bIas4JKDFfmZL800n2zJj/Vh/0AZLc9J
	4cZOVneiPmobrvvO6g5pMdDBdtKuDDDu8GZxruTtyuEHmkK0t3HWDognVtpSI1xsCWo69airCqK
	d9J9iny3a3Qg8X+wDPMr1mYrZzbrP9F30JOlRLzV868KjGYf852gXTuzdld7VjQkR7Efmr1n6of
	rt3JJ2TQ68ccxAWbQAO2J57yu9XctlKa19ir/iKrOjUqGPRBC05oolUXyqovLMFuv0yG5D0FxNS
	Rya9+Ww3FlxnxWe+Oa8mHHqBQ==
X-Received: by 2002:a05:6000:29d1:b0:456:3af2:852e with SMTP id
 ffacd0b85a97d-45c58b6782cmr2147922f8f.1.1778694616038;
        Wed, 13 May 2026 10:50:16 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-214.um39.pools.vodafone-ip.de. [109.193.28.214])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe13a7sm486730f8f.29.2026.05.13.10.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:50:15 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 0/2] drm/nouveau: nv04 FIFO cleanup + recovery for Tesla
Date: Wed, 13 May 2026 19:50:11 +0200
Message-ID: <20260513175014.96599-1-marek@czernohous.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7DOKD7J7OLKZ73ITE3SWWYIX5JSJ2L2Z
X-Message-ID-Hash: 7DOKD7J7OLKZ73ITE3SWWYIX5JSJ2L2Z
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7DOKD7J7OLKZ73ITE3SWWYIX5JSJ2L2Z/>
Archived-At: 
 <https://lore.freedesktop.org/20260513175014.96599-1-marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi all,

Two-patch series for the legacy nv04_fifo path covering Tesla
(MCP77/MCP79 and G80-GT218). Daily-driven on the reference NVAC
hardware (Apple Mac mini Late 2009, GeForce 9400M) since 2026-05-05.

Patch 1 demotes a benign CACHE_ERROR that fires once per Mesa session
start on Tesla GPUs. The Mesa NV50 userspace driver issues a method-
0x0060 / data-0xbeef02xx binding probe that recovers cleanly via
nv04_fifo_swmthd(), but currently logs at error level on every X or
Wayland session, dominating dmesg noise on this hardware class. This
clears the channel for patch 2 to identify real faults from noise.

Patch 2 adds a two-tier fault-recovery path for Tesla FIFO faults:

  Tier 1 (per fault). Look up the channel via nvkm_chan_get_chid,
  call nvkm_chan_error(chan, true), fire tracepoint
  nouveau:fifo_chan_killed. Idempotent through the existing
  chan->errored short-circuit.

  Tier 2 (sliding window). When the per-fifo fault count in a
  configurable window reaches the threshold, schedule a worker that
  calls drm_dev_wedged_event(drm, DRM_WEDGE_RECOVERY_REBIND, NULL)
  and fires tracepoint nouveau:fifo_dev_wedged. Worker context is
  needed because kobject_uevent_env may sleep.

Motivation: Fermi+ gets channel-kill and device-wedge automatically
through nvkm_runl_rc; Tesla was feature-frozen before the DRM wedge
uAPI existed. Three observable consequences on the reference
hardware:

  1. Silent state corruption (channel produces wrong output after a
     fault, no notice to userspace).
  2. Observability gap (no counters, tracepoints, or wedge event,
     only dmesg).
  3. Repeated-fault loop (the log-and-reset cycle repeats forever on
     a persistently faulting channel instead of killing it).

Validation. A debugfs fault-injector (kept on a separate
DO-NOT-MERGE branch, not part of this submission) was used to drive
both Tier-1 and Tier-2 paths through their full state space. Phases
1-5 of the test plan were exercised that way. Phase 6 (no manual
injection, real workload soak) ran 2026-05-05 through 2026-05-13:
one organic DRM_WEDGE_RECOVERY_REBIND event was captured on
2026-05-05 09:08; the rest of the soak was fault-free.

Companion userland tool nouveau-pstate-daemon v0.2.0 [1] subscribes
to the WEDGED=rebind uevent in log-only mode and was used to confirm
end-to-end propagation through udev.

Module parameters:

  nouveau.fifo_wedge_count     (uint, 0..32, default 10)
  nouveau.fifo_wedge_window_ms (uint, 100..600000, default 60000)

Setting fifo_wedge_count=0 disables Tier-2 entirely while keeping
Tier-1 channel-kill active.

A note on MAINTAINERS. The series adds a new file
drivers/gpu/drm/nouveau/nvkm/engine/fifo/recover.c. The change is
covered by the existing nouveau MAINTAINERS section
(drivers/gpu/drm/nouveau/), so no MAINTAINERS update is included.
checkpatch.pl flags this as a hint; it is not load-bearing.

This is a follow-up to the April 9 NVAC stability series [2], which
is still awaiting review. The two patches here are independent of
that series and apply against current Linus master.

[1] https://github.com/hibbes/nouveau-pstate-daemon (v0.2.0)
[2] https://lore.kernel.org/dri-devel/20260409-nouveau-nvac-stability-series

Marek Czernohous (2):
  drm/nouveau/fifo/nv04: filter benign CACHE_ERROR from Mesa NV50 bind
    probe
  drm/nouveau/fifo: add recovery path for Tesla cache_error/dma_pusher

 .../drm/nouveau/include/nvkm/engine/fifo.h    |  12 ++
 .../include/trace/events/nouveau_fifo.h       |  58 +++++++++
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  29 +++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/Kbuild   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |   3 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv04.c   |  29 ++++-
 .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |  10 ++
 .../drm/nouveau/nvkm/engine/fifo/recover.c    | 121 ++++++++++++++++++
 8 files changed, 257 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/trace/events/nouveau_fifo.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/recover.c


base-commit: 1f63dd8ca0dc05a8272bb8155f643c691d29bb11
-- 
2.53.0

