Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D66C5DF86
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 19:10:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDA410F173;
	Thu, 20 Aug 2026 19:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TCGs1pjv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E520A47A68;
	Thu, 20 Aug 2026 18:53:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787252021;
 b=oxKG6MiwYA/7Weyf0uPYl7CMx3MUgdfFMgLtohOLDWd76/TJp2GzB3UwELrNynJwMk9Dn
 eLT65X4tLJCmZ8D/dPLc3lhX39+XMTdqf6/XAWXx5U160RQp+L6f3Nm7ZlWEkvuLcnQ6sul
 p+hKYOAP8T8bpMwamtvUvUN4NQQ46J5qGsV1r0I3U32IXnZX20j/16DixGBT6gfDVlAUsx6
 hvdiNYzz0C0kNQFHAj7WQ79PZ3uW7K4mZZrCfFW7DY0GS+S6BAubyUapLQLiUVIHwmER1QV
 FQrtslJThIQHfh3RtgFy0bBiX1Kpj+E/szW6bp/hTj3fUf7VzrtbM657ZcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787252021; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=w1G6jsQM/GZe4vJI//RXLXg99wtDQmy8dh1+9zIBics=;
 b=jdzBhqt8Fj5iDjZEGnvt1Dkq1OFSYHC5ppMusZI87Pv9ALOHPZcd8azg/NV70POEEIRrh
 6O4O3tyIBkvE95kxbUTOZWS24l4vpwpkw93SF5WahA1wh9veTVL3Eg7mJBDBfNNpb2SpBXB
 ORiR2n4LE9RxUoNkGUyaTS9p2GOYMPn7QzSb84ncnM92rxhueVdgRaQKKXFZ2eKII13AD5J
 XHrzUCAoavawSXeglLjXd+AqREGPZ30lXgjx8rNFw/UWfQ0bJ+EwkH/ccBgK5/X12qXQK5Y
 C1VPsMEXmAFCZ/LMOy+LbtfY8RdfjGKujqFOfqblFW6+k+51cS9yApwZijUA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 46AC8473C8
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 18:53:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 95B9B10F16B
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 19:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787253013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w1G6jsQM/GZe4vJI//RXLXg99wtDQmy8dh1+9zIBics=;
	b=TCGs1pjvt6/odq4EpnVzpbtPZXG/mrSALCmTmmZdKCPFc/rqgeFHAMGfnQmkuxqzRe/faF
	YZk3Gv64qMVRVdVX2UhsgPfqi77DJ8QnsmSroMqJlTqsmxKeriY3H92B537RDzRLqYpiz9
	gfOcOzbhBQ6NmuI8fOHftFK5a4WHVsY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-v8_rBargOT6_fTTlUgdrxg-1; Thu, 20 Aug 2026 15:10:12 -0400
X-MC-Unique: v8_rBargOT6_fTTlUgdrxg-1
X-Mimecast-MFC-AGG-ID: v8_rBargOT6_fTTlUgdrxg_1787253012
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-52b4f6ac06aso2526331cf.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 12:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787253012; x=1787857812;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnb/0LkhoX6JhBArFplr3WwxDbTfPxUble2GOXa/Bjk=;
        b=GX/rw7RJ3OpHu7fOmfjfUtNsL+X2tdY5C5SlaLKnEAJeFilev1XkvX+MK0WZwMqM4w
         vNLDj4SVULVbN5M1K5q5tUtAsszjda0BLJY5hn6lBu//wk4XdXaBhSND0Nbxu0gW50AD
         fpf3kinOUUnbrVHbmcseVCadMINl2G0QmimQ06l2WlLUqFYODqKGR105tNP3UatkoQ7x
         MPfsTk1F43oqeXBK3qDkMe7HydU3cv3ZXQcLB+10qW8M6zT0h8KdfRJGh4CEuRAyCJku
         w/Nq3eqw2hTwc75emHg4bC3QKsjtl7baLbACiFRU/rFgqDpgGqZMxJ7hpnr3s1QXeuFk
         iBrg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpHPqyeotyaK0CVP1+b6bJMU4QXgPqsLeuZCBPuYpJs9zLQUDutfi7Io7qis3Nyyen71BbmAW0v@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ1korp3g1IFLpZ4twfLPeHTSgAuQZzgGkPnMC0D9/h7Zl5wPv
	7KQHVRpKFbVldkgyiFk3R7lQG+CQduDOUUr6S70sCkZXP0QLRFPyRsL+yudJIxbYcwIw+fzNYvO
	JOoQZUkPmyqAuoRsJaj1EVhP6mYWLw9bz1xVaoZMYfkK5Wf10cPwRWKtQ0FKsgIw/MiqZt3/QFP
	g=
X-Gm-Gg: AR+sD108rlgm69yq6AZIQUn4/yqXeev8OCgAQz7ep57V6GPvQOReX8Qsk5ZbxYpQw1A
	hB9SjlEydG/Z52MKoIwVrtg3oJEentIaSiMgI72Xk03F+zfifzx452JM1CsKnib3z/YclqaDQrF
	OObNl3qjcvIqGHt8W2Pwp+eN98xi1MsB/syMSNxip1V2Uagu6aNXrZ3BRR7aKjkpT2A4DpKqudA
	VIK9v3wNjEOYOsCcjKxSnXfu4k3kNQ30j+u3ykeG61jNQNib6QTjS4aji/hkrySRFvwM52cfMc/
	wdfQ8nKpWPJMnhYuAz4KXvB06H3kDEQ3UDAwCBfHL19il4XG/abzj15QC599AP7K7bUnnTxL
X-Received: by 2002:a05:622a:1112:b0:51c:22c5:daf5 with SMTP id
 d75a77b69052e-52df59fb918mr5347491cf.38.1787253011703;
        Thu, 20 Aug 2026 12:10:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1112:b0:51c:22c5:daf5 with SMTP id
 d75a77b69052e-52df59fb918mr5346851cf.38.1787253011087;
        Thu, 20 Aug 2026 12:10:11 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5edb5097sm45137076d6.9.2026.08.20.12.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:10:10 -0700 (PDT)
Message-ID: <4db24c901f8cf3315131e4b23cfe7a86dd26874a.camel@redhat.com>
Subject: Re: [PATCH v3 1/4] drm/nouveau: unsubscribe the channel-kill event
 before the fence context
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 15:10:09 -0400
In-Reply-To: <20260812231330.705425-2-mczernohous@gmail.com>
References: <20260812231330.705425-1-mczernohous@gmail.com>
	 <20260812231330.705425-2-mczernohous@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Se8v5CaxYP0J2O7Wa6bi3C0qNHvw6ctgV6JTo4E2Snw_1787253012
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TPI4JJWOX5ADT3EUYWCLLGLUJZP77S25
X-Message-ID-Hash: TPI4JJWOX5ADT3EUYWCLLGLUJZP77S25
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TPI4JJWOX5ADT3EUYWCLLGLUJZP77S25/>
Archived-At: 
 <https://lore.freedesktop.org/4db24c901f8cf3315131e4b23cfe7a86dd26874a.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2026-08-13 at 01:13 +0200, Marek Czernohous wrote:
> From: Marek Czernohous <marek@czernohous.de>
>=20
> nouveau_channel_del() tears the fence context down first and only
> drops
> the channel-kill subscription later, in the middle of the nvif object
> teardown:
>=20
> =09if (chan->fence)
> =09=09nouveau_fence(chan->cli->drm)->context_del(chan);
> =09...
> =09nvif_object_dtor(&chan->vram);
> =09nvif_event_dtor(&chan->kill);
>=20
> The subscribed handler is nouveau_channel_killed(), which calls
> nouveau_channel_kill() and from there nouveau_fence_context_kill() on
> chan->fence. A kill event delivered in that window takes fctx->lock
> and
> walks fctx->pending on a fence context that context_del() has already
> freed.
>=20
> Nothing reaches this below Fermi today, because the subscription is
> gated on FERMI_CHANNEL_GPFIFO and nothing kills a channel there. On
> Fermi and newer the window is real but narrow, since a kill has to
> land
> exactly while the channel is being destroyed. That is reason enough
> on
> its own, which is why this carries a Fixes: tag. The last patch in
> this
> series subscribes Tesla channels as well; nothing kills those today,
> so
> it does not widen the exposure now, but it is the groundwork for a
> recovery path that would, and the ordering is better fixed before
> that
> lands than alongside it.
>=20
> Drop the subscription before anything it depends on is torn down.
>=20
> Fixes: ea13e5abf807 ("drm/nouveau: signal pending fences when channel
> has been killed")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Marek Czernohous <marek@czernohous.de>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_chan.c | 9 ++++++++-
> =C2=A01 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c
> b/drivers/gpu/drm/nouveau/nouveau_chan.c
> index 598513f60449..f142f6310596 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -90,6 +90,14 @@ nouveau_channel_del(struct nouveau_channel
> **pchan)
> =C2=A0{
> =C2=A0=09struct nouveau_channel *chan =3D *pchan;
> =C2=A0=09if (chan) {
> +=09=09/*
> +=09=09 * Drop the kill-event subscription first.=C2=A0 Its
> handler
> +=09=09 * dereferences chan->fence, which the fence context
> teardown
> +=09=09 * below frees, so leaving it armed across the
> teardown leaves
> +=09=09 * a window for a use-after-free.
> +=09=09 */
> +=09=09nvif_event_dtor(&chan->kill);
> +
> =C2=A0=09=09if (chan->fence)
> =C2=A0=09=09=09nouveau_fence(chan->cli->drm)-
> >context_del(chan);
> =C2=A0
> @@ -100,7 +108,6 @@ nouveau_channel_del(struct nouveau_channel
> **pchan)
> =C2=A0=09=09nvif_object_dtor(&chan->nvsw);
> =C2=A0=09=09nvif_object_dtor(&chan->gart);
> =C2=A0=09=09nvif_object_dtor(&chan->vram);
> -=09=09nvif_event_dtor(&chan->kill);
> =C2=A0=09=09nvif_object_dtor(&chan->user);
> =C2=A0=09=09nvif_mem_dtor(&chan->mem_userd);
> =C2=A0=09=09nouveau_vma_del(&chan->sema.vma);

