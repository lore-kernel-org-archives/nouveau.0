Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8023C5DF82
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 18:09:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8276C10E6CB;
	Thu, 20 Aug 2026 18:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VIVpwNtN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D9AEA47A44;
	Thu, 20 Aug 2026 17:52:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787248358;
 b=cwvwFNCThTScRnBeBm/uJis6kUE8Tb7Ce6PwbNPlau9csRsQvARwsNREkXpROfS/xxV4T
 Ju2IqudokEbrBxKHSsIRuoAbwq1F+NKBkY6BsYydHXAibd64zb9N59dPV4L1/mK96zSLuZ0
 nubJAME1ovlOjeM7TjSc+/YOw7of/7D4lX07BZA+aAkT002ju/InVDfkTiYGg9M/WpLZRE6
 wuZUeohizdTOsZaEEX/IjCQAQ7rAcVXw452y/aahfZJ6BYEIZsy5twzIxiz6Xn4ZvTBWYVa
 iY4lPELs0+EuV/CLVOFR/fAMy5eCCRtPEkHsv+Lny1w2UunfRBoTQMhkUROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787248358; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EoMFrNCvIUQTPHB6hl+xAbTPs0P/K3u8eYdPPO0M/fM=;
 b=fp4HyWNZVk9i6jWyZzCg+gTwAkC3wgxjybosmsyLh7bTkG0BODYafRxuOUl2evoYuYL+8
 otf+vab8KBdkHtwILH/b1XxzrsSIMaHfppVynBwbEuH5m2NvHHxnhylIwub6kIotVohLLKP
 SVtRRel8prE0m9YZKczuwKDJbim37kreRKd/AHvxSltdSG6yU5EclRagnX6LID0h7rU1Anf
 MkfIAdxVOPH7dUPuHsa+vjPnKusoXM/DFUKwV+674uZ5rq6KVZWAy5MIFg4kq7/7N14U75m
 oJfU+hxhO9sprKXDWZjFh5T5HWfPbEkOEBGy3ltGv4x1tLIbls1tiOGwjZZQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C302347A36
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 17:52:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1525610E234
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 18:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787249350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EoMFrNCvIUQTPHB6hl+xAbTPs0P/K3u8eYdPPO0M/fM=;
	b=VIVpwNtNQWVIqfsM8H5uNhLhNFe3+99tTd7K5D1FBkPzVL4wCfl7iuyws9i2VYMSfA0ssI
	MVvhkMfC5/RWJFhjBQajT2YxgiqFVoNm/BYP2qTp+j53cX6HB0JTMipx3eDhykuYF8ZLMu
	imwqzbGZVby3znk+PA8Fm3sMX32KMUk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-qvp6dxvtOKSz4IsDZQCOtA-1; Thu, 20 Aug 2026 14:09:02 -0400
X-MC-Unique: qvp6dxvtOKSz4IsDZQCOtA-1
X-Mimecast-MFC-AGG-ID: qvp6dxvtOKSz4IsDZQCOtA_1787249342
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8ea75996387so2934136d6.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 11:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787249342; x=1787854142;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/D29wRD0UC/Hr8ZPGocWQ9UTN+csrkFSPeqNFH7Hdo4=;
        b=MgDD3TSy4El2hVl6akRTOn6CKaHgdf0mZMCL2UGHDdt5HK6ZLT+QN4ZkOK68ceOy0j
         h8Yxgr8M7p/lhI/kuNlu4UPld4EOzYWlxEWLa7B3TQxzyddoA85oG8mmnpg19ot7d4Hf
         FWAW9oQDXO4zB9MgqM01uHgZ5hj3gBdVbYvo7CGjs0rtWjQRvazrTvJmNYvDbz6FQZl7
         ZBy6dQTMknZswuOIymcIh0izIHEiK7QOSyMC76knt/5kLBlodi6zx9WyUb1ZwInD5BRc
         8MqLxTqI5NzomfSswoNi2Hsi0YNZlFj9Mh7iSokwEVzWU7Kq89UQr8PkOtpTrBbrg8U2
         hNwQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqCxVLndp+nFMiALz5qGU1Cud1T58K6ofE7XDIvocLyFc9zH6HNKgPJBZNdq8LQ3AM+cpnTxzWb@lists.freedesktop.org
X-Gm-Message-State: AFuF++k7dXNbzUOT2M75AEoXaKiPSsEz6Sk+2pU+L26ZMIFAF+9UIuGw
	l9yQbeH2wNmh2cG7fTitP03AIaeW2pp0RhqYH/bKifduWRJQ5C3DLOL9bvIVqYTIB/Kz52w1tb4
	66+I6X9X6RJ2KuZFi1jHgVdMETr0fPnOSajfzvm8aVueRUt8byg2hJ+QXvdfeAbBFEVA=
X-Gm-Gg: AR+sD13q7YW7uT+5ZtfGe6eYLzTBIDBtAkkp+xyGuV6yzF5oOS/zgduvzOcnODAT018
	WEniDM4CqVnOmCi3cp6w1mLqJ/Tilwok4/hnbCQClnLqNdl941oOkobIStO89WS67Wue4oWh0sn
	bzeeYW2XCtAqmxcbp2sRktV1vagttHeRNORFXcmrv12H0ucSqkxZ2EPo0cxoX/nObZstL34qmrd
	xsnf3dNmiqUmavXVI8T9zhINzNicQTPYM/lqsc9a1EXqxqQhxlw0qK6e1ZXacjcV4eKOikNs2fO
	8f1ghdWQmB6wi2Y5tnIRTTP4Mx9tTl/rR3PYtNmyEBAROECRosIVuvhbOq30OVfafWJX2Koh
X-Received: by 2002:a05:6214:acf:b0:8ff:650d:2b99 with SMTP id
 6a1803df08f44-90c807cac10mr1315086d6.0.1787249339805;
        Thu, 20 Aug 2026 11:08:59 -0700 (PDT)
X-Received: by 2002:a05:6214:acf:b0:8ff:650d:2b99 with SMTP id
 6a1803df08f44-90c807cac10mr1312606d6.0.1787249337745;
        Thu, 20 Aug 2026 11:08:57 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5edb4fa2sm43884006d6.10.2026.08.20.11.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:08:56 -0700 (PDT)
Message-ID: <7c5419077ac6b087386dcd7f28b26003237a13d8.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: disable the fence uevent work instead
 of just cancelling it
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 14:08:55 -0400
In-Reply-To: <89da2f2c2cd6223e6973b1adb8aebd7a9cd9bce8.camel@redhat.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
		 <178682366002.3748010.12779628082366287968@gmail.com>
		 <178688513268.513871.3468844663561639695@gmail.com>
	 <89da2f2c2cd6223e6973b1adb8aebd7a9cd9bce8.camel@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yRbNUAtWOfR8e_Blro_NjjSPu5EvKugQSsrwGRxjsLk_1787249342
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TZISVPP64EY72PAPVACIJW7LO6N62EV3
X-Message-ID-Hash: TZISVPP64EY72PAPVACIJW7LO6N62EV3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TZISVPP64EY72PAPVACIJW7LO6N62EV3/>
Archived-At: 
 <https://lore.freedesktop.org/7c5419077ac6b087386dcd7f28b26003237a13d8.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(I misspoke, this patch ended up in drm-misc-next instead as fixes is
currently closed)

On Thu, 2026-08-20 at 13:55 -0400, lyude@redhat.com wrote:
> This makes sense to me.
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> Will push to drm-misc-next-fixes in just a moment
>=20
> On Sun, 2026-08-16 at 14:58 +0200, Marek Czernohous wrote:
> > From: Marek Czernohous <marek@czernohous.de>
> >=20
> > nouveau_fence_context_del() drains the uevent work while the event
> > that
> > feeds it is still armed:
> >=20
> > =09cancel_work_sync(&fctx->uevent_work);
> > =09nouveau_fence_context_kill(fctx, 0);
> > =09nvif_event_dtor(&fctx->event);
> >=20
> > nouveau_fence_wait_uevent_handler() queues the work
> > unconditionally:
> >=20
> > =09schedule_work(&fctx->uevent_work);
> > =09return NVIF_EVENT_KEEP;
> >=20
> > so a non-stall interrupt arriving after cancel_work_sync() has
> > returned
> > re-arms the work that was just drained.=C2=A0 The window closes in two
> > steps,
> > neither of which is the drain.=C2=A0 The kill blocks the event when the
> > last
> > fence holding a notify_ref is signalled, which reaches
> > atomic_xchg(&ntfy->allowed, 0) (nvkm/core/event.c:104), and
> > nvkm_event_ntfy() skips a ntfy that is not allowed (:183).=C2=A0 That
> > stops
> > further handlers from starting, but not one that is already inside
> > nvkm_event_ntfy(): the event is created with wait =3D false
> > (nouveau_fence.c:201), so nvkm_event_ntfy_block_() leaves it on the
> > list
> > and never takes event->list_lock.=C2=A0 Only nvif_event_dtor() waits
> > that
> > one
> > out: nvkm_event_ntfy_del() (:141) goes through
> > nvkm_event_ntfy_remove(),
> > which takes write_lock_irq() on that same list_lock (:84).
> >=20
> > Either way the re-arm happens after the drain, and the caller drops
> > its
> > reference immediately afterwards, for example
> > nv84_fence_context_del():
> >=20
> > =09nouveau_fence_context_del(&fctx->base);
> > =09chan->fence =3D NULL;
> > =09nouveau_fence_context_free(&fctx->base);
> >=20
> > That is a kref_put() on fctx->fence_ref, so the context outlives
> > the
> > teardown only while emitted fences still hold a reference of their
> > own.
> > That is no safety net: whenever none do, the count reaches zero
> > right
> > there and nouveau_fence_context_put() kfree()s fctx while the work
> > is
> > still queued.=C2=A0 &fctx->uevent_work is embedded in that allocation,
> > so
> > the
> > workqueue already dereferences freed memory when it picks the item
> > up,
> > and nouveau_fence_uevent_work() can then take fctx->lock on it.=C2=A0
> > With
> > CONFIG_DEBUG_OBJECTS_WORK and CONFIG_DEBUG_OBJECTS_FREE, kfree() of
> > a
> > still-queued work item is reported as the free of an active object.
> >=20
> > On live memory the re-armed work has nothing left to do:
> > nouveau_fence_context_kill() empties fctx->pending and sets fctx-
> > > killed
> > under fctx->lock, nouveau_fence_emit() then returns -ENODEV rather
> > than
> > queueing anything new, and nouveau_fence_update() only reaches
> > nvif_event_block() if it signalled something off that list.=C2=A0 The
> > defect
> > is the access to freed memory, not what the work would have found.
> >=20
> > Only chips from G84 on can reach this at all:
> > nouveau_fence_context_new()
> > returns before nvif_event_ctor() when priv->uevent is clear, and
> > nv84_fence_create() is the only place that sets it.
> > nv84_fence_context_del() is the context_del for all of those,
> > because
> > nvc0_fence_create() and gv100_fence_create() build on
> > nv84_fence_create()
> > and override only context_new.
> >=20
> > Use disable_work_sync() instead.=C2=A0 It drains the work exactly like
> > cancel_work_sync() does, and additionally increments the work
> > item's
> > disable count, after which "any attempt to queue @work will fail
> > and
> > return %false" (kernel/workqueue.c, disable_work()).=C2=A0 The handler'=
s
> > schedule_work() then has nothing to re-arm, and the teardown order
> > stays
> > as it is.
> >=20
> > Draining a second time after nvif_event_dtor() would close the
> > window
> > as
> > well, and without the newer API: once nvkm_event_ntfy_remove() has
> > returned, no handler can start or still be running, so nothing re-
> > arms
> > the work past that point.=C2=A0 disable_work_sync() is preferred here
> > because
> > it needs one synchronisation point instead of two, it keeps the
> > work
> > from being queued at all rather than cleaning up after it, and it
> > is
> > what drm has settled on for this (drm/xe, drm/panthor,
> > drm_pagemap).
> > Blocking the event rather than the work is not an option: fctx-
> > >event
> > is
> > created with wait =3D false, so a handler already inside
> > nvkm_event_ntfy()
> > can still queue the work.
> >=20
> > Note for backports: disable_work_sync() arrived in v6.10 with
> > commit 86898fa6b8cd ("workqueue: Implement disable/enable for
> > (delayed)
> > work items"), while the fix being corrected here reached 6.6.18 and
> > 6.7.6.=C2=A0 linux-6.6.y therefore carries this bug without the API, an=
d
> > this
> > patch would apply there and then fail to build.=C2=A0 A 6.6.y backport
> > wants
> > the second drain described above instead, as its own patch.
> >=20
> > Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> > Closes:
> > https://lore.kernel.org/nouveau/20260812231330.705425-1-mczernohous@gma=
il.com/
> > Fixes: 39126abc5e20 ("nouveau: offload fence uevents work to
> > workqueue")
> > Cc: <stable@vger.kernel.org> # 6.10.x
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Marek Czernohous <marek@czernohous.de>
> > ---
> >=20
> > Changes in v2:
> > =C2=A0- Do not reorder the teardown.=C2=A0 v1 moved nvif_event_dtor() a=
head
> > of
> > =C2=A0=C2=A0 nouveau_fence_context_kill(); with the fences still unsign=
alled
> > that
> > =C2=A0=C2=A0 leaves nouveau_fence_enable_signaling() reachable, and
> > =C2=A0=C2=A0 nvif_event_constructed() is a plain unlocked read of objec=
t-
> > > client,
> > =C2=A0=C2=A0 so the dtor could race an nvif_event_allow() already past =
that
> > check.
> > =C2=A0=C2=A0 Reported as [Critical] by the bot, and withdrawn:
> > =C2=A0=C2=A0
> > https://lore.kernel.org/all/20260815200914.8A1131F000E9@smtp.kernel.org=
/
> > =C2=A0- Change cancel_work_sync() to disable_work_sync() instead, which
> > leaves
> > =C2=A0=C2=A0 every ordering alone.
> > =C2=A0- Pin the damage down.=C2=A0 Both versions call it a use-after-fr=
ee;
> > this
> > one
> > =C2=A0=C2=A0 adds that &fctx->uevent_work is embedded in the freed
> > allocation,
> > and
> > =C2=A0=C2=A0 that the re-armed work has nothing left to do on a live co=
ntext,
> > so
> > =C2=A0=C2=A0 the access to freed memory is the whole of it.
> > =C2=A0- Correct the backport note.=C2=A0 v1 claimed no longterm tree sa=
t in
> > the
> > gap
> > =C2=A0=C2=A0 between the bug and disable_work_sync(); 6.6.y does.=C2=A0=
 The stable
> > tag is
> > =C2=A0=C2=A0 annotated accordingly.
> >=20
> > This replaces 1/3 of
> > https://lore.kernel.org/all/178682366002.3748010.12779628082366287968@g=
mail.com/
> > 2/3 and 3/3 of that series are unaffected and still stand.
> >=20
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > index edbe9e08ba0f..11e95c37ce50 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> > @@ -96,7 +96,7 @@ nouveau_fence_context_kill(struct
> > nouveau_fence_chan *fctx, int error)
> > =C2=A0void
> > =C2=A0nouveau_fence_context_del(struct nouveau_fence_chan *fctx)
> > =C2=A0{
> > -=09cancel_work_sync(&fctx->uevent_work);
> > +=09disable_work_sync(&fctx->uevent_work);
> > =C2=A0=09nouveau_fence_context_kill(fctx, 0);
> > =C2=A0=09nvif_event_dtor(&fctx->event);
> > =C2=A0=09fctx->dead =3D 1;
> >=20
> > base-commit: c21bb4193868a8de71fc4693fa741e195fdf5d86

