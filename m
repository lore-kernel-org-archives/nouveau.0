Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4008C44515
	for <nouveau@archiver.kernel.org>; Mon, 20 Jul 2026 22:16:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 70D4910E20E;
	Mon, 20 Jul 2026 22:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U4m8H2bh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3689D4727C;
	Mon, 20 Jul 2026 22:00:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784584859;
 b=gGu/bJMmbGyl3IIilAkjYst+Lxs2HNLXTnF82U0+cbbx43J4nhyw2FOTflnVD7EFNlpsp
 e5i4LOV+LtNFiTxMxT207uju+ABbXuXi8mvHeVO8dvEctvSq13NrdQJhK02XGFbnZU4waat
 4oKkuppLJhe1n1SLX8aYDJE3kaK3ur7l1ifFvnm2EWZpPv625kidHARXnaBAJymWE57vjwl
 pcybxx6EmFNdeMVc97g1qGbrD2DS6HDyAUtejpQk5d2E+Cfi1sTCpYszZ1WmJOvzB23KJi/
 aigxTQThMOmfjZ6WxU+H8BPd64D/ajuAP8zxqj+3Hw5/sAHDtRyraGWJRzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784584859; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EC8yNHjTDXyuwDYD6Gak8bNS/hg5PwjNliAg5IrJPg8=;
 b=eRTndcb6o3LddzlNQURnrFiE0z+XDP257PzOkhp5loATynwrFKcvWiQhyTUPTF36f+qvz
 NGLlX2K4oFwLd6VdHEtRDSO3Nq/21XnYBDXX0woujTTUc1WLT2gUCVMRa+Tvoz91e7LO74R
 H/EskT/i7Us4uS+mLcSo33Jtc/PojenQ1Xo9uqjwWvh5FDr9PAOBjgs6Fbk0Bod7MHlTY0b
 jYiGcRPgYEajhy89it80Ovo72psEh++Z68JbCUJKFWKjl5kkR5afxyoKtLk8n1KH483qvDP
 AeLa+h/xKxL4JFSf2e3SH2aFezy6cMhFmCPHpXYIHUCGlU1RYtRA22ivPQ2Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6C86C466F6
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 22:00:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EF2BB10E203
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 22:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784585782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EC8yNHjTDXyuwDYD6Gak8bNS/hg5PwjNliAg5IrJPg8=;
	b=U4m8H2bh128zqch1eKtuRnB7e5utOp11OEkxnKSbyGqHDDlThd7j6KjWIYBHva9/U4Uqez
	0vojG05Gq1lFwzBKDfAjXoCfbMochq4x5AZwyRQ8QofgruRYEDAtXmzBmi21etxXzw3P8C
	gTG5WN2FC40O5GI2ER5HWxTO0DLCTTg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-R6un6v8RNAan_KkmMNvoMw-1; Mon, 20 Jul 2026 18:16:21 -0400
X-MC-Unique: R6un6v8RNAan_KkmMNvoMw-1
X-Mimecast-MFC-AGG-ID: R6un6v8RNAan_KkmMNvoMw_1784585781
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-91931144870so1507336085a.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 20 Jul 2026 15:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784585781; x=1785190581;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EC8yNHjTDXyuwDYD6Gak8bNS/hg5PwjNliAg5IrJPg8=;
        b=XmzVzsrW8hwW53hAJTCXnuk1oOJrW+Bl4UBEjcliClt96VxtRAH0uo4Xvb7RuXdzMq
         omJyqGRzyzGc7SRzz7tADU1ZwmeRGPtZL0TNAuMGKqX5a/l27uoxZHRVbVkYOCQwYyWs
         bZciJgH0rm2oPf2iM3yLtkswJLhQY0PI4Fzku0YYRf8sVG8wXnbtVncS6i2Vq/M8CvGP
         OS4vMrJi1ZRmhwUDVWZ70WwB7ZuN9eapOVknqO/eJoMPZqUFsbxXYgmVf+VGGTxdoVbL
         vfu42DdM5F+DLoXf3HgqvbZCyBKui2+XwDwm+nRBAOa97LQXJgwC8SG8+qsp70KWMWic
         FJpg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpL2kXXTRwJqNOCa3AJ1kGiFNSuK51Hkv/lAPl1FaRhucFp85MzPWSkWHFfyuWjv41cChuu3MT/@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzxv5yQAhnlyb1I0KRehVGP2VtjhU4JftDg7/rAS5hF98rCdCZC
	5/XkCGfs1/mC0+r0pPVZIsbl24vLINyFP7GqMH1NEezIE9cH8sJq8DrSF7BlsCWhA6eyG7v0A0y
	srsiPNTeZgQ6XFdedo0yV1Lp/rAeZR3NctjIriR7EbpNgqt/MuvXeGsWt/HdvvGnlO2M=
X-Gm-Gg: AfdE7cl1MzJTMP/gLiEBS31A3CtA6U6J2VyirK7jMd7pXIbIra9FF9g6lwWSsb+iS3m
	IK8zivvVQTRWbPJvXiywsEU3ORBWw5CvU1BiASjOX5hsEbuh0otfy1zFn91t+5D3Ru/CLgiS+e1
	BylqO9qVO6lJnB8IRqoJegui5cZCTbVxoqDy5zGdc7AeU/UtiylH073m0JUZjLAg9GyiytrRKxA
	YpbFp2qPqPeIbsMaI9iVz4kA5Dge8B6TjMEIq21XGVcvUTCFMWvras/hsiiiW7hffTJ+tMlK0xs
	5yQQ6W20SwkFs0fwCGFpjJTOnD37SNIIr9n62zK406jl7x00LPtOU3cdAX2edGjXBNiGgNEr
X-Received: by 2002:a05:620a:708a:b0:92e:fd2c:6a21 with SMTP id
 af79cd13be357-930b3ed4e6bmr1576934685a.27.1784585780724;
        Mon, 20 Jul 2026 15:16:20 -0700 (PDT)
X-Received: by 2002:a05:620a:708a:b0:92e:fd2c:6a21 with SMTP id
 af79cd13be357-930b3ed4e6bmr1576932885a.27.1784585780256;
        Mon, 20 Jul 2026 15:16:20 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-930b52fa8dfsm970105485a.11.2026.07.20.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 15:16:19 -0700 (PDT)
Message-ID: <147d6760338f314016bf4f5c0b33b5c5d08d9d3a.camel@redhat.com>
Subject: Re: [PATCH 0/6] drm/nouveau: GSP telemetry via RUSD, and fdinfo
 telemetry exposure
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Mon, 20 Jul 2026 18:16:18 -0400
In-Reply-To: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
References: <20260714211429.238355-1-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q-u2T_NAAicSliWg7wCW0EMkrxzk3Difk2R0XGYnZYU_1784585781
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BM6S66U4NE3RR67VAR7JFPR22UCW6YNN
X-Message-ID-Hash: BM6S66U4NE3RR67VAR7JFPR22UCW6YNN
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BM6S66U4NE3RR67VAR7JFPR22UCW6YNN/>
Archived-At: 
 <https://lore.freedesktop.org/147d6760338f314016bf4f5c0b33b5c5d08d9d3a.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(just for other nouveau maintainers, e.g. danilo, I'm currently
planning on looking at this during this week. Already started reviewing
some of this, slightly underestimated how much I had to review :)

On Wed, 2026-07-15 at 01:14 +0400, Mohamed Ahmed wrote:
> On the GSP firmware, nouveau reports nothing about the GPU. The GSP
> owns
> the sensors, so the legacy nvkm therm/clk/volt hwmon paths never run,
> and
> monitoring tools have no data to read.
>=20
> GSP on later firmware does publish all of it through a stable
> interface.
> It maintains a shared-memory region called "RM User Shared Data"
> (RUSD),
> which the firmware fills with all the relevant sensor readings like
> power,
> temperatures, clocks, and many others. Consuming it needs only two
> internal subdevice controls: INIT_USER_SHARED_DATA to register the
> buffer,
> and SET_DATA_POLL to tell the GSP which data groups to poll and how
> often.
>=20
> This series makes nouveau a RUSD client and exposes the data through
> two
> main surfaces:
>=20
> =C2=A0 - hwmon, for the values that map onto standard channels: GPU and
> memory
> =C2=A0=C2=A0=C2=A0 temperature, GPU/board/VRAM power, power cap.=20
>=20
> =C2=A0 - sysfs, under /sys/class/drm/cardN/device/rusd/, for everything
> hwmon
> =C2=A0=C2=A0=C2=A0 has no channel type for: clocks, utilisation, pstate, =
throttle
> reason,
> =C2=A0=C2=A0=C2=A0 ECC counters, PCIe error counters, and everything expo=
sed to
> hwmon as
> =C2=A0=C2=A0=C2=A0 well. One value per file according to sysfs convention=
.
>=20
> Polling is demand-driven. GSP polls a group only while a client is
> reading
> it, and a group idles off after 10s after the last read. Polling
> costs
> power, so nothing is polled unless someone is looking. A section that
> has
> not been polled yet, or that the board does not support, reads -
> ENODATA.
>=20
> The sysfs interface is documented in
> Documentation/ABI/testing/sysfs-driver-nouveau.
>=20
> While the original scope was RUSD support only, monitoring tools
> needed
> two extra additions to complete the picture:
>=20
> =C2=A0 - VRAM size and usage on sysfs (patch 5): since this series adds a
> sysfs
> =C2=A0=C2=A0=C2=A0 interface for nouveau, it's better to expose VRAM metr=
ics there
> rather
> =C2=A0=C2=A0=C2=A0 than force monitoring apps to pull in libdrm for the G=
ETPARAM
> memory
> =C2=A0=C2=A0=C2=A0 ioctls.
>=20
> =C2=A0 - fdinfo (patch 6): nouveau implemented none at all, and monitorin=
g
> apps
> =C2=A0=C2=A0=C2=A0 could not show per-process GPU and memory usage. It no=
w reports
> =C2=A0=C2=A0=C2=A0 per-client memory and per-engine busy time, accounted =
from the
> DRM
> =C2=A0=C2=A0=C2=A0 scheduler that the EXEC/VM_BIND path already uses.
>=20
> Limitations, caveats, and additional considerations or questions:
>=20
> =C2=A0 - RUSD needs r570 or newer GSP firmware; r535 does not have the
> needed
> =C2=A0=C2=A0=C2=A0 controls. Pre-GSP and r535 behavior is identical to wh=
at it was:
> the
> =C2=A0=C2=A0=C2=A0 rusd/ group is not created, and hwmon keeps its curren=
t behavior.
>=20
> =C2=A0 - This is all read-only telemetry. Clock, voltage, or power contro=
l
> is
> =C2=A0=C2=A0=C2=A0 through other interfaces out of scope of this series.
>=20
> =C2=A0 - The sysfs interface exposed here should be stable and valid for
> nova
> =C2=A0=C2=A0=C2=A0 as well. RUSD is stable and only grows more fields wit=
h newer GSP
> =C2=A0=C2=A0=C2=A0 firmware (e.g., fan telemetry gets added in r580), so =
it is
> possible
> =C2=A0=C2=A0=C2=A0 to keep the same interface as we use newer firmware or=
 as we move
> to
> =C2=A0=C2=A0=C2=A0 nova and any potential considerations should be ironed=
 out before
> this
> =C2=A0=C2=A0=C2=A0 gets merged and the interface gets frozen.
>=20
> =C2=A0 - amdgpu offers a single binary blob with all the telemetry
> embedded in
> =C2=A0=C2=A0=C2=A0 addition to the sysfs sensor files. This series curren=
tly only
> exposes
> =C2=A0=C2=A0=C2=A0 sensor files, but it is possible to add a similar bina=
ry for a
> v2.
> =C2=A0=C2=A0=C2=A0 This mainly offers a more efficient way to read the te=
lemetry as
> =C2=A0=C2=A0=C2=A0 clients would read only a few files instead of reading=
 all of
> them.
>=20
> =C2=A0 - The last two patches don't depend on RUSD and work on every GPU.
> But
> =C2=A0=C2=A0=C2=A0 they are here because they complete the sensor telemet=
ry story. I
> am
> =C2=A0=C2=A0=C2=A0 happy to split them into their own series if that is p=
referred.
>=20
> Userspace WIP work built on this sysfs surface exists in form of
> nouveau
> backends for nvtop, LACT, and a NVK HUD:
>=20
> =C2=A0 - nvtop: https://github.com/mohamexiety/nvtop/tree/nvtop-nouvtop
>=20
> =C2=A0 - LACT: https://github.com/mohamexiety/LACT/tree/lnouvct
>=20
> =C2=A0 - NVK HUD:
> =C2=A0=C2=A0=C2=A0 https://gitlab.freedesktop.org/mesa/mesa/-/merge_reque=
sts/39898
>=20
> None of these are merged yet and exist for testing only. Upstreaming
> will
> begin when this series gets merged and the interface is stable.
>=20
> Mohamed Ahmed (6):
> =C2=A0 drm/nouveau/gsp: vendor the RUSD header
> =C2=A0 drm/nouveau/gsp: add RUSD telemetry support
> =C2=A0 drm/nouveau: add GSP hwmon support
> =C2=A0 drm/nouveau: expose RUSD telemetry via sysfs
> =C2=A0 drm/nouveau: expose global VRAM size and usage via sysfs
> =C2=A0 drm/nouveau: expose per-client GPU usage via fdinfo
>=20
> =C2=A0.../ABI/testing/sysfs-driver-nouveau=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 167 ++++++
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/nouveau/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |=C2=A0 33 ++
> =C2=A0.../drm/nouveau/include/nvkm/subdev/rusd.h=C2=A0=C2=A0=C2=A0 | 114 =
++++
> =C2=A0.../gpu/drm/nouveau/include/nvrm/nvtypes.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 3 +
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 16 +
> =C2=A0drivers/gpu/drm/nouveau/nouveau_chan.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 22 +
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 29 +
> =C2=A0drivers/gpu/drm/nouveau/nouveau_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0drivers/gpu/drm/nouveau/nouveau_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +
> =C2=A0drivers/gpu/drm/nouveau/nouveau_hwmon.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 375 ++++++++++---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 87 +++
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 11 +
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sysfs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 311 ++++++++++
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sysfs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 10 +
> =C2=A0.../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |=C2=A0 26 +
> =C2=A0.../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c=C2=A0 |=C2=A0=C2=A0 1 =
+
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r570/Kbuild=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0.../nvkm/subdev/gsp/rm/r570/nvrm/rusd.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 303 ++++++++++
> =C2=A0.../drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c=C2=A0 |=C2=A0=C2=A0 1 =
+
> =C2=A0.../nouveau/nvkm/subdev/gsp/rm/r570/rusd.c=C2=A0=C2=A0=C2=A0 | 531
> ++++++++++++++++++
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 7 +
> =C2=A024 files changed, 1990 insertions(+), 81 deletions(-)
> =C2=A0create mode 100644 Documentation/ABI/testing/sysfs-driver-nouveau
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/nvkm/subdev/rusd.h
> =C2=A0create mode 100644 drivers/gpu/drm/nouveau/nouveau_sysfs.c
> =C2=A0create mode 100644 drivers/gpu/drm/nouveau/nouveau_sysfs.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/rusd.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rusd.c

