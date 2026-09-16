Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B94C982CF
	for <nouveau@archiver.kernel.org>; Wed, 16 Sep 2026 23:54:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CCBE410E415;
	Wed, 16 Sep 2026 23:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SiSRZ2Xv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B40C54817B;
	Wed, 16 Sep 2026 23:36:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789601801;
 b=jTkaRqHVRR2SX5ohVg4J2OCY5+dHTu1VzmT3/IvMGzb4U00cMyn1i+H7EaEjERQtKT0rm
 i6lmxme2Lwzrl27WTOdjEZXb0BZzPnNKBse/jFSVeXuXUc2v37FsbQyKT5YYt+L7qsO7Lyq
 uEG0vTSkhQv8TYpfdXYX4MFZzuvT40t+J7Mj0Uo4ES0zSIEyLMZP2Jrn+tTKkMEdrcLdEFN
 3M2z7CoeaAzMPYgm8UQb8xTTbEd44YO1+6i1rPeYkWaxFrtM3ugTebHp+Sz4moDnPGpSr7L
 dkZJXjsk6w43RYFCIlx0CqcHUfXV7zBdZOhpn23X2eQs7rTQBuXGVumD1H0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789601801; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hzPhM0cpITyXs1Muz62V+gilV41wWL46LsD2m7YxMD4=;
 b=BpPCCBV6fq044qmlvSbEgxZdovcCxAcYLG8041vnV/kyor6ziHNyy5XGHLbdH22HuVOZK
 fs7LvNeI7R52JrIh4EFaNLkmcNtCLE7RHA1j8RQb1cqu/laAuuMw5jfymhcfNGFqN30rTuQ
 IUHUY+r3yw3pkPo+WxLqznmR09p+asQIToyygEMyoXnnGPSiBw6G2KgPk2q232P1p0lJ/fT
 xcHdWiQ+W8umsK4L0g8QtdluQ1rv4U874r4FgWoMdWGC5uHmr9oGzfHJh32HiKkf0XfpKC1
 f6YxrIyZoSru3isF6OhHrBOa4YbqTx0dgRWUZr9RymOaiwpAQkxmna4+Gq5w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AD3ED480F5
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 23:36:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8305D10E1E5
	for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2026 23:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789602852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzPhM0cpITyXs1Muz62V+gilV41wWL46LsD2m7YxMD4=;
	b=SiSRZ2XvwCeZ65RNUkzsy/cbnPU+WssScjF2VcU6My3yZq/haviRme/ps6URfnm0TYxc8z
	ie4zbD+FZw6D+mLnK8Hw7rPnze3i6B7iaFJlW/iFs5kWFd8aV6hfzQnHp00xOnr6ERgO6Y
	mBkb9Q1TCx33zFh/xlokJxUkjL+rLEM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-litxi7N_N_m6R0h9NdmNHA-1; Wed, 16 Sep 2026 19:54:11 -0400
X-MC-Unique: litxi7N_N_m6R0h9NdmNHA-1
X-Mimecast-MFC-AGG-ID: litxi7N_N_m6R0h9NdmNHA_1789602851
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-53094ff7090so6213691cf.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 16 Sep 2026 16:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602851; x=1790207651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzPhM0cpITyXs1Muz62V+gilV41wWL46LsD2m7YxMD4=;
        b=kOQ/DxJ4GAupiS0tEPyyAsuEXJOowPoU3IucGLS+mYdsJkwdAlGwPwVthKiDVIytoY
         YhxIVlU7NtAh5KdLzfMs/2pfIg59sMtrQvWIIVvf075asc2IKw9gXSn+AKDLxOYsI91S
         U/KEiLi7IspdJ82iFXZ99GbNZettv08MZA51dJv1rlv2Q6aiB4nhDMtUf3S9/bAFxgia
         bizkkxyYUozlyZJ9Rt2vqlY5CZrkT79oZN/NWmpTBtif8CsXRV9pfhjob4/vYD2lkPbl
         c8nb2gC3MO4Of9u674AiBCaR/wimNZFhY0kgp9rkFTEZK08GPRh1rOA0+kEwyRIZ7AF7
         eZkg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxMv4lxIgGoWcCHFQsa26PDyjd0YLkL0n+18bzm37uQcNXR9T5fAmkihiSZQgxkPiKEqsuSDsvd@lists.freedesktop.org
X-Gm-Message-State: AFuF++nSA221K9oZwsC9jz3B6fZsKSjrO3KtmXxLKoMd3cfNLbC+Z/Y3
	4UzJWQfxPBoxrUl/2pvP5s5anIau/opl3PaKPL+z/se3ddPV2W+s7xxrHQA8JJwwDxm0UQq+Qlv
	jWh7UkxvsNT966o8hd/m7ZWkWOrAFctP0dyRib78yQ3IQ9NmtwJiDNGJC2PDesSSezOnhOO9SmQ
	O3zgtty7oouFvT3089z4p5TpcFYONZJ/YJuDUwZBRrSg==
X-Gm-Gg: AYBFou0rc38rEUHZRl9VMuaN4Tuh/eyw6IXHdYYdTKYx1/e9vEnrSMqGfv8pD3w/kVA
	Hr7I45po04Gu3MYXjWPRCIJsH7s9BZGkTAhFLjmQVjfBQBAKh230FKPFGsLoJtfelOb36x2rMLx
	EUpYMSztkm22xj1EVW2fq+6xWCJgctVEcsvJet96YtV58TNVNMPhjGm9M58d3C1i1XmfJ5r/OTU
	5lq9wCGcXX3+5hS
X-Received: by 2002:a05:622a:5c07:b0:531:4a1:fecf with SMTP id
 d75a77b69052e-5327f205baemr75469201cf.5.1789602850720;
        Wed, 16 Sep 2026 16:54:10 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:531:4a1:fecf with SMTP id
 d75a77b69052e-5327f205baemr75468981cf.5.1789602850383; Wed, 16 Sep 2026
 16:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260916223358.507351-1-lyude@redhat.com>
In-Reply-To: <20260916223358.507351-1-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Thu, 17 Sep 2026 09:53:58 +1000
X-Gm-Features: AcwNN1Vpx5SyQyvxSmIp5NIx5rhO2o5NzGsoeUHN5bDWmRFbcrc4SeABQVS8KHw
Message-ID: 
 <CAMwc25oJvW8gRjZ5J3+w2xSNyfjTT1X-MAiYPSPmq_-SB+=goQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] drm/nouveau/gsp/r570: Follow OpenRM's runtime PM
 process more closely
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4tJF5SkrX7DwSKxlYhuCAWo2mBIHsR7t04QM88jOuo4_1789602851
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OOG5CUN2SW4FRLLEUSGMNFX5KQCLRD4P
X-Message-ID-Hash: OOG5CUN2SW4FRLLEUSGMNFX5KQCLRD4P
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OOG5CUN2SW4FRLLEUSGMNFX5KQCLRD4P/>
Archived-At: 
 <https://lore.freedesktop.org/CAMwc25oJvW8gRjZ5J3+w2xSNyfjTT1X-MAiYPSPmq_-SB+=goQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Sep 17, 2026 at 8:34=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> While we have runtime PM working a lot more reliably then in the past
> with R570, we're still doing things a lot differently then OpenRM. For
> instance, we don't save/restore comptag backing stores, and we don't ask
> GSP whether it's OK to enter GcOff.
>
> This series fixes this, and gets our runtime PM process to look a lot
> closer to OpenRM's by implementing some missing pieces and workarounds.
>
> Tested on my daily-driver desktop with an AD102, a ThinkPad P17 Gen1
> with a GA103GLM, a Dell Precision 7780 with an AD103, and my test
> machine with a GB206.

I've replied with a couple of minor fixes but with those applied.

Reviewed-by: Dave Airlie <airlied@redhat.com>

The rules for devices are 0080 ctrls on device.object and 2080 ctrls
on device.subdevice.

Dave.

>
> Patch series based on drm-misc/drm-misc-next. Branch with patches here:
>
>         https://gitlab.freedesktop.org/lyudess/linux/-/commits/nouveau/rp=
m-openrm-sync
>
> Previous version:
>
>         https://patchwork.freedesktop.org/series/173901/
>
> Lyude Paul (5):
>   drm/nouveau/gsp/r535: Add support for INTERNAL_GCX_ENTRY_PREREQUISITE
>   drm/nouveau/gsp/r535: Add support for MEMSYS_GET_STATIC_CONFIG
>   drm/nouveau/gsp/r570: Add comp mode workaround from issue #3172217
>   drm/nouveau/gsp/r570: Start saving comptag backing stores
>   drm/nouveau/gsp/r570: Enable Gcoff in fbsr again
>
>  drivers/gpu/drm/nouveau/include/nvif/cl0080.h | 10 +++
>  drivers/gpu/drm/nouveau/include/nvif/device.h |  1 +
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  6 ++
>  drivers/gpu/drm/nouveau/nouveau_drm.c         | 13 ++++
>  drivers/gpu/drm/nouveau/nvif/device.c         | 13 ++++
>  .../gpu/drm/nouveau/nvkm/engine/device/user.c | 35 +++++++++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    | 10 +++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
>  .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 17 ++++
>  .../nvkm/subdev/gsp/rm/r535/nvrm/gsp.h        | 52 +++++++++++++
>  .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 77 ++++++++++++++++++-
>  .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c | 36 +++++++++
>  .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       | 29 +++++++
>  .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        |  7 ++
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  3 +
>  15 files changed, 308 insertions(+), 2 deletions(-)
>
>
> base-commit: 5589ef09f93b85b6f506e279a502d4cf1654f232
> --
> 2.55.0
>

