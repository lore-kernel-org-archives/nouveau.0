Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680DFC5DF81
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 21:56:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BD04210F1A9;
	Thu, 20 Aug 2026 21:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q4oBQtwG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BEFE147A81;
	Thu, 20 Aug 2026 21:39:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787261996;
 b=vdoRHyWHAguAOFeF2vkfJJK+y7EKkFExRWujIp3Fv7YMvwbS8VecRPZsrvYlAqXK7niJ1
 7fJzTwyTjlwRiQa4EHSSdP9YrW+Mk4KgqKgV6OAy/p5nzlO8wv1gwvM6qY/PrdE4hQYkvGJ
 J4htVp+xzTox+aedN3x3gnASccoifvkD1LRrVkFgy8grk+q/fS2sz3JBLd7fAGTbJ+TQ0aH
 e49ohmCVpV6S+RRKuYMEAvlapzYHVcF8gJUKn/ONb0+57mtEqpsw3W3JAocpyM1RCTMbUAy
 GK7mvVPBCW8LieMq286Bx7UDqeVougaJlho/h3j7d4G5ERNIBxMxd1SjeQHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787261996; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qJNhFXppokjOp9Um282YuDdOK7JlZ3LGM60w1T1FT9E=;
 b=F4x9wT87kcP0UIo81+xTU4yzmOQaJPWxrFynLjOBJhfLwQEwomrETrhw3DkhjXdsd1/Xc
 sRmAt+/aiTr7y8UgWcXwiQozuB/QW8y2LzaMAKjqg57damDT58PYbRYHaxt+/OiWZqFDy81
 +28sVt8oY3K1Kxi9FCEgWjttTc61Qpyd1ubJzV/5Z5g3NES4m8wD2lo/H5jJliIMSVqBPFK
 ugYfEYB8WQKteHJ0dx9ppOet/osustZI8LGtx+foixbeo0WnxRzueYeCU9CibwJFpT5aXfK
 GWwAGFtUJDNnLuyHVKvJHTNDiBc4AbYaNKRFmMAgf6G7lbTQQdUE+xUUZ48A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B16C647A41
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 21:39:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4A510E210
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 21:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787262988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qJNhFXppokjOp9Um282YuDdOK7JlZ3LGM60w1T1FT9E=;
	b=Q4oBQtwGNeCHEKr6A9uvsPNqt/4oDhbL6VEbrpXpVN01XmDa6gkYdIZsUQzjDato5OdI5r
	j22dmtInhpZl3oSiZauADVfhxnE6j0JAU6+7EE5ZRuvZ2CQe2fQvclCGMjLsBNNDHXF/KY
	pe9hreIGA8nN7ML1rDiCbRNHYpfzXH0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-ZIZNQC2fPlifTKHpJTuQow-1; Thu, 20 Aug 2026 17:56:25 -0400
X-MC-Unique: ZIZNQC2fPlifTKHpJTuQow-1
X-Mimecast-MFC-AGG-ID: ZIZNQC2fPlifTKHpJTuQow_1787262984
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-936708f129aso30041885a.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 14:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262984; x=1787867784;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzTaBAeZXEpNdEF6mCBk0yTwt9Zf1jS1qQHVYWMdOMI=;
        b=a8gyFLVEZk2Sf8tCIWd87PodF9R67DvnTPQKK7tyLAX/CVv7YVVxeVfGpQRsJV+NdV
         7rE+mOqSfKBF0iwBpzN9VRp83VfMG0CFKlmoon8sg3pq4+AP4siynwiALY3fS6Z6GqB7
         XzfTChaIJxxSwhE+LDOc2+cumQOBx8MbjQK8Fn3rcpwQ7ZwjlwqjXIi2AwQ9HZ16UmUf
         kOfbqIfpnfMws8pDnANLPQwo84JGUelnlhgRTT7ZBaCCYtlzhpesMUuCPMkcc2vd8rxb
         Op7agXgwY0Fw0yENHJqDVUh398ydyeOQX7WCSLLts+ZGMGFvEuJVfz3HZLVhSY/Dzdgv
         6TzQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq5QLEv0DVTLybWS8kvTajM35PMi3BUGzyR+HYS8wecrwXSRiRw+ddhdtAokvV+m5BJs+qePPiz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcH4NHqzEv9M8H7E/mYY2fVOmFGyGPFx5b6EvnVOGVN/3nfQYI
	uKtyDIcU8KtfdhJgegReEVt4/izGTbS0C5uuQrMMP3YluZiL7iy7cdljq0yvGN3OtFOLAgJLcwD
	TxE/8FaGLPPcOTGvKu79buP/TOkw0vSDQzGERPXkfFyEW29kCBmcxxBC67UaLLwMMsMY=
X-Gm-Gg: AR+sD119dEWXt4v7smAteEMTMFeEF9q9cwh3nFLH6QgtDzFRyvpKS5Zb5bAPwugbdHu
	Bvis1GcM9XgPHR/D1Yaml91wmOfgr/WLPH/ddt6RMy+r09wB7LLivkwBYHlzg/cTs7P6w5BxaXl
	9DPm2QJAia91SQvGNzdoOpQSuylMcwpWNtof6syxnI8p307OqWFGoVyEKa+YKSoFcxiG0SD8z7n
	706rqv8g1xrIIZYwz69dk4e2yPGdt1uwuYDncwVlYt3CJ49/0y8YvmgqhRIbKC9fKRZzS3+IlOS
	qpMV449wg9P8TSev3J07QkWVFOJcuyvwoE0VFblZTmqBz6tWpLn+7/otkKuqgSosezozlu25
X-Received: by 2002:a05:620a:1132:b0:937:36c0:bf6 with SMTP id
 af79cd13be357-9373958fcdamr105262185a.16.1787262984426;
        Thu, 20 Aug 2026 14:56:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1132:b0:937:36c0:bf6 with SMTP id
 af79cd13be357-9373958fcdamr105260085a.16.1787262983921;
        Thu, 20 Aug 2026 14:56:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-937204aa8a6sm461514385a.11.2026.08.20.14.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:56:22 -0700 (PDT)
Message-ID: <9414b8d122b9489056d72ee1605787ee038e62b7.camel@redhat.com>
Subject: Re: [PATCH v3 4/4] drm/nouveau: subscribe to channel-kill events on
 NV50 and newer
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 17:56:21 -0400
In-Reply-To: <20260812231330.705425-5-mczernohous@gmail.com>
References: <20260812231330.705425-1-mczernohous@gmail.com>
	 <20260812231330.705425-5-mczernohous@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SBc71fRaWoBI8oGK4bJvM_WUJ4qtEIUraKbfVlWjJF4_1787262984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2MHGWDHPRDA6XGIXLDFWXFN76ZJUVBZF
X-Message-ID-Hash: 2MHGWDHPRDA6XGIXLDFWXFN76ZJUVBZF
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2MHGWDHPRDA6XGIXLDFWXFN76ZJUVBZF/>
Archived-At: 
 <https://lore.freedesktop.org/9414b8d122b9489056d72ee1605787ee038e62b7.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This one is going to need some input from others I believe, mostly in
that I'd want to really make sure we know what the implications of
enabling an event like this on Tesla are and what kind of testing we
would need to know this isn't going to break things.

If it was a slightly newer generation I wouldn't be as worried. What
kind of testing have you done with this so far in terms of workload in
addition to what you mentioned on the cover letter? Tried running any
games, anything graphics intensive, etc.?

On Thu, 2026-08-13 at 01:13 +0200, Marek Czernohous wrote:
> From: Marek Czernohous <marek@czernohous.de>
>=20
> nouveau_channel_init() only subscribes to the channel-killed event
> for
> FERMI_CHANNEL_GPFIFO and newer. On NV50/Tesla the subscription
> therefore
> never happens, and nvkm_chan_error()'s NVKM_CHAN_EVENT_ERRORED is
> delivered into an empty notifier list.
>=20
> Today that is harmless, because nothing kills a channel on Tesla: the
> only nvkm_chan_error() callers are the Fermi and newer recovery
> paths.
> So this patch changes no observable behaviour on its own, and that is
> deliberate: it removes a latent trap before anything can fall into
> it.
> I am carrying a Tesla recovery path that does add such a caller and
> will
> send it separately once it is ready. Without a subscriber in place
> the
> consequences there are severe: nouveau_channel_killed() never runs,
> so
> nouveau_fence_context_kill() never runs either, and the pending
> fences
> of the killed channel are never signalled. Everything waiting on them
> waits forever: drm_atomic_helper_wait_for_fences() in the display
> commit
> tail waits uninterruptibly and without a timeout, and the TTM delayed
> delete workers wait in TASK_UNINTERRUPTIBLE. The user sees a frozen
> desktop on a machine that is otherwise alive, and nothing in the
> kernel
> ends that state: both waits pass MAX_SCHEDULE_TIMEOUT, so the fences
> cannot time out. They are signalled only when the fence context is
> torn
> down, that is when the DRM client owning the channel closes its fd
> and
> nouveau_fence_context_del() runs. Killing the client, or rebooting,
> clears it; waiting does not.
> That is also a dma-fence contract violation: a fence must always be
> signalled, with an error if necessary.
>=20
> Lower the class gate to NV50_CHANNEL_GPFIFO. The nvkm side is already
> class neutral: the KILLED case hangs the notifier on runl->chid-
> >event,
> which every fifo owns since the runlist rework, and
> nvkm_uchan_uevent()
> does not discriminate by class. Pre-NV50 chips keep the old
> behaviour,
> so NV04 to NV40 are unaffected.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Marek Czernohous <marek@czernohous.de>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_chan.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c
> b/drivers/gpu/drm/nouveau/nouveau_chan.c
> index 07b0bd1bc519..5c2f4b9342b7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -485,7 +485,7 @@ nouveau_channel_init(struct nouveau_channel
> *chan, u32 vram, u32 gart)
> =C2=A0=09 * lock and the pending list, so an event arriving in
> between would
> =C2=A0=09 * find a non-NULL but unusable context and walk a NULL list
> head.
> =C2=A0=09 */
> -=09if (chan->user.oclass >=3D FERMI_CHANNEL_GPFIFO) {
> +=09if (chan->user.oclass >=3D NV50_CHANNEL_GPFIFO) {
> =C2=A0=09=09DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
> =C2=A0=09=09=09=09sizeof(struct nvif_chan_event_v0));
> =C2=A0=09=09struct nvif_chan_event_v0 *host =3D

