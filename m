Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2B7C5B572
	for <nouveau@archiver.kernel.org>; Mon, 17 Aug 2026 22:43:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A51C10E977;
	Mon, 17 Aug 2026 22:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F/ELE51y";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9A663478AD;
	Mon, 17 Aug 2026 22:27:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787005640;
 b=qPFQiQZk3gBAK6kdgiphbK2+gK7Q5UcACtVDs5h/62Ty1QUKoK7X2D1rZKC7PG8E8D5QH
 nwFqAXNtedjDMSb19SapC8oFXUbYWB0gYPTcrX9vg+G/x8dAoTjF47I+5NgCMagYemoMmxM
 XB9D2a2YfUXP2wN4QSvy8LtvIqeELeKWtWF4uDLxu6sKFL+D3Y7fQGUuF+vL/zeQsupgxg0
 msb1TcfW8In25YX9RQG4iQUESML2rtk7yXfBOIREQprSmODdbaLwGAz1YOsb6mRo8ePSlHk
 J9Yp/CtoLg3xtOA6KKVMN/t4WcKPgEZ0NudjAgRXB244ERj18s9nEDXQF21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787005640; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ATd3N86kFiVuE8vda+2rIGOUQB1M9XIX53mjLf5o6e4=;
 b=kWoNUCGvDCmWQ3peEbEcGb7+uzOsfjQc5SVnnu3XZadn7eMMSaMUXg+sBx3TMih9Q3RQ8
 hgqHpojiR9s5ZEPrJQUOhG/N71qo+eA2J4GtUHnk7n65l5g9g+fU6nfqnb+LYKF4m7QZ+16
 m3E2JsxOiRTWWaGcxWLqA4DLVf9ETHR5JuG/HcMst+7Pz7uUuRVbMsGkqBWIbP45oIjh79q
 +8AlDcFGuMvAlAgfhYWrcW7f2F/dpPM752lbZbl1fiz7/l0sCyVAJUsU90GKgHQ8S8DkX6y
 Dn3Nq2z9tvP0IQ5sHzIKxnwGEmAYdNNztSMvQ7fXfSeavVEPMvxy/qdnRbQg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7DB45470D3
	for <nouveau@lists.freedesktop.org>; Mon, 17 Aug 2026 22:27:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0D610E467
	for <nouveau@lists.freedesktop.org>; Mon, 17 Aug 2026 22:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787006625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ATd3N86kFiVuE8vda+2rIGOUQB1M9XIX53mjLf5o6e4=;
	b=F/ELE51y2qWSnAhA1BH0paT944SPZJ9Fvj6KO7c0tv99FHiZnSHSfER9KXtsUzvDGSt+HW
	RJ6uVtxs5IALZWARX17xlNyUhyyGxuR5iSJN2KP/PzVoO6JSjtkDCP26ME3rgJotDJOnMc
	nN80edEJeWmFoMTaYDMj2XPG7RvSkbk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-WyNMNU4NMmmDIquQmWGzqw-1; Mon, 17 Aug 2026 18:43:38 -0400
X-MC-Unique: WyNMNU4NMmmDIquQmWGzqw-1
X-Mimecast-MFC-AGG-ID: WyNMNU4NMmmDIquQmWGzqw_1787006618
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c26012cd0so37580291cf.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 17 Aug 2026 15:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787006618; x=1787611418;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBb4GI1JETzGycaeth8GVu7eys17B4CdM2QImPbvCqs=;
        b=YvFr6cTvahOGHjqriv7Ow5KAJlMx2sYQtNh/9tGUWkzCcVa4TdvSMU12/tl5TT5sru
         SVqCEK7ysbhtO2CQLVO81SvIvuazjGWRpKATGBeadFn6N1E3kfiwlGMO0aA8cOPJUj65
         huHQMoIbpxrseYKePPNgKxkUyV14+pHlhBzVfq/yTAozvJnQzmaWLDw/xh+LeeRsWDyB
         6etRCVm4TeP6S8ySOqy6ZForjZqWDsUa0bBg3Dq6kvelu4/fAZq7n1vaxrY093hcdspA
         hL80ZvpK6Uyvh5sNHqV9bYKnPT8Kionjl6T6KiOkOhfK9wv7gFE9P/eGxGtcpMqES3qF
         UrqA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrdZROUY978niBd3n3g2/KYfKnErFc/RBx+p0flFXaDoQwS6uBtXo35jM6QKCjn6BtBy71VGAwK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSu5zjSt5tNKZi/Sp+zT6bsxslbLo5pp87mHnhjOEiNJMJhoNn
	2zfGvzQjodPvXn/YT2xb5bZWkD5NTSekmyRD0i4PgqgVcMxCg80LlJFDRCO8pgpzfH4Kv0dgv43
	xme1ilYQFjCAvCPBYVVjbjqVEjOV5k6JglfSDOW/eRagSYdCyqPm4qTRgv4uSB+Xazek=
X-Gm-Gg: AR+sD13J8ki0YK5FcqlP1NeKJR/j/UoDUqP54Aio3qQUI7teGCBhaiU/+ec/KIXv5Xy
	Qtk1IrKs1YgsLWL1jMk0HJefWCeQNjPRc07qmHVVnHtxClOVhpiM95UfYiC8LyuLdeq7KLo0maC
	OvGymZkgsHVLBv2GDXcGsDf/JozZ9g6+8qdGWxOmT9x8Kcp1w65i+Z07qlyGUsPisDrTZQ5kB1z
	t5hCQxbWXqg9VJazT7jixXsj3YE8YgPEAkcuELAeHqNdFTKpdflpcKaqRseNa7MlAB4iANSiNsT
	a0WWENc9tU8xEXo51ialxIue5sR2MD/c9HbfqRxTNQMoP4nTOkiufYOF4bNxD8oLrS/a6DZs
X-Received: by 2002:a05:622a:1aa1:b0:51c:1117:c7c with SMTP id
 d75a77b69052e-52d85439e1cmr283996181cf.25.1787006618179;
        Mon, 17 Aug 2026 15:43:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa1:b0:51c:1117:c7c with SMTP id
 d75a77b69052e-52d85439e1cmr283995771cf.25.1787006617649;
        Mon, 17 Aug 2026 15:43:37 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c4593369csm18934786d6.29.2026.08.17.15.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 15:43:36 -0700 (PDT)
Message-ID: <71b8aaed1153fe1b5562db4dd395bb205f04d0ec.camel@redhat.com>
Subject: Re: [PATCH 6/7] nouveau/dispnv50: program pixel clocks above
 2.147GHz on GB20x
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Mon, 17 Aug 2026 18:43:35 -0400
In-Reply-To: <20260814235705.59132-7-mohamedahmedegypt2001@gmail.com>
References: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
	 <20260814235705.59132-7-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yapHnZ1TSNJwbVqFnqFmd5oQK8lik-EXFz3W8Gh_L-0_1787006618
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: F4W2C6G6TK4ADQP4WDO2X5KPQI4U7J6W
X-Message-ID-Hash: F4W2C6G6TK4ADQP4WDO2X5KPQI4U7J6W
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/F4W2C6G6TK4ADQP4WDO2X5KPQI4U7J6W/>
Archived-At: 
 <https://lore.freedesktop.org/71b8aaed1153fe1b5562db4dd395bb205f04d0ec.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 2026-08-15 at 03:57 +0400, Mohamed Ahmed wrote:
> The HEAD_SET_PIXEL_CLOCK_FREQUENCY(_MAX) methods carry only 31 HERTZ
> bits. Starting with C97D the upper bits live in separate
> HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI(_MAX) methods, which nouveau never
> programmed and headca7d_mode() computed m->clock * 1000 into the 31-
> bit
> field. NVVAL's mask then silently truncates anything past 2^31 Hz,
> which
> means that every mode scanned out at pclk modulo 2^31.
>=20
> No mode nouveau can currently commit crosses the boundary (an
> uncompressed HDMI FRL mode tops out around 1.78GHz at 8bpc), but this
> is
> a prerequisite for the upcoming DSC work, which makes 2.147GHz+ modes
> reachable.
>=20
> Program the full value split across the low and HI methods, exactly
> as OpenRM's EvoSetRasterParams9() does (nvkms-evo4.c, 31-bit low word
> plus the 4 HI HERTZ bits, giving 35 bits of range).
>=20
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/headca7d.c=C2=A0=C2=A0 | 21 ++++++=
++++++++++-
> --
> =C2=A0.../drm/nouveau/include/nvhw/class/clca7d.h=C2=A0=C2=A0 |=C2=A0 4 +=
+++
> =C2=A02 files changed, 22 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
> b/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
> index eeaeb15aa664..2046e38a4d79 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
> @@ -219,10 +219,11 @@ headca7d_mode(struct nv50_head *head, struct
> nv50_head_atom *asyh)
> =C2=A0{
> =C2=A0=09struct nvif_push *push =3D &head->disp->core->chan.push;
> =C2=A0=09struct nv50_head_mode *m =3D &asyh->mode;
> +=09const u64 hz =3D (u64)m->clock * 1000;
> =C2=A0=09const int i =3D head->base.index;
> =C2=A0=09int ret;
> =C2=A0
> -=09ret =3D PUSH_WAIT(push, 11);
> +=09ret =3D PUSH_WAIT(push, 15);

This can be 14, see below

> =C2=A0=09if (ret)
> =C2=A0=09=09return ret;
> =C2=A0
> @@ -245,11 +246,25 @@ headca7d_mode(struct nv50_head *head, struct
> nv50_head_atom *asyh)
> =C2=A0=09PUSH_MTHD(push, NVCA7D, HEAD_SET_CONTROL(i),
> =C2=A0=09=09=C2=A0 NVDEF(NVCA7D, HEAD_SET_CONTROL, STRUCTURE,
> PROGRESSIVE));
> =C2=A0
> +=09/* The FREQUENCY methods carry only 31 HERTZ bits; the upper
> bits
> +=09 * of anything past 2.147GHz live in the HI methods
> +=09 * (EvoSetRasterParams9()). Truncation here scans out at
> pclk modulo 2^31.
> +=09 */
> =C2=A0=09PUSH_MTHD(push, NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY(i),
> -=09=09=C2=A0 NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY,
> HERTZ, m->clock * 1000));
> +=09=09=C2=A0 NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY,
> HERTZ,
> +=09=09=09(u32)(hz & 0x7fffffff)));
> =C2=A0
> =C2=A0=09PUSH_MTHD(push, NVCA7D,
> HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX(i),
> -=09=09=C2=A0 NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX,
> HERTZ, m->clock * 1000));
> +=09=09=C2=A0 NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX,
> HERTZ,
> +=09=09=09(u32)(hz & 0x7fffffff)));
> +
> +=09PUSH_MTHD(push, NVCA7D,
> HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI(i),
> +=09=09=C2=A0 NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI,
> HERTZ,
> +=09=09=09(u32)(hz >> 31)));
> +
> +=09PUSH_MTHD(push, NVCA7D,
> HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX(i),
> +=09=09=C2=A0 NVVAL(NVCA7D,
> HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX, HERTZ,
> +=09=09=09(u32)(hz >> 31)));

These last two PUSH_MTHDs can be combined since each mthd comes one
after the other:

PUSH_MTHD(push, NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI(i),
=09  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI, HERTZ,
=09=09(u32)(hz >> 31)),

=09  =09=09HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX(i),
=09  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX(i),
=09=09(u32 hz >> 31)));

That also lets you go from 15 to 14 in the PUSH_WAIT above.

> =C2=A0
> =C2=A0=09return 0;
> =C2=A0}
> diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
> b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
> index 0fec6fc21d44..1ab12d91c9d9 100644
> --- a/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
> +++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
> @@ -653,6 +653,10 @@
> =C2=A0#define
> NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX_ADJ1000DIV1001=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 31:31
> =C2=A0#define
> NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX_ADJ1000DIV1001_FALSE=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 (0x00000000)
> =C2=A0#define
> NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX_ADJ1000DIV1001_TRUE=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 (0x00000001)
> +#define
> NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI(a)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 (0x000020C0 + (a)*0x00000800)
> +#define
> NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_HERTZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 3:0
> +#define
> NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX(a)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 (0x000020C4 + (a)*0x00000800)
> +#define
> NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX_HERTZ=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 3:0
> =C2=A0#define
> NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS(a)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> =C2=A0=C2=A0 (0x00002030 + (a)*0x00000800)
> =C2=A0#define
> NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_CURSOR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 2:0
> =C2=A0#define
> NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_CURSOR_USAGE_NONE=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> =C2=A0=C2=A0 (0x00000000)

