Return-Path: <SRS0=z4d8=KH=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F93C433B4
	for <nouveau@archiver.kernel.org>; Wed, 12 May 2021 19:28:55 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 445F66121E
	for <nouveau@archiver.kernel.org>; Wed, 12 May 2021 19:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 445F66121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A166E231;
	Wed, 12 May 2021 19:28:51 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E476E1E6;
 Wed, 12 May 2021 19:28:50 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id di13so28427202edb.2;
 Wed, 12 May 2021 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HimVdGYNuDFmeFfGkz9uf17qGXHCnZx8wVlqXRaVfR8=;
 b=fI7pm3pIf7CfDEM5BrDDJwBIyffdqB3flQLis93YPSJHHj4DaF0eRy8JFd0aDnyVUC
 vBrIse5NM/CLGy8QuQBXpd4iwCaBFGpJs7T+rVIe/hENNUPPY2DkQBCqqauifL0hUdLX
 RJL1S2o/W+j02X56MxMk8vzktqeVuXuLHCtX5heObAPcdP5w/M2fQ9rBcdNi12jMR5g0
 V9yg8bp00NCecqNJNMr3WrD7o0YMySaqd9XE5x82rQ+tEEKCdhxo6QHNusxn1w6plSTh
 kmWYPpTF6CvC3SsPAukccXnp/m8qRyN1uPTjqqxD/uccvjZWg0JD3b0rq7leVwjTA2D2
 6C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HimVdGYNuDFmeFfGkz9uf17qGXHCnZx8wVlqXRaVfR8=;
 b=OeTAIk79CX8k3f+zL8IVZ61fQ0UgroSH8PMJ2QW8cZay2wN+ytuWgNZA2TuLifcK0r
 1wN7VM/PXTBgSTNkmSqqk0zuKd1kEHLp8zmcUcTbZ/1Osntlm17lLzng7pJFqLCr4qW+
 TBWlRNVFXohtjncJs6af1tZzCNLw2VgFPsQYtep4a4gLvlDz3viWNIf6qmBmLBdjrkJv
 TrEG8H9SennRyitoXerKgRF2QTXvxVGHiZWfwAUvuw5hQNIYsE1MAj7D32RCmarPcLJC
 HoOKGrR8hXbH2uCbNGmHlEqcvPxqSYgBBux0kx5uaNfEG/hchBiD0o80bhz9P3PlFKMv
 RBpg==
X-Gm-Message-State: AOAM531X9RpgK7FgUOvJEv10B2NayD7KnZzNoGA23Rf4rbH+Z1L2D9G3
 NvFnUsiM6vRWFzYvRBr7WZsIYbhAbomYc5FMeuU=
X-Google-Smtp-Source: ABdhPJwEthJpDtHTFSpcOsRAg0L+JXU+pxmFnXubLa6FGoNLWhkzErcyFoD5El3zH0vlIFdSKv3bgKVfqZCvYxmzS54=
X-Received: by 2002:a05:6402:341:: with SMTP id
 r1mr45254463edw.113.1620847728585; 
 Wed, 12 May 2021 12:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210512185527.26050-1-tzimmermann@suse.de>
In-Reply-To: <20210512185527.26050-1-tzimmermann@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 13 May 2021 05:28:37 +1000
Message-ID: <CAPM=9tymkJyVN4f9ivLaz7U=Mqhu2CuWGEk8RxbPFrQOc8wBzg@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Remove invalid reference to
 struct drm_device.pdev
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, 13 May 2021 at 04:55, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The pdev field got removed from struct drm_device recently. Replace
> the invalid reference with an upcast from the struct's dev field.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: b347e04452ff ("drm: Remove pdev field from struct drm_device")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Dave Airlie <airlied@redhat.com>

> ---
> This patch should be merged through drm-misc-next.

please land asap.

Thanks,
Dave.
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 7f38788a6c2b..2a298c171d4d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -460,7 +460,8 @@ nouveau_connector_of_detect(struct drm_connector *connector)
>         struct drm_device *dev = connector->dev;
>         struct nouveau_connector *nv_connector = nouveau_connector(connector);
>         struct nouveau_encoder *nv_encoder;
> -       struct device_node *cn, *dn = pci_device_to_OF_node(dev->pdev);
> +       struct pci_dev *pdev = to_pci_dev(dev->dev);
> +       struct device_node *cn, *dn = pci_device_to_OF_node(pdev);
>
>         if (!dn ||
>             !((nv_encoder = find_encoder(connector, DCB_OUTPUT_TMDS)) ||
> --
> 2.31.1
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
