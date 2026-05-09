Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE247CD3447
	for <nouveau@archiver.kernel.org>; Sat,  9 May 2026 03:19:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B95010F619;
	Sat,  9 May 2026 03:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aG+XLVjB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B16DB45E23;
	Sat,  9 May 2026 03:06:26 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778295986;
 b=C2wBgsozipUmO9T31Me5TH+3XQpO2ywQ8OudZtSM57MaV4tGAIDMFVKsQu9ZbvasCkA/k
 Pv/5IU6vUYnpdYwh+ljO4THHRci0rHj74v2pKX9VdXdyDs6GjhU1/mRdYuMxMIFeB+R7Lcc
 zb+fnNuoJcDrYWsgoGvrpFzDugfewYQkkGI7t6PRfmnojov/yzJiYEdFeLC0GVmGGhjCHax
 g7AkD9NBGreVPKFZcKUS1eI0xSiKJ+Y9tM8JpPf+wM7lCNxbRoXLZrlOIBxYr+MWbzdJ9fp
 7DhVmqxeqzbmFs0DtIYFsmu7cxfwcqffqR1wmZRUU0bV36r4ndH0eUfRXfJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778295986; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CxMznwGJOgjrL67SxyQcq86ofqmaCMHw/Ooho7JXCtI=;
 b=bs+D4NdgZhFBGP7Zrc0vY+o20eEAuX+4TjWLXfEKGjUlsYhFkZPk86K2vrF27DE1WagAa
 MLQ2MU8u+XRUhs9bXh+tQi3ldPiD0Y8xUWkBWcp461Apn+yXGXIVzfOoFaSxonIaawkiNH5
 whizaJn4IJZ+veRRwOyPCxr2BuUSolEfbXlijyI/3qj3aX3pnFr54uJaiecYvosw5AeEL5u
 uOYbhRihr32cghSt1Ykx5mxoSI3G+1CQWwGGMTO1V+N50LUENz7oJg3+lm+rflC086bxFvq
 BhTJACX74PsX2EQKryvS/BZ3ej2tVlyrB3cXFj2HL6Hbx4RkTiz1o4n5xE3g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D1FD745ABD
	for <nouveau@lists.freedesktop.org>; Sat,  9 May 2026 03:06:23 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5469510E17C
	for <nouveau@lists.freedesktop.org>; Sat,  9 May 2026 03:19:09 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8f231f3b130so198818185a.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 08 May 2026 20:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778296748; cv=none;
        d=google.com; s=arc-20240605;
        b=eFzfTTT2/wOA7JB6ptcNTcw1g56NhROQegUnf1qPVRWuWisq/CE0OO3yDwNb3budjA
         qS/eXwzK61camRkcRgJL/+rEXa8G1TDjiq1S3+Fe3WycuHo7nHpLRVMEmaKt48ctxK2v
         /ikA6tCN8f3CYpcRNqBWqP8r75aY12L2R/w/qT93FUolOz1UgmF05d85wYsNLNs0a/P9
         QBVQKVxin9ezm0GdmCVoQ48ogignF1E/cGVixhnmJG2gk//4VrmvbfBCIdO1PeybmyeY
         Yz8ReTVtTaY3EjjXVFj+1OHH2oxXlbiCQZx4m/v758oSP13TC9QkL9Wk8Iz8cdzKay/W
         wCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CxMznwGJOgjrL67SxyQcq86ofqmaCMHw/Ooho7JXCtI=;
        fh=blh7vmZrIk2fvvPinQQTRahwoKvDt2s7Y5HYOdGiSgo=;
        b=hsSsniFtjd3fF8xZe6naHi+8cRUvm7QKoS8qvPyr0ugrPfTaNxWq5Ck3bQC9RLgMuq
         oSD/3Pl2VsfD2pGaHaKeaSOSCWvdlKWJRbI2MhsxYm966wH1TLtV/6hQHwHyqc+NGJm7
         kvL/LY04BtvpaKcdLqu29GCwVVklJwCHq89oldOapYnb1nAewVb/kvE9goPSriIH84qV
         c3nPMOW1MWhN8qhRp1pApmLTTRkJIQiARqb3n216UMJfHFcPro7wQSlc1e569DlPKSQs
         fkthX5IYgvLCnBrDMhkhWA3a1RlM4ePZvxUwl89wbQ1nbIjWsDGGkdhVjCZVPXKoioEG
         GlKQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778296748; x=1778901548;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CxMznwGJOgjrL67SxyQcq86ofqmaCMHw/Ooho7JXCtI=;
        b=aG+XLVjBmlQzzGglhjUguWbwrzBuiByKaTRi/ZH+O4qwH2DBwLooKaiLiiHkO+3qIL
         wNovf+ZkUCZ80587Jhvjgh1OjsTX97VH9vzsprGc5M4nCqeGngbbJz3IlDEK77ObP3p1
         +x15jbQ35NT9O+DON6yhnXDD62cg2wE15kUDpOmES1qr9E1x8+b/gjzb7ALZezq6cWFZ
         LKNZ3c4Lk4VaTLm6PjxDBKPDx4ujZpUXHNBru/lsotURiExnGAmE82UUIlafsqok8TzR
         KEoeNUwtANfB1f4KTQaTH9dkTGjAdEB7t9eKB9XL8jxWaSwrwK2lMKtgkDaOAMf6zXjI
         KZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778296748; x=1778901548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxMznwGJOgjrL67SxyQcq86ofqmaCMHw/Ooho7JXCtI=;
        b=NURRF8anUXMY+YfZUTpH5U1L3TcRRL/8Rldj0D/Of1KfeP8IaaZFosgUL37q+ED26V
         ficxSj0SRGPZ131nPcg/liHtqBTtfQ3RO9sNWSedrPKVEQRFnW3rLsZdLHrdFDrf7lw8
         VxQNL3Ef3C6PlKAbVjPFNK/56asdmIriG/U2bXJvnjlz3OPloRRfFmSZTgj87WwechGy
         akCIe50+ZKWBe+PY6WYdL1mmXBgzPxZUM2OdR9mGJdrTXVZpEBDqfwo7YHVinFE9V3eP
         mDFeBNjEChfamjZPEIve8NtgzeDLO4Rdt/kyCgUUuIt2QHS7SOakZPWzN0L7bM9qHdUP
         UcCg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qHN6X2DhR/pDQhuG389jhGHsa4NMlOgidIBle2JuQKnMd7R2uvQWyF+1iFLyu+6KZkzbkbMGB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuzDOMwNwzB5JtXIMh3FWMmeyEBN4nKXz9rMnzmuGMeHIorDuy
	PEoGdLDNcL2eY1S+Ig6DaG4jHJjP/ibYs4q8Vss2rAAIvBr80nYsdQsURWvmp6NOaAH39SQ+LQl
	C3wDXiMbeUkO7ytMb3rsD1EdUTduBHag=
X-Gm-Gg: AeBDiesXMJk4TKFbEOgRT5TprhJLo35m5nBXKEwnllA2zKqBb+0+W9pPltuge/QJeT3
	epwD25M6wAXj7cUX8uK6tZ27YjOJs3whMeHujtUHOAI/XlLRuze+UG9sMTBCNXJSo+yfYArFUdo
	Ljjr5Q7D/JHJlmkmtuS1bE0TIuO8eAwFjMX0RhsoEiBkHQe+N07ubCOYEeK0zTJfk4if88SoqI9
	Ir0PO/j3wMOm/u5Cuy1Vjn+H95s/K3Uc4szTfetlIo78tgvhBl9cV3w++b2HPx7i7tEH3QMuD8Q
	4xHcCewupgUTHOMry5TpBTEWdtbQq95Avrbxfy1VLhEL9D/utNNlzhyMVbKu8wZ1/yB1c9uuDNA
	8Jfoy
X-Received: by 2002:a05:620a:f0c:b0:8dd:7422:6934 with SMTP id
 af79cd13be357-904d68dee8bmr2359167685a.44.1778296747959; Fri, 08 May 2026
 20:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260429030348.3930866-1-lyude@redhat.com>
In-Reply-To: <20260429030348.3930866-1-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 9 May 2026 13:18:54 +1000
X-Gm-Features: AVHnY4JKAYfBzEvcCazoWW39EPzkIq8d6VGfmI7CrPBmf49am2bEWNkv5j3ODv4
Message-ID: 
 <CAPM=9tyeTxS+Dacc=YdXKrqC1OrrVG78EOkFv4x8f9ykcc3TFQ@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/disp/r535: Add scanline position support +
 head state support
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: QTU6KT2I2BK4UI4Z464BFRKRPXT3BPZD
X-Message-ID-Hash: QTU6KT2I2BK4UI4Z464BFRKRPXT3BPZD
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>, Aaron Kling <webgeek1234@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, Zhang Enpei <zhang.enpei@zte.com.cn>,
 stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QTU6KT2I2BK4UI4Z464BFRKRPXT3BPZD/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tyeTxS+Dacc=YdXKrqC1OrrVG78EOkFv4x8f9ykcc3TFQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 29 Apr 2026 at 13:04, Lyude Paul <lyude@redhat.com> wrote:
>
> That's right! It looks like this never actually got finished, something
> which I just noticed today when I saw this fun message spamming one of my
> test machine's kernel logs when enabling display debug output for nouveau:
>
>   [drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal] crtc 0 : scanoutpos query failed.
>
> So it looks like we've been falling back to DRM's core fallback for a while
> now, whoops.
>
> So, while it seems that we do have the option of doing this through GSP -
> that doesn't seem like a great idea. Mainly because reading this from GSP
> would involve a lot more latency then we should have for vblank handling
> due to the RPC communication. So instead of implementing that, just use
> gv100_head_state and gv100_head_rgpos for implementing .state and .rgpos.
> It seems to work perfectly fine!

Does the open gpu module do this at all, I'm just mildly worried that
blackwell might have moved stuff,

If you can confirm by looking at open-gpu.

Reviewed-by: Dave Airlie <airlied@redhat.com>

Dave.
>
> Fixes: 9e9944449023 ("drm/nouveau/disp/r535: initial support")
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Cc: Ben Skeggs <bskeggs@nvidia.com>
> Cc: James Jones <jajones@nvidia.com>
> Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Aaron Kling <webgeek1234@gmail.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Zhang Enpei <zhang.enpei@zte.com.cn>
> Cc: <stable@vger.kernel.org> # v6.7+
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c       | 4 ++--
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h        | 2 ++
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 8 ++------
>  3 files changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
> index dbd984da75014..0608266188d3e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
> @@ -253,7 +253,7 @@ gv100_head_vblank_get(struct nvkm_head *head)
>         nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000004, 0x00000004);
>  }
>
> -static void
> +void
>  gv100_head_rgpos(struct nvkm_head *head, u16 *hline, u16 *vline)
>  {
>         struct nvkm_device *device = head->disp->engine.subdev.device;
> @@ -263,7 +263,7 @@ gv100_head_rgpos(struct nvkm_head *head, u16 *hline, u16 *vline)
>         *hline = nvkm_rd32(device, 0x616334 + hoff) & 0x0000ffff;
>  }
>
> -static void
> +void
>  gv100_head_state(struct nvkm_head *head, struct nvkm_head_state *state)
>  {
>         struct nvkm_device *device = head->disp->engine.subdev.device;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
> index 856252bf559a4..b642729c254fe 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/head.h
> @@ -53,6 +53,8 @@ void gf119_head_rgclk(struct nvkm_head *, int);
>
>  int gv100_head_cnt(struct nvkm_disp *, unsigned long *);
>  int gv100_head_new(struct nvkm_disp *, int id);
> +void gv100_head_state(struct nvkm_head *head, struct nvkm_head_state *state);
> +void gv100_head_rgpos(struct nvkm_head *head, u16 *hline, u16 *vline);
>
>  #define HEAD_MSG(h,l,f,a...) do {                                              \
>         struct nvkm_head *_h = (h);                                            \
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> index 6e63df816d855..49a1eef9bdf14 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
> @@ -625,14 +625,10 @@ r535_head_vblank_get(struct nvkm_head *head)
>         nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002, 0x00000002);
>  }
>
> -static void
> -r535_head_state(struct nvkm_head *head, struct nvkm_head_state *state)
> -{
> -}
> -
>  static const struct nvkm_head_func
>  r535_head = {
> -       .state = r535_head_state,
> +       .state = gv100_head_state,
> +       .rgpos = gv100_head_rgpos,
>         .vblank_get = r535_head_vblank_get,
>         .vblank_put = r535_head_vblank_put,
>  };
>
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> --
> 2.54.0
>
