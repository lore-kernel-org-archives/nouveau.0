Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AA7CDB46F
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 12:45:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B731F10E6AF;
	Mon, 22 Jun 2026 12:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KPl9Yn5Q";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 72AB046C6D;
	Mon, 22 Jun 2026 12:31:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782131470;
 b=F+F5uO1P3uo3YSCLNdSGp3ijmhRTCb/D4ksYZ0srYziEZO3+BjZZ3eC0HF2OWIhXOG6Td
 BRzVjmmIzJ1p4hYezwj4p7sCe97FeQlnY2+ciS9Ud17pfQx2bgyHOUfgfsWf20F+kM70ugY
 qDGVMwvW6kHW9n0/9Va4NXpR26yVhGiUkvD7Z122EwA9bcC5p94yei4p71hTt7LPCBUWRpl
 W/SrkXufK4mWbWjIC/MH64C9e5CCYF2AC3nUKP2Xnr996A5O9bPeJCl8q8nFK4rFaQC2NXW
 C45exdN44jUx4K+7zljIWwBOGD91ntrpQnpvPk6admu3u9BZRHILggqgXG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782131470; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RkMwbTC6310DHTrZdoptKKXWD1KIfX8Jfo4LzUqTcgs=;
 b=JkvV/0wkEIdh8+VH2+se2P7WpQfzzEYu1mrhyqCKHed/WEWngFhSqe5MI8/VWi8PBeJQI
 M4MoE5laSIHj+EfQxoxcSS5qPr3DaveBYT/qEDjrv9XVjmPnwAiaacDbU25KKvkBIgh4tAc
 890GywPNEGvwqFR/ljPA/owi4Gv643Nw23vcu9yeqSpN5/hPOz1ZYsp37pEqBDtXwzN79qF
 TBWd7ViYcfm/5MgEXjRXgyh6PtH9uySjccdc9vEKEERTRirQDD2zuVOoUIfd8UkhjLX6WCt
 1kTT7mmxqduIMLFojcA42xo4Vbv2MskbV0D6EDwej9n2RqdG6u+pREzCnRiA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B35E046BC1
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 12:31:06 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D20D10E635;
	Mon, 22 Jun 2026 12:45:30 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gkSbV48k3z9sWm;
	Mon, 22 Jun 2026 14:45:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1782132326; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RkMwbTC6310DHTrZdoptKKXWD1KIfX8Jfo4LzUqTcgs=;
	b=KPl9Yn5QwOD6AnheCc8UlrorIpnP+dvN9KCfUVMCk9RAOmgsewVSWfVpYrMZ2Y6u+8+JI1
	Ox+zeoe5LNoMfmZhfGv+M+cbWksOT4kLVe9rDso6qG8eObXLqycmhckfBTjpUPIVqVGAdw
	LJfhVXNUSEE4Cv42K2lL7/LW16yQq4wfGl/uNYPYEu/A7WnZV3hK+ktNw3G9eWP/7CB3f4
	GPn/KiPeCKwGc+O/N39dlhpOfxVpU5ANZDLx7LJ6S5Imrq/6Jn2f7lRxsj0HbI0hnn76h8
	9zuKYdLgty5Sp3qhtCTLrYz32RjCjRh5IoWY5sehncvfdTb+GUqJ7KF0LAIo8g==
Message-ID: <8c5ff6db6ab8c29c3e7addd969c4642e9d82c524.camel@mailbox.org>
Subject: Re: [PATCH v3] drm/nouveau: Simplify nouveau_cli_work
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, Tvrtko Ursulin
	 <tvrtko.ursulin@igalia.com>
Date: Mon, 22 Jun 2026 14:45:19 +0200
In-Reply-To: <cf9f4a62-ed02-46d6-9560-481ceda2d1a3@amd.com>
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
	 <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
	 <DJEU27KUZRNN.3R1F8AL6UL30S@kernel.org>
	 <d3e27b911dd1c0261c2c4d7d65d12d6c1aef58ff.camel@mailbox.org>
	 <cf9f4a62-ed02-46d6-9560-481ceda2d1a3@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: zwxpr4yr7cu81hodh86wfpmdpue1g5x6
X-MBO-RS-ID: e546aff977dc697f06d
Message-ID-Hash: 2CRGXKMALNSPYYLIIXKUK7ZT7QLHVQVR
X-Message-ID-Hash: 2CRGXKMALNSPYYLIIXKUK7ZT7QLHVQVR
X-MailFrom: phasta@mailbox.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: phasta@kernel.org
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2CRGXKMALNSPYYLIIXKUK7ZT7QLHVQVR/>
Archived-At: 
 <https://lore.freedesktop.org/8c5ff6db6ab8c29c3e7addd969c4642e9d82c524.camel@mailbox.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

(+Cc Daniel)

On Mon, 2026-06-22 at 14:17 +0200, Christian K=C3=B6nig wrote:
> On 6/22/26 10:57, Philipp Stanner wrote:
> >=20
> > The issue Dave addressed was a UAF within Nouveau itself, where the
> > driver put() its own fence while its own callbacks were still
> > executing.
>=20
> Yeah that's exactly the reason why I have been rejecting the idea
> that drivers install callbacks on their own fences.

I remember we had that discussion when I discovered that signaled
fences can temporarily remain on nouveau's "unsignaled fences" list and
wanted to do the removal automatically via callback.

>=20
> Maybe an idea how to generally tackle this for all drivers: Never let
> the dma-fence framework call dma_fence_signal(), that should only the
> driver do by itself.

About the framework I'm not sure, but what we do enforce strictly in
Rust is that only the creator of a fence can signal it. We achieve that
by two fence types, of which only one implements a signal() method

I remember seeing some parties signaling the GPU scheduler's fences, so
such things definitely happen. And since you likely can't enforce it in
C, you would still have to take the possibility of a third party
signalling your fence into account.

>=20
> This way we don't run into the issue in the first place that the
> driver needs to install some callbacks *and* the driver also knows
> when the installed callbacks are finished because that is when
> dma_fence_signal() returns.
>=20
> Does that sound valid to you guys? If yes I will be sending out
> patches to do this.

Hm. I suppose that would be an improvement?

Maybe let me ask differently, too: why is it that the framework is
signaling fences in the first place? If I understood you correctly last
time that is partially related to the locking problem in the callbacks.


P.

>=20
> Regards,
> Christian.
