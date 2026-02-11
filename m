Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDE1ECD6E9
	for <nouveau@archiver.kernel.org>; Wed, 11 Feb 2026 21:18:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A1B2D10E65F;
	Wed, 11 Feb 2026 21:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pvFSgP7e";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7EC2D41C6A;
	Wed, 11 Feb 2026 21:08:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770844110;
 b=W76AAzFleYMehTCnt7q3vSHYO9ApKUcCbJ18xiCb7cHKOrzV1FIQUWHljubthNsu5sIzN
 XiK6yyMwR0NWz3qLXvKNrq4PpkA/FjpmuWFhObhXPkX2Nsh4M1+cS6JWlXJhRsxfgqH2P6E
 lxJ5D6oTPNqX7PWjMficy0LvziE6IIR150/qIzJ6FUmU+MjrmJK/QPg6HWS9suiJQM/GUlD
 i/6AZJOJBfqRg7iXxjdwBb+2aAZcPBrnacWI8un1rbSugRJDUm54vlGKhtb92MvV/+S2s06
 0UJudeioWBq8hNETVDfQKSpa40B3Er261q6ZHa46lC8mhkQ8u7wUaGInOBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770844110; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xT0rof/5J4xo7Q3X6YsIdq2pOByL27VuB8Ytrk12UVA=;
 b=dOsXOokqf/Gjr4EbRRWH4Jg4qnmogQ9kJbTIHdJf0xEnKrHwc0JZR/YwsXfCb3ibZB/WT
 MYsYpIoaPBcB1KZ3aCXnMM1bY4HeNH1OnFOMH5S+kBTi6qCjXxPJ8inqf6Bmz5+goP9lOzU
 lArU8i/4aYQoh55TpLjKZs+vXDU94yrU7Qy9WrpVTbpyedKkEzsStxhuL9x2SOTJtoogl+j
 NoLUPCIvXaFcy+QFVs3/FfWWTpDgr5yw53BNe1TDVmqrpjvm27rQGsb1zjViwc/EQ8acmII
 bDvP/PbsL7ahh0MkbChjI2g5iJpnMO6J7e6KgQ/6nDDDP1BDnTaH4m3b8Iiw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 356454053B
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 21:08:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1C54E10E656;
	Wed, 11 Feb 2026 21:18:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C866419D9;
	Wed, 11 Feb 2026 21:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3614FC4CEF7;
	Wed, 11 Feb 2026 21:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770844680;
	bh=Xk2na6235/6MdtkvIhpTRHZmnBktjn8EJsmkNHoHgrE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=pvFSgP7elG8OioKaof0a5y8V+UeqIvIJPG+ORj4CYPFr0S2UTkWWWbG0TeASObmAG
	 ld/2Ev08iZ7H17laDT6HY+vl5c1KPccISOEmTY5yNnb0KHbHe7X7dwBH35O5Kj5V80
	 I1nSWjqVMOy7jX1jsYA4lloLS+T/lz8JVK5hco0RhZ2RE3BYPtFbgpKTVxHX9+kKBm
	 bOkKsO5SwTP3Vmc05Ti8merg7u0PtlDwVpPXxdTxMW62HnkGuhSqcsU9je/EYTJFW/
	 Jahai5V1xcB29kEuBDG9/KadzI/EDX63FjALRne+JKjabdUH/sLG44pAVNU/YFu6cV
	 VPb0rG16+zFrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 22:17:50 +0100
Message-Id: <DGCG1MWY5SJC.1ZGMNKR8E2NPW@kernel.org>
Subject: Re: [PATCH -next v8 1/3] rust: clist: Add support to interface with
 C linked lists
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-2-joelagnelf@nvidia.com>
 <DGB75XMWML8M.DFZY5L52EBQF@kernel.org> <20260211210952.GA3632639@joelbox2>
In-Reply-To: <20260211210952.GA3632639@joelbox2>
Message-ID-Hash: VS7WNOIHAJ26YCSWS7TZL5PB65NN35VV
X-Message-ID-Hash: VS7WNOIHAJ26YCSWS7TZL5PB65NN35VV
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VS7WNOIHAJ26YCSWS7TZL5PB65NN35VV/>
Archived-At: 
 <https://lore.freedesktop.org/DGCG1MWY5SJC.1ZGMNKR8E2NPW@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 11, 2026 at 10:09 PM CET, Joel Fernandes wrote:
> On Tue, Feb 10, 2026 at 11:07:37AM +0100, Danilo Krummrich wrote:
>> On Mon Feb 9, 2026 at 10:42 PM CET, Joel Fernandes wrote:
>> >  rust/kernel/clist.rs   | 320 ++++++++++++++++++++++++++++++++++++++++=
+
>>=20
>> I think we should move this under rust/kernel/ffi/ to make it obvious th=
at this
>> is FFI infrastructure.
>>=20
>> > diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
>> > new file mode 100644
>> > index 000000000000..8aa72b5d54be
>> > --- /dev/null
>> > +++ b/rust/kernel/clist.rs
>> > @@ -0,0 +1,320 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +
>> > +//! A C doubly circular intrusive linked list interface for rust code=
.
>>=20
>> Here and in the struct documentation, I'd suggest to clearly point out t=
he
>> use-cases, i.e. that this infrastructure is for FFI use-cases only and s=
hould
>> not be used otherwise in drivers, etc
>
> I am curious why we would not want to have drivers be able to use CList. =
I
> thought that was the point of making it pub at the module/item level as w=
ell.
> I think it is possible a rust driver may have a reference to a CList in t=
he
> future.

It is a (partially) unsafe API built to support FFI interactions. The absol=
ute
majority of drivers should not have any FFI interactions themselves. nova-c=
ore
is the "odd one" as it will have an interface with a C driver (vGPU).

Besides a few "odd" drivers, there may be quite some subsystem abstractions=
 that
become users of the API. In the future build system, subsystems and drivers=
 will
become individual crates.

> But I will update the current usecase above, as you suggested, good point=
.
