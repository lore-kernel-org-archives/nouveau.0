Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5446D46C1D
	for <nouveau@archiver.kernel.org>; Sat, 31 Jan 2026 00:35:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B036110E1A4;
	Sat, 31 Jan 2026 00:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o4vfWilD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0671140F63;
	Sat, 31 Jan 2026 00:26:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769819178;
 b=VGY2Q7w0J8cGHTQQHX8TqGnia6FGwzkWaxTgipkjF7HIcxV1FL0LH+fpE+SE0ouACqTnx
 2F7hvp/Zo0nw4ccV5izv6USQUAUQJozMNnDV0Llk1L+vPn96kq/7Zomupw+0JY+mTiijYII
 uUeqsbLRvelEd1aGRYh3phz4GeCE32ScdyeSpApCwHa7DBFOWYCpoMcpJWxnL387DTSglIi
 Aa3iFIwJdAhk8h0vrKlB0pQ9HSHDNuKiGuH4jkK3DIso4MrJGfPX7vMutZnTj6OVWSfHiDn
 rYyimoaJzQ5HDMbDaHZ+gL/yJgEn81v6L6JyP7jTq9S4xPUudxImQCsU6wqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769819178; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sY3VqJJlEkOJaiS4F+Hdt1OXygTLM7yODQPXTI+8jAk=;
 b=f+muKUDRxICoHZIORyhX22v3V6Z9d+q4whPI1+ZDb9Za2cEy3qrTMiGkFaEVIT8n0E7z2
 TCpnBz1MCmJJiQGlXFFayFKkznVk3gffGrNt3SzKLQLPOkVjqaSp+PoJH1S/SMhqicgKUI+
 RqbJoqizDZlVpylpoKVvX8+0GQqmH1uVMnPJm8zCmcFf8IjAe2Qw/Fh0hDZCFSHG3sFlZ+9
 lqChYRusIbXoxBsbO5nmGH2o/dRsMzxeNYy9wfXRWK76pP9KsVQBLDi63hZF40qH4tVQkEK
 8FIdH6mjhDSeIgEbROeo9I1Hp5EIErotJrvYD0+4zQRv4TKMTg/kqOlZntJA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1CAF54015A
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:26:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 934E010E109
	for <nouveau@lists.freedesktop.org>; Sat, 31 Jan 2026 00:35:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EA4D4024C;
	Sat, 31 Jan 2026 00:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B94C4CEF7;
	Sat, 31 Jan 2026 00:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769819724;
	bh=ES6e4LTzBdsTWSEb8j3Wo6hkQDH7RWYISCYXV9N3FEw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=o4vfWilD1UCEmxk+WI4MZbEX5f57zLaweMhIZJeViASdAvxnPX6JT2HPKP1l1Fpcv
	 6ppCMNIukNp87wiTpkVSbh4bvmDQZleqGTUdWKgkecl2BHZJJoFffmp4F9WlUMC7eN
	 CADuXivE+FzB6SU/aQDUEfO5Qw70S6tZfi1xIha+1QaW6g2A06x/rX69ipDm9PDKrK
	 05zktisKuj40JgzWQlF+a0kxRtnE+744duv4YqBheSLYVDW2iGsRpcM9rwjJfUEGka
	 5tyFcIhpXyPyUVBzqQTE0PcsomEiCxVlll/tUGJOd8SQbXAi1I1V09mVEnHKe6JJA5
	 au27SyGrUCu+A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 01:35:20 +0100
Message-Id: <DG2CQBAM6SG8.1116LCW3IIT3N@kernel.org>
Subject: Re: [PATCH v6 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-8-ttabi@nvidia.com>
 <95b913a1d344f603d17abc7f6d78da166068bc91.camel@nvidia.com>
 <DG2BY691US2F.36NWWJ18OPTBP@garyguo.net>
 <DG2C7G44QD5C.BY4U4HG7XBJM@kernel.org>
 <f723d517b943b9f4c10764daee9ff711e15b6834.camel@nvidia.com>
In-Reply-To: <f723d517b943b9f4c10764daee9ff711e15b6834.camel@nvidia.com>
Message-ID-Hash: GYS2SRU5ZFDPPXXXGJAPMWGCN7NEBSOD
X-Message-ID-Hash: GYS2SRU5ZFDPPXXXGJAPMWGCN7NEBSOD
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "mmaurer@google.com" <mmaurer@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GYS2SRU5ZFDPPXXXGJAPMWGCN7NEBSOD/>
Archived-At: 
 <https://lore.freedesktop.org/DG2CQBAM6SG8.1116LCW3IIT3N@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Jan 31, 2026 at 1:26 AM CET, Timur Tabi wrote:
> On Sat, 2026-01-31 at 01:10 +0100, Danilo Krummrich wrote:
>> > One idea is to create types that look exactly like `Dir` but always ZS=
T and
>> > no-op regardless whether CONFIG_DEBUG_FS is enabled... But that feel a=
 bit..
>> > weird. Matthew, what do you think?
>>=20
>> There is no need for CONFIG_NOVA_CORE_DEBUGFS in the first place. The on=
ly
>> Kconfig we need is for retaining the GSP log buffers after driver unbind=
.
>
> Danilo, I'm confused.  You told me to add this Kconfig:
>
> https://lore.kernel.org/rust-for-linux/DFR6RWROWBYA.1Q9JKH8UDSXOX@kernel.=
org/

Maybe a misunderstanding due to my type? I.e.

"I think it's OK to always have the entries on keeping them beyond device u=
nbind
has to be behind a Kconfig option."

vs.

"I think it's OK to always have the entries, only keeping them beyond devic=
e unbind
has to be behind a Kconfig option."
