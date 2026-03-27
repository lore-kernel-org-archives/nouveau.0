Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D891F10F2867
	for <nouveau@archiver.kernel.org>; Fri, 27 Mar 2026 18:42:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6099510EEA7;
	Fri, 27 Mar 2026 18:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JqLTMAvv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A4F534532D;
	Fri, 27 Mar 2026 18:31:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774636307;
 b=cyuRDD9HC5WcGOcokGG3ptUBBUjqdQup+BnulB8LnAlbSN28jB4QzhzjZEd1nDTkZO9g0
 CytO4PjfUjVFSpnoiT5OEPJYckKZEFO+4FKZTEOcdbLzYn3LScgGL9R69Xo7jsbBwEswKC+
 CbvBdSuxuEedtUyh+m29epAlpBKcMD2iK/2/QA0glfxju3pe6lJvIhqdmpc6kKfHjYGJkdQ
 HURRYkqaLONDOSURTYiuj644bdfkCx9Np1ximRnrCVC2rrQvQHt9jvLgOI5sbej4aH/kYN/
 9Y9qAZCn+sX+/CbZx9uM718g/M2ylr83IeYmVN+vd4HmX4cGwmQNlRCuuabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774636307; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2y7w8ILJRrW4PHKILONOcMtyD5lLkfYAXp0+U6jH+wM=;
 b=lI0aEWeYay32ITMier4bZsGqxT6Yx7B4hHlel3PWvxJZeK/7+6laNwpdD4X8UJQDHjBB9
 LTAfRZJ1LQ/F3IeOZCp87onKLTtDEmOmylTtcl6EWCTOONRspTcFyAlUxi00FCkC/sAODis
 yHKW8bowbwKupMtHkHbu0Ld+6eNsDIW4penXkJEJzpsXKKeKyvwiq5Gxlc2AXQIgjgyTcsa
 trz9CNvCR3VeSlOXRQfdlcyZi78tY9RfmysfBKpSFjhv3uvd5oj3JE4lpM7B/JU1tyvd4Iv
 v8hxZBfQ1V9IxdVQGRDowBfotk4kJWhAVgGslczUbtz7fhPvxBAMtauYydhA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9AC85445E1
	for <nouveau@lists.freedesktop.org>; Fri, 27 Mar 2026 18:31:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0C69D10EE81
	for <nouveau@lists.freedesktop.org>; Fri, 27 Mar 2026 18:42:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF7D36013E;
	Fri, 27 Mar 2026 18:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC21C4AF09;
	Fri, 27 Mar 2026 18:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774636974;
	bh=R9AHAajVl54S43rOD25tNtqd/iHB1Qz12wrBG7w2KjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqLTMAvv7+jnfJ63kHoj5u/xRq7KjteyBcy3HIl1cnYvAHjHZ1OWSG0NmwwBvb/fd
	 dup5UeymFe5k1FgaPMpKPS1CWFV2QefCBH69aiBilkovEgPOC7G+mJHdKietEf93mn
	 z+D5DefKb0R+UjekRh0OhALTi/xJwUwgIy8DpuYwcGTN9n+tm/uHO9LVguwZYokkoK
	 tnQuwnG/Tf+S+rzR3bpRe5cvXOYdNDZqK+J4SPMytGZ+3SUK2+mrVQra/5ismGlbII
	 czayvkG45XiAzqxbhUAC5z+eA4cRh6ytBdF/EcuGtNZxJHtyqSJi2FR5/EBnlhtMp1
	 Wd10Tu3oCjHYw==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5096CF40074;
	Fri, 27 Mar 2026 14:42:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 27 Mar 2026 14:42:52 -0400
X-ME-Sender: <xms:rM_Gaf53wU_w_vFmN1XR_9VmQF1e9TTRE1rM87oww0jbqKn3zQiTvA>
    <xme:rM_GaXPvT0Z2HQrHgUaQNVTRIVrWLOwO-BgCrV5k8GRfnE72m0QIvotqSXTp_orHj
    2gOytGhfi8Tw5WrIjza2Ip1_8Tik1hvjAcSmd5zwH2MmvzdFnQ12Q>
X-ME-Received: 
 <xmr:rM_GaVKjAVbZbK7E0hlnUpPhDxno_FwWS3alvOVgDWol-eNebJPQxgRTTLinzpUhbU8XuI9F0parELUQLiuRtIH53yHFxQQe>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedutdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    epgfdvtdefieetieefueetudehffevieffkeejvdetleffledvveetgfeufeethfeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunh
    domhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedtleekgeejuddqudej
    jeekheehhedvqdgsohhquhhnpeepkhgvrhhnvghlrdhorhhgsehfihigmhgvrdhnrghmvg
    dpnhgspghrtghpthhtohepfedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehm
    ihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtohhmpdhrtghpth
    htohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepfhhujhhithgrrdht
    ohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopegrtghouhhrsghothesnh
    hvihguihgrrdgtohhmpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepthgrmhhirhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmh
    grihhlrdgtohhm
X-ME-Proxy: <xmx:rM_GadFLMzx4SKFk_EBd2q_cYZurxddg5M3RCp3W13r-KO2-pIw_3w>
    <xmx:rM_GaQwrMngO9IeycAuAvKlG4TKJtWiPzWRRnEJy5iLXeqAcanIiVQ>
    <xmx:rM_GaRzM6IaacdY8NVZgpSijNYfeYjtBiBd74AMcjNC3_VfJbdwB2A>
    <xmx:rM_GaeYlxRTqqcf4hORjoZECWHFuqZSzQ6j1M4n3MsRaTFYdYieCxA>
    <xmx:rM_GabyudvqMVVB43xhTcrM2BV1ORfwR7f7w1i5eNFfiIaXHwurbBMl7>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Mar 2026 14:42:51 -0400 (EDT)
Date: Fri, 27 Mar 2026 11:42:50 -0700
From: Boqun Feng <boqun@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
Message-ID: <acbPqjBE8mqbiVkv@tardis.local>
References: <20260319121653.2975748-1-gary@kernel.org>
 <20260319121653.2975748-5-gary@kernel.org>
 <CANiq72kZH-AX=QQz2V+qCfVzMsUEAPan=o1E=OZOAnivj3L3HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CANiq72kZH-AX=QQz2V+qCfVzMsUEAPan=o1E=OZOAnivj3L3HQ@mail.gmail.com>
Message-ID-Hash: ST4BFB7PXYZ764WS47FED3NVV6NBGMJ3
X-Message-ID-Hash: ST4BFB7PXYZ764WS47FED3NVV6NBGMJ3
X-MailFrom: boqun@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun.feng@gmail.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Yury Norov <yury.norov@gmail.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Yury Norov <ynorov@nvidia.com>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, netdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ST4BFB7PXYZ764WS47FED3NVV6NBGMJ3/>
Archived-At: <https://lore.freedesktop.org/acbPqjBE8mqbiVkv@tardis.local/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Mar 23, 2026 at 12:36:52AM +0100, Miguel Ojeda wrote:
> On Thu, Mar 19, 2026 at 1:17 PM Gary Guo <gary@kernel.org> wrote:
> >
> >  rust/kernel/net/phy/reg.rs           |  8 +++++---
> 
> Tomonori: are you OK with these changes?
> 
> >  rust/kernel/num/bounded.rs           |  2 +-
> 
> Alexandre: are you OK with these changes?
> 
> >  rust/kernel/sync/atomic/internal.rs  |  9 ++++++---
> >  rust/kernel/sync/atomic/predefine.rs |  2 +-
> >  rust/kernel/sync/locked_by.rs        |  2 +-
> >  rust/kernel/sync/refcount.rs         |  8 +++++---
> 
> Boqun: are you OK with these changes?
> 

Acked-by: Boqun Feng <boqun@kernel.org>

Regards,
Boqun

> >  rust/kernel/xarray.rs                | 10 ++++++++--
> 
> Tamir, Andreas: are you OK with these changes?
> 
> > -    transmute::{AsBytes, FromBytes},
> > +    transmute::{AsBytes, FromBytes}, //
> 
> Nit: We should take the chance to expand this.
> 
> Thanks all!
> 
> Cheers,
> Miguel
