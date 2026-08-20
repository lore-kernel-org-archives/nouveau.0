Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACA1C5DF81
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 17:55:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EB0F610E5FB;
	Thu, 20 Aug 2026 17:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UhRHN483";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 54E4447A3D;
	Thu, 20 Aug 2026 17:39:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787247548;
 b=FzCNql5N8W0khlYQEVtPoZvDRbuBHBO/dcgqK/Yds2/EC1cUgvEAfTydX6v8TGzowmMRC
 JlWhhfRGdVkJhDCdwa8Lw43i6mZVpz/9Q4Bh4JfaCU4vYYRcqAsJe/pbacrzscazBDQhMUa
 hdWK8BKnkGmc+mTd+5ebtcjqbua7rn8SSPYEKNs3+uzJLJFVvlcMK7PW3dUfIfl+xocrx8o
 LKQ6/bIAmWXWs+kFOqVLeG8p6jKaH11gjT+sVzxhVLFHPXIshaz0pVrTSK0njm4x/2GjEQ4
 azP0+DGvBBK3hS2ZEl5h0pFIABmNNF3BW9xPUGdo30Xpbb2plKYSwkSKHv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787247548; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WXmR5qR3jtx7kOIrq38SuTT1/+e+DpvoYM+cnNboWbk=;
 b=Gs3dD5gKTzFjJEMT8iCL9KlLNekC/907asLLw0o1L6t/m+sqfDKgib051Hg5ucMBELpnp
 Jfsqu9j9ZdF/u4JZ6yTLZu8dmpbYvHqzoIjNsXytd1T/2JWF+1QNTHDxR2RybNkx3FteCrz
 xGh17js8pj0n3PDDlNurjf/+THqjB6D6kQgdkdF7FXjDd8ky4oizINh1P6mEMVr8SbMnm0c
 8Y8/M0BJosDcwNbB2Hb+rMZXVboqtfHEDDVjk1XaCf0lgecyTrYhzLpyhPSHntYyto6KQWY
 Ygbe6/e9wUxueerv75EPmOVQyGv2Oi3tG9nYIcfaRlgqYLhFGfJ/C7y62bSg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 97CB847A37
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 17:39:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D6DDE10E1EE
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 17:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787248540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXmR5qR3jtx7kOIrq38SuTT1/+e+DpvoYM+cnNboWbk=;
	b=UhRHN4831gbAShENs6L7PKqC/uMQzGrvv3vbCfmmQVdEMoIRSRctPFrYkMS4gO1+ZM0EiM
	bxp5S/yBTxBLnxbJRpReSMbiNsnCRAroPvU55cwsKAYmdX1MCrEyryfOf2w0lVT8crxV+W
	3CRtwJObHS7jUA4DNDjhCoAtjLMmXiw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-5r2MF_kpNSOZW1tYyC4kOQ-1; Thu, 20 Aug 2026 13:55:38 -0400
X-MC-Unique: 5r2MF_kpNSOZW1tYyC4kOQ-1
X-Mimecast-MFC-AGG-ID: 5r2MF_kpNSOZW1tYyC4kOQ_1787248538
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52ce3c7cb2eso1053191cf.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 10:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787248538; x=1787853338;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTFvT4h0Q0q3RfixbzGb3rOg5NcbDH7/Ar2/bb9HET4=;
        b=koIsNQqpC3MeDUx5fQ6G9YWTboVVoOlQUil3lt0pAN1UJAZB0rCdD8o+2lD6E+rmLM
         bnecJ95AnGiKGY8dYT76KwjiuDc/Ff4a45u60pjmRKmamvd0cdVcnQVv2H3OHkr6bz1s
         9i4OhNFT43R37/YqcZGmmQH1Br6KJt5DP2yg096JkKarjKT/+PbOehaFtNexBYdgPYu1
         cevYH2dF75aZX3C7it2cj/muTlKM7nMaY0OKiPUqa87rX6MTz5VD3EAZiEMVDIBGxk7a
         3rJJkvU52FDQDFagISiGXivhmVtxrdbrjb3sQMAJNYnnfcr89/QyXH78wiH6BQuCL5nI
         MkSQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq1XG4r9PKWaoY8lmJEEOA+iwzazFln7r74Z/8bGtrMtUFSK7ClTT8t5iXqsjvpqbXYZRa29BaK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykJuvT0nuuaAlff3zq6cfi+M4naBfoTyGoraP5SYe6KGCSM7/A
	JZTdX8yYZskwf9qCP0j4Gung6+M/Eqm5x5qirJ6q/lLAbYCFqvxewv24A5+b2TujFJ3AnJiYfsF
	mbDt8EGH+uDRmhoe+fy15IXjJOoEs0S1nQYUbKM/YUCWJyTDjfN+XO7FZlFXfqBHUlXA=
X-Gm-Gg: AR+sD10/LwxGUq0W20CgNFgyPHr+kiHmwExRPGUbUM3xlWvNIsYTC0AXEas9eesyh+a
	dFlIE0HbWmYJ2PqGcrsE/vRRZZvrMa25BEseGcaC5/CVEyUVA8FKb8nxQoADeJ20GHeekizLVPa
	dx/m2/cGr2Se3Nf6BZTKG94sHMET/s5jEOhYgOnnkrfcGlOtAarQDJGJ43R+e0L9bY3aS/0rM2P
	fHadmIrwACVg9wgsRETiAiYdsVo2UvoetM7eEnnzL2gpRWflEKz0VwO1y2jgKpjmPYl5BYV1NSK
	3XWfUuT4Tr5S/W5WIxHukhhbxP4LPHcYpJZS3M3Zy7dJhL6ZhXpWJL2y50sf5v/79ic4LTYB
X-Received: by 2002:a05:622a:5591:b0:516:ed02:c85d with SMTP id
 d75a77b69052e-52df5637a7dmr1713151cf.3.1787248537877;
        Thu, 20 Aug 2026 10:55:37 -0700 (PDT)
X-Received: by 2002:a05:622a:5591:b0:516:ed02:c85d with SMTP id
 d75a77b69052e-52df5637a7dmr1712551cf.3.1787248537384;
        Thu, 20 Aug 2026 10:55:37 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5f29065bsm43058966d6.24.2026.08.20.10.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:55:36 -0700 (PDT)
Message-ID: <89da2f2c2cd6223e6973b1adb8aebd7a9cd9bce8.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: disable the fence uevent work instead
 of just cancelling it
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 13:55:35 -0400
In-Reply-To: <178688513268.513871.3468844663561639695@gmail.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
	 <178682366002.3748010.12779628082366287968@gmail.com>
	 <178688513268.513871.3468844663561639695@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y50IMOIU-__al8cPxO_JkVjkpd-_wPcauPvuwRkMkgs_1787248538
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 4KV4SICP2ZRUYVUDQE2MZCOUI4XHCENN
X-Message-ID-Hash: 4KV4SICP2ZRUYVUDQE2MZCOUI4XHCENN
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4KV4SICP2ZRUYVUDQE2MZCOUI4XHCENN/>
Archived-At: 
 <https://lore.freedesktop.org/89da2f2c2cd6223e6973b1adb8aebd7a9cd9bce8.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This makes sense to me.

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next-fixes in just a moment

On Sun, 2026-08-16 at 14:58 +0200, Marek Czernohous wrote:
> From: Marek Czernohous <marek@czernohous.de>
>=20
> nouveau_fence_context_del() drains the uevent work while the event
> that
> feeds it is still armed:
>=20
> =09cancel_work_sync(&fctx->uevent_work);
> =09nouveau_fence_context_kill(fctx, 0);
> =09nvif_event_dtor(&fctx->event);
>=20
> nouveau_fence_wait_uevent_handler() queues the work unconditionally:
>=20
> =09schedule_work(&fctx->uevent_work);
> =09return NVIF_EVENT_KEEP;
>=20
> so a non-stall interrupt arriving after cancel_work_sync() has
> returned
> re-arms the work that was just drained.=C2=A0 The window closes in two
> steps,
> neither of which is the drain.=C2=A0 The kill blocks the event when the
> last
> fence holding a notify_ref is signalled, which reaches
> atomic_xchg(&ntfy->allowed, 0) (nvkm/core/event.c:104), and
> nvkm_event_ntfy() skips a ntfy that is not allowed (:183).=C2=A0 That
> stops
> further handlers from starting, but not one that is already inside
> nvkm_event_ntfy(): the event is created with wait =3D false
> (nouveau_fence.c:201), so nvkm_event_ntfy_block_() leaves it on the
> list
> and never takes event->list_lock.=C2=A0 Only nvif_event_dtor() waits that
> one
> out: nvkm_event_ntfy_del() (:141) goes through
> nvkm_event_ntfy_remove(),
> which takes write_lock_irq() on that same list_lock (:84).
>=20
> Either way the re-arm happens after the drain, and the caller drops
> its
> reference immediately afterwards, for example
> nv84_fence_context_del():
>=20
> =09nouveau_fence_context_del(&fctx->base);
> =09chan->fence =3D NULL;
> =09nouveau_fence_context_free(&fctx->base);
>=20
> That is a kref_put() on fctx->fence_ref, so the context outlives the
> teardown only while emitted fences still hold a reference of their
> own.
> That is no safety net: whenever none do, the count reaches zero right
> there and nouveau_fence_context_put() kfree()s fctx while the work is
> still queued.=C2=A0 &fctx->uevent_work is embedded in that allocation, so
> the
> workqueue already dereferences freed memory when it picks the item
> up,
> and nouveau_fence_uevent_work() can then take fctx->lock on it.=C2=A0 Wit=
h
> CONFIG_DEBUG_OBJECTS_WORK and CONFIG_DEBUG_OBJECTS_FREE, kfree() of a
> still-queued work item is reported as the free of an active object.
>=20
> On live memory the re-armed work has nothing left to do:
> nouveau_fence_context_kill() empties fctx->pending and sets fctx-
> >killed
> under fctx->lock, nouveau_fence_emit() then returns -ENODEV rather
> than
> queueing anything new, and nouveau_fence_update() only reaches
> nvif_event_block() if it signalled something off that list.=C2=A0 The
> defect
> is the access to freed memory, not what the work would have found.
>=20
> Only chips from G84 on can reach this at all:
> nouveau_fence_context_new()
> returns before nvif_event_ctor() when priv->uevent is clear, and
> nv84_fence_create() is the only place that sets it.
> nv84_fence_context_del() is the context_del for all of those, because
> nvc0_fence_create() and gv100_fence_create() build on
> nv84_fence_create()
> and override only context_new.
>=20
> Use disable_work_sync() instead.=C2=A0 It drains the work exactly like
> cancel_work_sync() does, and additionally increments the work item's
> disable count, after which "any attempt to queue @work will fail and
> return %false" (kernel/workqueue.c, disable_work()).=C2=A0 The handler's
> schedule_work() then has nothing to re-arm, and the teardown order
> stays
> as it is.
>=20
> Draining a second time after nvif_event_dtor() would close the window
> as
> well, and without the newer API: once nvkm_event_ntfy_remove() has
> returned, no handler can start or still be running, so nothing re-
> arms
> the work past that point.=C2=A0 disable_work_sync() is preferred here
> because
> it needs one synchronisation point instead of two, it keeps the work
> from being queued at all rather than cleaning up after it, and it is
> what drm has settled on for this (drm/xe, drm/panthor, drm_pagemap).
> Blocking the event rather than the work is not an option: fctx->event
> is
> created with wait =3D false, so a handler already inside
> nvkm_event_ntfy()
> can still queue the work.
>=20
> Note for backports: disable_work_sync() arrived in v6.10 with
> commit 86898fa6b8cd ("workqueue: Implement disable/enable for
> (delayed)
> work items"), while the fix being corrected here reached 6.6.18 and
> 6.7.6.=C2=A0 linux-6.6.y therefore carries this bug without the API, and
> this
> patch would apply there and then fail to build.=C2=A0 A 6.6.y backport
> wants
> the second drain described above instead, as its own patch.
>=20
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes:
> https://lore.kernel.org/nouveau/20260812231330.705425-1-mczernohous@gmail=
.com/
> Fixes: 39126abc5e20 ("nouveau: offload fence uevents work to
> workqueue")
> Cc: <stable@vger.kernel.org> # 6.10.x
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Marek Czernohous <marek@czernohous.de>
> ---
>=20
> Changes in v2:
> =C2=A0- Do not reorder the teardown.=C2=A0 v1 moved nvif_event_dtor() ahe=
ad of
> =C2=A0=C2=A0 nouveau_fence_context_kill(); with the fences still unsignal=
led
> that
> =C2=A0=C2=A0 leaves nouveau_fence_enable_signaling() reachable, and
> =C2=A0=C2=A0 nvif_event_constructed() is a plain unlocked read of object-
> >client,
> =C2=A0=C2=A0 so the dtor could race an nvif_event_allow() already past th=
at
> check.
> =C2=A0=C2=A0 Reported as [Critical] by the bot, and withdrawn:
> =C2=A0=C2=A0
> https://lore.kernel.org/all/20260815200914.8A1131F000E9@smtp.kernel.org/
> =C2=A0- Change cancel_work_sync() to disable_work_sync() instead, which
> leaves
> =C2=A0=C2=A0 every ordering alone.
> =C2=A0- Pin the damage down.=C2=A0 Both versions call it a use-after-free=
; this
> one
> =C2=A0=C2=A0 adds that &fctx->uevent_work is embedded in the freed alloca=
tion,
> and
> =C2=A0=C2=A0 that the re-armed work has nothing left to do on a live cont=
ext,
> so
> =C2=A0=C2=A0 the access to freed memory is the whole of it.
> =C2=A0- Correct the backport note.=C2=A0 v1 claimed no longterm tree sat =
in the
> gap
> =C2=A0=C2=A0 between the bug and disable_work_sync(); 6.6.y does.=C2=A0 T=
he stable
> tag is
> =C2=A0=C2=A0 annotated accordingly.
>=20
> This replaces 1/3 of
> https://lore.kernel.org/all/178682366002.3748010.12779628082366287968@gma=
il.com/
> 2/3 and 3/3 of that series are unaffected and still stand.
>=20
> =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index edbe9e08ba0f..11e95c37ce50 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -96,7 +96,7 @@ nouveau_fence_context_kill(struct
> nouveau_fence_chan *fctx, int error)
> =C2=A0void
> =C2=A0nouveau_fence_context_del(struct nouveau_fence_chan *fctx)
> =C2=A0{
> -=09cancel_work_sync(&fctx->uevent_work);
> +=09disable_work_sync(&fctx->uevent_work);
> =C2=A0=09nouveau_fence_context_kill(fctx, 0);
> =C2=A0=09nvif_event_dtor(&fctx->event);
> =C2=A0=09fctx->dead =3D 1;
>=20
> base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86

