Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE49CD98DA
	for <nouveau@archiver.kernel.org>; Mon, 15 Jun 2026 09:32:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD84B10E31B;
	Mon, 15 Jun 2026 09:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="by2nHFup";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 39A1946B2B;
	Mon, 15 Jun 2026 09:18:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781515084;
 b=ugykorUz+fqL7eGuoovSekPb089lgiD23H5mJbsAiVkZWjQxIzyGKvTu79Em7HdokvUgY
 JSMtuwarisctqAD35eVBD0kTW/kDVTIAanl7uulxAMkrEJxDO1BTnhDHW0Lntv5x2dvgFw6
 U5WQ19zLgAklRJQENybObBKr9vVadMZYHDpaTKRtP6+nDbmqIFNCYKUqFnTQj+4PK0XHv8A
 aXWOFSaDJfCozbdZCnUX2qlKMu8rvh83P/55M73/svdkfCyWZ5uBrddLmZ0GRrq+8scbk0z
 NAlRzd8BDHxSFpZCskt5MjcJYTcs5Qzpv+DwWXIRgJur8CXDr1gjd5pc1DCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781515084; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IHQDosOm22jDMT0kcqkkbFG5+g4HnZQEipe6cGcRh7c=;
 b=mX/9D0uSc3azjYTI5PutJsZ02yE39dbp/vn5Ij7yTY2uwsMfqPW6wPhGn6qeToJMjWPx2
 wAR9ivCDZ+YJuXqrWSQUjeBsAbasZkSJG1pEThfoh2F8j8NHfc7sp9xNuX35PBOMTZ5G5Xq
 dYDeHj1kPue//p4OGb+gwA2/yrMgO6z/XaCccEmJsEgQ97SyqfREyTOfcsRhnQtArROS63f
 GOF+2QCd0kUvp/s9IGE1rk0lPcG6WLUuL45x/72R8igwczv2MP4WJFuqaKMSkqA1M/lLl12
 RO8mqOQC2hULTr+i00LyP+q4aV7qDU+ehBEsDn4UVA7DEnINk8Yu+LdqsalA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C586F46A78
	for <nouveau@lists.freedesktop.org>; Mon, 15 Jun 2026 09:18:00 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9257D10E313;
	Mon, 15 Jun 2026 09:32:07 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gf4dY5yZhz9trN;
	Mon, 15 Jun 2026 11:32:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1781515921; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHQDosOm22jDMT0kcqkkbFG5+g4HnZQEipe6cGcRh7c=;
	b=by2nHFupUSW24AiyvLIU0HFpiEkiM4M5QjbephY0Ueq4ZPEfSrMJBeRPMlKG/98iYYyMhT
	suKSPvpkRRr5zHaspoDD0FOMxhsdtUjonlJlTFJmOBvLSwPy+p6A5CB9rzj3PFvtQpoGBv
	dGhNiEqe157ic1sk3dZW3ffhacALkVyZzKDO6hC1ziuBwnpYnP4i9IMusUw8KRO1r4AZ95
	HEqf7fap6fhq0cdJ9DqyhcuL3UwI7wArYp66A8/ciUmNSpNlZzrNvPh5GrTYy2BfLvKkFl
	jCGD3aKlHKMd/wV1ppc9KTPaYvl3A0GHrLW6vEgYBRgsv7Em9M3Us/eAf5PItQ==
Message-ID: <36bd84b9c2d504efbb2484c13455f1aa5ade06ff.camel@mailbox.org>
Subject: Re: [PATCH v3] drm/nouveau: Simplify nouveau_cli_work
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org
Date: Mon, 15 Jun 2026 11:31:57 +0200
In-Reply-To: <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
	 <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: t1jwn3aphp9ngd7tjsygxqfm4wk69uas
X-MBO-RS-ID: 12c9ef0ea4e8ee90adf
Message-ID-Hash: BGLL3H6TI5FTSS4DGTLLG6YS5FIKWTW3
X-Message-ID-Hash: BGLL3H6TI5FTSS4DGTLLG6YS5FIKWTW3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BGLL3H6TI5FTSS4DGTLLG6YS5FIKWTW3/>
Archived-At: 
 <https://lore.freedesktop.org/36bd84b9c2d504efbb2484c13455f1aa5ade06ff.camel@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 2026-06-15 at 10:26 +0100, Tvrtko Ursulin wrote:
> Lets simplify and make clearer the fence lock cycling workaround in
> nouveau_cli_work().
>=20
> The reason for the workaround is that the worker processes the list of
> pending work items (and so fence callbacks) opportunisticaly, while
> dma_fence_is_signaled() returns true as soon as a the fence is signaled.
> It is therefore not allowed for the opportunistic processing to free the
> work item, since the fence callback processing can still be in the proces=
s
> of dereferencing work->cb.
>=20
> This wasn't very clear in the code so clarify it with a nice comment.
>=20
> In the process we replace the somewhat interleaved and not very readable
> nouveau_cli_work_ready() helper with a direct dma_fence_is_signaled, whic=
h
> is even faster since it removes the lock cycling from the unsignaled fenc=
e
> path.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: nouveau@lists.freedesktop.org
> ---
> v2:
> =C2=A0* Don't dereference work after work->func(work) frees it.
>=20
> v3:
> =C2=A0* Put back and explain lock cycling.
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_drm.c | 34 +++++++++++++-----------=
---
> =C2=A01 file changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 42a81166f3a9..7ea95ab960a0 100644
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
> @@ -176,9 +160,25 @@ nouveau_cli_work(struct work_struct *w)
> =C2=A0	struct nouveau_cli_work *work, *wtmp;
> =C2=A0	mutex_lock(&cli->lock);
> =C2=A0	list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
> -		if (!work->fence || nouveau_cli_work_ready(work->fence)) {
> +		struct dma_fence *fence =3D work->fence;
> +
> +		if (!fence || dma_fence_is_signaled(fence)) {
> +			if (fence) {
> +				unsigned long flags;
> +
> +				/*
> +				 * Because fence can still be in the process of
> +				 * processing the callback list, and the
> +				 * callback references the work we are about to
> +				 * free, we need to sync with the callback
> +				 * processing before freeing the work.
> +				 */
> +				dma_fence_lock_irqsave(fence, flags);
> +				dma_fence_unlock_irqrestore(fence, flags);
> +			}
> =C2=A0			list_del(&work->head);
> =C2=A0			work->func(work);
> +			dma_fence_put(fence);

This is semantically exactly the same fix that was introduced by Dave
in c8a5d5ea3ba6a and which you are reverting here again, basically.

It's no improvement IMO, just a differently looking work around the
fact that the dma_fence framework is not properly synchronized.

I suggest you participate here [1] and here [2] and share your opinion.
At least *this* problem would disappear of only dma_fence_is_signaled()
were locking properly.


P.


[1] https://lore.kernel.org/dri-devel/fa0dc9757bf8343516c4b156a2b70ec91b64e=
f8f.camel@mailbox.org/
[2] https://lore.kernel.org/dri-devel/20260612104251.2264707-2-phasta@kerne=
l.org/

> =C2=A0		}
> =C2=A0	}
> =C2=A0	mutex_unlock(&cli->lock);
