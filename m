Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A175EF99DD
	for <nouveau@archiver.kernel.org>; Fri, 13 Feb 2026 22:07:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F1BC410E843;
	Fri, 13 Feb 2026 22:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="rUAKvq3X";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 50A8F42DA9;
	Fri, 13 Feb 2026 21:57:41 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771019861;
 b=NVBIghGPKYovs+q/OEYv4lwyqZJya7iHftofD+BnFqtiLlJ2zpsnuaPxgS52/3+8hMPsX
 9YgkUZy9AB5FWE7ikA1TkwJB+POUKinj65XW3J6Y7VaSWHWZU7d1/ZOe0YCR9zBOgktlFu1
 b8VT1F1+kGkZtXnoOFDgkoB/8JmmGWP0Z5NG0ABL//a72ojAFIIcsqqRzA8NKeThoLIssA4
 3XUQunANVGfVbX7ZTWcgRA76r9pRHPqv+Gp/IEHzODTxRW5l1bIcyTnU5s1wm0i/e3sXNv8
 O4Jwe4NASWB/TAsGDIuae3cPH2fnUwL5w+Pa0cTtS56bnbquVJXCHu9cdtmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771019861; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DL8wMAc57bqbNTeHsP9udij3SwqaDpC6X44tvY86qXU=;
 b=E5pjAW2+080CBTnJs1UuiVsiMu37gZF/w/I1qVXpCcqOSrA/jCkpvwZr7El0qR+BLyogi
 cCjPqbjwl+GzmU81rlkRKEK/NM3KJaXqa5Q53IQmo8A7j+eU+YQtNPRpuWhddIfyIu7v0cr
 XlkY4S3bHffOnl/0WGgd8z4AFPlG7RqIT2YbSL6hoEXTlYPwhxFgnKmCU2EUvAFPv2Xqdr1
 rrZZ3Qr5ID8zoQpxAI1GN4X4zZeXBGNEj0hqwrWTmbWBeb3k4C2EjsONGPbT57V54zwDEKH
 s0ZOETCGVSQiZ+gScgPjbD0nPjmudTRnknPw0vRx0wVDo2zj/YmbB3+VBOJg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3FFE241CAA
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 21:57:39 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B00DC10E333
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 22:07:17 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-65a2fea1a1eso5226524a12.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 13 Feb 2026 14:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771020436; cv=none;
        d=google.com; s=arc-20240605;
        b=S2d7oNDhlbgoNxjeqXei+9ncoNh0EWY1ATgXdn422+DMjN40YZWzzPQg4nG/uMvRY/
         1RCUzMl+dq0vV3n5CQ25SIQoubKVHs2Em794yPRf+l900XYWPHPE93EN3OoipUsQLFJM
         sv+JzguLEOBgIa4D22UEmyVyDszCUZb/89d0biia17IT/+a/t0FgSud/VTzAGU/B/mLk
         nWlsBX86QwLxj1CvMdPSKVatuMyxlYbp22jExs8HGEi7j/aby9T7kviu4BIuJCfrfTpF
         KfdTQjTxeVx42wc3hLDIig1UnUTblEu6gFx+53KPOi/CK6217kDU5gVvpx5jtesVqw0G
         oAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DL8wMAc57bqbNTeHsP9udij3SwqaDpC6X44tvY86qXU=;
        fh=6WNJtySSw4QZCahVqIpcAxnJwBEpzz65MQV5J6HBeiY=;
        b=a6XPND/I4tI5StNB+1ixjz0wRLS6RTNlSo8WDy3ELzoMW+EyGCvi5O66+knw9m3R10
         lnSLyRcgiTgvLH1had3/84RXj/mwgBBZcVvHI01iT6fnbuodrVAqts8QqmIj5az1mXwO
         yMV2Ixy9diRIRfmkniF4PLhcZHwJBTsub9F8KfNwqMrqIxoY4iqzJxdclxrklJTZ9Ga2
         RnK1EYuPBTuoA8vtToYg6nxl1Dj3DZiBGT0yGBo/wr2Y4aMxpD7XTzAYgAmL1+A0jJ6T
         EE1dXJXZip+Qxwn3DHziGOeVlPvtaZa6BWYD6Kn1tUmL85/MQH5pkOQzP4+Gevqv4lWt
         CwFw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771020436;
 x=1771625236; darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DL8wMAc57bqbNTeHsP9udij3SwqaDpC6X44tvY86qXU=;
        b=rUAKvq3XOkQSX73uDmgAT4VVhIgHrUHFGR9vYTiFwWpuFd+7N+O+Zt2Mk6JgOAO2Ic
         FUNXNQeOpyqhx6eLtp7jXDJgFfWv0jXHfUfWB5pNZ2zlDAEsWBdCsowHdWLAd82RNnDM
         txIdk96gHpWK/dJJY/kQ7xunLMO3dXpzIZ1GzY4BFeRkNXFZ7pz89hAstiA8ox344dil
         IEgZ+Tn1vCaBFJ9MkXRSmWnMQXvbE+tFSTBTb+mBvaomCczIJT0u8Fp2ALVV4BDvm8g1
         0cLX2+ETNohocIOhZMB5K4aU2QjDHxKR3hZ+gJ306Q4w9PXn2LK0leLuuwlm4Cm7Txrb
         gMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771020436; x=1771625236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DL8wMAc57bqbNTeHsP9udij3SwqaDpC6X44tvY86qXU=;
        b=QhTuhSPnoX9n2jw7Rd5nisvHtBwzMf0IDAiE0C3h3HzrWrncOLgoPl8Km7SQOL64oI
         d2fq3ENH5w7gWDRR5WO28iqjQNT6Gr8O0acZlpzn7Gb91Puo1Sm65/v537EXZXYBkbyO
         yAR9Pd95WCGgiGsT9fkls3YSHPyRoSleNUu3kNNmAgWHDLcQXmb5J4xSnyNrCbB+NW/N
         8isuHcx7Ap6k5ztZZuhoD8L+p+3O08tG0GPyC74XaDDxRwKXaioHqXOuXc2rv+1TAtHh
         YR7RPzluViqEM16D/WU2thdGR+iQCenWEEJdwDB4S4RgMQkUIzu6Hht0JwweaG2c/8nq
         oBGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd1CkD8MIDoxeS6+yNAAbMtGXOeNG/aVQuKMjxCziuriEN0dYjIQkqviHN0YUGhwrz02FujTKa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjS0oHcWaOifcbPsrxSE5V1Ke2nwnGSTW3MbwADq82E6wrVVxN
	JZBxPntNhJ3uPfZN16wPLG6SAM4KIlqA7Q2bMA9XJRZbjIm/ZoZ3zchqDfcCulXuM21sE8ksMVk
	0zekq7yb3s4qG4ZWN7y9ldtUt6MG4DLjj8q3CoIxW5A==
X-Gm-Gg: AZuq6aJgQ/zYOK/nnD4blQ/Q57c1C5+n44Q5y2SlU33Y86+6HAtBO5+u5igpj3oIndQ
	JXGixG4uiQLyzBkR6FyiW1C+hRlcOVQH8xruEWrD/s2pQIbD+rZKm9MNDmUI62pIf2f41Fazqtc
	APuXovs96pzU/zIkatPdduWQtjlMcxujkN6c4WRtFD6B4Xmo5vYl2uO4gZJVubwshvGq52b/UD1
	VdOerfs0SOoDhvVd+OvLmJlOHsqadzofQA6HWsDo90TtTH5Tf/Ny2NSmDrTsP/HoF4hvKZVFmoR
	F7fx4rUm1xxINvo=
X-Received: by 2002:a17:906:99c4:b0:b8e:7e21:133e with SMTP id
 a640c23a62f3a-b8fc06ad554mr99933666b.27.1771020435404; Fri, 13 Feb 2026
 14:07:15 -0800 (PST)
MIME-Version: 1.0
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
 <20260205-zcull3-v2-2-ac572f38cc7b@darkrefraction.com>
 <DGE03Z9YNGAW.3RUQ7P7L93HEE@kernel.org>
In-Reply-To: <DGE03Z9YNGAW.3RUQ7P7L93HEE@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Fri, 13 Feb 2026 17:06:49 -0500
X-Gm-Features: AZwV_QhA2ln9EmOt7c3z3p115W1c-p7mbF6XQu3-8Fn76SQW3316QUd_reHz9b0
Message-ID: 
 <CAAgWFh0FGMvvryFPQObyeNqFFkv2hS8NRpVFeQPEvxRSk174=Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VY5KXZ5IHR4IXKG7KGNJVAUFCUYRIO7P
X-Message-ID-Hash: VY5KXZ5IHR4IXKG7KGNJVAUFCUYRIO7P
X-MailFrom: drawoc@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VY5KXZ5IHR4IXKG7KGNJVAUFCUYRIO7P/>
Archived-At: 
 <https://lore.freedesktop.org/CAAgWFh0FGMvvryFPQObyeNqFFkv2hS8NRpVFeQPEvxRSk174=Q@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Feb 13, 2026 at 12:14=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu Feb 5, 2026 at 7:56 PM CET, Mel Henning wrote:
> > +int
> > +nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
> > +{
> > +     struct nouveau_drm *drm =3D nouveau_drm(dev);
> > +     struct nvkm_gr *gr =3D nvxx_gr(drm);
> > +     struct drm_nouveau_get_zcull_info *out =3D data;
> > +
> > +     if (gr->has_zcull_info) {
> > +             const struct nvkm_gr_zcull_info *i =3D &gr->zcull_info;
> > +
> > +             out->width_align_pixels =3D i->width_align_pixels;
> > +             out->height_align_pixels =3D i->height_align_pixels;
> > +             out->pixel_squares_by_aliquots =3D i->pixel_squares_by_al=
iquots;
> > +             out->aliquot_total =3D i->aliquot_total;
> > +             out->zcull_region_byte_multiplier =3D i->zcull_region_byt=
e_multiplier;
> > +             out->zcull_region_header_size =3D i->zcull_region_header_=
size;
> > +             out->zcull_subregion_header_size =3D i->zcull_subregion_h=
eader_size;
> > +             out->subregion_count =3D i->subregion_count;
> > +             out->subregion_width_align_pixels =3D i->subregion_width_=
align_pixels;
> > +             out->subregion_height_align_pixels =3D i->subregion_heigh=
t_align_pixels;
> > +             out->ctxsw_size =3D i->ctxsw_size;
> > +             out->ctxsw_align =3D i->ctxsw_align;
> > +
> > +             return 0;
> > +     } else {
> > +             return -ENODEV;
>
> ENODEV usually means that that device fell off the bus, I think ENOTTY wo=
uld be
> a better fit.

Done.

> > +     }
> > +}
