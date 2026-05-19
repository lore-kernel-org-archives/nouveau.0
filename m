Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E86CD4F5B
	for <nouveau@archiver.kernel.org>; Tue, 19 May 2026 22:02:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB3010EE7C;
	Tue, 19 May 2026 22:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LoKQxxnL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 95CBD46050;
	Tue, 19 May 2026 21:48:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779227329;
 b=la1BAiA5Q7a68L2RoaTaVzKsN23nycnvHOu7jcraBs9L+fxzy2ERRadJ2/VV/KyxgJIge
 nwCfCDjE9D33l5YdXVEqs1ZQZhKAHMrEKR0P7zpZWQaOza5MfNMe03/h5oLLZuIMn4PzxOU
 rhj5IoHV13mrFuuTXnB8LU9gNfmhhG1GoIiyvWcds/QfHmn4ao+fx9htpdBcPJAlnzB4PaP
 ZA/Ci+dUXlFFAup7E6kowBHKSb3aMZpKJT8RqCDuUZqgi3VPr8xmBmIFP4kpdjcntxwsFzC
 zk6zEBC4oTyajdnCtbLtVEMlchHJea4hJGjsLYLvxNTTlM/9rOrLVVqKUadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779227329; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yX/FeS6p1ggTWK2cFLIbTmgp46Xg7x9+qqW6hrD7F0s=;
 b=RG7EkRlbrHF1rz54gY6xiVHdOGnQFB1TXu1Jw9PQFC0D+jHXxpBsFWge09FErunr6tl7d
 Hup6x/p1xNykL+GjUxzF73jQesQlVyzXLFc/N6gqTZ5It/Zc2J094Mdc4P3kqfnkhkujPzd
 cnOjNZA48c3/Y47ACAyn/RYUF7DnASS+m6zlG8VK4VVQca/vdGSaT5/vXtyYLao0zm4y6q7
 mFPUOZFohctFtcF00n2n7DOptpNLgFc58kvPjW1IYbt/4pI3917a4jaWRfgLil/Lx8i9L9j
 c8SghkeE9vZ0Pr2NCFMM4v8SczJcViaLOk48dFF6BxAzSM+dplkGTEJMUI9g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 48FE346039
	for <nouveau@lists.freedesktop.org>; Tue, 19 May 2026 21:48:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 849DE10E3F4
	for <nouveau@lists.freedesktop.org>; Tue, 19 May 2026 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779228115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yX/FeS6p1ggTWK2cFLIbTmgp46Xg7x9+qqW6hrD7F0s=;
	b=LoKQxxnL4QBrGm0TrYR2FhG5HhbuY9LnkE3wzJsFFw8YFXcBoym4BfgIA9YQDaNviBCPgt
	boiRbsJSTuD+kCmdIR1wVuCwZ4wyLxOO8NCR/zAnqqrfef2mp3bH8lOWVBZZ2yZ5dMXMJn
	5HbL1jjjs7p1pzuOowsbKo0Z/trC+AQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-exUjqIZWN8mqPwa62vrsfA-1; Tue, 19 May 2026 18:01:54 -0400
X-MC-Unique: exUjqIZWN8mqPwa62vrsfA-1
X-Mimecast-MFC-AGG-ID: exUjqIZWN8mqPwa62vrsfA_1779228113
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-90f4e81b8e2so1054284085a.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 19 May 2026 15:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779228113; x=1779832913;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yX/FeS6p1ggTWK2cFLIbTmgp46Xg7x9+qqW6hrD7F0s=;
        b=OumTv9qsmYphUAjBd5LNr9VVD8SLQe3lpaH3ENA0mpcyHmoKLlqYjegHYqYmCZMkRQ
         GhMdahwG8QR73ZW5yQrjI2vT37v6HYjsWD4Z83aaU5k6zYMn5mxBsN5LWzZJS7A7kxnW
         +sF7sylCrp18y0fYBZafpg6jS7bmNOG1Xw5eRWBx4g2Yyn24JMauxjzhvhxQGgEtXp50
         jP25AMla9gBCudIGBoQYLTalIfB87WUbHwtLuMx/P/ey2j3Gd3mZN0r5LOd/EC3HFAED
         bXG7uXpKOoj4JscifZpiDMhn/e5KbX7uGGiX9htJtrqce5JoXWPX51GB+6sIOJ2SbM2Q
         traA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8SqBp0VP+prhGZn37W4fMn4Wn4sWnC/4xcHxk/QGLK+P+kzjNe6o1FP3F6IzKARnwQPNpKUcb+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx/UYZNFi43kFmi4Tc+qCvniIgXwzz5QKHOowdEkDq5f/sUg+/
	gigy9dNBXiyETaIINdpfKXJASj0E2FfgraV3n8kjBDflY1mdlkAQ4nAPVU4LQUc5AUl6tDoQe71
	JKBLysL+n/N2oYNaq8Nvqf/t0scQW6SVk6PHBC5IIbfNnAhJ7k1f34jJN2Ntm1MMXD6kb/7uZao
	k=
X-Gm-Gg: Acq92OGDf6H6nlO7L4ketKS3sA+zjNKNFi/wGh5y2tl84hy0B/JCVnHxmVJfuwpEh43
	CkBqYPR6CuFALwRpFYyaN1kPrMQUuB5tgcrser/KC1hnlZ5k76NK8dbDFQuWqb9I4dfdG392YBW
	ZOkilfpXeZrfjCezWdkx6GHAsKAr/82MHe1yfjaxaL+64/ktdb+LxtHza67MEfGK69bxuc6MJFY
	hxFNStueBOUlf0FW7QiuSsFhcQqyk50yANuNWfeAJElEgPbMN0xbGVnr3ZOqaWNAytYYMBPx4cR
	JP6ZPHvXLpqrQ6216Ys7kYWAnmhC1YkG4x2SohBVSc2Aqi1xQ8/kPlyx1rZ8l/Ix4qyaXtNzVEp
	GnWmPD+loT+iCy1QQ/g==
X-Received: by 2002:a05:620a:170c:b0:910:5637:4bec with SMTP id
 af79cd13be357-911cd1752admr3279951285a.18.1779228108218;
        Tue, 19 May 2026 15:01:48 -0700 (PDT)
X-Received: by 2002:a05:620a:170c:b0:910:5637:4bec with SMTP id
 af79cd13be357-911cd1752admr3279853985a.18.1779228095704;
        Tue, 19 May 2026 15:01:35 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-910ba36d137sm1948054085a.1.2026.05.19.15.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:01:34 -0700 (PDT)
Message-ID: <4037b4a4c1768f5f28c7ae1c5dfb2913e675d6ab.camel@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau: nv04 FIFO cleanup + recovery for Tesla
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org
Date: Tue, 19 May 2026 18:01:34 -0400
In-Reply-To: <20260513175014.96599-1-marek@czernohous.de>
References: <20260513175014.96599-1-marek@czernohous.de>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i-pUincQi9hNkNUNhT1dGnOb2u9-fC-FYDHMZpglNA0_1779228113
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VAJAROOVXTM4DNJHNPHZIIEGQYXWDGYK
X-Message-ID-Hash: VAJAROOVXTM4DNJHNPHZIIEGQYXWDGYK
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VAJAROOVXTM4DNJHNPHZIIEGQYXWDGYK/>
Archived-At: 
 <https://lore.freedesktop.org/4037b4a4c1768f5f28c7ae1c5dfb2913e675d6ab.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hey! I truly apologize for asking, and thank you tremendously in
advance if the answer is no. But I had to check since I haven't seen
you around before, and these are unusually long commit messages:

These patches were written by a person correct? If not, you need to
follow the coding assistants guidelines here:

https://docs.kernel.org/process/coding-assistants.html

On Wed, 2026-05-13 at 19:50 +0200, Marek Czernohous wrote:
> Hi all,
>=20
> Two-patch series for the legacy nv04_fifo path covering Tesla
> (MCP77/MCP79 and G80-GT218). Daily-driven on the reference NVAC
> hardware (Apple Mac mini Late 2009, GeForce 9400M) since 2026-05-05.
>=20
> Patch 1 demotes a benign CACHE_ERROR that fires once per Mesa session
> start on Tesla GPUs. The Mesa NV50 userspace driver issues a method-
> 0x0060 / data-0xbeef02xx binding probe that recovers cleanly via
> nv04_fifo_swmthd(), but currently logs at error level on every X or
> Wayland session, dominating dmesg noise on this hardware class. This
> clears the channel for patch 2 to identify real faults from noise.
>=20
> Patch 2 adds a two-tier fault-recovery path for Tesla FIFO faults:
>=20
> =C2=A0 Tier 1 (per fault). Look up the channel via nvkm_chan_get_chid,
> =C2=A0 call nvkm_chan_error(chan, true), fire tracepoint
> =C2=A0 nouveau:fifo_chan_killed. Idempotent through the existing
> =C2=A0 chan->errored short-circuit.
>=20
> =C2=A0 Tier 2 (sliding window). When the per-fifo fault count in a
> =C2=A0 configurable window reaches the threshold, schedule a worker that
> =C2=A0 calls drm_dev_wedged_event(drm, DRM_WEDGE_RECOVERY_REBIND, NULL)
> =C2=A0 and fires tracepoint nouveau:fifo_dev_wedged. Worker context is
> =C2=A0 needed because kobject_uevent_env may sleep.
>=20
> Motivation: Fermi+ gets channel-kill and device-wedge automatically
> through nvkm_runl_rc; Tesla was feature-frozen before the DRM wedge
> uAPI existed. Three observable consequences on the reference
> hardware:
>=20
> =C2=A0 1. Silent state corruption (channel produces wrong output after a
> =C2=A0=C2=A0=C2=A0=C2=A0 fault, no notice to userspace).
> =C2=A0 2. Observability gap (no counters, tracepoints, or wedge event,
> =C2=A0=C2=A0=C2=A0=C2=A0 only dmesg).
> =C2=A0 3. Repeated-fault loop (the log-and-reset cycle repeats forever on
> =C2=A0=C2=A0=C2=A0=C2=A0 a persistently faulting channel instead of killi=
ng it).
>=20
> Validation. A debugfs fault-injector (kept on a separate
> DO-NOT-MERGE branch, not part of this submission) was used to drive
> both Tier-1 and Tier-2 paths through their full state space. Phases
> 1-5 of the test plan were exercised that way. Phase 6 (no manual
> injection, real workload soak) ran 2026-05-05 through 2026-05-13:
> one organic DRM_WEDGE_RECOVERY_REBIND event was captured on
> 2026-05-05 09:08; the rest of the soak was fault-free.
>=20
> Companion userland tool nouveau-pstate-daemon v0.2.0 [1] subscribes
> to the WEDGED=3Drebind uevent in log-only mode and was used to confirm
> end-to-end propagation through udev.
>=20
> Module parameters:
>=20
> =C2=A0 nouveau.fifo_wedge_count=C2=A0=C2=A0=C2=A0=C2=A0 (uint, 0..32, def=
ault 10)
> =C2=A0 nouveau.fifo_wedge_window_ms (uint, 100..600000, default 60000)
>=20
> Setting fifo_wedge_count=3D0 disables Tier-2 entirely while keeping
> Tier-1 channel-kill active.
>=20
> A note on MAINTAINERS. The series adds a new file
> drivers/gpu/drm/nouveau/nvkm/engine/fifo/recover.c. The change is
> covered by the existing nouveau MAINTAINERS section
> (drivers/gpu/drm/nouveau/), so no MAINTAINERS update is included.
> checkpatch.pl flags this as a hint; it is not load-bearing.
>=20
> This is a follow-up to the April 9 NVAC stability series [2], which
> is still awaiting review. The two patches here are independent of
> that series and apply against current Linus master.
>=20
> [1] https://github.com/hibbes/nouveau-pstate-daemon=C2=A0(v0.2.0)
> [2]
> https://lore.kernel.org/dri-devel/20260409-nouveau-nvac-stability-series
>=20
> Marek Czernohous (2):
> =C2=A0 drm/nouveau/fifo/nv04: filter benign CACHE_ERROR from Mesa NV50
> bind
> =C2=A0=C2=A0=C2=A0 probe
> =C2=A0 drm/nouveau/fifo: add recovery path for Tesla
> cache_error/dma_pusher
>=20
> =C2=A0.../drm/nouveau/include/nvkm/engine/fifo.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 12 ++
> =C2=A0.../include/trace/events/nouveau_fifo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 58 +++++++++
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 29 +++++
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/fifo/Kbuild=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/fifo/base.c=C2=A0=C2=A0 |=C2=A0=C2=
=A0 3 +
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/fifo/nv04.c=C2=A0=C2=A0 |=C2=A0 29 =
++++-
> =C2=A0.../gpu/drm/nouveau/nvkm/engine/fifo/priv.h=C2=A0=C2=A0 |=C2=A0 10 =
++
> =C2=A0.../drm/nouveau/nvkm/engine/fifo/recover.c=C2=A0=C2=A0=C2=A0 | 121
> ++++++++++++++++++
> =C2=A08 files changed, 257 insertions(+), 6 deletions(-)
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/include/trace/events/nouveau_fifo.h
> =C2=A0create mode 100644
> drivers/gpu/drm/nouveau/nvkm/engine/fifo/recover.c
>=20
>=20
> base-commit: 1f63dd8ca0dc05a8272bb8155f643c691d29bb11

