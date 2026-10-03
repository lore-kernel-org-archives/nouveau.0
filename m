Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFBFCA5FE6
	for <nouveau@archiver.kernel.org>; Sun,  4 Oct 2026 13:45:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4326810E9B7;
	Sun,  4 Oct 2026 13:45:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=saltyming.net header.i=@saltyming.net header.b="hl4gbgCK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4905948969;
	Sun,  4 Oct 2026 13:27:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791120450;
 b=PGcOD0h40zMT/tTCtJpDrlOV9sKdTv6CeEGB+uPuuGJ5vz1UFwADF4G1EqO6P7OBuzLgC
 Hf+GYlf+Vsc+rlkxs21OrAa8i1PWsc+mSeStht803mwQZyD9hyG+0ZRPOe4in4POtYiUqMM
 rz8PtCr48GwgkuTzzU+vcbvzBsmHB5rrLJHZmsSAYhcEwIbvbUjruHhzZFiAs5vG8F9K+EY
 q9eAwkgZ78HGn8NSSm4sh1tMOjF9N1bug7P9U7R4aOUH+sQLA/yvqpBIEku5ng4t2Sl1R6b
 NMl9GiC96w6crdmF0pbvbfj7dmcAAlTLYDgYq9BMCJRoF3Hu7wXLotIX8UXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791120450; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VeZYO3jefwb4yxSTzrfcJ0DSsI77zkNa5o+LTFguS6Y=;
 b=avHh5bPC4jzKxsK+ohtY41cW6tJSoqHEPqVynCwJ5+av/6DS6tZHEaA6+Iv+qsW8sksyR
 Rzu7OpTXu8kj4VV8bVDvcVgQbJ5CViwNrPTB0olriJH5eaRvzZ8u1V8egdiAUFWN2YJr/tN
 T1MKHmG72kqW1qabIa01DjLV0OjoUUoQRgjmo57+bB1q/7MPL2OeNtHWFY127kYi5y3XH0s
 Dyh9PqUqOJePqUZhQorARkVFEESj0mtkCa0zHsmc47ZlqiH7wEdzGixzDqhBHB4reXPVtPy
 xr/Z2FBjz4pzIX0MmC4vm08poe00830l5IHuIRE7XtGr/win7FFzDDXATJsg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=saltyming.net;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=saltyming.net
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=saltyming.net; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=saltyming.net
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 54AF248945
	for <nouveau@lists.freedesktop.org>; Sat,  3 Oct 2026 23:26:01 +0000 (UTC)
Received: from smtp-sv1.saltyming.net (smtp-sv1.saltyming.net [152.53.31.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ADCC810E2E5
	for <nouveau@lists.freedesktop.org>; Sat,  3 Oct 2026 23:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=saltyming-dkim-202512; d=saltyming.net;
 c=relaxed/relaxed;
	h=MIME-Version:Message-ID:Date:Subject:To:From:Content-Type; t=1791071053;
	x=1791675853; bh=VeZYO3jefwb4yxSTzrfcJ0DSsI77zkNa5o+LTFguS6Y=; b=hl4gbgCK2i
	7GuyTiBOPM+AZRN4dCC5v6jSHjzdAT5tJZ66qBTvQbMQCYoH8nNDGi+VTDWWaRwSqKS4SH3OkYj
	7o3HZYUe99hOs6INR4Dfw0cyOovLsRrlehkFwFzwEd8wdbdgOTqAwqZbUSnX/EiNzBR8UuwfKp+
	sVCBUQp+m7veUWpTB5irqwFQCaGGfBxyt41HjNtSPGGosaebWrEbqU50xz+Dgov7C/VdsssDH6j
	r56BeGYdCcVIg20ns/G7FPXbJcvTMYtZqNVolHNMRpzmsiq6OdNgXO1KlGo5m1ggnTTlTKeSQph
	kz3CfsJjuQZgPQjtVzisceZAOYjUPnkw==;
Received: by smtp-sv1.saltyming.net (SaltyMail) with ESMTPSA
	(version=TLSv1.3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256)
	(No client certificate requested)
	id 5706f076-2f97-4bb3-9e24-6dc8d40fc060
	for <nouveau@lists.freedesktop.org>; Sat, 3 Oct 2026 22:34:27 +0000
X-Virus-Status: Clean
X-Security-Tags: spf_none, dkim_none, dmarc_fail, dmarc_quarantine, arc_none,
 av_clean, ham
From: Hamin Sung <hamin@saltyming.net>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [RFC PATCH 0/2] drm/nouveau: select GT21x performance levels by load
 through devfreq
Date: Sun,  4 Oct 2026 07:34:18 +0900
Message-ID: <20261003223420.77993-1-hamin@saltyming.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: hamin@saltyming.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: GRCUSPJP4TRYPUOHQ2KGOIUGA6JTEBYE
X-Message-ID-Hash: GRCUSPJP4TRYPUOHQ2KGOIUGA6JTEBYE
X-Mailman-Approved-At: Sun, 04 Oct 2026 13:27:28 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Aaron Kling <webgeek1234@gmail.com>,
 Hamin Sung <hamin@saltyming.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GRCUSPJP4TRYPUOHQ2KGOIUGA6JTEBYE/>
Archived-At: 
 <https://lore.freedesktop.org/20261003223420.77993-1-hamin@saltyming.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On GT21x (GT215, GT216, GT218, MCP89), nouveau can reclock by hand, and
booting with nouveau.config=NvClkMode=auto selects the clock subdev's
automatic mode.  Nothing adjusts the automatic pstate on these GPUs, so
automatic mode means the highest pstate.

This series measures graphics engine load with the PDAEMON idle counters
(patch 1) and lets the devfreq simple_ondemand governor choose the pstate
from it while automatic mode is selected (patch 2), along the lines of
the Tegra devfreq support from commit 6ca1701cecdb ("drm/nouveau: Support
devfreq for Tegra").  Nothing changes unless NvClkMode=auto is given at
load time, and a fixed pstate written to debugfs still wins.

The devfreq device lives in the DRM layer rather than next to
gk20a_devfreq.c, because PCI suspend, resume, runtime PM and unbind are
handled in nouveau_drm.c, while nvkm subdev init runs again on every
resume.

On GT21x boards that need memory link training, the first pstate change
runs into the "scheduling while atomic" bug fixed by "drm/nouveau/fb/gt215:
don't sleep with PFIFO paused during link training", which I sent
separately for drm-misc-fixes.  This series makes that first change happen
automatically, so it should go in after that fix.

Testing:

  - built with W=1 and sparse, with and without CONFIG_PM_DEVFREQ, and the
    Kconfig change checked on x86 and on an arm64 defconfig with Tegra
  - GeForce 310M (GT218), 6.18.54 backport: its VBIOS has a single usable
    performance level (the 135 and 405 MHz entries are marked 0xff), so the
    series as posted does not register a devfreq device there.  With a
    local change allowing a single level, devfreq registered
    (simple_ondemand, one OPP at 625 MHz, delayed 100 ms timer) and the
    load samples read 0% when idle, 3-4% while kmscube rendered at 60 fps,
    and 0% again afterwards.

So the counters and the sampling path work, but pstate changes driven by
the governor are untested: I have no GT21x board with several performance
levels.  Reports from anyone whose debugfs pstate file lists more than one
level would help, which is why this is an RFC.

Questions:

  - Is the DRM-layer placement fine, or should this move into nvkm and
    share code with gk20a_devfreq.c?
  - Selecting DEVFREQ_GOV_SIMPLE_ONDEMAND from DRM_NOUVEAU when PM_DEVFREQ
    is enabled: acceptable, or should it be left to the configuration?
  - The 100 ms polling interval and the 50%/20% thresholds were chosen to
    keep the costly GT21x pstate changes infrequent; better defaults are
    welcome.

These patches were written with an AI coding assistant (see the
Assisted-by tags) at my direction, from a session that read the nouveau
clk, pmu and devfreq code and the envytools PDAEMON counter
documentation; the assistant also ran the builds and the hardware test
above on my machine.  I have reviewed the code and take responsibility
for it.

Hamin Sung (2):
  drm/nouveau/pmu/gt215: add graphics engine load counters
  drm/nouveau: select GT21x performance levels by load through devfreq

 drivers/gpu/drm/nouveau/Kbuild                |   1 +
 drivers/gpu/drm/nouveau/Kconfig               |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/pmu.h |   2 +
 drivers/gpu/drm/nouveau/nouveau_devfreq.c     | 328 ++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_devfreq.h     |  19 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   7 +
 drivers/gpu/drm/nouveau/nouveau_drv.h         |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/pmu/base.c    |  29 ++
 .../gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c   |  40 +++
 .../gpu/drm/nouveau/nvkm/subdev/pmu/priv.h    |   5 +
 10 files changed, 433 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_devfreq.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_devfreq.h


base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
-- 
2.55.0


