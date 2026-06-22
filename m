Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849CFCD98F2
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 18:20:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 123AE10E801;
	Mon, 22 Jun 2026 18:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GIXMY0rG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4D12646C99;
	Mon, 22 Jun 2026 18:05:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782151546;
 b=nCh4kKZRRKuvOsKl0mP519rtGJBI5nk6/vrZ9dOm1VmcLxtW4ZuFP4BmCOyDEME+lRXwk
 y13MovMqKizQV6WqkbmcIqXbYwDqu7qBtGMmopHxDwhAN8Ngf59QUgGgvyWnx7/Ev1Slqb6
 Ls+rESnV09OEprRmYHWpVtUKDwFEPfJJT4rYQajcnEfVybt4sVk+3V3AjK8PVvXn7gSPbUZ
 o0AB/Y74hH19oU0Gt7CUiMoh4/i5joE5cVH+kydxRALNvA7Zer8NJE9mTwwUlJUFKs0S1Eg
 5do/69H5KLdqrp02cakbijCAO1Jv9sasEjGXjeE9XSAuT1Qf2EvQ8Hgp6byA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782151546; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dBA6CnCEo0EHydNW5LEGvdxXZC1r75DUROE1Y8OSRFM=;
 b=A4KPm/H8WOIv3X+2j97RBakcKnTVbvrX5AoapIczJfmobWkuxJixDXl+jhVrMFeULsXj4
 5+Le+EVe7ugAxg50fR9eMV7mUyShFAh/ITJUxKdy9Co4sa2aScRfrJkBIiAWBDwjZ10KD7x
 0fgzl2jD9T8uvlcfTw4zsqJjPMI+yR7YcH/NnqYmTw0OhV/J0BQuEi8vXdMHPtr9lqKUOM6
 9Ypt5b7JDTMGbqKkAEUx0XUpRXLnJ9n5kTCemKPdOwB/i4RwWkM6nHGuX+PJ9qI3JTU8rkD
 99Debye6gCzqd3CQzTLa7qCnAq6fv8wZK8N5a/2hX60TAYLKdB2HQhFp48og==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7929446BC1
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 18:05:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F39D910E7DB;
	Mon, 22 Jun 2026 18:20:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 584D8601F3;
	Mon, 22 Jun 2026 18:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFFAF1F000E9;
	Mon, 22 Jun 2026 18:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782152407;
	bh=dBA6CnCEo0EHydNW5LEGvdxXZC1r75DUROE1Y8OSRFM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=GIXMY0rGiQbGwjpvuQpD/nu9ZldK6puGkCbteExIqgf+fCPzK1y3cpulX5njQouje
	 L0u7RoSujFJsw0IdYXi+Pnf10rvYzhAJDfGpBvAAUh1Z3KiNfTd2XOB628OnaYcKVG
	 Rk9h98p/egOG0TT8twNAAG5S6XLfZ/YKeCXM1Txh+sAYwKSUWMZlM2Xn4O85LcTTXW
	 7DbFXllR0ZngNAcFrPs5yCATpPyyAO8OYIBiDXzSziuhjKUj8Rbc0te3aH2SdsZzd6
	 f2jEriE0wAeaR/DBbYbB3ghEQlu8p8uoSMl0AWx+QF7hw7ssQB1D5BQtbSeiAYtwvo
	 VPMhU7/A4gMOg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 20:20:03 +0200
Message-Id: <DJFSAVPR4EE0.1L3AWTWLI9CE2@kernel.org>
Subject: Re: [PATCH v3] drm/nouveau: Simplify nouveau_cli_work
To: =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
 <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
 <DJEU27KUZRNN.3R1F8AL6UL30S@kernel.org>
 <d3e27b911dd1c0261c2c4d7d65d12d6c1aef58ff.camel@mailbox.org>
 <cf9f4a62-ed02-46d6-9560-481ceda2d1a3@amd.com>
In-Reply-To: <cf9f4a62-ed02-46d6-9560-481ceda2d1a3@amd.com>
Message-ID-Hash: ZZ7PPWHBA7H6WRZCTSXDIM4Q4S3VKJJU
X-Message-ID-Hash: ZZ7PPWHBA7H6WRZCTSXDIM4Q4S3VKJJU
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZZ7PPWHBA7H6WRZCTSXDIM4Q4S3VKJJU/>
Archived-At: 
 <https://lore.freedesktop.org/DJFSAVPR4EE0.1L3AWTWLI9CE2@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jun 22, 2026 at 2:17 PM CEST, Christian K=C3=B6nig wrote:
> Maybe an idea how to generally tackle this for all drivers: Never let the
> dma-fence framework call dma_fence_signal(), that should only the driver =
do by
> itself.
>
> This way we don't run into the issue in the first place that the driver n=
eeds
> to install some callbacks *and* the driver also knows when the installed
> callbacks are finished because that is when dma_fence_signal() returns.
>
> Does that sound valid to you guys? If yes I will be sending out patches t=
o do
> this.

I think that's a good idea, as it would get us rid of having to rely on API
internals to synchronize struct dma_fence_cb callbacks without doing the fu=
ll
RCU dance, which can be quite cumbersome (as described in the nouveau case)=
.

It still leaves us with the full RCU dance for struct dma_fence_ops callbac=
ks,
but that's a different topic.

Thanks,
Danilo
