Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AA7C43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 21:15:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F27110EE53;
	Tue, 14 Jul 2026 21:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MS/tHf+o";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 349634719E;
	Tue, 14 Jul 2026 21:00:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784062831;
 b=aoM+upMbBwzpHH5Sg+KkSl3Q0h5c8lGFuJJ415ko7kjkQ/6T7YZQv3SAN9t/GhUphLThP
 wEfshlKXYv+2pYxW46M8vo6RdjlPtDH6GGwvvgVHRJZcBJfqFRnSA73yA0Nv6TBRyqnhU3n
 qYyOYlFjLXhinRztKFD8bkMNhykbP8vTRqMjX7v7xvwZs0LhGVN6gJxUVJVouruMFts4wsb
 b6nq7jV2tVybgBJGU7kdYgM1v7bGI1s4paPve/BQVlLt6lQVDNsz/6TUU/xTAgolW3irH3v
 AQnKioE+QHmQOw3TLaJ+E9A8rkSV+qvOhc41p85rxrA62BZ7ubf1/kVtHNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784062831; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RCq7Nx8/0JTWLcWo9D6VA1wUiUAA6aMWpwH1k5hkv5c=;
 b=zGGqRQYGZpPbVdR3gSvCDhC2eZ2nwD4WW0Rpg3sMGHHkFJRNENWhyJ4ikHJC92QMXM/kk
 Raevs5X8OUABJYxbV5hO3GIdS2i4IbK5RN+/VdmTfahRIlLY4l/Ok3/uu27Hu5wntvIO9aF
 0ijmMIVQkp201K2pzfvH2p0lm6PhlLVD2JVOc6q1A5cE4mIzz3YfRv+8K/OLStLl6w0ahUF
 W02xGQBbQOvQJfWcY1RCu1VBRu4fGqk0fxCWAPOMqnMo7OjUai4Afs8ePZZcNUqOqoh3ha1
 hAtIjk65J+IGH25qpDNke5A3mKi3vQcTf/R75EWbEOaEUun0Jb9T4fV5ivkw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5EE2447123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 21:00:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F3FCE10EE29
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 21:15:41 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4953bc61ce2so1031255e9.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 14:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784063740; x=1784668540;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RCq7Nx8/0JTWLcWo9D6VA1wUiUAA6aMWpwH1k5hkv5c=;
        b=MS/tHf+oZlSwzDDENqfEjNvLETL6eRLHYknVTPATeAJMh9PpBktRasYRLZxLbA/HNN
         xFxz7a06vbHNhvRj+Lzn/jAVY3KwR4wffW17WmV61xbH327C2xCmoBqtl66HJ1VW3aI+
         sq7GJvcmroTiEBl5If1FKQ8xdVSvCjHRIY/q6BapeHZSVrDK7GnwtMNaTaA1v0lrhQpA
         XIah8kvzyIfEJZCMoMES12SMESxL66vuGty7/vGpmdU3YeTc+e+XM0R8pv9m/eFyojNn
         OmUGMopdW7+o92tcHDBc/SHtjiS0ED0/hNV22v4jQVspPPhi4dCcuJwZenf3Olt47Siz
         YPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784063740; x=1784668540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCq7Nx8/0JTWLcWo9D6VA1wUiUAA6aMWpwH1k5hkv5c=;
        b=hldkICztdtJbQWVjtqDpSfdas8IO1I6jhQt2gliiQhcrn0ol86ZVdqthyZhEPtIHIr
         j1SQRWjzwI/QrHO6rVxAHrz2BgB9LNcF7pnsOhFN2Y9w5V806oFrf8zTyIWMp1/UDjul
         xdIM2IaGZFC1preeI/HkRVqSqXLZ2B30VPwk9/hwmXJlAnfvsJuWTsloiAz3Bggt1DSW
         peHEWMbqFZRD93Gs5NEHXWmdLCyoUwiB5AQhr0HivNhKiBqPlpT4UZFS7mxOGB8fXu7S
         iBxw3jSJcP5OZMsssupXhRr79BLGrUHwa0wGS8EQP3D2HfsZFcm/6hOMol37Fv0+d8yA
         GGFA==
X-Forwarded-Encrypted: i=1;
 AHgh+RphMhOCdq0ThCnxTydBDipxlyQxOss0YO+A4eQQIPGGptOJMvAv4CwiNZiJOWPsEWAh57QgetvM@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6iHuOVSfdtlPiGrBlq3c3gPFn8xfdwASxsKeJ8I03cXqgdj5t
	NY0Hs6Gi2nHT9OYI4oZ7jFW+Ojge12p91wbpqZjy9i2w5KOdQKSv/zJm
X-Gm-Gg: AfdE7cmjkm35Bmwa4Xei8Zk8cMpC+rodSgY4vODDoMF3CkUWv9uM8/QWTcdTPMenDyy
	BB7SiZOHeoR9WejMPVKcqwDQhS6FZPVDnCVsrreYRZO1f2Z0UzM7ATwY71fe6zOfjzJJEeFHLKe
	T9bEtnAIOE9bDl+4ouM1ZxXkp0DF6IHsAB5SXcD1LOR3Xvs91rMBMzf2HWEHpL6GzY8pFJP4qIw
	T/N4xCxmjxTLWzRuArQpC3+6ZznLjA6cT9F0/3vX8T47DLvivHN2DH7/I6aUAUbzwhceiPdJZ3y
	8w2tWcPt48tWs401s/rkxy0PnVdkut6bdgMSJRtTWS6QDVkWExCW52UA6tkdtgOOvHkSE8QWMbv
	O4p48dKe/4qpp+HNu9WFoBIdnaWLBE3nDh+H/UnnwCXdw1NYaTP94b8kGiVgrSrGCZSOW/on3co
	N/kfoYwifpDUQCMsM0E0Gu
X-Received: by 2002:a05:600c:6387:b0:492:7142:f46e with SMTP id
 5b1f17b1804b1-493f87d8583mr168232975e9.2.1784063740186;
        Tue, 14 Jul 2026 14:15:40 -0700 (PDT)
Received: from fedora ([94.205.182.68])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950a32a2casm149843875e9.12.2026.07.14.14.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:15:38 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] drm/nouveau: GSP telemetry via RUSD,
 and fdinfo telemetry exposure
Date: Wed, 15 Jul 2026 01:14:23 +0400
Message-ID: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HWYT7NVDVVIRHPTWUP3NOHM7SU44NKKD
X-Message-ID-Hash: HWYT7NVDVVIRHPTWUP3NOHM7SU44NKKD
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HWYT7NVDVVIRHPTWUP3NOHM7SU44NKKD/>
Archived-At: 
 <https://lore.freedesktop.org/20260714211429.238355-1-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On the GSP firmware, nouveau reports nothing about the GPU. The GSP owns
the sensors, so the legacy nvkm therm/clk/volt hwmon paths never run, and
monitoring tools have no data to read.

GSP on later firmware does publish all of it through a stable interface.
It maintains a shared-memory region called "RM User Shared Data" (RUSD),
which the firmware fills with all the relevant sensor readings like power,
temperatures, clocks, and many others. Consuming it needs only two
internal subdevice controls: INIT_USER_SHARED_DATA to register the buffer,
and SET_DATA_POLL to tell the GSP which data groups to poll and how often.

This series makes nouveau a RUSD client and exposes the data through two
main surfaces:

  - hwmon, for the values that map onto standard channels: GPU and memory
    temperature, GPU/board/VRAM power, power cap. 

  - sysfs, under /sys/class/drm/cardN/device/rusd/, for everything hwmon
    has no channel type for: clocks, utilisation, pstate, throttle reason,
    ECC counters, PCIe error counters, and everything exposed to hwmon as
    well. One value per file according to sysfs convention.

Polling is demand-driven. GSP polls a group only while a client is reading
it, and a group idles off after 10s after the last read. Polling costs
power, so nothing is polled unless someone is looking. A section that has
not been polled yet, or that the board does not support, reads -ENODATA.

The sysfs interface is documented in
Documentation/ABI/testing/sysfs-driver-nouveau.

While the original scope was RUSD support only, monitoring tools needed
two extra additions to complete the picture:

  - VRAM size and usage on sysfs (patch 5): since this series adds a sysfs
    interface for nouveau, it's better to expose VRAM metrics there rather
    than force monitoring apps to pull in libdrm for the GETPARAM memory
    ioctls.

  - fdinfo (patch 6): nouveau implemented none at all, and monitoring apps
    could not show per-process GPU and memory usage. It now reports
    per-client memory and per-engine busy time, accounted from the DRM
    scheduler that the EXEC/VM_BIND path already uses.

Limitations, caveats, and additional considerations or questions:

  - RUSD needs r570 or newer GSP firmware; r535 does not have the needed
    controls. Pre-GSP and r535 behavior is identical to what it was: the
    rusd/ group is not created, and hwmon keeps its current behavior.

  - This is all read-only telemetry. Clock, voltage, or power control is
    through other interfaces out of scope of this series.

  - The sysfs interface exposed here should be stable and valid for nova
    as well. RUSD is stable and only grows more fields with newer GSP
    firmware (e.g., fan telemetry gets added in r580), so it is possible
    to keep the same interface as we use newer firmware or as we move to
    nova and any potential considerations should be ironed out before this
    gets merged and the interface gets frozen.

  - amdgpu offers a single binary blob with all the telemetry embedded in
    addition to the sysfs sensor files. This series currently only exposes
    sensor files, but it is possible to add a similar binary for a v2.
    This mainly offers a more efficient way to read the telemetry as
    clients would read only a few files instead of reading all of them.

  - The last two patches don't depend on RUSD and work on every GPU. But
    they are here because they complete the sensor telemetry story. I am
    happy to split them into their own series if that is preferred.

Userspace WIP work built on this sysfs surface exists in form of nouveau
backends for nvtop, LACT, and a NVK HUD:

  - nvtop: https://github.com/mohamexiety/nvtop/tree/nvtop-nouvtop

  - LACT: https://github.com/mohamexiety/LACT/tree/lnouvct

  - NVK HUD:
    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39898

None of these are merged yet and exist for testing only. Upstreaming will
begin when this series gets merged and the interface is stable.

Mohamed Ahmed (6):
  drm/nouveau/gsp: vendor the RUSD header
  drm/nouveau/gsp: add RUSD telemetry support
  drm/nouveau: add GSP hwmon support
  drm/nouveau: expose RUSD telemetry via sysfs
  drm/nouveau: expose global VRAM size and usage via sysfs
  drm/nouveau: expose per-client GPU usage via fdinfo

 .../ABI/testing/sysfs-driver-nouveau          | 167 ++++++
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/nouveau/Kbuild                |   1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  33 ++
 .../drm/nouveau/include/nvkm/subdev/rusd.h    | 114 ++++
 .../gpu/drm/nouveau/include/nvrm/nvtypes.h    |   3 +
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  16 +
 drivers/gpu/drm/nouveau/nouveau_chan.h        |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  22 +
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  29 +
 drivers/gpu/drm/nouveau/nouveau_exec.c        |   3 +
 drivers/gpu/drm/nouveau/nouveau_gem.c         |  16 +
 drivers/gpu/drm/nouveau/nouveau_hwmon.c       | 375 ++++++++++---
 drivers/gpu/drm/nouveau/nouveau_sched.c       |  87 +++
 drivers/gpu/drm/nouveau/nouveau_sched.h       |  11 +
 drivers/gpu/drm/nouveau/nouveau_sysfs.c       | 311 ++++++++++
 drivers/gpu/drm/nouveau/nouveau_sysfs.h       |  10 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |  26 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |   1 +
 .../nouveau/nvkm/subdev/gsp/rm/r570/Kbuild    |   1 +
 .../nvkm/subdev/gsp/rm/r570/nvrm/rusd.h       | 303 ++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c  |   1 +
 .../nouveau/nvkm/subdev/gsp/rm/r570/rusd.c    | 531 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   7 +
 24 files changed, 1990 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-nouveau
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/subdev/rusd.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sysfs.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sysfs.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/rusd.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rusd.c

-- 
2.55.0

