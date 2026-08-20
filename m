Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB09C5DF86
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 20:01:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3059710E5FF;
	Thu, 20 Aug 2026 20:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GefwR9/Q";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6230A47A76;
	Thu, 20 Aug 2026 19:45:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787255108;
 b=ynyDG94Ic5YgiK+NBbBNmJ0WrftY6pm5CCBiC0iNzzhBmprGMtoI+SKzxFN7BFeubvzGy
 kzo6f24jVk+P6nxgTfUhTA794y2O3FkBF7OPTZothQqhmk+uP82q9MttAVoh5aM+H4noAwe
 zEFsvoGKLxX3PDB/ni++r6r1pPn3JjNzcxc8G6dOZpgh7reVLEGxWOwj78byO4aK+j+3jgP
 ocPv0qeuZdUBLGu2x3X7cvNKgqMrVeypiyTaB0K2B4tE644a8ifWBw7xnh3eVsZcTjiARdq
 3boUOI+c6YS/ev0DmJqxiAwsLqI7gHHlEINHRW+G891W4qKpvH9ZCYUePpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787255108; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yJKPICihK9XYAlei4GXUvaTGSn4DbGwdgj148h871wM=;
 b=ZjGa5zGONVVD5snw1Rq3uQkWvTAumrKTzbmuFWGP9LMz61wEhNqSkj062GwOhrXPWqtFZ
 91YGbk9N5AU/AlnoH4Gl7ONsVgua+4uDOobcnyTpUjd6os4GI5+n7wB4x3RepXuU189grmR
 nLdSHHzJBZ/0naoV0YhMxednoBQN7ZD1TZMxDhOmUMdFmidRlpU7jivz/uHHAEg2L8pLCcO
 fKgp6hAPSYBK04GSLUggbotdVYa2vchD2tEXM0YGsrXRTOsTkZoEH5OTHUMPvd0RVpNyqLn
 U/m0RgDyRW9G1fYUfgOWu+Rxg265ZKxMnjWZpBbx+m+5OWMYkdfO16kqYJ3A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CEAD0473C8
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 19:45:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 480FD10E0A7
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 20:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787256101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJKPICihK9XYAlei4GXUvaTGSn4DbGwdgj148h871wM=;
	b=GefwR9/Q+Zu59T0Sk/pxSPSVYcJOuKLlkxNs1SRZtS8TaVafyV+AcfZlUXMk+GuPQOhA0e
	UOuMtepTyaMoODnKk6tz649Xu3S90NRsnQmFsFd7yBXE0NEQy8Ey2RgBHqttn/LVHFEZZq
	RQAqu9ussgUxXnMFesBxMVp36oLmi/U=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-neamIkyaMwKzyhOPvWWPrQ-1; Thu, 20 Aug 2026 16:01:34 -0400
X-MC-Unique: neamIkyaMwKzyhOPvWWPrQ-1
X-Mimecast-MFC-AGG-ID: neamIkyaMwKzyhOPvWWPrQ_1787256093
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-9087f2fe592so1866176d6.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 13:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787256093; x=1787860893;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yJKPICihK9XYAlei4GXUvaTGSn4DbGwdgj148h871wM=;
        b=mVdmH2B9KGmJDlDbOud19QvzyFPyiWrlqIKDKpoZ44OXLvic5tBgFG+8hZub8YEVwY
         rTAgezX64M03gV/cMCTx+7ns5uM7e1jkeXA42Ruw7wP5XyFEKWKyDjeU6YlI8AhJXWZ3
         5oKTEp5ZcD+0Jd8oc9xJuhpFdltUZv7PC2djZtxejXtwbMt9+6YngXIn4epNZFUKNgzG
         jZ1jAXzDSeXK5huvHPTg4Z9yq6nWjqg5+qPaikDR/SeyzybphVPSyloeHx/+zHmcqNWw
         i6TKBpL14eIJq616I1jXa5TL4/T9+ce4rpr6gOYnda2cGTHjqmQANvj7dBp1p/eSwx7D
         mRIA==
X-Forwarded-Encrypted: i=1;
 AHgh+RquDQ6rfKe/tJ9zvC1jT0A0lDfGfqzYV0G7UBRj0yKvzGLKCSNJBPPnxKFciPRpoMPYld06fXeQ@lists.freedesktop.org
X-Gm-Message-State: AFuF++mBhk1okRsgREYZ/RhXW3tX7BNylAhiGzA5ZGCw/zDNj8MReHZm
	yn/AGDm8sRMpXbXbVMEbZt9iGPKodYLKhnjYZSqIaiytQ3ov/40gJNsKJdiKiTpjBuLcgkEk8OP
	F4H9OcupABf7fktg8Qgoalem5jkMMwb0jSPTZeMp4mVTSbfGSf2DKk/7zaTg+HPrNZHg=
X-Gm-Gg: AR+sD10N52IrQ8InyW8/l9kqaSeXz7eAIhRUCPPCpZvbYSN+r9k6DvrTzrmjtGpvKcx
	sf1BSVUxwTyD3fHt3KKz+vqnAoqOuD8Mmx/VJspkZg5lpy57Scz0gm6W6lSiehSoLcNz2pzBXuz
	gNNSs4ZVOtphcUEPdTttZGcX0joSoEpX8MoqBtAxkw41K1J7bsy53+SfLsW4ldcW0TIhQ/fAGFq
	LvLxZA2TDYDku6bY1G1KHgATEugbNPP0ZKe3qnPAMA8WSpY2wFs433t+76AT/YZT6IRH9bEZj6q
	z2J+Ylo2mrYIG3sn76kG+xotPzIBLyI3bEHrI48lGles/EgeteVtp5e1iOUZOUSXjQl1/aJ6
X-Received: by 2002:a05:6214:4113:b0:90a:74d4:e4ac with SMTP id
 6a1803df08f44-90c80c5b401mr6881856d6.16.1787256092628;
        Thu, 20 Aug 2026 13:01:32 -0700 (PDT)
X-Received: by 2002:a05:6214:4113:b0:90a:74d4:e4ac with SMTP id
 6a1803df08f44-90c80c5b401mr6880856d6.16.1787256092024;
        Thu, 20 Aug 2026 13:01:32 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5f2a1139sm45835516d6.34.2026.08.20.13.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 13:01:30 -0700 (PDT)
Message-ID: <4ae8c1b945b83dfeafe4c89d59ec03c994242fd9.camel@redhat.com>
Subject: Re: [PATCH v3 2/4] drm/nouveau: subscribe to the channel-kill event
 after the fence context
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 16:01:29 -0400
In-Reply-To: <20260812231330.705425-3-mczernohous@gmail.com>
References: <20260812231330.705425-1-mczernohous@gmail.com>
	 <20260812231330.705425-3-mczernohous@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JMLWoweMSX6FCOiAoZhWw3Es89JKJIr1eX9sR_Ht-Bo_1787256093
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QIL5A5MJ5WZN7GW43AE5G2FIO635UA6Z
X-Message-ID-Hash: QIL5A5MJ5WZN7GW43AE5G2FIO635UA6Z
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QIL5A5MJ5WZN7GW43AE5G2FIO635UA6Z/>
Archived-At: 
 <https://lore.freedesktop.org/4ae8c1b945b83dfeafe4c89d59ec03c994242fd9.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 2026-08-13 at 01:13 +0200, Marek Czernohous wrote:
>=20
> Move the subscription behind context_new() so the handler cannot
> observe
> a half-built fence context. The failure path is unchanged in effect:
> the
> caller drops the channel with nouveau_channel_del() either way, which
> since the previous patch unsubscribes before freeing the context.
>=20
> One behavioural change worth naming, and it is not free: a kill
> delivered while the channel is still initialising is no longer
> observed,
> because the subscription is not armed yet. That window does not close
> here, it moves, and on Fermi and newer it grows by the span between
> the
> old subscription point and context_new(). What changes is what the
> window costs. Before, a kill landing in it reached a half-built fence
> context; now it is missed, and the channel is left blocked with
> chan->killed still 0, so nouveau_channel_idle() and the checks in
> nouveau_gem_ioctl_pushbuf() and nouveau_exec_ioctl_exec() keep
> treating
> it as alive. The missed-kill window is not introduced by this patch
> either:
> nvkm_uchan_init() already calls nvkm_chan_allow() and
> nvkm_chan_insert(),
> so the channel is schedulable before nouveau_channel_init()
> subscribes at
> all. Closing it properly means subscribing before the channel becomes
> schedulable, which is a bigger change than this fix.

I don't think this would be a big change, actually. If I understand
this code properly, we don't need to move around the channel event init
at all. Maybe:

 * Add another atomic to `nouveau_fence` to indicate if the fence is
   ready
 * Have `nouveau_channel_kill()` check this atomic after setting the
   killed bit, and only call `nouveau_fence_context_kill()` in the
   event the atomic is set.
 * Back in `nouveau_channel_init()`, after we initialize the rest of
   the channel (we still haven't set the atomic yet) grab the fence
   context lock to delay, but not block, any incoming kills.
 * Check the killed atomic to see if a kill event came in the window
   before the fence was ready.
 * Set the atomic indicating that the fence is ready.
 * Drop the lock.
 * If we found that the killed atomic had been set while holding the
   lock, call nouveau_fence_context_kill() manually (or queue up a call
   to it if that works better with a workqueue perhaps?).

Hopefully I didn't miss anything that would make my idea not make
sense. And consider trying to write the respin without using claude!
You will learn more, the work I've done is the only reason I was able
to think of a solution like that only a few minutes after reading the
code here.

Also - it might not need to be an atomic, I'd have to look a bit more
closely to know though.

>=20
> As with the previous patch this is unreachable below Fermi today, and
> the last patch in this series lowers the gate to NV50.
>=20
> Fixes: ea13e5abf807 ("drm/nouveau: signal pending fences when channel
> has been killed")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Marek Czernohous <marek@czernohous.de>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_chan.c | 55 +++++++++++++++--------=
-
> --
> =C2=A01 file changed, 33 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c
> b/drivers/gpu/drm/nouveau/nouveau_chan.c
> index f142f6310596..07b0bd1bc519 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -370,27 +370,6 @@ nouveau_channel_init(struct nouveau_channel
> *chan, u32 vram, u32 gart)
> =C2=A0 if (ret)
> =C2=A0 return ret;
> =C2=A0
> - if (chan->user.oclass >=3D FERMI_CHANNEL_GPFIFO) {
> - DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
> - sizeof(struct nvif_chan_event_v0));
> - struct nvif_chan_event_v0 *host =3D
> - (struct nvif_chan_event_v0 *)args->data;
> -
> - host->version =3D 0;
> - host->type =3D NVIF_CHAN_EVENT_V0_KILLED;
> -
> - ret =3D nvif_event_ctor(&chan->user, "abi16ChanKilled", chan->chid,
> - =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nouveau_channel_killed, false,
> - =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args, __struct_size(args), &chan->kill);
> - if (ret =3D=3D 0)
> - ret =3D nvif_event_allow(&chan->kill);
> - if (ret) {
> - NV_ERROR(drm, "Failed to request channel kill "
> - =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "notification: %d\n", ret);
> - return ret;
> - }
> - }
> -
> =C2=A0 /* allocate dma objects to cover all allowed vram, and gart */
> =C2=A0 if (device->info.family < NV_DEVICE_INFO_V0_FERMI) {
> =C2=A0 if (device->info.family >=3D NV_DEVICE_INFO_V0_TESLA) {
> @@ -494,7 +473,39 @@ nouveau_channel_init(struct nouveau_channel
> *chan, u32 vram, u32 gart)
> =C2=A0 }
> =C2=A0
> =C2=A0 /* initialise synchronisation */
> - return nouveau_fence(drm)->context_new(chan);
> + ret =3D nouveau_fence(drm)->context_new(chan);
> + if (ret)
> + return ret;
> +
> + /*
> + * Subscribe to the channel-kill event last.=C2=A0 The handler
> + * dereferences chan->fence, and the fence context is only complete
> + * once context_new() has returned: the backends assign chan->fence
> + * from kzalloc() before nouveau_fence_context_new() initialises the
> + * lock and the pending list, so an event arriving in between would
> + * find a non-NULL but unusable context and walk a NULL list head.
> + */
> + if (chan->user.oclass >=3D FERMI_CHANNEL_GPFIFO) {
> + DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
> + sizeof(struct nvif_chan_event_v0));
> + struct nvif_chan_event_v0 *host =3D
> + (struct nvif_chan_event_v0 *)args->data;
> +
> + host->version =3D 0;
> + host->type =3D NVIF_CHAN_EVENT_V0_KILLED;
> +
> + ret =3D nvif_event_ctor(&chan->user, "abi16ChanKilled", chan->chid,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nouveau_channel_killed, false,
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args, __struct_size(args), &chan->kill);
> + if (ret =3D=3D 0)
> + ret =3D nvif_event_allow(&chan->kill);
> + if (ret) {
> + NV_ERROR(drm, "Failed to request channel kill notification: %d\n",
> ret);
> + return ret;
> + }
> + }
> +
> + return 0;
> =C2=A0}
> =C2=A0
> =C2=A0int

