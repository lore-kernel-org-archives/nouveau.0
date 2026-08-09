Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086DBC5AC80
	for <nouveau@archiver.kernel.org>; Sun,  9 Aug 2026 06:07:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 856BC10E0E2;
	Sun,  9 Aug 2026 06:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nRIoj6KL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 45E2747653;
	Sun,  9 Aug 2026 05:51:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786254660;
 b=z06B4eDGxdNFQ6y/0C7wVLZzopyZ40SZtKPJUuCnblOQLPYPCH+q5QCBHKadsE40eFgCf
 fASqmnQ/br+KNDrcDU6ra8EOHRyn/KlKM75r7ieQxQvwKJbftK3c4aTS92uLA8xJal6DMRs
 kKDbhK7m3AMainbJrn0OHhfyhXKlAxjwuTbPC1vh6ZU7rlpPKJbU9EMy0cnxmnoC3XgdIhN
 gArg/VZdVtjwVOQpjFbkw/pFNWDb7ZxOMcskZ/WyZHFKMspa1+RDU6ceaodZoebJu2MY70P
 Jru870LurKTt1nFZV0jUp6YajfH+FNREEWNkG556ukBf1xHrMOpprVLo+zUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786254660; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YpmkqxittInrChlb+wwaxzd9ar8fv5VvkAor8BQUeUM=;
 b=Qd6UWE30eSkJTZIXa+Wy2JJpZA8K9K0jvE9u0WOs5FjAWDE5agIC3dJGBHpQrRh/T22Ti
 lYE5xQRMJ9+XMnlpIpMvi7liIlE5rx1cYa24l4kxOwubk3do1rvOgBvPESzENygBG1qdDYU
 OHOhI01wUfzsXKxg7gD+fVEJdgOweq8JKvNUV/h4lrYonBkDYwNhnOdvtuQTJRbq/kGdNai
 7FK39DzZS/l7/4p04tC9s1nkNFFtydtBdCpDJBzqwS5zx5HgXG9RmEmv9tJtg1VqCDQ+KMl
 O8KOyZUCH5rY0+c8nLy8nE7VC/cUxerTDr+54G/rArBDc5M+6dq3I2475QmA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1047347622
	for <nouveau@lists.freedesktop.org>; Sun,  9 Aug 2026 05:50:56 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D30F710E0D9
	for <nouveau@lists.freedesktop.org>; Sun,  9 Aug 2026 06:07:05 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5b021916bd3so931424e87.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 08 Aug 2026 23:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786255624; cv=none;
        d=google.com; s=arc-20260327;
        b=CgHazobD2kb2d8WkEjYHFWzuVDzoRQEUxo8yitnewJUqSfHSWAFkzgz2o3+qTKq4rR
         g9lSeyznB3ReeBSjk6sv6JRw3UNf+XVm3VWeOKQJSfJEAlCoU5rfQFU24W9kW2n/2xlm
         sYJCmeYCmG1UpSFI0CC/BmnsghNWcG/qJWDGN+KeTLgKVlfSaXMG/Cl/26eK69S/nXgP
         iaDaoX+kIU1RYyvI8nghyTeG6/pjaAjAVBc/iaJiGPYTftELYUP1QlZXYByFI5Iv9vGR
         S6W2yC8G707THMH+Fi3afzJ5KZ4rdhblqkNRIJpVT1hanOzaEcbBA41NaW1MLBuUvlRW
         1sjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YpmkqxittInrChlb+wwaxzd9ar8fv5VvkAor8BQUeUM=;
        fh=9S/tzy3DBKVo47c2PkosA+KusMfb5QYaMxzoPCk/EsM=;
        b=cOfmrMkZmsWjH0X9hPYR1zWOwjEO9gFZeBke4mTzfuDPbddSiZrKCTNipPeES7UIfj
         nUoI3AUUfX4BDOexCaYFDg0L8TwfwTDqZPOYmNlLtsmR11L6zHgcw6eY4vQzqBvhuBJ3
         ZZCpIoSb9er1xJSrJYoQLqIB/GbQJ1j2wTbOrr/hWUueiojN4j/kHS4ES0VSXXFfzQSM
         Q+88aVs6+zFKo7JDyFNcQnxi3sQD9/cXhFBnQErzqOb216zxj9xn5sWir5PvlRcXDq3v
         Tl2Vsb4cuoWCeRUCbzrz213tfKfRsMTk6w3Eg8XulpLUZtLATW1m35WXXU1fvfWwgv9R
         oMMA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786255624; x=1786860424;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YpmkqxittInrChlb+wwaxzd9ar8fv5VvkAor8BQUeUM=;
        b=nRIoj6KLON7ayIl9ULLDYWsOHhOIEMvSELDybw/sasYdAmDKB/n01i2bEmdB4BWwoj
         xmqoKuj9McA3Jf7faGjAlrnKxChhjXrbDkr3G9sfd4HGAan+tlY4bZgNp2IDCmwEks3j
         jbuLRO6LM7Tg7Dz4Q5DodPSVF8RhsBdbwLfuFy8rTI52Sz2KETutvT29hZz2VJklmJqY
         ueqn3QLjplSLU7U7gNZvgg6SvpoX6sCIWOv4ltXUIs2PajxO1Hwc88lmLyy4dkIQUauM
         IanUJhMIubADeYYrS/1drkWM+KUBBBzJHkVwGddQ+H9vqkB5SPEUv7AG5KcyXFLm20c+
         mcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786255624; x=1786860424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YpmkqxittInrChlb+wwaxzd9ar8fv5VvkAor8BQUeUM=;
        b=parfwIKviSR68UEdkRKIgVS+7sanXDwRbXBPGrS+IWwdIN0pdMMThh2koLGEj6K+3B
         qQQj/U+JErYorvsb9BZSGyPMZL3HDnLf2uqT6wPo7EpfSZ8mglEscPShTSMqzUSUdhry
         +KZhnp0undX4oVTXo96uN5fCibGIBVCxHGPT22h6MXGr0dR7DtKH1ZuyhqIKWrSbm+Lu
         NNF8FT3nTH1IQdP+qLGH/q5PoxnEK1OfhgOfkrJgFLvcMDop03Z+2wISVM1IRiGEgfFR
         PMUPaVPBeV1XWXOcrNLmE5KcVD0RLtEvgxNdFDOR2ipakR3i97Nbpqq3tYzHrq7bTY9c
         Wg6Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoOfIsV3HknJqasW9+yJ1TIn/OSM0XFv1tQdmOmI5MmjF3iL4O7z6AX3HQGuFLfVC4/qDcRIGju@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPXIxgZq25ZbX3nacFfpnHuFKmImg1w565afI5NTqvQUe0PiA0
	yEZ/5IT0c8XaPcNFkd6m6ybqXyjN4WV7dlj1xNMhlgpHqYEN8ZmEqI13l6C/ZxgE8D45qYY9bma
	VRpEZL9X8EVzHQ4l5i3Zkhoeia2zIbSQ=
X-Gm-Gg: AR+sD11WdOIBLUq2jAp30+KB9qU47Ts66CeYNMbT4y4XEAIDPsjetOr0eiioogNdyXm
	I2I+qvdS4gILbuW4yz/YIt5/CUO16DD8I07nVpF+7XZF/AXnhLAf/L7aPQspZwRuh0AyPuqzycO
	7XptuzLkGsOETyspEPd6W++ADunQKQUvG3clpN3OmVow2qbJaAhKH5GaVYlme18OetqttYJzASG
	N1SinKcvG4afIctvreyaOj2HTHm5WGHZNurJBYYRU3rlbjal+/7FqpSCdyR/Qt5jjZVoYbGjw0+
	525HrRmV0V6SKiahsMn2nAeRJ6JEK7mRdSbjPPzAyobeI0Dg0S2X3SFdc+0sD/4uo23Q1lGxQUT
	C6RcJ2rCM5YBlNzv6ntrd1IVbwSsFnw==
X-Received: by 2002:a05:6512:68c:b0:5b1:5f7e:1ca2 with SMTP id
 2adb3069b0e04-5b30b770f9amr1464459e87.32.1786255623565; Sat, 08 Aug 2026
 23:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260725-tegra-coherent-wc-v1-1-dfdcc929c21b@gmail.com>
 <67fe34eebafe657b3221ac39838440b294c60444.camel@lynxeye.de>
In-Reply-To: <67fe34eebafe657b3221ac39838440b294c60444.camel@lynxeye.de>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Sun, 9 Aug 2026 01:06:51 -0500
X-Gm-Features: AUfX_mx8KQxE55mPFvf4bCdi1Ci4tN_R-8PURcVW83QA94nVGU1-lMotJniGcXI
Message-ID: 
 <CALHNRZ9Jg=NQ-i5G8q4vdOgwgUUKDAdi0+VXUnHU2Ctpo74YAw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/nouveau: Use write-combined maps for coherent on
 Tegra
To: dev@lynxeye.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: P7JYXDMPOO3ED3NLXNE5IPKJEPIIRN3W
X-Message-ID-Hash: P7JYXDMPOO3ED3NLXNE5IPKJEPIIRN3W
X-MailFrom: webgeek1234@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Faith Ekstrand <faith.ekstrand@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P7JYXDMPOO3ED3NLXNE5IPKJEPIIRN3W/>
Archived-At: 
 <https://lore.freedesktop.org/CALHNRZ9Jg=NQ-i5G8q4vdOgwgUUKDAdi0+VXUnHU2Ctpo74YAw@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 28, 2026 at 3:38=E2=80=AFAM Lucas Stach <dev@lynxeye.de> wrote:
>
> Am Samstag, dem 25.07.2026 um 18:28 -0500 schrieb Aaron Kling via B4
> Relay:
> > From: Faith Ekstrand <faith.ekstrand@collabora.com>
> >
> > On Tegra devices, uncached maps traslate to device memory, causing
> > unaligned accesses by userspace resulting in a SIGBUS. Instead, use
> > write-combined maps to ensure proper access.
> >
> This is not only an issue on Tegra. All ARM64 platforms translate
> uncached to device memory, which does not support unaligned access. So
> the issue could happen in the same way when connecting a discrete GPU
> to a ARM64 platform with PCIe support.
>
> I would argue that there is no downside to always using write combined
> memory for coherent buffers. You gain potentially faster writes while
> the only issue is that writes may get delayed visibility at the device
> side. However, I don't think anyone uses coherent buffers to modify the
> content from the CPU side while the device is operating on the buffer.
> For all regular use-case the memory barrier in FIRE_RING() will make
> sure that the buffered writes are visible to the device before the
> commands using the buffer are made visible to the device.

Should I send a new revision that sets write combined for all coherent
then? I only have Tegra devices to verify this on, so I can't attest
to how this affects discrete cards.

Aaron

> Regards,
> Lucas
>
> > Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> > This patch is marked RFC because there is not complete confidence that
> > the change is correct. Without this change, nouveau can easily hit
> > sigbus errors in Android UI rendering via nvk or running vulkan deqp
> > tests on Tegra. Changing coherent maps to use write-combined stops the
> > crashing, but it is unknown what the performance impact is, if any.
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_sgdma.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/=
nouveau/nouveau_sgdma.c
> > index fa3b4ebf38a83..10f6ef1c541bd 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> > @@ -72,9 +72,12 @@ nouveau_sgdma_create_ttm(struct ttm_buffer_object *b=
o, uint32_t page_flags)
> >       struct nouveau_sgdma_be *nvbe;
> >       enum ttm_caching caching;
> >
> > -     if (nvbo->force_coherent)
> > -             caching =3D ttm_uncached;
> > -     else if (drm->agp.bridge)
> > +     if (nvbo->force_coherent) {
> > +             if (drm->client.device.info.platform =3D=3D NV_DEVICE_INF=
O_V0_SOC)
> > +                     caching =3D ttm_write_combined;
> > +             else
> > +                     caching =3D ttm_uncached;
> > +     } else if (drm->agp.bridge)
> >               caching =3D ttm_write_combined;
> >       else
> >               caching =3D ttm_cached;
> >
> > ---
> > base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
> > change-id: 20260725-tegra-coherent-wc-19941d1a5a60
> >
> > Best regards,
