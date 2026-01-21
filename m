Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EE1D262B0
	for <nouveau@archiver.kernel.org>; Wed, 21 Jan 2026 06:06:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 836F610E6C2;
	Wed, 21 Jan 2026 06:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ayOwYbv4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8741D40111;
	Wed, 21 Jan 2026 05:57:30 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768975050;
 b=ODgGcnPvAvGdzLjZBL/j+DDh16COjFVSiUS3M3pzp+D7X+zu1jxRLcSv3ZIhgrIbR0Get
 rkxegFL0de3ISbnL7tZGhHV892J2vwlx6yUzp5RSKeBpW5SBrt7DhyVNuXA9GWmAyu1ehID
 Cbh4c0ZxkBN0/QNf4n6GdHSNh70bcdupikN6lJQ5/vjhxJ7E1I5wG4OwNIYtn23vHAcqVP9
 2hJmcD1Q3Uw1CopywcQG+Vc67CTZUTf5Yoycr/bmFPuf1FSg8761+lfun7u4l+DoGsAQ3HG
 stWfZXmIJBDAXsqUkiA8t+Yy2p0AZwXADWvTW98iKp3YTh+4B0YrxfNgnfow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768975050; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Z7UojO72eVbVg73zkaZW8PxUfBtrnWv4riC70q+KrZ0=;
 b=PAtD4PdRzKV1DbLMg+vSLd8urjdCUJ9Yw+d10+rH1LYTKZTBl/8NQr3eDI02VyB4Wp+Mt
 KP3YcUGgkXMvH/U4FLcw7K4y5Tr+D3CMR4kjJj0CdSFrRyMrIW698HprPKvIlQFDPbAI91M
 IldNL/z2aZxKaDcWQFkiQebVkAv2KOD7bJPbqz6vLIDPbjhtTUl5QvVQtGy/tM/Ixu23S2C
 smf7BDVJxDF0hOFMhK0xSbyM4t5i41WQKqBe3UCA2EzVOtJW2TrUGJak0i3lIeh1dxJmB3e
 MGUdPzldPg5SD0K4y5YwTTl4CHX2VubxLhW2HGmmYWmCbSX3vLTV170N592w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 96F4C4003B
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 05:57:27 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4684810E6B4
	for <nouveau@lists.freedesktop.org>; Wed, 21 Jan 2026 06:06:13 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-88fcc71dbf4so47626296d6.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 20 Jan 2026 22:06:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768975572; cv=none;
        d=google.com; s=arc-20240605;
        b=M/yb5kfleWSEsq3zF2D+G+jRPfUKTu/UHdSIKz++U3tMkpuZ2b8gQryFxh6PHlilYm
         8zj0rAg8kpuY7JxH/U6Q8lpO+1noOMj/XTXVRCESWJH6ss5BqjgS5uPzFkVWUTOvN6QX
         UBTsdXkcvEWQpOGJQCT6SA3unaRM7cYyS0Hy/aqzGo8XAhHQ0wYpvtWekEVAAO4cPT3Q
         hEa4drEB4dIGv35DfzZOAukJEtRJEIjHvkoItl/Ves2b7vkSi7tbUOrZewC7Tp6iQSUO
         xCDy41UvxNLOnAhqN16HNWLq8GdTbUszVJXqEW1rP1ENZQ9goK/4SwNyfEZg3ogwPNZD
         cVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z7UojO72eVbVg73zkaZW8PxUfBtrnWv4riC70q+KrZ0=;
        fh=H8wZYYC241CBNw2RXArgW6QsN3Rg5cRSrNt/oK9GIVk=;
        b=e+HYTBfp12Qw/xtSLUmLVXlOAh0FaEpX2E6D20u/xep9M4RkIb0POHBg4SiXYgxGei
         w6peI0ky/XBgahw+xv3+HBvlqEwgPM6hngGOCGtIboca/DvJSbnMyoOyd4D00xigjSnU
         flJGMY2Th3sSHjXG2L3kzJMVFxASeriwxSXFi4LU+JRvivdkswJt0GIEbr/yiXrWBlqu
         GzV7ksa0rgV6hnHX/3o5CgB/CoH4rVNfgKPRpLVorU1toerK0O+d5bgzVjMnLs8Km4ay
         OIZr7eo55rohyGEOtTBBSuTj5SxIMAHMrNDDmiwbLQnsZ+BpX5eKaHC2iMnKP9WCPZD5
         W0qw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768975572; x=1769580372;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7UojO72eVbVg73zkaZW8PxUfBtrnWv4riC70q+KrZ0=;
        b=ayOwYbv4wuxpKnWkpb0JQxZCkBxS6whzWUTmFnG4/rsua+B9x2Vo6IXcWIOO5rXrgB
         FZhdjaTJHfGNzI/68f1WTu7S6WG3VmqHNcqPZMvKnKz3MG4NtBAZTj+HmLRxNlUXSnJX
         mQisR9vexl3k10gpgw/Mre+DZyhWa7skeLQTeNi3GS3nnFtwQHKPSR0qY9dJNHGmQp9g
         4Lpz/YgxPN23j0otQok5DRlbTmSAvD5okUfqOUKJIcIpqXegaRP80ZLiF97xqnOwJEkp
         c2ZzZvkERuLb3td+Ql8XETYSiUEquacQApS+3fOxI00js4msqnLUyEZR24o0xBVPBibM
         hErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768975572; x=1769580372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z7UojO72eVbVg73zkaZW8PxUfBtrnWv4riC70q+KrZ0=;
        b=IrY6ShLM7uRKJ8a2SOxlwPiX0ZjtONt0PRpV8dpeP9T4ltfywkcezj2xVH+HCWykVh
         IKm5ZLpNH6aAN98jC9hYX7xl9UJqDhOk4xMfNTGJE9yGuohVTPeOf0fnTVvulGUGtjy5
         eAx9+FKA+vYVlPAD8US0N2N2KUNFcOilp28XD8+LtmUfDuai+xnkdvfb6kQIk/rgXBEE
         rLmg7hnZQYCfnN3S73OFvNB8fDOI40FmVoBDUnvzkqMjU9Gg11iDkCEiMIJ9ZXc0DDPL
         uJf77c1fVrE0Dz63WzvPChn5F18x3FJ6DW8QIj0k8jcC/FlpGFvECkEJwh6bIQx9PBNZ
         AKag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhxyR/AY78+s+lPlhA/uzje22HD5XOx5ReZ1YuCJy0f4Zh0u82ZmCA0DOcIROCrmkikrOHdtCc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLUI08s75NaZm9DS1q5ctcU9wGpYbIm+zVgLCiuhwBl+q86jxz
	jJcrwy5mJ3dK1FtLXXXrYLiCpQe1KYEGzjkcjBniE1J0IL2tVqO6P7gQMdyKvg5iS6uHtZMlp2K
	4gEx8l5syTqrSniUY/gOTCepMEesYV/0=
X-Gm-Gg: AZuq6aLDtkNw+EB2lthXLfn+cH47xw7Ll5chgR8clEQGe5crersgY2/r5eBMMpe5nR6
	JMKMQt0GpnhCaI1d62kQXtCacWw5ZQYDOEZ9yuK/emj8kqHayWZG596EvSbtgSDmG902B7jnv7U
	6lZor1Lj1FIKEZ2+/uD96QWEJigQya1tg/Od/6tHns0X5BGCMYUvyqm27A+NC3pP2euT5aBWAwe
	aGGU0BgKMrtKXxKMpbSP3y9rHIgikXc2mb2DzB3PcSrO+E7o/tc0O9sRV1hW3idcwg6RNBRsrws
	gRqoyksYRDmINGDeMqF++MwQ3Ed+gNC3NmBXRarR8becGddAU453LB6PHp3loDd2fg==
X-Received: by 2002:a05:6214:3007:b0:890:2df9:c6a3 with SMTP id
 6a1803df08f44-8946391947emr59560006d6.50.1768975572034; Tue, 20 Jan 2026
 22:06:12 -0800 (PST)
MIME-Version: 1.0
References: <20260120121455.142960-1-me@linux.beauty>
 <CAPM=9tw-Mkw95g=VDgjvqQha8KaTM7e6Qs2b3bvTaNUdz-Q7Kg@mail.gmail.com>
 <19bde085588.1b451560725069.154128025837198067@linux.beauty>
 <DFTV9NQTFFU0.NOD8PPU8HW8L@kernel.org>
 <19bde331fbd.dd44bec734977.5910036498943757747@linux.beauty>
 <19bdf152a97.5ffa0a07806790.470935296772844852@linux.beauty>
In-Reply-To: <19bdf152a97.5ffa0a07806790.470935296772844852@linux.beauty>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 21 Jan 2026 16:06:00 +1000
X-Gm-Features: AZwV_QigfFK2fLqZfST8Ad7KET0n2cYjnEyPoN4JddxN7P9HrS2OyyM7MmT2BXg
Message-ID: 
 <CAPM=9txNMnPhaCO9PJb=-kptgWia=18TbfFnQ1W03Cj3dLDCsQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau: pci: quiesce GPU on shutdown
To: Li Chen <me@linux.beauty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YFKFA64ZA4NRIG23GKQGO42QSJHMI4EH
X-Message-ID-Hash: YFKFA64ZA4NRIG23GKQGO42QSJHMI4EH
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Daniel Palmer <daniel@0x0f.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YFKFA64ZA4NRIG23GKQGO42QSJHMI4EH/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9txNMnPhaCO9PJb=-kptgWia=18TbfFnQ1W03Cj3dLDCsQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 21 Jan 2026 at 15:44, Li Chen <me@linux.beauty> wrote:
>
> Hi Dave,
>
>  > Hi Danilo
>  >
>  >  > On Wed Jan 21, 2026 at 1:50 AM CET, Li Chen wrote:
>  >  > >  > > +       usleep_range(200, 400);\
>  >  > >  >
>  >  > >  > Why is this needed? it at least needs a comment.
>  >  > >
>  >  > > This patch is needed for kexec/KHO/LUO reboot: firmware reset is =
skipped, so the GPU may remain in an active/DMA
>  >  > > state and the next kernel can fail to re-init nouveau. We can=E2=
=80=99t call the full DRM/TTM teardown from ->shutdown() because
>  >  > > userspace may still hold DRM fds during shutdown, which triggers =
WARNs.
>  >  > >
>  >  > > So the shutdown hook reuses the suspend/quiesce path (safe with o=
pen fds) and then powers down the PCI function (D3hot)
>  >  > > to leave the device in a consistent state for the next kernel.
>  >  >
>  >  > I think the question was about the usleep_range() specifically. :)
>  >  >
>  >
>  > Thanks for the hint.
>  >
>  > That usleep_range(200, 400) is just to give the PCI power transition t=
ime to settle before an immediate kexec jump.
>  >
>  >  It=E2=80=99s mirroring the existing nouveau_pmops_suspend() behavior,=
 which already does udelay(200) right after pci_set_power_state(..., PCI_D3=
hot). In ->shutdown() we=E2=80=99re allowed to
>  >  sleep, so I used usleep_range() instead of a busy-wait udelay().
>
> Dave, if this is ok, I would add it as comment in the next version.

Please do,

Also with that,

Reviewed-by: Dave Airlie <airlied@redhat.com>

>
> Regards,
> Li
>
