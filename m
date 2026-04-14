Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F855F9D0EC
	for <nouveau@archiver.kernel.org>; Tue, 14 Apr 2026 18:49:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E038710E656;
	Tue, 14 Apr 2026 18:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b="SnS0ywoE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3D18445827;
	Tue, 14 Apr 2026 18:37:17 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776191837;
 b=CDwkguyP+HWF2jUfznPzJX7Cczkh/tF9gmsMwsbCzpHhMcGi5x+aBHyZglxfsF9TtZ8D/
 lHBrYCDgHQa4OZvYxk36ELB+Xdva75vQB79a+261stvTRg+kZrOfZTGOtS2t61ybNSNxzG0
 hbJFe6N6HxwXKCmOd3cRMiJDXS+kk1LdEfuptb5yn4Hl3pNdZL1m42UpHHUYyZSy9tk8j9f
 iLyNL7LLftKOa1uq8D9n5Zrot2IFkUuKYmugXpM/xU7kyQNiFj2s3x0NuU7oLRwijNxygHG
 6jq6fGTz6jUIaOgYNDdxJQI3tCWbAHUaZisVK3VKmmST+Y8Y8GSCoxaip1Og==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776191837; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+Mt12iXkXz5fRqukwoiN5eH3WDU3oeAE0jkk5FyZ9Rw=;
 b=f24crkBNK0TsM/rDtH1ULZR28tYJ96uGw+mDvAJzSTQQklHzikn04nZP6xtr/okd5CPC+
 QI5CBPTWsZTxzkjzcZzwnH6kMz8htPU8rUCKwcQkp0rV3mJpg0P2b8iIenOGpGpA1p4+bs+
 o6NrtLJ8YW7vEH8xAOATR77uT0A2b4Z8LmrJ9Dq/yIOE0JsDQctVoQw94l12LCw/hiq3S+n
 dJfm8a8EoUBb9MxiD7j7D/Mwlw5p2mim/kUlA1OXoS5ZQtmcai92T7y2P0od5MxXhXHCxfI
 75q26ZeEJxE72qc6lQpRDYOKcW0nsMDCyWkf87vxyQWLkSMKv2Suxvym9W3g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20251104.gappssmtp.com;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20251104.gappssmtp.com; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 73A0843E69
	for <nouveau@lists.freedesktop.org>; Tue, 14 Apr 2026 18:37:14 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB8EB10E645
	for <nouveau@lists.freedesktop.org>; Tue, 14 Apr 2026 18:49:05 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-5ff05af29b4so2018769137.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Apr 2026 11:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776192544; cv=none;
        d=google.com; s=arc-20240605;
        b=JgIb9yfz2nkVBETxBBqecCnl+JpFd8ZkuLZi4rOEiZA8O658qeFXmunvF61/tLowfr
         H13CLjvxCzzmaf6MXmksPhRPFQSrHruoz2pRPYN31gZemqd8/jZXh/Rq8IKHji5WDAG5
         2i81a7e0g1958ecQ3eD6zxF/8OYmXOQ50f5Sc/2p5SpH6ekFBi/hj1F3KP0FtrKbaFFg
         gyqYg0FilED/iw71yIh2+54ar/MqpsLPM2W9AP+h9XUNrJPzdigteLpm8myy9qNRefD6
         aKK+JAOKM9nBtLtjaEPenMldkUyN7GI3JXb8vKf+0hs5m5U/Ry0HOHCmDdD4OIFra1ek
         37cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Mt12iXkXz5fRqukwoiN5eH3WDU3oeAE0jkk5FyZ9Rw=;
        fh=pVPPMgWrgaQaMEGxSoFdBUo34bRHJX3t2qFv0lLaO/M=;
        b=NwYSbHljlx4z2oDBwVZGC94qv9r9PNcNCaSnMA1lbtfHQxyWz2sGXQnalZ36Ud/DL6
         dbNYN3tPYanNpHquTDfvBFlRm3sK0Od/EIZVstEQWfsQXq8DqhaVy3g9PIH3tV9QyN1e
         0nrG8G5UaRoDxXGDbzecySuAtnU7Sw1AWXh4js+q6Ovinc+xCZC9mtfqfd1CcdUIKnF7
         keNh/1Ykc7+CXt4s68DvN8Q2A5arOeeUlJ/2SL4Un4qm+D9PG0KI2PNE0WJhlK6tJ96V
         4rghRcvz8qlEThRH0A1TVDEDL88asGOAFjrEU5GuCZWfzkXdBu4f3QYpA6LGtcEzVi9f
         Umxw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20251104.gappssmtp.com; s=20251104; t=1776192544;
 x=1776797344; darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Mt12iXkXz5fRqukwoiN5eH3WDU3oeAE0jkk5FyZ9Rw=;
        b=SnS0ywoELJtR9PJ31tCCxoZrpkJ7TJFJ7bEpUrHz/6MiGR29wbk71f5JKTgAJyWNGA
         P9fsTXyAW3QYNhflig2vsHWO6XDX0jwSsV3tbC7yApEQJS6mYTYWFCtsFHJgAzeLd+FB
         ndcUecuxlTJ2/ufiJoJFrKI8BFRmnFJShIBzt8IYe4oE1AzsKA4sk2hPFNFNDtKYef/z
         AOCHc9BuO8bfPoQGPKFUlqyEN1OjKKVZizja5H00mRnT67q8Fcms6yv53reQt/L2Pq2M
         JFPqpl2eR7b2QXCT0gMzHaLTpewPLeykR3QWBB11f3rUcHjigXPNtZbcsACWpKhl9je0
         wCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776192544; x=1776797344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Mt12iXkXz5fRqukwoiN5eH3WDU3oeAE0jkk5FyZ9Rw=;
        b=iotkFExix3CaUvFUzbF00jbEwAsm1w+GHd7wXjbgfbx3tRSJVWgpH4EyiJUO8rubyO
         gr7XlU2yNi+Wh898szcfqa7hScfHev6KoOqpsHLA/8y0CjPce5Du/Wjer9iKAeKsgtQQ
         8GiQ1s5tPA93rGO6LmjpFb6y+PTfhAhZ1GFgzqOFriS3f59Mf4x4KziGuen1nWQpOFDc
         +d6YteRfbEaLpeoSVEjtdnak6hmE+puIhI9Sa95ODvpzdbmU0cLpDBGeinKzznKpKsDM
         eshX/26sAz5RMEfQHpF78n3CGWdkvYgFq3JztRH8rfLKhQCsMaUFF2YBTxtQOjYl7tzl
         mnrw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+G2SZ7UFYM7JaW1wD5vCIgquMXidY8ycB3QqRCob1zcVqCDOi/tF7gBfpHW5rgtfKx76vJcxej@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOAWjpacPWc3Q43YoRwJg8YATJckfatc0pHUxflRts1ZiM/Qqb
	bcO47coFI7yrvvNuBNU5zlwUUxH3qXn8N8Ki+9Qp6aMnak5fQ0RLrzXO4blstfBjnCISGPa2kBc
	Dqg2NNO1yLofsj/tou8pWAxFOQcH89HPv1DXSr+9xYA==
X-Gm-Gg: AeBDievgEI4M/g1SqfcR+w2e9k16rbxMPXlmZ9xzLxSLFisPgGE/q+09TQUJCwBb1dp
	nvg0uPwwqtr/2r286Hlc6MDppFhyajWi1KMC0djiFx210oNcsXKatlcbSGC2SJX9gfZEJxxv8mh
	Ye6cNPZxhQDCYgAcpHmUaYECvg6bnZvSQmIkksRl+UBenkNGUvhHSJaU+5vFAXI2qe/Y6xer8FB
	zxZEEs5Hn/37N/znKQ5gN6AwPzq81ylorWM9EN6YbjEBrutDYJPsASAKL/YT7qNqkmPgzPAIBYO
	iWFN9WzG89jbkh/c9Q==
X-Received: by 2002:a05:6102:c48:b0:608:cd24:354c with SMTP id
 ada2fe7eead31-609fe9b0d22mr8588437137.3.1776192544312; Tue, 14 Apr 2026
 11:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260414133734.130115-2-phasta@kernel.org>
 <20260414133734.130115-3-phasta@kernel.org>
In-Reply-To: <20260414133734.130115-3-phasta@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 14 Apr 2026 14:48:38 -0400
X-Gm-Features: AQROBzDdgq9-sVUtchx7CDAIP18djW6OsmpTOp9warpredWNoQkjcNtGiRDY_DQ
Message-ID: 
 <CAAgWFh13vpZbLeMMGbvJGRiq0Tb+thP3o_4Osv=621NoCht11A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Fix double call to
 drm_sched_entity_fini()
To: Philipp Stanner <phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: U2JNLLSXU7O7EIDFP2KFPIQY35ZZJVB2
X-Message-ID-Hash: U2JNLLSXU7O7EIDFP2KFPIQY35ZZJVB2
X-MailFrom: drawoc@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@kernel.vger.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/U2JNLLSXU7O7EIDFP2KFPIQY35ZZJVB2/>
Archived-At: 
 <https://lore.freedesktop.org/CAAgWFh13vpZbLeMMGbvJGRiq0Tb+thP3o_4Osv=621NoCht11A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Apr 14, 2026 at 9:38=E2=80=AFAM Philipp Stanner <phasta@kernel.org>=
 wrote:
>
> nouveau_abi16_chan_fini() does invoke drm_sched_entity_fini() twice:
> Once directly, and a second time through nouveau_sched_destroy().
>
> That's likely undesired behavior and might be a bug since
> drm_sched_entity_fini() decrements reference counts.
>
> Fix the issue by using the appropriate function,
> drm_sched_entity_flush(), to ensure that the entity becomes idle.

Your commit message says drm_sched_entity_flush but the commit uses
drm_sched_entity_kill.

> Cc: stable@kernel.vger.org
> Fixes: 9a0c32d698c1 ("drm/nouveau: don't fini scheduler if not initialize=
d")
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/no=
uveau/nouveau_abi16.c
> index 7860877d909b..291203121f0c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -176,7 +176,7 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
>
>         /* Cancel all jobs from the entity's queue. */
>         if (chan->sched)
> -               drm_sched_entity_fini(&chan->sched->entity);
> +               drm_sched_entity_kill(&chan->sched->entity);
>
>         if (chan->chan)
>                 nouveau_channel_idle(chan->chan);
> --
> 2.49.0
>
