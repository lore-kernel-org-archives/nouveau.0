Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C18CC5DF81
	for <nouveau@archiver.kernel.org>; Thu, 20 Aug 2026 18:13:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0856E10EC16;
	Thu, 20 Aug 2026 18:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Dobq2EBB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6057247A49;
	Thu, 20 Aug 2026 17:57:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787248634;
 b=qUbMKmwfDaE5+YA2Tv8OBCUrexrbD8t0lvwydmkiS3Gs22Tccb9+itb86dyBA+E3bHcxy
 faoUWJcS6NZUCdDhUnjgpfky9mjmuhrHHw12/FE3TZV8s3ogzOCt79MRNTXE37J5CCOeVBr
 L+dElTQZfjOZ0nrTtb2i1opXw22ekqE0sxN5G2+jaXtT4Smi3hk5msUozHD7vzVTtfGUHbW
 HasbqRqlpqm43fRarTb41JjZ/CAvXegu3Aw/N84ngHbg/i+fp67VIhOrO0ml77WToGLPcnM
 4y5x4X8wwxGXaecfsCSWzVt5pSrat7A/2J1NZnGVdYbTqfm1WNWVzlMkxMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787248634; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ioDl19YMAvkax5adWxSHFRx0OcBttsxIoujuyuuFzRs=;
 b=dlpYNMQwWwYFhhO3P0aMXq70OLECMWymXW15nfZqoEmlTaYirQzHabJUeolhk2IozoGyw
 BrE+cke44HVUtXcIkGpCh7ApS6Vptj2zj8eIn5gKxI71Fs4X0GEKNPOvLklRl6wHOppBc6j
 6sUxQIuGZ2J6L4BF5D9pURwQL8+KCLPTmkSHQKojtmkx1IK5ngub2KPwy92aY1J2xTpka/N
 a0y+CTrBcLpbG1clWJ2tYbtEiLq1BLupD4RXzEMP9GgFhl8ETWsgRQfH5OFi4AdIpAaDDv3
 ut/MKPI55B6ptsdoVD/dLDyAFRn4n+Qv10+ugIIqh04zi1g01hWz7xC1ovWg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7123B47A37
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 17:57:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BB64A10E42F
	for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2026 18:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787249626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ioDl19YMAvkax5adWxSHFRx0OcBttsxIoujuyuuFzRs=;
	b=Dobq2EBBlukS4dFex59pikgHDlYQFW2CMDLCXwLiBkj+ngG4oFPrKDdGmmde9HVeqeFgmZ
	5kBXyCufLYxFvF3mSUVmrAL68i4UzNzPr5UgGp1r2JTDWvJZ8SgyNzS5vAkmpQtzdPDkOX
	ARcl4qndsHRHKVSg/5B9bouAB33Gfw8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-nPnb0FifMEWfr3RTm_xIlw-1; Thu, 20 Aug 2026 14:13:44 -0400
X-MC-Unique: nPnb0FifMEWfr3RTm_xIlw-1
X-Mimecast-MFC-AGG-ID: nPnb0FifMEWfr3RTm_xIlw_1787249624
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c0408254aso16804001cf.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 20 Aug 2026 11:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787249624; x=1787854424;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rl/GCSC9mrxRzZFL9EE5o5Bx5mzQPkItraIxAO9n+xk=;
        b=UUE5i8fCQc32jXdvcuYK+oH90x7vjuFv8SY48I3Tcq30FKMpXe7rFR/jbEJdYxtaki
         TMolDhhag59ywN3jQ3heuUvVKo5SnwBmTxCb+dtQ1KzVpe3VS1xKtp/KxOx1eyfLgxeG
         bqVrdPN4GAgYJUA+hlZ05cgq7dny+Mso8peHv9Fd8XpSvONQCs3mW5r2L0iABBb/HqGa
         WzXQaE1Z3glVbuCxQQhhPwm+QIXxafMcaWM6XPLeyAw3ZeWzv81P9/bpiK5cdDzCiy6o
         JLMrxcM4AqhGAFmO1RmRE0Gp7W8UzLG1J/K8FxUal2xixLqolR/ElKJfPmcAWiJlme3p
         59zA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq3lkh67Zek5jvFjsnIOtB5v4XRyCFdSA6eNwJEuuzb0tK7XU6FXdJqXrexjs0Bz9Hmx/z8+ACx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfhrjOZNJiRzUhAR9MCUr7Dx5jijpwqCHemuq1moEFLrnni67E
	vLya1lZ8dEsVjeDciuzQ9UJlHqdrUkW08uAkCsZXGKGakJoZWYcJ/lRAA9vFhZHdq1qBZ487w8e
	ty8TLL8jedBd6BgNn1HWYqbOfSAIGcf8FoIVhjjneImQnUKMHTGaYVJXprRVO4HYmpHg=
X-Gm-Gg: AR+sD13VEbTJApzSUCcPDaKr1JfC4e9w4C2n2Rq2t9Zwmy85IWR7uRJj1Qd6vVXSJDe
	PqPD9KNWk/Wy24AnCcUoo27KEu5+7zhLYQy9BvoehnoYQQw1nlwll0upAueIbBKN1qPdaxkbvsg
	kOWcHgLPs+YAKTxjXjjQ6/Hsczmt7p+Gh7S70TbOj8aKLgMC26VTTNp8QBp880YkDh/hAnseCM1
	ju4e81ZmYIDPDwOQJZmhzdnXG3dWea9NfCMr8CpSOtiKyKSfkxD2Tyb8jN0V2/Le5dhVolmI1Hy
	aYt51ptzBnYFIe/1HXoqpkpAawABbRyoNtSgN9zI8sdDavvPfxtiyCyibPkUErop8EWTpfda
X-Received: by 2002:a05:622a:4086:b0:51b:f992:9e18 with SMTP id
 d75a77b69052e-52de2eff50cmr85002111cf.2.1787249624036;
        Thu, 20 Aug 2026 11:13:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4086:b0:51b:f992:9e18 with SMTP id
 d75a77b69052e-52de2eff50cmr85000801cf.2.1787249622905;
        Thu, 20 Aug 2026 11:13:42 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5edb44easm45361866d6.6.2026.08.20.11.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:13:40 -0700 (PDT)
Message-ID: <40b59b1a40755347533320b65ff1a4342b8e3c8e.camel@redhat.com>
Subject: Re: [PATCH 2/3] drm/nouveau: cancel the DP IRQ work before freeing
 the connector
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 14:13:40 -0400
In-Reply-To: <178682366002.3748010.4096452389040554615@gmail.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
	 <178682366002.3748010.4096452389040554615@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FWzciDwnIuep3suKK5aKCHDUqqTf2cVajGJ2hCiuVaE_1787249624
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NXBEHVLLDCZ6RXGUMLIOS3ZATABZZLC3
X-Message-ID-Hash: NXBEHVLLDCZ6RXGUMLIOS3ZATABZZLC3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NXBEHVLLDCZ6RXGUMLIOS3ZATABZZLC3/>
Archived-At: 
 <https://lore.freedesktop.org/40b59b1a40755347533320b65ff1a4342b8e3c8e.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sat, 2026-08-15 at 21:54 +0200, Marek Czernohous wrote:
> From: Marek Czernohous <marek@czernohous.de>
>=20
> nouveau_connector_destroy() tears the two nvif events down and then
> frees the connector, but never cancels the work the IRQ event queues:
>=20
> =09nvif_event_dtor(&nv_connector->irq);
> =09nvif_event_dtor(&nv_connector->hpd);
> =09kfree(nv_connector->edid);
> =09...
> =09kfree(connector);
>=20
> nouveau_connector_irq() queues that work unconditionally:
>=20
> =09schedule_work(&nv_connector->irq_work);
> =09return NVIF_EVENT_KEEP;
>=20
> A DP IRQ arriving just before nvif_event_dtor() therefore leaves
> nv_connector->irq_work on the system queue past the kfree(). When it
> runs, nouveau_dp_irq() derives both nv_connector and connector from
> the
> work_struct and dereferences them, and goes on to take
> outp->dp.hpd_irq_lock.
>=20
> There is no cancel_work_sync() for irq_work anywhere in the driver,
> so
> nothing else covers this. Add it after the event teardown, where no
> further work can be queued, and before anything is freed.
>=20
> Reported by the Sashiko review bot as a pre-existing issue, in its
> review
> of an earlier nv04 FIFO series of mine, and confirmed against the
> source.
>=20
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Link:
> https://sashiko.dev/#/patchset/20260812231330.705425-1-mczernohous@gmail.=
com?part=3D1
> Fixes: 773eb04d14a1 ("drm/nouveau/disp: expose conn event class")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Marek Czernohous <marek@czernohous.de>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_connector.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c
> b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index b0b0ad9a0c24..e49dcaa6d210 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -397,6 +397,7 @@ nouveau_connector_destroy(struct drm_connector
> *connector)
> =C2=A0=09struct nouveau_connector *nv_connector =3D
> nouveau_connector(connector);
> =C2=A0=09nvif_event_dtor(&nv_connector->irq);
> =C2=A0=09nvif_event_dtor(&nv_connector->hpd);
> +=09cancel_work_sync(&nv_connector->irq_work);
> =C2=A0=09kfree(nv_connector->edid);
> =C2=A0=09drm_connector_unregister(connector);
> =C2=A0=09drm_connector_cleanup(connector);

