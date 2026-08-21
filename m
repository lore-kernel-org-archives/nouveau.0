Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58CCC5DF97
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 22:16:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EDF6310F3E0;
	Fri, 21 Aug 2026 22:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ImkV0cQj";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A0DDD47B00;
	Fri, 21 Aug 2026 21:59:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787349573;
 b=nXY1SPUlySQPOe6SIrUD5NqPpEaR/0VfxM4SFoyDCkU+j5So84ONrZd3QUoJ5zyEYD0Cr
 q9WOs7HtZ92OwvBzXaJdmUzuqbOWd9gh6DdkiXQRQcKAoOGPKmWxl0yvjcCu9nfMAShttkN
 qV7CmcUJky6i6IvM0aUkVQxzCH8Its+0jJ/XWRty9nB3pQA/EuqGXxQVMQFWWxWWVFKRapK
 z7ynyHq6F62gI7SkBpizdj031jPXuG0pb7yOo0XFeFW3QckxgtC9TmxawtUOWM8JrHRBWHh
 nSfFgOCieT3by7QdYd/BfFSyAo2KScv1V0dLJs6KYzgEyT1bk8KaS7dfpK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787349573; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zA1LeFPAQat9KKPEkh1443J5kCMSRDAY5hs4TF16uEk=;
 b=BhMh+UO6nyAqompc67X80W9U/CTxL1jolWtTowEf5A+r23Qk528F+aEzVF4SQ6Y0XJKdT
 AH/CmRECDG/3Sy2qEyBv+HuA/R2NwV2La2rmGl4rZdhBw2KVWGN8tyGELBMOYgmGKXCVUuk
 5tzbeRmCwwl6G/0m5hCMaA5H+Cxt7zdTuoAyqHSO6nwp8N8QJePlANU+OV+/4jN/YxJEd9P
 /F2SOPaiS0V4fulc/tXzdmuDtpVey5a7QOprJ5YEZDddgsRvWMYj4oVR0vi1qzVOfrhq+kE
 CYgXIi7WFvYkYDkxSlHoSKB5H+g/u6Q0n/ncRXh4yxpfmZCwDRQORT7QzMyw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A105547AB5
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 21:59:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8767610F3D6
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787350567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zA1LeFPAQat9KKPEkh1443J5kCMSRDAY5hs4TF16uEk=;
	b=ImkV0cQjW14BDf+Up9L6mcYNOnXr01LUr2/eVgTKD78NBfCw9d3QcT9JcgX4lt+gZrw1g9
	bbjeOWnt+k9X3O7E/0kW07BAj+wlLe6rR54+80MuoNYRRhaXFZYHExgviugHDXKMx9xPXf
	zLwg/SZBlWj3MfI2GtGxqrLU4M2/l50=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-AN1nR0wxM5-yKAFj5d_zYg-1; Fri, 21 Aug 2026 18:16:06 -0400
X-MC-Unique: AN1nR0wxM5-yKAFj5d_zYg-1
X-Mimecast-MFC-AGG-ID: AN1nR0wxM5-yKAFj5d_zYg_1787350566
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8f1e4e0eac1so11777526d6.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 21 Aug 2026 15:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787350566; x=1787955366;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezCmUh0WjbjOP5OmNgWXgB839nnjB9OIOQSsdtH9W/0=;
        b=odrPaX/020jgnhzXlC8KiZI3Exp5zJaxOmPWU4nvFisnHOapSGyTdSUQqFx8RNCyF+
         vcCgXl8qhYCwQpaIAOMst0tggGHP0lEyZENMljktnH2oPGjN8DirmVMUFgnDeFdiOX6N
         lkpiuB3LjotBawkNpsEPkJK4Okrtl+wk5IntotX1Mpdp1nP6exhivYZIDkzDiuwA7tib
         rFNMB3Lq3LrPcjn/inTKIq4qYyWcitZEFkXZKFedpgRWCdmIakRDi4e1ZctKSARPNPHR
         dpqd/Mt2ll6AD8i4rs2L1UY7aS7+KskRI/ABUKWDq1M/P+uSn4WM6evrOoq9qrUAwn3G
         HQVA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrg4fE6xXTs5Aztw7jhhVr2S0g8e1H47TUKs18GHVEqpvEs5Up/dStBJuapZQEmWF3Dk4DE/p97@lists.freedesktop.org
X-Gm-Message-State: AFuF++nwzk/zQd9bj5ohbB2WIH5ryUPL+2y35NE3Trgm/xwoNVNJXwkN
	swM2NKRIaQswekvhA6ZQ8Y0aNcPm9yKW/gw0RscW5oSH0/shiBQCb9Canwu8uJnmXNfqHyY9gDQ
	wIZoL7fBJGW+bHtM+HRaM6LjmPEXYSz2ZgLS04+Wu4590tNVPhn4BpzKnAe3UHgKeG7s=
X-Gm-Gg: AR+sD11NZTquMgDZlNcZz6WspbIRpTUYQipXbnL3BCxXUoXszp7O1mLv2U7VbDNPIe0
	khFa0D44klrCOsy3jgxelKb92JbC3Taj7bm5sQ4ZMe1yGT++9aa/1bjlzNLU/RRflTdDzWY4S2w
	L7r93MrfyS4Vcs2DW+Vs6c+makFELuTHj9MWuEueAatnvf5OmFrzRtXdFV3/ZZK3NCUBYkaKoWM
	s+7RRZ20v9hDuRzaUvHXyTNFmRk0c7qTOvEynMVBleKhGlNtpq9Ilr3uOcKYjdGqOROTHAQaQ1v
	dDmxUKkVf+X/w0uesfG8P8OeP4r9fndqkDesYwWorvSLl3W78n59M/Dkma12QuRVt3T/ohHy
X-Received: by 2002:a05:6214:4a8b:b0:8f2:fbb1:cec4 with SMTP id
 6a1803df08f44-90c80c5fdf2mr88542996d6.19.1787350565837;
        Fri, 21 Aug 2026 15:16:05 -0700 (PDT)
X-Received: by 2002:a05:6214:4a8b:b0:8f2:fbb1:cec4 with SMTP id
 6a1803df08f44-90c80c5fdf2mr88542406d6.19.1787350565414;
        Fri, 21 Aug 2026 15:16:05 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5edb5097sm73053326d6.9.2026.08.21.15.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 15:16:04 -0700 (PDT)
Message-ID: <734e126e531e320e281361579ba8fb190bff032f.camel@redhat.com>
Subject: Re: [PATCH v2 09/10] drm/nouveau/dispnv50: program pixel clocks
 above 2.147GHz on GB20x
From: lyude@redhat.com
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	linux-kernel@vger.kernel.org
Date: Fri, 21 Aug 2026 18:16:03 -0400
In-Reply-To: <20260820164929.17117-10-mohamedahmedegypt2001@gmail.com>
References: <20260820164929.17117-1-mohamedahmedegypt2001@gmail.com>
	 <20260820164929.17117-10-mohamedahmedegypt2001@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QtJjJiUOoTEq5nojZ4W61NHwvSkJ9XcuQHvcJhx7XBQ_1787350566
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2WY2YDIWLD5YR7IVUGHJ56FJKC5W7MYL
X-Message-ID-Hash: 2WY2YDIWLD5YR7IVUGHJ56FJKC5W7MYL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2WY2YDIWLD5YR7IVUGHJ56FJKC5W7MYL/>
Archived-At: 
 <https://lore.freedesktop.org/734e126e531e320e281361579ba8fb190bff032f.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2026-08-20 at 20:49 +0400, Mohamed Ahmed wrote:
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
> index eeaeb15aa664..678cbc78ca9f 100644
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
> +=09ret =3D PUSH_WAIT(push, 14);
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
> +=09 * (EvoSetRasterParams9()). Truncating would scan out at
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
> +=09=09=09(u32)(hz >> 31)),
> +
> +=09=09=09=09HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MA
> X(i),
> +=09=09=C2=A0 NVVAL(NVCA7D,
> HEAD_SET_PIXEL_CLOCK_FREQUENCY_HI_MAX, HERTZ,
> +=09=09=09(u32)(hz >> 31)));
> =C2=A0
> =C2=A0=09return 0;
> =C2=A0}
> diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
> b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
> index 0fec6fc21d44..5754878ddc69 100644
> --- a/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
> +++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
> @@ -734,6 +734,10 @@
> =C2=A0#define
> NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_BYPASS=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 20:20
> =C2=A0#define
> NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_BYPASS_DISABLE=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 (0x00000000)
> =C2=A0#define
> NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_BYPASS_ENABLE=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
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
> NVCA7D_HEAD_SET_SURFACE_ADDRESS_HI_CRC(a)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 (0x00002150 + (a)*0x00000800)
> =C2=A0#define
> NVCA7D_HEAD_SET_SURFACE_ADDRESS_HI_CRC_ADDRESS_HI=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 31:0
> =C2=A0#define
> NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC(a)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0=C2=A0 (0x00002154 + (a)*0x00000800)

