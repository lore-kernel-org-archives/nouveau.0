Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388ACCDB46B
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 08:57:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 671B710E58C;
	Mon, 22 Jun 2026 08:57:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="mylKUjOD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7436246C56;
	Mon, 22 Jun 2026 08:43:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782117813;
 b=tgYlGCW/KDwGfRaYKR/XU6TniHiH83d5leoPbxMKCEoFUwiTh7Wj4BVEyoyzZMXnu1bJ5
 vCirU2UZctlTD7v9Y+Rb5MclW9C6Myshp3OU9Q+RLprcoI9su7NZKIP6Uzh+BrJB+4xGYhD
 gkg1bjedNhrLTiskt2c3d+JefJGE0jLpc2WGq7qJAHkZrHpzQjp+HcgWaL3q+xlISgSaJca
 1hXeM2/fTH0KiJoFbrDkyyNQ7TdCydlt0D8ZCte5tli+Sbc8r74H/77aqWrGdy5DcmhyAY3
 ZLUHW1ZTGA9jRUnyLwLNbzUNeOluR6MwXxDA/+XmFSCSqQlGstQoORjfDmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782117813; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hKzWHukHfTQILopIYFUQ42h+qPJjuzhOu/WvXALLHzA=;
 b=GOiLlJHBpsIYg8uDZAURH+Ofx2iGmYq9l2XFqqOx9/1t3BYURDxMZgyBQmGxAQJZBzVWv
 n7WfHxbTnwRnz76bbLIhGPiN6WM/VaFFHPsUaPATzoF2J+Plv8Pwfhj9cNizTvx+wVw12H2
 5zpt//RbL7CzoKWHpg/FPVayR/44Ol/0Odk+WG1ymY/XpyAatGMXmmlYVT5YWSh1/FAnHBU
 +EEoonj/nPoZt0rciaEtChnRzjDMvxxTqhzpsoHrxE03DbRgAeWM8bwKrTqDUsCRs+M4iA3
 PKrcxjseDQetMVyyoyVyIzvPQroeN50KwOikS5YHcda/hs0B5P8LzJul15MQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=mailbox.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=mailbox.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=mailbox.org
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 18C8C46BBE
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 08:43:31 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB9210E2D6;
	Mon, 22 Jun 2026 08:57:54 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gkMXv01Lpz9vDJ;
	Mon, 22 Jun 2026 10:57:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1782118671; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hKzWHukHfTQILopIYFUQ42h+qPJjuzhOu/WvXALLHzA=;
	b=mylKUjODLd0MfB07KpPRZ1L+HrvKjLV9/+jQ9wr0NBqYDeoYfYapfARSoL7bZhl9w8u+nL
	rDnqlMWL0HIFRW08GfeiEKMzDQgl62U62gVjXxoB7g47ciWWh2pvEOABVtZ3L2ufavQ3lz
	aB/atPQ9TNpHMOt+wxE3tebF3+PeDT+7eLNvF9K4fr8ga/+zrkVRECVRm94v1KH0ZNdpG4
	KdoX2ZeywfXFyEmKL/udtMDUSkqr3Zprrdn5FnGl9T/b+qzcCnn2WoLft5Rgl3FrWJ5BH/
	N3uAACXkof1B8B0XlKkX3KAD7VCrpQnZEWqGM2lQS3oiYhh7ok8r4wr85uK3SQ==
Message-ID: <d3e27b911dd1c0261c2c4d7d65d12d6c1aef58ff.camel@mailbox.org>
Subject: Re: [PATCH v3] drm/nouveau: Simplify nouveau_cli_work
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Tvrtko Ursulin
	 <tvrtko.ursulin@igalia.com>
Date: Mon, 22 Jun 2026 10:57:45 +0200
In-Reply-To: <DJEU27KUZRNN.3R1F8AL6UL30S@kernel.org>
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
	 <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
	 <DJEU27KUZRNN.3R1F8AL6UL30S@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 4qo9t4mhc1dmp5i3id4epexmzyebqwbt
X-MBO-RS-ID: 38736c6b59fcd00d6c8
Message-ID-Hash: Y64MW5XSHYXLWL4XDTQVF65NR5RWLRIX
X-Message-ID-Hash: Y64MW5XSHYXLWL4XDTQVF65NR5RWLRIX
X-MailFrom: phasta@mailbox.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Philipp Stanner <phasta@kernel.org>, nouveau@lists.freedesktop.org,
 Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: phasta@kernel.org
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y64MW5XSHYXLWL4XDTQVF65NR5RWLRIX/>
Archived-At: 
 <https://lore.freedesktop.org/d3e27b911dd1c0261c2c4d7d65d12d6c1aef58ff.camel@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun, 2026-06-21 at 17:30 +0200, Danilo Krummrich wrote:
> (Cc: Alice, Boris, Christian, Dave, Gary)
>=20
> On Mon Jun 15, 2026 at 11:26 AM CEST, Tvrtko Ursulin wrote:
> > @@ -176,9 +160,25 @@ nouveau_cli_work(struct work_struct *w)
> > =C2=A0	struct nouveau_cli_work *work, *wtmp;
> > =C2=A0	mutex_lock(&cli->lock);
> > =C2=A0	list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
> > -		if (!work->fence || nouveau_cli_work_ready(work->fence)) {
> > +		struct dma_fence *fence =3D work->fence;
> > +
> > +		if (!fence || dma_fence_is_signaled(fence)) {
> > +			if (fence) {

btw I don't think that these two lines read more beautifully than the
removed nouveau_cli_work_ready().

> > +				unsigned long flags;
> > +
> > +				/*
> > +				 * Because fence can still be in the process of
> > +				 * processing the callback list, and the
> > +				 * callback references the work we are about to
> > +				 * free, we need to sync with the callback
> > +				 * processing before freeing the work.
> > +				 */
> > +				dma_fence_lock_irqsave(fence, flags);
> > +				dma_fence_unlock_irqrestore(fence, flags);
>=20
> This does not ensure that there are no more dma_fence_ops callbacks into =
the
> driver. For instance, a concurrent dma_fence_is_signaled() might read the
> signaled flag as false before we do this lock dance and then still enter
> ops->signaled().

The issue Dave addressed was a UAF within Nouveau itself, where the
driver put() its own fence while its own callbacks were still
executing.

Tvrtko's patch does not address the RCU issues you mention, nor does it
address any other fence related issue except for adding the comment
that should have been added back then with the fix in
nouveau_cli_work_ready().

It's literally the same. Take the lock manually to work around the fact
that the bit is protected inconsistently, setting is locked, reading
just randomly races around.

>=20
> Luckily, for this specific code here in nouveau it should be enough to en=
sure
> that all dma_fence_cb callbacks are finished, which this hack does achiev=
e.
>=20
> The reason I call it hack is that it fundamentally relies on dma_fence
> implementation details and not a specified API contract.
>=20
> The closest thing to an API contract for this is the RCU protection that =
was
> recently added. So, the proper approach would be to run this work with
> queue_rcu_work() and then call flush_rcu_work().
>=20
> In this context it is worth noting that in this case it is even more
> complicated. Since the work struct is shared per CLI the single RCU barri=
er in
> flush_rcu_work() is not enough, i.e. there is no per fence callback grace=
 period
> guarantee.
>=20
> To me this still seems to be a bit of a footgun (although we could probab=
ly
> improve the nouveau code to make it a bit simpler).
>=20
> That said, the patch does make things a bit clearer, so I picked it up --
> thanks!

I disagree that this is an improvement and am unhappy with you merging
it. It merely moves Dave's fix from one place to another and causes
unnecessary churn in the git log.

Adding the comment into Dave's fix until someone can address the
(literally) fundemantal problem in dma_fence would have been my
preferred approach.


P.
