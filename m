Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F39AC982CF
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 23:52:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1C910E363;
	Wed, 16 Sep 2026 23:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Tp3UOjzn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3649B48176;
	Wed, 16 Sep 2026 23:35:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789601707;
 b=ytAmt9X3/PPmfdqVnZv26SUmtjHzXNuyiGElnNjYE+s9kS3Yamsfgr//RzE3L/wOgl1Q+
 HWppQkT9oYN1fFopRBqqnnijCG15ndOHKu60OqFHlcB9LRoxySXZwrutnfOCE4XFGmbT3rd
 fuwtggEI2uwrN5r8V75U7NHJgW33sX1sdT4GuSL6v0WLgIK4TvSfTJZ5pHRYB/jIwimB4Dx
 Zh+IuYoQjE4Xu7QO4fh3QryXw9mkcr+gDplssNpUoM8i/1YmcspejP8Wil6WKg6mFMzO1gS
 vPeTAKRzz/wiZRI4xA7kabDvfVNEWmMz1Ik5SFx//TsmdUl8kvtNBEw+TvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789601707; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XxveY0gK9JFrEbJosmnsDKRmBotP9lpgucyith6XnGI=;
 b=CvXhY1v/NMNwNe0lVGHKlK1vOC+wgTtC1v6ZZ2QKIIkJrNPlFE6m1QzFndLfUHyXEljDU
 S6tTXDGg0uqgGn6t86BlDGSn2lphp3HK1PpRh68BHBpoabQZdos8MRdksTzU1+RISYjLl4P
 TFTzbI+Old9sLo5xFybLoYDtHT6aaGtq0Ah7xj3yKc0HSsbEJMuU/4I3e+MBEgft88ob2DM
 auCeTlZ79NcgqzmFhtPAqyz/hSvjHYvQ88gXKTnZyUmCWCE/I329GNyDe21rpFIn6IRuA2p
 8KEmtEvAkV02UxIUKXu099BGVPtu/21QjTmNQgMZngBekPvCfsMey39zK+Hg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D4F0E480F6
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 23:35:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 01C2F10E2DD
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 23:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789602758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XxveY0gK9JFrEbJosmnsDKRmBotP9lpgucyith6XnGI=;
	b=Tp3UOjznlzCttT5mESFPbK4up+YpyfmLEi2M2I2JszLVNYt2OUBxblqoAD9IyL4gxTURYj
	i6xc2zsGdQueMXDffIz1i2VoRb2lseCySo00eBXHYR7GzifLeGKx/epuiPqHhxAhyMnQ+e
	cyvOHLOjGeIW6nsZJD1Hq8aAsiLcqPI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-98vJfAp7PQ2SbL8GO9Q5xw-1; Wed, 16 Sep 2026 19:52:34 -0400
X-MC-Unique: 98vJfAp7PQ2SbL8GO9Q5xw-1
X-Mimecast-MFC-AGG-ID: 98vJfAp7PQ2SbL8GO9Q5xw_1789602754
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-91064f6e75bso7585476d6.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 16 Sep 2026 16:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602754; x=1790207554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxveY0gK9JFrEbJosmnsDKRmBotP9lpgucyith6XnGI=;
        b=RRK+r3kVN8QdOLV1kShcYHxV0tN02DPL9EAPC0xZV7Qp0onfhcGPI0rgXiH1dy0IHA
         bOJDvAdZA55l+Z3A4VrKqonVNysFN8K756gTrQrPSVUd/yQY4s8DSdfHpq0Fc9VhV2C2
         V1PtEHEwWNre0l1apevg9M1F6XwoFOSf9fmddcMolKv040OiP8CtbBT/Fk5JYni0ogEo
         DwM/XEYWA6FN1/+dYis0777/d33UYl+UHXoiccALO/IatcK75L88zP357GXBrw7X979J
         p83qVpvO93cYMWBOYzf3pchJVwb+ICpQ8FsfUoe2jaFeOl2ascQyzvJl/4nUnl4SgbdX
         2BBw==
X-Forwarded-Encrypted: i=1;
 AKwUvByzuKYodkS3nrs+7PvTfToXka+oG+JfhZR5F6JCwyozAbr3UaduuVN6elc5zsn7Rf0h6bMGGGse@lists.freedesktop.org
X-Gm-Message-State: AFuF++mOFNL7fOZ6pY7kHfeu3vZtrthNYK6220Io94MMl/FgTia8ux+a
	NFtqLKq1/dpT4q+33SUWea6YBqyvTZ+yODJv3plUKdMu1jwRsiwG8KcMD+N6HQYwQ1zrymvP0L9
	f1EgVMkY3nMb9HSRGpqy+Aky0l2rJkZ3Sr//Oes2Sy4hD1TE544qWVwwk08+puX+cUErQT70OzP
	JPFBiZe2CxF8/Si48BnliURaxP78DRnukYXq6CuwLTqQ==
X-Gm-Gg: AYBFou2QBnQOKQONLqTwJwcEvM/T2eTonGLFuwm2i5pjXdbUUh2zWOBZ2j655aRVzW4
	ggjkPDJpcl2vPknqchBXOwviK85WDbHiQ8OSRsLyYw7fnmMzrhok8e0QUUXqF4WjVN1hHm2bMCb
	J2fmmzF1T633CP4YalvKFoH2hwHoXnpAIPKq6jl+uLm8Uubi7WROhVFowcYKw/G3gvmtxNF8apU
	Ul3J+WjHvzSLhwc
X-Received: by 2002:a05:6214:cc7:b0:912:c32:f67d with SMTP id
 6a1803df08f44-9123d71d88bmr87785826d6.5.1789602754212;
        Wed, 16 Sep 2026 16:52:34 -0700 (PDT)
X-Received: by 2002:a05:6214:cc7:b0:912:c32:f67d with SMTP id
 6a1803df08f44-9123d71d88bmr87785576d6.5.1789602753822; Wed, 16 Sep 2026
 16:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260916223358.507351-1-lyude@redhat.com>
 <20260916223358.507351-4-lyude@redhat.com>
In-Reply-To: <20260916223358.507351-4-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Thu, 17 Sep 2026 09:52:20 +1000
X-Gm-Features: AcwNN1Vhn0Q92zF9XK_q_kVcWg67HkJPIJKmLIMdoKKm-T5YZ3FSW1jZ1gt4KBo
Message-ID: 
 <CAMwc25o+rVLRvHPqmurPJtPnqHupx4SNz=ZSrStwKm+GEejFng@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] drm/nouveau/gsp/r570: Add comp mode workaround
 from issue #3172217
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0PWYk38Qhmg_MkNp5TmLRQGzvV5nFe9rH72sJpdWQaw_1789602754
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QUFGFKUEVAXVDOEBYDFVNM6426GP6BAZ
X-Message-ID-Hash: QUFGFKUEVAXVDOEBYDFVNM6426GP6BAZ
X-MailFrom: airlied@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QUFGFKUEVAXVDOEBYDFVNM6426GP6BAZ/>
Archived-At: 
 <https://lore.freedesktop.org/CAMwc25o+rVLRvHPqmurPJtPnqHupx4SNz=ZSrStwKm+GEejFng@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Sep 17, 2026 at 8:35=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> One of the things that OpenRM does right before initiating fbsr is apply =
a
> special workaround (nvidia issue #3172217) which temporarily disables raw
> compression mode on the GPU. It is later re-enabled after resuming with
> fbsr completes.
>
> Since we don't currently save the compbit backing with fbsr, this shouldn=
't
> currently make any functional difference in the suspend/resume process. B=
ut
> it will be required for implementing support for saving and restoring
> compbit backings from the GPU.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---
> V2:
> * Fix gsp object mismatch in r570_memsys_enable_raw_comp_mode()
> * Clarify debug message a bit in r570_memsys_enable_raw_comp_mode()
> V3:
> * Enable raw mode before rescheduling FIFO channels
>
>  .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 48 +++++++++++++++++++
>  .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       |  6 +++
>  2 files changed, 54 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> index af5aa5065c3dd..fe618a94461dc 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
> @@ -26,6 +26,35 @@ r570_fbsr_suspend_channels(struct nvkm_gsp *gsp, bool =
suspend)
>         return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl)=
;
>  }
>
> +static int
> +r570_memsys_enable_raw_comp_mode(struct nvkm_gsp *gsp, bool enable)
> +{
> +       NV2080_CTRL_INTERNAL_MEMSYS_PROGRAM_RAW_COMPRESSION_MODE_PARAMS *=
ctrl;
> +       int ret;
> +
> +       ctrl =3D nvkm_gsp_rm_ctrl_get(&gsp->internal.device.object,
> +                                   NV2080_CTRL_CMD_INTERNAL_MEMSYS_PROGR=
AM_RAW_COMPRESSION_MODE,
> +                                   sizeof(*ctrl));

I think all 2080 need to be on gsp->internal.device.subdevice

Dave.

