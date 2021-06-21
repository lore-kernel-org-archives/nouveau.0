Return-Path: <SRS0=7WDz=LP=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AC7C48BC2
	for <nouveau@archiver.kernel.org>; Mon, 21 Jun 2021 14:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B94C160C41
	for <nouveau@archiver.kernel.org>; Mon, 21 Jun 2021 14:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B94C160C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E591A6E1A5;
	Mon, 21 Jun 2021 14:55:29 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D126E1A5
 for <nouveau@lists.freedesktop.org>; Mon, 21 Jun 2021 14:55:29 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j2so9476704wrs.12
 for <nouveau@lists.freedesktop.org>; Mon, 21 Jun 2021 07:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+BK98dz60Wqkdd+SjHG6CssBQDlQ+h0Eq+0db/LD2aQ=;
 b=CzerPj3Oqquv7JWjdkv7EORCatKpm99O8sCYP/iJiBKYx98rNpDEuyCNhAkmK5xjme
 Bd6dXbqYhlZD3FqvYivDhfYuEDYJz3CS+gP+CQmU6JYcifmXzXn4ycs2XmCM9vFnpvjd
 MEJOExnl8EQvDmw1+16Zj51U4BgVub1ZVhS98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+BK98dz60Wqkdd+SjHG6CssBQDlQ+h0Eq+0db/LD2aQ=;
 b=C0s7q5dtL7PUNxcQPXNT/Fdvew+NVdD1OQCZCZFgKneTxRB2wncXFe5yhXvBv4ydRa
 9nsvptCkqpx2OCUxqij7cbuMyVTdwf779HoqCxqws5v2zM4K/6s9+QpxK5Wf5JOyfyHL
 lXX6vnxT+LF7WNk4CDugxKHSEjYZPiTzeS78ZGrwBa5PSJKjJi+pF3LXhQd5Z/z2TgrG
 7BO2XaRTzH8PZfd5oNNW3Xuqmh5FUQkg4Cfp34McKKdGufXsgIibwNzVo0w8WLu+rxl4
 G8Pk460ootgh8LaBxr7Z9rSKZoGwKotipMPRpD9M2KlaAzAVPRtGvWR1/MjCnlAOyilZ
 JrqQ==
X-Gm-Message-State: AOAM532zL7WTQs3TgOJ0/Rx8trK0cqmSawBZabul21uCOMSLcfrdE7l/
 tLA8FmMq6dDbzaSzUz3plsqojw==
X-Google-Smtp-Source: ABdhPJwJgzJ8Ca2T+z9hEf2yvqJqhKN9AFccoQwR1QOhC4Yu0t0AMwcmlSYQmtTb+Hc5rv5qsHAe+g==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr29841764wrs.63.1624287328442; 
 Mon, 21 Jun 2021 07:55:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o11sm16195097wmq.1.2021.06.21.07.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 07:55:28 -0700 (PDT)
Date: Mon, 21 Jun 2021 16:55:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <YNCoXur4q/OCHb4k@phenom.ffwll.local>
References: <20210621130328.11070-1-christian.koenig@amd.com>
 <20210621130328.11070-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621130328.11070-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Subject: Re: [Nouveau] [PATCH 2/3] drm/radeon: wait for moving fence after
 pinning
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 03:03:27PM +0200, Christian K=F6nig wrote:
> We actually need to wait for the moving fence after pinning
> the BO to make sure that the pin is completed.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> CC: stable@kernel.org
> ---
>  drivers/gpu/drm/radeon/radeon_prime.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/rade=
on/radeon_prime.c
> index 42a87948e28c..4a90807351e7 100644
> --- a/drivers/gpu/drm/radeon/radeon_prime.c
> +++ b/drivers/gpu/drm/radeon/radeon_prime.c
> @@ -77,9 +77,19 @@ int radeon_gem_prime_pin(struct drm_gem_object *obj)
>  =

>  	/* pin buffer into GTT */
>  	ret =3D radeon_bo_pin(bo, RADEON_GEM_DOMAIN_GTT, NULL);
> -	if (likely(ret =3D=3D 0))
> -		bo->prime_shared_count++;
> -
> +	if (unlikely(ret))
> +		goto error;
> +
> +	if (bo->tbo.moving) {
> +		ret =3D dma_fence_wait(bo->tbo.moving, false);

Here we wait whil holding the reservation, so we should be all fine. Maybe
not the nicest to wait while locked, but also I don't think it'll matter.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +		if (unlikely(ret)) {
> +			radeon_bo_unpin(bo);
> +			goto error;
> +		}
> +	}
> +
> +	bo->prime_shared_count++;
> +error:
>  	radeon_bo_unreserve(bo);
>  	return ret;
>  }
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
