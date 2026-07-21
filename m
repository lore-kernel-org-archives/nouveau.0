Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9218AC4452D
	for <nouveau@archiver.kernel.org>; Tue, 21 Jul 2026 20:47:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DC29A10EB44;
	Tue, 21 Jul 2026 20:47:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hCEGACkh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 91BB9472B5;
	Tue, 21 Jul 2026 20:31:35 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784665895;
 b=efzho3MYncGXfZIqN/T5Q3qBnWpmKHmHIGbsKwrmJxAv874oQifoljNwU0FCrpMBeyvES
 yG2gW+yLAsznPZRBGO4o/FV68tlgZEp4uaR73GZYW6uuCMDc8mlGmQ3nHfUFOpvlYNExncF
 EFHa9RyJOLqjEQHCT35xTG6bwngeiR3o0Y3X0rqpEKnw5ZFAOZEuaz5bhi6VgBLuvLvDccb
 jJHkZ0wSgLV2OGomBJtUfejs49r83bKcHxkCNwghxOXMFF2MHryBHhwrovSPtVxZEvCrEoM
 GN9gFcGvEaAJH1fwpq1rqRsyvwBPcY+mCZe7aZZ4gbeBaZDsXfhW9yywNFtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784665895; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GJbUbySs84LNWjl5SycArBud2hG3wkiE9tEYI1yGGjI=;
 b=Eeq0njAj+au1sQvEuAMtWjyUc7ZcC/q61Ppl7zsiO9MNEIN6yGDddDNCnhdmoOF0xnPrV
 L749xKzUeh+FWiLs8xzFzGGrObkA3Jg/EPvncugBOTJZb16O4UVeJpAeV2ZGHwAk0h35pag
 lf+d7b7/SuvgVph33hiYjdJlMMNAcC4QkkMclt/1xSt+9596IMuuKQgMEMkFtBXSDKPC/vn
 WWkoGI+6v4IkPwBAyZJBP93EVx6w7DGk/7+27P7fQJqL8H66Dc8INp32EWlqa9HSElym04x
 +skscQeu2LhE/7hrX890ZCQu1wBzbfXDl5KfgY5I/kifAA9IepyvFOfWwryg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 10F9847287
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 20:31:32 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC6710E3C6
	for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2026 20:47:01 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-38101f85591so4515420a91.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 21 Jul 2026 13:47:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784666820; cv=none;
        d=google.com; s=arc-20260327;
        b=cO5ogoaRDn7v81eVq2zthpV58V4o8s/ONQJtSsCIEUjwcjD70HdfNVizJYs8L4whVj
         /ky7pICNyhkRH2bouDg1SLqJS6Dwh5GbJWVza1P3iPuGsgBHXIgqRzoZcHaVIwKN/9xn
         /x5+Xsjpdr02geCfIQvz0EfVsp25HKvi3X1RtfBSN16ddqzcv1Ry0r4v3kuqgFcoKyL9
         NN+8q0vQ50YHnJ9EgOha0bHcTFeHWodQOsLPawfkBq5eOO6ubfygeVHx1VM1fVp69Gp5
         8Xnu0nL/nQmdwd1a0arNGasWSM7VXqGXkyAKfZBxS7I+9mM+bK+b7EkmWvGv3nAfQx6B
         xbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GJbUbySs84LNWjl5SycArBud2hG3wkiE9tEYI1yGGjI=;
        fh=5AtK34nHL7d54r5vfPrunC/lWWg9PNyZLfIw3AAg8Pc=;
        b=Znmd7mGkGh75hh9jPUTK7g5Pv6M4WeZh4aY/hKL9/umeVaAcj5aVA971tqYD4z9a63
         CWZpu/M6bdPXjnt7De/eHd56KDvocbqYlEdDANBdPfZgow7EkPTyTz3Y1R8f5u3yoNP8
         /TiboMvwWnxOZ1YI/VL6Lp2CaRxONt87LAu532Gq2iFNa4Ej+dL0Y+klmVvT5/TuWueQ
         v+1xgek5V2m0CYsmS1mwHInF7Tpxa2U4mB5Znj4X67ynY6Pp2ARw5EUVKb9ExBWtBE0A
         6PZkm6YfbPu7LMSCFDMyHbucBvqPXwqmaRMHpC7O+os/XshMrtje+Eo+L9AFuZSU0YYS
         lKfQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784666820; x=1785271620;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GJbUbySs84LNWjl5SycArBud2hG3wkiE9tEYI1yGGjI=;
        b=hCEGACkh//oq7YDM1B7Px0QQLalluJ58VGC+OBjPvkqlWkGuN2JZ89MQtk5WXWn1nC
         2JO1DLcXN0OtRubo4XzTVKG2ZqpA0nnOMWq37QYraB9hMJjU1C4+RJhxQwSqkFOW7O4k
         M58nn/bJvGUGAMoXZtINWYDlH7WAV1KzKxuub22rIkIDv5bdj0sQGtyGO05JAm9apSLF
         fXjwYo/ZmnqrK5Yt1HOrCv1oTJSU7EYHHg/ESTozOjCe+VExjVAmSfMlrLcV4PqNlVG3
         txD/stf6S39xUZs3HXJFTMK4lqlf6teLyzmtIAHVlF+EdQm/1gAqIMZpelpDaJbyOxe8
         XMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784666820; x=1785271620;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJbUbySs84LNWjl5SycArBud2hG3wkiE9tEYI1yGGjI=;
        b=rXf98+9oJf4gg5ycN6kyfL+9UwDUQPROmXtl2uQm2WagiqzWvHSy8r5n8ABfpoXeBY
         hg3RvAYKL44AK2k47ZUODFkzK9pSuBPHp77+/CgA2S2lzHsLve+DPbOe9vLZvPLcSoUI
         eNKY1+LYXDOLQ2wNSQJ0UhlGtOv+V0oMBItqIRzq069ZG+2DLJ4lbWGFZHqXyJLrS4oR
         3nQfhU+bzF4u5+4qLzGxrh9MIMyEkJJ1D2QgbKcRLyf6X9tTRzyVKIh7i3C9G95N+Yzn
         LCfrLfKx4mAZAji5cRh2qGE40aXKiHGYdGKnCKf4/POjgt4CvWBQbmDtRwJflGlFhrhn
         jnKw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrdgH5bEzxUi0k4z3SHotVE2bf9plyF1PuXJrl0ysHOWEKiGR/Z41B5sUeoFjGyrxdGJUdvevQv@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6ZWSvHwV0mP8YNVbm1QuggyLeRZ4xugUpjbX9Ce/V6G4L3ipG
	9B+5Dvz16D3bTp+1qQBWTHi5HDlITBYw3H/j4tchgS7yX381FefWNWhk1Vaz3HfQtEOPZ14FSof
	yk/grka9S60g2/eH2HhADuMyhkodk1Hk=
X-Gm-Gg: AR+sD126EFyyDYBBA1isBnX5feYkjhJegdceOxwG3vvbNmi7c79DdqCvYqNOGT63u5R
	LxovTdMdrLkMWTOaWIPxj6vBpI4w4xORPQpxH6NGmyMqczY99ear+ZbnakhAbVL+nDset5yV2jD
	SBzE8MSIGh1gNS74vWTgS4aIkp1qkti7pOskXXunhovHRxkXy3nb+QTH6GhGaNJcu/erj/ns6Cq
	uT9oe2A7YIYy15RlLEO8PWiSjqta8oss6nYoC8kdhQBu9lldIgk8s0rCiPb+neyvxI5LA==
X-Received: by 2002:a17:90b:4b04:b0:37e:1620:dabc with SMTP id
 98e67ed59e1d1-38ea3203c92mr1107979a91.0.1784666820492; Tue, 21 Jul 2026
 13:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
 <d17afcac57059fc5effc786321ac43cc6d0b2c30.camel@redhat.com>
In-Reply-To: <d17afcac57059fc5effc786321ac43cc6d0b2c30.camel@redhat.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Wed, 22 Jul 2026 00:46:49 +0400
X-Gm-Features: AUfX_mzU0gvZD_QQT3Qph1MI2ZWe3n4-T0xRbt8Sz7wnfNAh6FJ04Xhdy4VnbSA
Message-ID: 
 <CAA+WOBstz=K3MgfLSMG2Nh=gsrLyTi98qato0QtJicYoyG5LJQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] drm/nouveau: GSP telemetry via RUSD, and fdinfo
 telemetry exposure
To: lyude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DOLKSSH6KAD4YS34ALZYCXUDDOA3QBID
X-Message-ID-Hash: DOLKSSH6KAD4YS34ALZYCXUDDOA3QBID
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DOLKSSH6KAD4YS34ALZYCXUDDOA3QBID/>
Archived-At: 
 <https://lore.freedesktop.org/CAA+WOBstz=K3MgfLSMG2Nh=gsrLyTi98qato0QtJicYoyG5LJQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jul 22, 2026 at 12:40=E2=80=AFAM <lyude@redhat.com> wrote:
>
> With the various nits addressed or responded to, for the whole series:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> (I assume with you moving stuff into nvkm I might need to re-review
> later, but that's fine with me)
>

Thanks a lot! All your suggestions are fine by me so I'll incorporate
them, do the shifting around to prevent the errors on unsupported
metrics/cold reads from reaching userspace, and push a V2.

> On Wed, 2026-07-15 at 01:14 +0400, Mohamed Ahmed wrote:
> > On the GSP firmware, nouveau reports nothing about the GPU. The GSP
> > owns
> > the sensors, so the legacy nvkm therm/clk/volt hwmon paths never run,
> > and
> > monitoring tools have no data to read.
> >
> > GSP on later firmware does publish all of it through a stable
> > interface.
> > It maintains a shared-memory region called "RM User Shared Data"
> > (RUSD),
> > which the firmware fills with all the relevant sensor readings like
> > power,
> > temperatures, clocks, and many others. Consuming it needs only two
> > internal subdevice controls: INIT_USER_SHARED_DATA to register the
> > buffer,
> > and SET_DATA_POLL to tell the GSP which data groups to poll and how
> > often.
> >
> > This series makes nouveau a RUSD client and exposes the data through
> > two
> > main surfaces:
> >
> >   - hwmon, for the values that map onto standard channels: GPU and
> > memory
> >     temperature, GPU/board/VRAM power, power cap.
> >
> >   - sysfs, under /sys/class/drm/cardN/device/rusd/, for everything
> > hwmon
> >     has no channel type for: clocks, utilisation, pstate, throttle
> > reason,
> >     ECC counters, PCIe error counters, and everything exposed to
> > hwmon as
> >     well. One value per file according to sysfs convention.
> >
> > Polling is demand-driven. GSP polls a group only while a client is
> > reading
> > it, and a group idles off after 10s after the last read. Polling
> > costs
> > power, so nothing is polled unless someone is looking. A section that
> > has
> > not been polled yet, or that the board does not support, reads -
> > ENODATA.
> >
> > The sysfs interface is documented in
> > Documentation/ABI/testing/sysfs-driver-nouveau.
> >
> > While the original scope was RUSD support only, monitoring tools
> > needed
> > two extra additions to complete the picture:
> >
> >   - VRAM size and usage on sysfs (patch 5): since this series adds a
> > sysfs
> >     interface for nouveau, it's better to expose VRAM metrics there
> > rather
> >     than force monitoring apps to pull in libdrm for the GETPARAM
> > memory
> >     ioctls.
> >
> >   - fdinfo (patch 6): nouveau implemented none at all, and monitoring
> > apps
> >     could not show per-process GPU and memory usage. It now reports
> >     per-client memory and per-engine busy time, accounted from the
> > DRM
> >     scheduler that the EXEC/VM_BIND path already uses.
> >
> > Limitations, caveats, and additional considerations or questions:
> >
> >   - RUSD needs r570 or newer GSP firmware; r535 does not have the
> > needed
> >     controls. Pre-GSP and r535 behavior is identical to what it was:
> > the
> >     rusd/ group is not created, and hwmon keeps its current behavior.
> >
> >   - This is all read-only telemetry. Clock, voltage, or power control
> > is
> >     through other interfaces out of scope of this series.
> >
> >   - The sysfs interface exposed here should be stable and valid for
> > nova
> >     as well. RUSD is stable and only grows more fields with newer GSP
> >     firmware (e.g., fan telemetry gets added in r580), so it is
> > possible
> >     to keep the same interface as we use newer firmware or as we move
> > to
> >     nova and any potential considerations should be ironed out before
> > this
> >     gets merged and the interface gets frozen.
> >
> >   - amdgpu offers a single binary blob with all the telemetry
> > embedded in
> >     addition to the sysfs sensor files. This series currently only
> > exposes
> >     sensor files, but it is possible to add a similar binary for a
> > v2.
> >     This mainly offers a more efficient way to read the telemetry as
> >     clients would read only a few files instead of reading all of
> > them.
> >
> >   - The last two patches don't depend on RUSD and work on every GPU.
> > But
> >     they are here because they complete the sensor telemetry story. I
> > am
> >     happy to split them into their own series if that is preferred.
> >
> > Userspace WIP work built on this sysfs surface exists in form of
> > nouveau
> > backends for nvtop, LACT, and a NVK HUD:
> >
> >   - nvtop: https://github.com/mohamexiety/nvtop/tree/nvtop-nouvtop
> >
> >   - LACT: https://github.com/mohamexiety/LACT/tree/lnouvct
> >
> >   - NVK HUD:
> >     https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39898
> >
> > None of these are merged yet and exist for testing only. Upstreaming
> > will
> > begin when this series gets merged and the interface is stable.
> >
> > Mohamed Ahmed (6):
> >   drm/nouveau/gsp: vendor the RUSD header
> >   drm/nouveau/gsp: add RUSD telemetry support
> >   drm/nouveau: add GSP hwmon support
> >   drm/nouveau: expose RUSD telemetry via sysfs
> >   drm/nouveau: expose global VRAM size and usage via sysfs
> >   drm/nouveau: expose per-client GPU usage via fdinfo
> >
> >  .../ABI/testing/sysfs-driver-nouveau          | 167 ++++++
> >  MAINTAINERS                                   |   1 +
> >  drivers/gpu/drm/nouveau/Kbuild                |   1 +
> >  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  33 ++
> >  .../drm/nouveau/include/nvkm/subdev/rusd.h    | 114 ++++
> >  .../gpu/drm/nouveau/include/nvrm/nvtypes.h    |   3 +
> >  drivers/gpu/drm/nouveau/nouveau_abi16.c       |  16 +
> >  drivers/gpu/drm/nouveau/nouveau_chan.h        |   2 +
> >  drivers/gpu/drm/nouveau/nouveau_drm.c         |  22 +
> >  drivers/gpu/drm/nouveau/nouveau_drv.h         |  29 +
> >  drivers/gpu/drm/nouveau/nouveau_exec.c        |   3 +
> >  drivers/gpu/drm/nouveau/nouveau_gem.c         |  16 +
> >  drivers/gpu/drm/nouveau/nouveau_hwmon.c       | 375 ++++++++++---
> >  drivers/gpu/drm/nouveau/nouveau_sched.c       |  87 +++
> >  drivers/gpu/drm/nouveau/nouveau_sched.h       |  11 +
> >  drivers/gpu/drm/nouveau/nouveau_sysfs.c       | 311 ++++++++++
> >  drivers/gpu/drm/nouveau/nouveau_sysfs.h       |  10 +
> >  .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |  26 +
> >  .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |   1 +
> >  .../nouveau/nvkm/subdev/gsp/rm/r570/Kbuild    |   1 +
> >  .../nvkm/subdev/gsp/rm/r570/nvrm/rusd.h       | 303 ++++++++++
> >  .../drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c  |   1 +
> >  .../nouveau/nvkm/subdev/gsp/rm/r570/rusd.c    | 531
> > ++++++++++++++++++
> >  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   7 +
> >  24 files changed, 1990 insertions(+), 81 deletions(-)
> >  create mode 100644 Documentation/ABI/testing/sysfs-driver-nouveau
> >  create mode 100644
> > drivers/gpu/drm/nouveau/include/nvkm/subdev/rusd.h
> >  create mode 100644 drivers/gpu/drm/nouveau/nouveau_sysfs.c
> >  create mode 100644 drivers/gpu/drm/nouveau/nouveau_sysfs.h
> >  create mode 100644
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/rusd.h
> >  create mode 100644
> > drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rusd.c
>
