Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6990CD3445
	for <nouveau@archiver.kernel.org>; Fri,  8 May 2026 18:54:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA0F10F5D0;
	Fri,  8 May 2026 18:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UNR6cmvL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7F5E545E21;
	Fri,  8 May 2026 18:41:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778265687;
 b=Q35/rCeZLFoxPmVlqdRIz686IpWW9zIhIZ/xdAFqHJDsLIgcPfmocSUCuMri2tBx+L4Sz
 3pRF9iBENj1jGsCE30J+uYQKqicfMYtgMF/lqGdZ7x3k3zIPUThkp1FScXsbfpgxZwlUALE
 5N++oFd6hh+Od7d0DsQx+Q8vBh/IbOVp+7xjxncQu24Z2+Igoh8i+h8cnh1GjeO2uodP3Q4
 Lvd3UKr6M8eRxCyRWm9pWj/kVAyXUou9ZLvKcd/a3Zo+JNBbPx7Pyp/ybnb7aZFup4NKro6
 mX7gBhKyBmKpsrJBAGFqWP4RQVqIfkMYYloNsrTkHyafL/NyVEzZv/tdjA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778265687; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0YhjsTWluBMG0VD0yeK46oKsqKSKzhoowDRLmjDkdWY=;
 b=xxyTuqu5svuuDCwFxBpsrKPQKmypGteiuNfpqJXkGURswmacTY+mKTlHvfO120dnKjKlg
 TVoFl5oPYITjN4sS+ifi/8QUkP/W2z4/UdMPRX7eCBtU6aiMH5jUcjsClHmeWd7uiG3JNrR
 8cZvrMv5ngj1pSfPBjSJcwx3Vsaqcy9p/dSsxfV/AOH/jkc2RxBfdf9uwtqTmMiUMOpoy2O
 H/xZ1ZhIl0bvg6ABy/1X2mI/XIu6tMcUJmF0chto8gybgUzAr1XJgF0CG+qig3CHriq+Zfc
 HGrHz0XKf9sstAytYkNTO5ahaYcH4YjyG6iQuHfwWeSN+TIFEpdBfyLU2Qvg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 58BBD45E16
	for <nouveau@lists.freedesktop.org>; Fri,  8 May 2026 18:41:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E266D10E348
	for <nouveau@lists.freedesktop.org>; Fri,  8 May 2026 18:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778266448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YhjsTWluBMG0VD0yeK46oKsqKSKzhoowDRLmjDkdWY=;
	b=UNR6cmvLj6cQEwtkFSbPF9/jsVFEDk71mfEHHNPNJDgHJ2yK1SRtm9A9LSXE5Hlths8UnD
	2kSofuwiQn29MzTsvqxrVUONh5C5aivwYx09JoJpI3F1bC3QJPRcHOu2gy/TpzVh0XiuEF
	K5ctpI49UkENUkClYwwJhenlNwqAOss=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-pqNjEXl6N0q5T8GpOwJY2w-1; Fri, 08 May 2026 14:54:04 -0400
X-MC-Unique: pqNjEXl6N0q5T8GpOwJY2w-1
X-Mimecast-MFC-AGG-ID: pqNjEXl6N0q5T8GpOwJY2w_1778266443
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50faf575af4so52941731cf.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 08 May 2026 11:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778266443; x=1778871243;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nw5Hfi8KU2h83icRdaxsQgdWasba3ZiPDgOGZW2eFxA=;
        b=i1ZQ2a/3nFSI0dxo8WcXvl5TkWaGrnQ/syos1qEVbnn6oBlaG08CgvemWpx/lXrlJC
         49FPdKk2qAc8q6rxqgXCGMJ145r+WxgCStfd0JLL4bJa1Yi5s/c8PL9uuw3i4zIHkMWm
         yeKjywwBoXNG4IKgA79IjrgnkFVj4iBN6Ku8v+62GwYTwUlAlMSTI5xu5PqhHJcCxJY4
         U8AudhWOxDKFP34UYsrIAuk/t212fpIxYBS92DzfgjNL1lV5fq5pKJkqNvteD9dIGswY
         yC6axpLqd6X5F9uF/U9p4+bNZqXrRoGRpewyoLS7X9lMX0iGChdEdvMvTrGPy9Eq8wb6
         lzFA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/MAgMJt1qMJ5t25Md/DR9FWVS2Rrf4H0a6im61NJ/c7M3FYi+gyjXUm7Xdux8e7qAiC12Xlqfd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycZluEo0pR49dQ7vFw7OiXCp2+YVVMMirEeGDJe5SAbu0D2Mti
	F8xFLYROGL+SIJhI4xFxLXvmn9WNKy6QQjpe9Kbxk8PJ2q+iGnPElh+ET/ubVP00Lj1bR8wwZms
	ZQFZ5jDh7XvMm7meZMrWv5Gep2TQHQiaL7jkfONBsHuB5Z/9t8y6W0cq2QCSst3J8s34=
X-Gm-Gg: AeBDieuSz8/MKWPUvvTgQ+yGlVJhIe7WWOZygBPaJw8D+JTX+lin/VseK/CU6hzZNCW
	aBeZX1htGwXSs4u5/CFeO+l+CoNZD2bYKheNZi/NQktL57rlkJqC3X6d0oUGXakI6btOMqxA9hO
	8uAFREZNGJqZb9NXQIJa6l/qEdjqsYDj4f3GR60d6awrrV4jf3kjie7BSUvKg5nHUGEN7O1p/Ed
	+IFP0giVm4Moj6YyfFgVBvu7TwgnO3T6CFvWKbnYAUnsduxQ1sRs6M/pwPT1xKhqUc0Lunt+CWH
	TqyIPR8kCE/XLUvh4Mgh4s9Sj8fPHW2oeXIqB4hyXTJNrdYxhTCjAcMO836QddXSq3aK4OmAKQv
	Kb0BF0N4dlXPOCR0a7gJMMZoqgG+G
X-Received: by 2002:ac8:59d3:0:b0:509:23ee:b9a5 with SMTP id
 d75a77b69052e-514619ddbddmr188660071cf.5.1778266443458;
        Fri, 08 May 2026 11:54:03 -0700 (PDT)
X-Received: by 2002:ac8:59d3:0:b0:509:23ee:b9a5 with SMTP id
 d75a77b69052e-514619ddbddmr188659591cf.5.1778266442983;
        Fri, 08 May 2026 11:54:02 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5148e7c0289sm27365411cf.18.2026.05.08.11.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:54:02 -0700 (PDT)
Message-ID: <e76465b097afa44f472294b0fdf775b7abd7da95.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/gsp: Use kzalloc_flex() for r535 display
 funcs
From: lyude@redhat.com
To: Rosen Penev <rosenp@gmail.com>, nouveau@lists.freedesktop.org
Date: Fri, 08 May 2026 14:54:01 -0400
In-Reply-To: <20260508052056.1744665-1-rosenp@gmail.com>
References: <20260508052056.1744665-1-rosenp@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GnovDusge6DnlVPRipTP-UzHm_DzHsmCYNUuD5YZfxs_1778266443
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: B4LLL7EEQBMIGJUCSYRUHMCRXZUWKMMQ
X-Message-ID-Hash: B4LLL7EEQBMIGJUCSYRUHMCRXZUWKMMQ
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/B4LLL7EEQBMIGJUCSYRUHMCRXZUWKMMQ/>
Archived-At: 
 <https://lore.freedesktop.org/e76465b097afa44f472294b0fdf775b7abd7da95.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

There's one change to make below, but I will just handle it locally
before pushing:

On Thu, 2026-05-07 at 22:20 -0700, Rosen Penev wrote:
> struct nvkm_disp_func ends with the user flexible array member.
> Allocate the
> r535 display function table with kzalloc_flex() instead of open-
> coding the
> size calculation with sizeof().
>=20
> This makes the allocation describe the object being allocated
> directly and
> keeps the fixed six user entries unchanged.
>=20

I assume this was the AI talking, but this sentence seems like a
nothing-burger. Will just drop it from the commit.

> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> index 6e63df816d85..1155f079b0c3 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> @@ -1734,7 +1734,8 @@ r535_disp_new(const struct nvkm_disp_func *hw,
> struct nvkm_device *device,
> =C2=A0=09struct nvkm_disp_func *rm;
> =C2=A0=09int ret;
> =C2=A0
> -=09if (!(rm =3D kzalloc(sizeof(*rm) + 6 * sizeof(rm->user[0]),
> GFP_KERNEL)))
> +=09rm =3D kzalloc_flex(*rm, user, 6);
> +=09if (!rm)
> =C2=A0=09=09return -ENOMEM;
> =C2=A0
> =C2=A0=09rm->dtor =3D r535_disp_dtor;

