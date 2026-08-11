Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F57C5AD7B
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 01:16:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 33F9110EA31;
	Tue, 11 Aug 2026 01:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=faith.ekstrand@collabora.com header.b="W6imkZE4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 082D947684;
	Tue, 11 Aug 2026 01:00:31 +0000 (UTC)
ARC-Seal: i=2; cv=fail; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786410030;
 b=ppg5I6yUPeK2FfwKq/wTymfFeCiDAjiIgomtbq2X+aV5QaMqizQ615hT3FcFNgbS1rIIJ
 YI7KTwXKLcffNngrbP2Puss/zl9NhdtuMeho7w+Mb6GwbQejTn2ObDQvig15MR7JRHKB7X9
 KWXL99pnd1W+cAQxQS52WXWlf+U39MYqZgRuJpVM7j0PoZNsXmlXZmi+5byKIN4OURctBTR
 NQVdp+lNiVOlL564DQEX158lxljpMMqkRIS6pnKprNZ4calK0eA6VMxbgxgW53fPtytpj7Y
 HUy43UCf3AAIXis2f+0ZH9ZwUJrQ4ig+i0477Vccs6t7AGFkTO+egTRJS0hQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786410030; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JGKBQYYb1upxXdsc1VDTCgRhH60CNH1HNvdXsZhZhkA=;
 b=gPW8Srkbp97bI9gUM8bPiu3f2P1nPo2WpBkgA2wxILF/ZtUyQhPk/RcBlvFmonrsDPdDz
 s4dLAmXvX1NjPDhpI4wUl/slbPYeXm/b0Q4qEsB6581dlQ8bHHIA7JpEf5EEaUQU1TSA2cM
 /RjXnxF0kGhxPZDuCsZHCF0dz8hWlJAr2p7FVgmBHkpem5pZph4aqb2zpXmCG1hPXAf6b/n
 arcA90GUdEvsKwDiuYnyfJ9Lp2gV7I7mbk2nzH0ExIzQMVfQdF936i/yBzrA3R3JZeThOeo
 CCtw2yroYVDrDQnH/Z7cMe+QjziXtgkqiT6gaqgTK5A4TPqOvplNdOepw5rg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=faith.ekstrand@collabora.com;
  arc=fail (Most recent ARC-Message-Signature did not validate);
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=faith.ekstrand@collabora.com;
 arc=fail (Most recent ARC-Message-Signature did not validate);
 dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A6971473BA
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 01:00:26 +0000 (UTC)
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Tue, 11 Aug 2026 01:16:40 UTC
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6775710E241;
	Tue, 11 Aug 2026 01:16:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1786410080; cv=none;
	d=zohomail.com; s=zohoarc;
	b=naHig9FKg+UwziJFBLMOKCamqd1aWyc403juo0pkOIf13in5mptCkrxB/gQmGe3unp+OXRdFl348Lrnhxp+ivnoXvIZ6YWCLBmnIGJyM/aeXv7wIB5vpOUsKtbwTv+wD+OTMJRbMVB/eCPoAlqzFCMhXrsVcvr426kiCVOLOwZo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1786410080;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=JGKBQYYb1upxXdsc1VDTCgRhH60CNH1HNvdXsZhZhkA=;
	b=Guqucqu2vdFaz2YUbEF0whFCwbiPOdMRB4rEvGqEMcberzBNv6CzWRXgjopQBwnUH6nImOczCl6199CcMAhlRpA3+DswXAQx14BZtEDGiJX2fyoER6StxoLU6ScYd4bZgic80umH/oH6bflhWU/JcRjvANU85OId9ufAui3eSdc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=faith.ekstrand@collabora.com;
	dmarc=pass header.from=<faith.ekstrand@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786410080;
	s=zohomail; d=collabora.com; i=faith.ekstrand@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JGKBQYYb1upxXdsc1VDTCgRhH60CNH1HNvdXsZhZhkA=;
	b=W6imkZE43LfuKP5ONqCe6NZbvuomHMrWJRSZbg/nT68fKKpHdYYnPYOnaLUf+8zu
	dUitS2cXsqUH+044nz3uRr7X2MwARDHdU+CyBnP8K8LmJ3XWK3us9eTYJYDaCEcdyJB
	SwEP0K5F4/Tzo2HItTsHJCdpdbDnna/loX/yGmh0=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1786410080037397.08614927222334;
 Mon, 10 Aug 2026 18:01:20 -0700 (PDT)
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1786410078818973.1558608767025;
 Mon, 10 Aug 2026 18:01:18 -0700 (PDT)
Date: Mon, 10 Aug 2026 21:01:18 -0400
From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: "Aaron Kling" <webgeek1234@gmail.com>
Message-ID: <19fee56924f.82459cc61103651.6241601648149454872@collabora.com>
In-Reply-To: 
 <CALHNRZ9Jg=NQ-i5G8q4vdOgwgUUKDAdi0+VXUnHU2Ctpo74YAw@mail.gmail.com>
References: <20260725-tegra-coherent-wc-v1-1-dfdcc929c21b@gmail.com>
 <67fe34eebafe657b3221ac39838440b294c60444.camel@lynxeye.de>
 <CALHNRZ9Jg=NQ-i5G8q4vdOgwgUUKDAdi0+VXUnHU2Ctpo74YAw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/nouveau: Use write-combined maps for coherent
 on Tegra
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Message-ID-Hash: HLK5GODLJUEHWNO3YRENDSEMZO7OEEYA
X-Message-ID-Hash: HLK5GODLJUEHWNO3YRENDSEMZO7OEEYA
X-MailFrom: faith.ekstrand@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HLK5GODLJUEHWNO3YRENDSEMZO7OEEYA/>
Archived-At: 
 <https://lore.freedesktop.org/19fee56924f.82459cc61103651.6241601648149454872@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



~Faith Ekstrand



From: Aaron Kling <webgeek1234@gmail.com>
To: <dev@lynxeye.de>
Cc: "Lyude Paul"<lyude@redhat.com>, "Danilo Krummrich"<dakr@kernel.org>, "M=
aarten Lankhorst"<maarten.lankhorst@linux.intel.com>, "Maxime Ripard"<mripa=
rd@kernel.org>, "Thomas Zimmermann"<tzimmermann@suse.de>, "David Airlie"<ai=
rlied@gmail.com>, "Simona Vetter"<simona@ffwll.ch>, <dri-devel@lists.freede=
sktop.org>, <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>=
, "Faith Ekstrand"<faith.ekstrand@collabora.com>
Date: Sun, 09 Aug 2026 02:06:51 -0400
Subject: Re: [PATCH RFC] drm/nouveau: Use write-combined maps for coherent =
on Tegra

 > On Tue, Jul 28, 2026 at 3:38=E2=80=AFAM Lucas Stach <dev@lynxeye.de> wro=
te:=20
 > >=20
 > > Am Samstag, dem 25.07.2026 um 18:28 -0500 schrieb Aaron Kling via B4=
=20
 > > Relay:=20
 > > > From: Faith Ekstrand <faith.ekstrand@collabora.com>=20
 > > >=20
 > > > On Tegra devices, uncached maps traslate to device memory, causing=
=20
 > > > unaligned accesses by userspace resulting in a SIGBUS. Instead, use=
=20
 > > > write-combined maps to ensure proper access.=20
 > > >=20
 > > This is not only an issue on Tegra. All ARM64 platforms translate=20
 > > uncached to device memory, which does not support unaligned access. So=
=20
 > > the issue could happen in the same way when connecting a discrete GPU=
=20
 > > to a ARM64 platform with PCIe support.=20
 > >=20
 > > I would argue that there is no downside to always using write combined=
=20
 > > memory for coherent buffers. You gain potentially faster writes while=
=20
 > > the only issue is that writes may get delayed visibility at the device=
=20
 > > side. However, I don't think anyone uses coherent buffers to modify th=
e=20
 > > content from the CPU side while the device is operating on the buffer.=
=20
 > > For all regular use-case the memory barrier in FIRE_RING() will make=
=20
 > > sure that the buffered writes are visible to the device before the=20
 > > commands using the buffer are made visible to the device.=20
 > =20
 > Should I send a new revision that sets write combined for all coherent=
=20
 > then? I only have Tegra devices to verify this on, so I can't attest=20
 > to how this affects discrete cards.=20

Yeah, generally we should be using WC on discrete cards, too.  The big ques=
tion is if nouveau is doing some shenanigans behind the scnenes with cache =
types.  I'm pretty sure I've had this discussion with nouveau people and we=
 came to the conclusion that uncached mapped to WC on discrete for some rea=
son.  If we're getting actual uncached maps instead of WC on discrete GPUs,=
 that's a serious performance problem but I don't think we are.  I've CC'd =
Karol in case he remembers what's going on here.

~Faith


 > Aaron=20
 > =20
 > > Regards,=20
 > > Lucas=20
 > >=20
 > > > Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>=20
 > > > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>=20
 > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>=20
 > > > ---=20
 > > > This patch is marked RFC because there is not complete confidence th=
at=20
 > > > the change is correct. Without this change, nouveau can easily hit=
=20
 > > > sigbus errors in Android UI rendering via nvk or running vulkan deqp=
=20
 > > > tests on Tegra. Changing coherent maps to use write-combined stops t=
he=20
 > > > crashing, but it is unknown what the performance impact is, if any.=
=20
 > > > ---=20
 > > >  drivers/gpu/drm/nouveau/nouveau_sgdma.c | 9 ++++++---=20
 > > >  1 file changed, 6 insertions(+), 3 deletions(-)=20
 > > >=20
 > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/d=
rm/nouveau/nouveau_sgdma.c=20
 > > > index fa3b4ebf38a83..10f6ef1c541bd 100644=20
 > > > --- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c=20
 > > > +++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c=20
 > > > @@ -72,9 +72,12 @@ nouveau_sgdma_create_ttm(struct ttm_buffer_object=
 *bo, uint32_t page_flags)=20
 > > >       struct nouveau_sgdma_be *nvbe;=20
 > > >       enum ttm_caching caching;=20
 > > >=20
 > > > -     if (nvbo->force_coherent)=20
 > > > -             caching =3D ttm_uncached;=20
 > > > -     else if (drm->agp.bridge)=20
 > > > +     if (nvbo->force_coherent) {=20
 > > > +             if (drm->client.device.info.platform =3D=3D NV_DEVICE_=
INFO_V0_SOC)=20
 > > > +                     caching =3D ttm_write_combined;=20
 > > > +             else=20
 > > > +                     caching =3D ttm_uncached;=20
 > > > +     } else if (drm->agp.bridge)=20
 > > >               caching =3D ttm_write_combined;=20
 > > >       else=20
 > > >               caching =3D ttm_cached;=20
 > > >=20
 > > > ---=20
 > > > base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93=20
 > > > change-id: 20260725-tegra-coherent-wc-19941d1a5a60=20
 > > >=20
 > > > Best regards,=20
 >=20


