Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE8BCD98CE
	for <nouveau@archiver.kernel.org>; Thu, 11 Jun 2026 15:07:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1C01110EF9F;
	Thu, 11 Jun 2026 15:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="M7t6/i91";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0612946A38;
	Thu, 11 Jun 2026 14:53:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781189632;
 b=x3EuMNcshsKgpwMn0gFtes9rO6ciGe/L3U1k52Zll2s4k/J0iq9H6T+lX8/5lkgmPkGuW
 AqQ5B5UOj01raTJ9b4oyTvOWt+X9wsLrxDdwnltgd6tfZNiUTsoJUbuntFrID4/JsnTEqpx
 UbHxVZM4aOqcjXwJwt+XUHFGqw5lweAD6BM/aC+6Z2SdhfnGuGF8J7oWWTWFbl1yXYlssQo
 aMtsxckdq6MfLsrpC2WbSDT3/xBTX1NZeZR7ZsdWiV8Vgx3N2n84UIFXQc0t7HH9QV7eisK
 iB0Gdh7iAJUrk4O+SRK8mU9H9QVL2UvZon93GtUE5lWvzGQ5T4rm/ZqxrDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781189632; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YJe1xz1ZMNVnBlNAhTok//gR+6F59R46BnGd4lcF8bY=;
 b=qEtlPa7aHIwBo814sNZxJREIZt7+NWJtDCwJGhdFoulAt982B5Vgdx9QyppAdQivGKnl+
 b1HJeaGBZfVrsv7MpogiToRLKKUhEix6C6LLCc9FLmIW9U28Ji2bXpjc01dID9JgHwpv+SM
 +Mm4c7xXTgq9N7Cq7DuEA5TDNV6vRer7xVikU1VPBFV3LQtT7JJQ04XB6vPuZoO9+lCgmSy
 OFz7MxV9SdBnI80CuOxjrRRC+cEdgRKOf/sCSRzG7RY+eTLspe9x3aqcyPBEICBoDnD2848
 LEqom03xkiwzAmRCBFyGEkbxz6e0HB6Ugev4weibZrt6Tno3Zf155a0+ERsQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=ursulin.net;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=ursulin.net;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E47CE469FA
	for <nouveau@lists.freedesktop.org>; Wed, 10 Jun 2026 11:58:28 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF1B10E91D
	for <nouveau@lists.freedesktop.org>; Wed, 10 Jun 2026 12:12:26 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-691c5776f95so5896613a12.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 10 Jun 2026 05:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1781093545; x=1781698345;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJe1xz1ZMNVnBlNAhTok//gR+6F59R46BnGd4lcF8bY=;
        b=M7t6/i91iRfqU1TN97bLsiq9zQUABlMEGWfsK8kEQ7naQBP1YUAyNqY7dULffieTa5
         5zKwGStwmg5P0WRARB3pDkfMW1UGx6x0Ftl8CIgYKJPj6b8gFr+ukPibw6lWc4UMwCRJ
         V9zZXagJ+jI3XU6UwGzrhztR1GGWtkXpPO2Wa3iTSCYpd3n7x+VhgNhE1fyiUO4oG0E9
         PKkWqYarxc/rz6mn9mL9ASMo66TlwGrXYMotaGnvrGSEiuawYq7zCqWSxUL5I0HmCYtt
         bpZmhsDmkcUiiVgQOKsGs4Mdhs6awrOXMpNrU4nLzqYztmExUSlm8CmUCKlybil1LaJ4
         gFjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093545; x=1781698345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJe1xz1ZMNVnBlNAhTok//gR+6F59R46BnGd4lcF8bY=;
        b=ncqHxjRACVgcUf7mM+V/SQEp/MJb3oFeU0kBgSRpA4MTBYrjQWaG2HbdseGLq9Vn0x
         NBucTxVv8VqkZ9IaHH7Rskxb/q+6ig9HrNttFCEN3C8q6HU9Gyw+ZF0iluI8+YCBo838
         6BG8H41CkQvVcDe6x7PHDFShF+pnyZezGgmx1+VWM6b73ATTnSzSz0f9nWjcFpG7puSe
         5HxpDi7K/i87Pawjt6kvp6BxrVqJ2ZSecv/P6x+ssD+3/dio1g4xQKgdgV7w8OzxX65k
         lpAN0jNOYTYRSgzduFjSxtXVUpIf39GvfW559QikKxh/c23ymtZHDqEzkkkMkyR6Vv5a
         spcw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8e9NGpl1NXxFw6XRsHDFgas0SO1FNt+6OFKp3PHGzo5sheklCAjoT4RS0FbLlVfz5omL8FcE5r@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2qKGKcglkM76xX8doogJ6HabcQpdAr9X83xHaSEFsuFF1/isb
	RReyHe7gKn7cd3hGZRFITJeC68RPTad1y2FeXl30RNPVhQy53Jk+ILoDYWUU0SrGtprwsYGe7uf
	8/SEBO/Q=
X-Gm-Gg: Acq92OGw9ZTPM6pdX560LYrRFxDKdjBX/BTMw6+Kp+MNURaQm6PWORm8S0ZzJXlLcsj
	g81sJl6FwH31U/PdwLgzvp2oBfCM6kKUWIXzJE3NT+5ARkVutXb+XuIBuW+uSOX3FiITVE8xLKv
	KTaH/oVRt/sn+ihv5UJWjaZnZqvSF44oq2HHGQcKOKXqIJZTUxYnUU51JRtXECW8cN1A6l+yfa+
	pDsFRrbijYW70KhXfBJdhWernD0MrSNSQMzAJpy7SALty3R+qt9eIAFrQI7f7CGQQI90Qfew2p5
	GBCrMGc8xM7d2jzK3FoL/R7caSSdixLxhmLok2wn3T+FvBiYslemPBHlC9/obNMYBvWzhjm6u+f
	OGKbs///YWQvv8Blzceh8ujTPm6jLr/NZwhMn0xBYx5WsqB46KFWldVEU+pJf9W2sQq0aBwpFTs
	RnijqPThkX2wdQWv8H0D1qXp5In0J2aXyqA84e2mPKlgoJm1tulX8NYqpBzhACysIOiA==
X-Received: by 2002:a05:6402:5193:b0:66e:abe5:ab22 with SMTP id
 4fb4d7f45d1cf-68fa4c0039fmr11944776a12.5.1781093544179;
        Wed, 10 Jun 2026 05:12:24 -0700 (PDT)
Received: from [192.168.0.116] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68e64e2c810sm9966710a12.9.2026.06.10.05.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 05:12:22 -0700 (PDT)
Message-ID: <b5f634e3-ca52-4674-82a7-fabce99ec364@ursulin.net>
Date: Wed, 10 Jun 2026 13:12:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Document weird looking bugfix
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20260610082602.1292853-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260610082602.1292853-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: tursulin@ursulin.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: WUSNZ52R5IXCX6RS47RT56XU3EOUT4FP
X-Message-ID-Hash: WUSNZ52R5IXCX6RS47RT56XU3EOUT4FP
X-Mailman-Approved-At: Thu, 11 Jun 2026 14:53:50 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WUSNZ52R5IXCX6RS47RT56XU3EOUT4FP/>
Archived-At: 
 <https://lore.freedesktop.org/b5f634e3-ca52-4674-82a7-fabce99ec364@ursulin.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


On 10/06/2026 09:26, Philipp Stanner wrote:
> commit c8a5d5ea3ba6 ("nouveau: fix client work fence deletion race")
> fixed a race. To do so, it replaced the automatically locking
> dma_fence_is_signaled() with manual locks plus
> dma_fence_is_signaled_locked().
> 
> For someone browsing through the code, this reads very much like a
> cleanup or rework leftover. Future contributors and / or new maintainers
> not familiar with the history might be tempted to remove that bugfix.
> 
> Document the bugfix.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> (I did not test this)
> ---
>   drivers/gpu/drm/nouveau/nouveau_drm.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 42a81166f3a9..519a0c164a72 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -159,6 +159,13 @@ nouveau_cli_work_ready(struct dma_fence *fence)
>   	unsigned long flags;
>   	bool ret = true;
>   
> +	/*
> +	 * This is not a cleanup / rework leftover, but a bugfix to prevent a
> +	 * race with someone signalling the fence. The locked
> +	 * dma_fence_is_signaled() cannot be used. The dma_fence implementation
> +	 * is not fully synchronized with locks, but also uses atomic bits,
> +	 * which can cause the dma_fence_put() below to be executed too soon.
> +	 */

IMHO it would also be interesting to document why this happens from the 
nouveau point of view.

For example I see the two references held on this fences in the call 
chain, but apparently neither are enough to close the race. Which 
suggests a third party has a pointer to this fence but with no reference.

I talk about this:

nouveau_gem_object_unmap -> nouveau_cli_work_queue

There it grabs a reference before queing the worker. In the worker it 
drops it before calling the callback nouveau_gem_object_unmap installed:

static void
nouveau_cli_work(struct work_struct *w)
{
	struct nouveau_cli *cli = container_of(w, typeof(*cli), work);
	struct nouveau_cli_work *work, *wtmp;
	mutex_lock(&cli->lock);
	list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
		if (!work->fence || nouveau_cli_work_ready(work->fence)) {

... nouveau_cli_work_ready can drop one reference

			list_del(&work->head);
			work->func(work);

... then work->func was set to nouveau_gem_object_delete_work by 
nouveau_gem_object_unmap, which will end up calling:

nouveau_gem_object_delete -> nouveau_fence_unref

On possibly the same fence.

So if there a path inside nouveau itself which signals the fence without 
holding a reference then could be it that the problem is self-inflicted 
and not due a dma-fence quirks?

I am not entirely sure since it is not very clear. It needs someone with 
nouveau expertise to clarify.

Regards,

Tvrtko

>   	dma_fence_lock_irqsave(fence, flags);
>   	if (!dma_fence_is_signaled_locked(fence))
>   		ret = false;

