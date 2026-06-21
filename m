Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9D5CD98F2
	for <nouveau@archiver.kernel.org>; Sun, 21 Jun 2026 15:30:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E4D3D10E3D2;
	Sun, 21 Jun 2026 15:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d8KfrdEU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A130E46BF0;
	Sun, 21 Jun 2026 15:15:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782054951;
 b=hfSa3FxKPwXAlhgy/WC2gyyGNivQvXEEZhMgwQu0hXnr/WK247befpAvq6cvVW3sobs6n
 9JmWmdcah2vm5wC3T6A0ETrRV8DwGhnXgHq5GVyLcQs2lk19AfyiWJYbCxKk29BwG+eLcpQ
 zJOmyDqQk/ZZcPw97aq/Y43W7DL5oc/8FKQmFbL6Aewgcxhu0jaJlewwNLmWMtGLuAOMmSq
 +xulD9zuKjL80ec7byuzoiT4Or39P7/3cUEX6n1KzwCDmKfJGSmPkMNs0KUF/U1ublwtxRg
 Fskhk9agGXb1DRaAN0PNq1fyDq3hu3vnO/1vSRiHCueN4nDsNhW9Xuqsgtow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782054951; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6pEoIOWLfQJmO2+ou/JKQf6FBbp/ciOIe6rHDPQ/PM0=;
 b=N6E/UoJ0kMNiEczrpK2IYt5x/N7TnbPmCowgBowlruVErGftt5ImUdqlF+G2Ey7Q9CRaM
 30tLwak4YVy4XA8806W9f9YQpBbqFuMMm82g8d5mp9TEhYWH9rAJAS10DHUcayL0kmrnQmQ
 adg03V3bNofSlEmZabcVzcgIEOcPPZxqrPW1zaGIyBbdGKi6b5tqSC1//b024HDqGpDLUnG
 rUwiDFAS0FxqAdCr4ZGxwmLAUzRiv1WtsO93iXS2+siJV6ZzhbzNWIGQ73Fl7XMZvtVy4Bv
 I0oKiTmDQFzigl5WTkY0V+CybT9RGm8jKCw9lc0dOuGIj2CwEOPpSXwz9JNQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A80D746BD1
	for <nouveau@lists.freedesktop.org>; Sun, 21 Jun 2026 15:15:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AABB110E3C4;
	Sun, 21 Jun 2026 15:30:10 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E73F860051;
	Sun, 21 Jun 2026 15:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937A61F000E9;
	Sun, 21 Jun 2026 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782055809;
	bh=6pEoIOWLfQJmO2+ou/JKQf6FBbp/ciOIe6rHDPQ/PM0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=d8KfrdEUOlKX8045CSG6Zlei6Dc60D7DHRtXbEVaLJjDkpjPUX0e4ns2JPHCJKGdj
	 7/Xedr7dvrvU/MiibqDIebJuAKSHR+wp2sweN0KiY9EQB04fsgFpvez0Da2AjMK9l+
	 GsECbbPTebdGK6ywOO4RSnzyyErtaKY/VMlpaq7fTZjo4/0nVj+r9Kyq9eMvPMfaHN
	 VH+vIK33atDMvR4DABOkiQM4Nnq7qD+eYZQiTQkpTKZvk9EhByaHo7sWyqVye5mfwY
	 VvmeK9TWEuIpC+5gCxmkGgrt1WTogKtH2Dzz2X2DDU1+vC5HThoc3jl3oRB1GqsrTH
	 /9YlesgzBkoew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Jun 2026 17:30:06 +0200
Message-Id: <DJEU27KUZRNN.3R1F8AL6UL30S@kernel.org>
Subject: Re: [PATCH v3] drm/nouveau: Simplify nouveau_cli_work
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
 <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
Message-ID-Hash: CCBGCZMHF5LL5AARFFHVYD4RBAVN32LK
X-Message-ID-Hash: CCBGCZMHF5LL5AARFFHVYD4RBAVN32LK
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Philipp Stanner <phasta@kernel.org>, nouveau@lists.freedesktop.org,
 Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CCBGCZMHF5LL5AARFFHVYD4RBAVN32LK/>
Archived-At: 
 <https://lore.freedesktop.org/DJEU27KUZRNN.3R1F8AL6UL30S@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(Cc: Alice, Boris, Christian, Dave, Gary)

On Mon Jun 15, 2026 at 11:26 AM CEST, Tvrtko Ursulin wrote:
> @@ -176,9 +160,25 @@ nouveau_cli_work(struct work_struct *w)
>  	struct nouveau_cli_work *work, *wtmp;
>  	mutex_lock(&cli->lock);
>  	list_for_each_entry_safe(work, wtmp, &cli->worker, head) {
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

This does not ensure that there are no more dma_fence_ops callbacks into th=
e
driver. For instance, a concurrent dma_fence_is_signaled() might read the
signaled flag as false before we do this lock dance and then still enter
ops->signaled().

Luckily, for this specific code here in nouveau it should be enough to ensu=
re
that all dma_fence_cb callbacks are finished, which this hack does achieve.

The reason I call it hack is that it fundamentally relies on dma_fence
implementation details and not a specified API contract.

The closest thing to an API contract for this is the RCU protection that wa=
s
recently added. So, the proper approach would be to run this work with
queue_rcu_work() and then call flush_rcu_work().

In this context it is worth noting that in this case it is even more
complicated. Since the work struct is shared per CLI the single RCU barrier=
 in
flush_rcu_work() is not enough, i.e. there is no per fence callback grace p=
eriod
guarantee.

To me this still seems to be a bit of a footgun (although we could probably
improve the nouveau code to make it a bit simpler).

That said, the patch does make things a bit clearer, so I picked it up --
thanks!

Thanks,
Danilo

> +			}
>  			list_del(&work->head);
>  			work->func(work);
> +			dma_fence_put(fence);
>  		}
>  	}
>  	mutex_unlock(&cli->lock);
> --=20
> 2.54.0

