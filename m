Return-Path: <SRS0=6/tN=IR=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F34FC433DB
	for <nouveau@archiver.kernel.org>; Fri, 19 Mar 2021 09:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04EDC64F73
	for <nouveau@archiver.kernel.org>; Fri, 19 Mar 2021 09:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04EDC64F73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A277E6E9D4;
	Fri, 19 Mar 2021 09:57:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281A06E9D2
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0PczpDbwsPC5lQkBB89vq5oDLbkXKIf3dA1wCttmZ0=;
 b=hha9aVk8CgJWMmc5rukCMr29PPMMr2FxK5NwAhUKnaiKHb1jjbhlkjP8nBEVgzfXv/LEJq
 t24LN1oF0ZVNlAdgu5Co14WTOQAsUSDZKV2PcltLFmUFoaP9zVVGVErcuyRfGXzNXJcgie
 fNT3n4JlxZOzdlr9ALixqUCxZrM+/qo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558--XIkbanHPJeYFV6kgj8x7A-1; Fri, 19 Mar 2021 05:57:22 -0400
X-MC-Unique: -XIkbanHPJeYFV6kgj8x7A-1
Received: by mail-wr1-f69.google.com with SMTP id t14so4192261wrx.12
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 02:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s0PczpDbwsPC5lQkBB89vq5oDLbkXKIf3dA1wCttmZ0=;
 b=PwHDDtSk0bgFGR0gkzcIapwU7hdNFNt65LuuGMFUhHFcUGcX9DEMtYKUhXL44pPuS5
 PX8c2pFJUVj+wfjbKenOsARBKnI1Jx0VmE+mD6CaRF/HfFPDx+/npyuOb1+djkUjEXNS
 mu55ATdyDjYErRrYphPZtuPZNMhQ5romQo2AER/IOinJre36fVnMjhj0ph+sHzOwy7GV
 IRf86P7dAhPUvqOxxMSiDlcv7e6W/HVn5wnY85Wc/pm3A+hOxR2Qqbhnkrp8fWfoJbva
 t2GT6ZVuDS7SjOAVR259WntvGbPIiG84FjU7x0nOJwFSdvdJN0rXhE0+jj2CMRfurrXk
 7XgQ==
X-Gm-Message-State: AOAM533lz9cbWHrOoITra1mPVHLp3q13I6zVkldgncIY3zlmAHkpnCij
 SEeu1oU4m7SCt0r2hYuumliZFgDWn1i/f2g2WuwIDhf8WvccG8J186C40nqT06r4SnPCdEGzzZ/
 Y0tfMaGAdslJ8ZZZxWkX7br8lWTOxIed6fbSEXHQ8GA==
X-Received: by 2002:a05:600c:220d:: with SMTP id
 z13mr2955177wml.1.1616147841802; 
 Fri, 19 Mar 2021 02:57:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOEla5BNWHU1g97Pq8e92rbVtjZyisiqoILIxYNfkNvpqjWZOUdjVvSJ1zyfBh+8SUEzzYdsvjQ9RNg/izpQU=
X-Received: by 2002:a05:600c:220d:: with SMTP id
 z13mr2955164wml.1.1616147841683; 
 Fri, 19 Mar 2021 02:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-20-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-20-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:57:11 +0100
Message-ID: <CACO55tuB4ACS=zFmUCj=q+V0cRScW8N-HgCcejAB5P=n_uNnCQ@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 19/19] drm/nouveau/nouveau_ioc32: Demote
 kernel-doc abuse to standard comment block
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 9:25 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'filp' not described in 'nouveau_compat_ioctl'
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'cmd' not described in 'nouveau_compat_ioctl'
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'arg' not described in 'nouveau_compat_ioctl'
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> index 8ddf9b2325a42..2af3615c5205c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> @@ -38,7 +38,7 @@
>
>  #include "nouveau_ioctl.h"
>
> -/**
> +/*
>   * Called whenever a 32-bit process running under a 64-bit kernel
>   * performs an ioctl on /dev/dri/card<n>.
>   *
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
