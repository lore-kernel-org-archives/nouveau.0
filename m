Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D3DCD3423
	for <nouveau@archiver.kernel.org>; Mon,  4 May 2026 04:01:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 21A9A10E36C;
	Mon,  4 May 2026 04:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K/thZJr8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5C9F245DA2;
	Mon,  4 May 2026 03:49:16 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777866556;
 b=qI71iDG+kxnWX7liF5Sswzb92PHg29AJXpLTicvxUTAxuKOO6I3BtQk15yJcREkh8pNIn
 E4Sm4/4eJ3lvg7pXK2e9IZ+38JE+MN0Ph62vRIo2FUMh2+3HCbKIxy+vvpbuGgYZ/WuKJeb
 fz8Vq+STC0ze5AxnPAdxBore3e30G7GqIZrJ5Zo03uzLMGd+bKGaJZ0a+/AdtU+Us1KP493
 t6cfVc+dzzp2dLa5Dv6/OHleO1y8Lmt2f/7BYf5vqtQZDL1UCc9ZxNvGf3Ee0kLZQmOTniO
 uF4tccqDVEI/iEOPeXS04YrA8mh2vNMnGhbFxg/txne73E2yUCWsB/UOwLxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777866556; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oGlVUVNCo7t578SnF0/FJlFOI+mo4qIG1hmcAiuexlk=;
 b=gMctYra9kxdEwWivd/ULyisJiUyYXd5dwZiE2uWn8p82xvceFxRp4XAp7NeAZbWCQtLDb
 szBPfOTKpuCoPJWCe1i2ln0QDZeunneDf0Am2YbZdc672sDQwMVb+GL9JsA6+y//ado27jH
 qcUOA2Nv5mYnPq8olwmQ4z/q4k94OfK/OTSFxVMbgoVmWsFuuNtIu0wRPueD0uTY+7wG98j
 jfjykZjSPO/uuYvD1eKXVb7q9136Tm33GqldnM0WTDspVKVT/b092+PVBeAKOY720lzOGhf
 2TVhgfPrqiDlwYwWQ7A+555WlTxlx/larOylUoje1I4Eao4IHbB2U8A+KnkA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 191A04525F
	for <nouveau@lists.freedesktop.org>; Mon,  4 May 2026 03:49:13 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9362F10E366
	for <nouveau@lists.freedesktop.org>; Mon,  4 May 2026 04:01:47 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8ee63e91acfso280066085a.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 03 May 2026 21:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777867306; cv=none;
        d=google.com; s=arc-20240605;
        b=WbMZfVPH+PaZj9U8p1db8wQ1WpHMOFa18qWWXzc1m4GecaFot7W9iczVKzMrPTnbq1
         nGq9ua1grcBi4K/X78zRPZ1r+omMFl0RtKV2XqQxBn8sQulEKJgWt1IIafNkVUMYzmV5
         TDSBeqFNWueQfkvNu2IiL5srZcG1GtTOBAPPNTA1iszozdh3JK7NftgBTXQmB9JEN8vp
         9ZKHWRapgRMyzLyD0YtQNhjLouwEdgJgMjP/JYowJBaBl5+N+UpyWN6D6VNTXspmZDzx
         hfa+JdAh6tiMxYSojGrQMb1EiF2FTA0As1OOc1p2SWOeVZHULadGT7ydszYzMwjD2FJu
         eAmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oGlVUVNCo7t578SnF0/FJlFOI+mo4qIG1hmcAiuexlk=;
        fh=qIvVfNSAgMGh/Bc/xwakUNlxxHU5+THqqiudxtWjW+U=;
        b=F7puqfuxlWnr2RAYJ0m1APluZJ4eT4QghCqwNCySvfMZvICZXIWzF2T/GmSgr7llRn
         epjEp3mSZAyTvrsSu8Vpe2WHTBe32gbZcFLISRsfThVE0iwN7Pf0noL3HjFsbO0rDPSu
         GPsbAbEVLrXcsPWQzbCAveBTjQviOP0G3IDUQIyZaPBw+A3GFqrOX7nP0wYaYG0lpe4/
         Rc8xnIDYthEf9j3NlxwOc8aXjWONM7XoZTYNcggslakl9K9qdPsKSlVIg3PehCON9Hro
         Yc3j6wh9+UfyQ7yxiQ1ypYCcillPapUzQ6FcAhhCN6bYvK8rt0nfGeyWBWElwDuVc1IV
         N2SQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777867306; x=1778472106;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oGlVUVNCo7t578SnF0/FJlFOI+mo4qIG1hmcAiuexlk=;
        b=K/thZJr8LMDez1Ul+LA5Zc0zpDI1vIDQALvtTRNa++AZAVGRHcjkTv1yswIRIAArOD
         ug+7KSz6R4MMgAsoUzRmN0i3LR2YvlcuqjHFpzq03yAIbUmzIRloBvtzbFtaVc7wcljD
         kb8mdGCWC7aawdYy+kL3o8kGxgepOnC8/2/68kBfxLjmmHoOS+bePsXefCZ9EL+aeHts
         YQFVkh+j6nCuUrxaYKBDe1zR1+7oaIN/wpwEWNJC/lzn2nZTdmN2vimUkNAscJXfFe0L
         tLjGc0aujL9qrqbselwYwta9eQjEPjYII5BpJa0p8K5qPGd490+LyD7hBnBGyLElkjnP
         P7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777867306; x=1778472106;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGlVUVNCo7t578SnF0/FJlFOI+mo4qIG1hmcAiuexlk=;
        b=rv0OmPcrC2eYJHd3W0qqWC20mX527csTJ181aSSCQBckwbW7qWGlb85BqIMhE1xOn3
         HUQPDq4txmBxWQt8WR91w11dbl/fC0PPYCUwihDTVoC3rCMJi5oYSmGO2lQyy7ATDEMb
         cFUmb41CCc853P3tuF+i9x+Ep+ZElP9WTmgCEjAhLiBKVK+GRLmZicbM9/eWG0PLTVzo
         xncuVgqheEbv/uvYL9b9o0fM5RBUpplijpu/NRVadE/sVtK+Mx2g+7zWEpVT3l7lRaqe
         Mgc+6A/Fug8aXSzswflWZr4WqA/i1eXpzQBwf3mhaOirqDJR6PCO42JF3dizUWmtmDU1
         HHLw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Bg0XnsSQ7COfdgO0xgGBf1Av5vNii8Z1jsMo55ppts4kt2QDLKViTB8VGZPchEeTi5ClcegnJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYQUAOUCEP8cwAibUHhCZ1eQBtR4P7Xilz9AU9R5A48cnPa3AK
	EwdYg3qhkYqXS2BoKhFc1glBCpUkCLbAXnda1egGCUXOLPeoTEBsJBwmUq5Frk31JNqhtzLFRMx
	bEAxiYRX7Ck7/DmlXHso81GIlRF8+8QE=
X-Gm-Gg: AeBDievctDXYlRHyFAad8DeXqhLTpZfEE8O4841TP3FlV2HT/wO/X7mCyTHV6auSmx2
	0oPYfM8FshdyrwGSY/ZTA+zs2t8PnocOg/Bv8Ygz5zA/qiDavjSjs5ummihjsUWgmDAVmSp2VnU
	eO1o/Qex6b0s6LhBtF1UObtTJ5FUJhUalcaSlYmFLo9ynYPANWzTxxdowG+gDJktVXbFIUFF3DF
	LeNMXrIF71GSqORyYzIJcsSid+E+7Pefo+oyHfJQe9jsTwdZlsKRl9SZyKpDAot1J5JdYVBtwdi
	GTuqMnMPdyVxbYokDxjzGIlBN1AvDa+buPiWLwC9tbj7VKFRCxLUkcWeYlaQxt2FJky/j1QRvS4
	d+A==
X-Received: by 2002:a05:620a:708a:b0:8f1:5e8f:fff3 with SMTP id
 af79cd13be357-8fd16c9964fmr1319335285a.26.1777867306422; Sun, 03 May 2026
 21:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260501215856.840898-1-lyude@redhat.com>
In-Reply-To: <20260501215856.840898-1-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 4 May 2026 14:01:35 +1000
X-Gm-Features: AVHnY4LmcMo5jkCCXrsqxOpC_hYtr1-nSy7Wtvdm85s7TmkVILKxYJXd3dyZi5U
Message-ID: 
 <CAPM=9tyVOHU4KZxpGeKn=V3zhGnBwq4v5QfXvzdUE4QPQ2zMOA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/kms/nvd9-: Use contiguous memory for CRC
 notifier context
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: HUD7ZHFKWTO5L2PKEF3KG6CNRAN757VL
X-Message-ID-Hash: HUD7ZHFKWTO5L2PKEF3KG6CNRAN757VL
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, stable@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HUD7ZHFKWTO5L2PKEF3KG6CNRAN757VL/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tyVOHU4KZxpGeKn=V3zhGnBwq4v5QfXvzdUE4QPQ2zMOA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat, 2 May 2026 at 07:59, Lyude Paul <lyude@redhat.com> wrote:
>
> It looks like CRC read back has been slightly broken for a while now, in
> particular on GPUs using GSP. On my test machines, it's worked normally
> when attempting to use it from fbcon. After gnome-shell gets started
> however, attempting to read /sys/kernel/debug/dri/$CARD/$CRTC/crc/data just
> returns -EINVAL.
>
> It turns out what's been happening is that since we've been using
> nvif_mem_ctor_map() to both allocate and map the CRC notifier region - we
> haven't actually asked for a contiguous allocation, and simply ask for
> whatever type of memory allocation nouveau can find first. This doesn't
> work because the CRC engine on nvidia GPUs doesn't support non-contiguous
> allocations, which also causes us to fail setting up the kmsCrcNtfyCtxDma
> object on pre-blackwell platforms since we don't have a single memory
> address we can point nvif_object_ctor() to. Instead, ctx->mem.addr gets set
> to ~0ULL.
>
> It does however, seem to work when fbcon is running. The only reason I can
> think of this is that before we start up a display environment, there is
> pretty much nothing allocated in our VRAM that wasn't allocated by nouveau
> itself - making it dramatically more likely that we end up finding a
> contiguous allocation by default.
>
> So, fix this by manually requesting a contiguous allocation when we
> allocate our context notifiers.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 12885ecbfe62 ("drm/nouveau/kms/nvd9-: Add CRC support")
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: James Jones <jajones@nvidia.com>
> Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.9+
> ---
>  drivers/gpu/drm/nouveau/dispnv50/crc.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> index deb6af40ef328..5817f39934a8b 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -10,6 +10,7 @@
>  #include <nvif/class.h>
>  #include <nvif/cl0002.h>
>  #include <nvif/timer.h>
> +#include <nvif/if900b.h>
>
>  #include <nvhw/class/cl907d.h>
>
> @@ -499,16 +500,24 @@ nv50_crc_raster_type(enum nv50_crc_source source)
>   * notifier needs it's own handle
>   */
>  static inline int
> -nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
> +nv50_crc_ctx_init(struct drm_device *dev, struct nv50_head *head, struct nvif_mmu *mmu,
>                   struct nv50_crc_notifier_ctx *ctx, size_t len, int idx)
>  {
> -       struct nv50_core *core = nv50_disp(head->base.base.dev)->core;
> +       struct nv50_core *core = nv50_disp(dev)->core;
>         int ret;
>
> -       ret = nvif_mem_ctor_map(mmu, "kmsCrcNtfy", NVIF_MEM_VRAM, len, &ctx->mem);
> +       /* The display engine requires a contiguous region of memory for the CRC notifier context */
> +       ret = nvif_mem_ctor(mmu, "kmsCrcNtfy", mmu->mem, NVIF_MEM_VRAM | NVIF_MEM_MAPPABLE, 0, len,
> +                           &(struct gf100_mem_v0) {
> +                               .contig = true,
> +                           }, sizeof(struct gf100_mem_v0), &ctx->mem);

I don't think you can just throw gf100_mem_v0 in here like that, I
think you should maybe make nvif_mem_ctor_map deal with this since you
want a kernel mappable vram region it needs contig.

Dave.
