Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F23CD98CE
	for <nouveau@archiver.kernel.org>; Fri, 12 Jun 2026 17:22:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C63E10F5EF;
	Fri, 12 Jun 2026 17:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="WR2uZbkx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E49EB46AA6;
	Fri, 12 Jun 2026 17:07:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781284077;
 b=ZNZru89qnGeKUCtnmCHE8Fth++ujiIjOK1P95PweFsrYcoD+Qo6k3EXupkAJ1Y6E28EZn
 NW62b18cuqrRmtK9TzNXr9g8OjYSZyn0jo3KJE4Gq2F+wj8/iQi+joRsWZuI1YY837W/4eu
 AOBQa9Ien7wPWGuMn78AwRXtQE/K/AAsq6sWhqzHYLP9j0eka/4IGHo/DokZYw3/Lmccwsv
 KagUUIiaqdRs2HwcEUpi6jvDTXS+kqf71MWJff09zSef7uYP1dFNdfMkXTgXdFM/dFyydbl
 84R1QhovW0uUTCAN4qRMPvhAiAkxLYk0AXwy8jKbohJFDb46LQEXZZddDzug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781284077; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ruCg0zsQ+pCKVkr4bRPKkDiLDN0obctnod88Z+YlYn8=;
 b=ds30o3/He7Dn4tlAVURDIb7SO2rkvRyVJIWHjTvC8joNhsxTLVtiOAd4IkbACoaiti6by
 a6JEkSLDuulVm9gxPuDJuWCCVBDyhNWn50SGlrH/3GNmc8oCTkEyo9962WvsHzRdsFoijqY
 mjZEa2bCKilVbI6AotdUg3xFBmvP8HcYHNRX1+HkmENWMHYyR/ZN7IiBWyCMmdBgLS5rDVX
 +GS4H8fUr5g29CccrLJu5tbnMJ+kQq5d+tCQxkFgtcJIIkDt9GMQkBFx2xJAq76QhtBp/rU
 fSU82GONUPOGZLRDazQaTxwFpKsx2CpVgK2a/T922A/iXrkorHXLy7jyDG5Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mailbox.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5976446A7C
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 17:07:54 +0000 (UTC)
X-Greylist: delayed 440 seconds by postgrey-1.36 at gabe;
 Fri, 12 Jun 2026 17:21:56 UTC
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4493A10EAC2
	for <nouveau@lists.freedesktop.org>; Fri, 12 Jun 2026 17:21:56 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gcR2d6zdDz9ss3;
	Fri, 12 Jun 2026 19:14:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1781284474; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ruCg0zsQ+pCKVkr4bRPKkDiLDN0obctnod88Z+YlYn8=;
	b=WR2uZbkxFXNTQ5s9l1pPa8qMlCDVVg94t1se20DO12nqG0/HRu6L0UTxIx2EwJM0Bg6oyv
	BqZXRpuLOZDP5zxD6KSfapjMpRYhMuMKVI+SrmB+BM5+lB0GUccUzccsad/mTRIJl8rwMr
	Z9WQKQp+kRDc7OgdK1C5tnufIQu3U8rBbxcvKh8JMr3V/i1U2PwTK2h1hI8ALJvVxyVrds
	wbUt4L94hA2V+LcXsK5d7Lv3aWcXlu5bsuXWR/zpHllqeNcoA49rFzZdnidMsPMCDRIIUt
	mwgiy+6WOlwX+GrG7t4hEXo/HSKBRowx+X4VIZSUJrgB69zYutdApCbcbG+Wgg==
Message-ID: <6f929f2e1c55f7945b41593eea44f28d3b93abf7.camel@mailbox.org>
Subject: Re: [PATCH] drm/nouveau: Simplify nouveau_cli_work
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org
Date: Fri, 12 Jun 2026 19:14:30 +0200
In-Reply-To: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: ad8d6e7c345bf1c729e
X-MBO-RS-META: bi8rza9rr5zqmq43ai6k75juckspsmkf
Message-ID-Hash: KOVT6TCHIJBSEOQCJUVNK33NLANJI7XH
X-Message-ID-Hash: KOVT6TCHIJBSEOQCJUVNK33NLANJI7XH
X-MailFrom: phasta@mailbox.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: kernel-dev@igalia.com, Philipp Stanner <phasta@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: phasta@kernel.org
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KOVT6TCHIJBSEOQCJUVNK33NLANJI7XH/>
Archived-At: 
 <https://lore.freedesktop.org/6f929f2e1c55f7945b41593eea44f28d3b93abf7.camel@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 2026-06-12 at 17:54 +0100, Tvrtko Ursulin wrote:
> I don't claim this fixes anything but the code certainly was a bit
> roundabout and this at least cleans it up.
>=20
> The only semantic difference is releasing the fence reference after
> the work callback is called. Which kind of make sense anyway.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: nouveau@lists.freedesktop.org
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c | 19 ++-----------------
> =C2=A01 file changed, 2 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 42a81166f3a9..7de174537fc7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -153,22 +153,6 @@ nouveau_name(struct drm_device *dev)
> =C2=A0		return nouveau_platform_name(to_platform_device(dev->dev));
> =C2=A0}
> =C2=A0
> -static inline bool
> -nouveau_cli_work_ready(struct dma_fence *fence)
> -{
> -	unsigned long flags;
> -	bool ret =3D true;
> -
> -	dma_fence_lock_irqsave(fence, flags);
> -	if (!dma_fence_is_signaled_locked(fence))
> -		ret =3D false;
> -	dma_fence_unlock_irqrestore(fence, flags);
> -
> -	if (ret =3D=3D true)
> -		dma_fence_put(fence);
> -	return ret;
> -}
> -
> =C2=A0static void
> =C2=A0nouveau_cli_work(struct work_struct *w)
> =C2=A0{
> @@ -176,9 +160,10 @@ nouveau_cli_work(struct work_struct *w)
> =C2=A0	struct nouveau_cli_work *work, *wtmp;
> =C2=A0	mutex_lock(&cli->lock);
> =C2=A0	list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
> -		if (!work->fence || nouveau_cli_work_ready(work->fence)) {
> +		if (!work->fence || dma_fence_is_signaled(work->fence)) {
> =C2=A0			list_del(&work->head);
> =C2=A0			work->func(work);
> +			dma_fence_put(work->fence);

Dave had addressed a UAF with that patch.

So if this would fix it, then the claim would be that work->func(work)
was the user of that fence, and not some other party elsewhere.

I don't know whether that's the case.


P.

> =C2=A0		}
> =C2=A0	}
> =C2=A0	mutex_unlock(&cli->lock);
