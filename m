Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80471EB271A
	for <nouveau@archiver.kernel.org>; Tue, 10 Feb 2026 21:10:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2971810E5FA;
	Tue, 10 Feb 2026 21:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e3bgbA3B";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 45C5A41E85;
	Tue, 10 Feb 2026 21:00:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770757246;
 b=rZLVIinCuJEWcK18N+aOs8DZ4avO0VgvoJLW0wa/xeawGhRGwtBdf+4K5G7517tSK9Wiv
 31SrVGtXb7UN1hhqOnsA7qXYgIVcndbRWp7rsPsQ7hZYD1aemzSYDhk2YOLIQG69zMZiaIm
 6wpUFlE4RuJpLL159kEym00QwwMCEjyow1Srq6onAl4+34G1DlsHq7FYcN73gc2UavS9jvT
 zTAjAR3KEOoPHz13QeOlg67PchDIwwudp9czCcmBPmVd99TAEnAN0O08c/0vYYk6jxmd+el
 xieMg8eh7FVwo5x5LumH6uwUnyhvkKR3VDiQrFMi7AzIwWHwyvxVNjfDJS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770757246; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dSTsb+q6DDk4tYUUPHexxL1dAbJsi78nQKtcr9bMUic=;
 b=ziXSBfVHzjBvUNVUunUwy4h3qfSbj9lH3oTxrqcwHe9rbE7mddNkAP18dQ0Vnt5np6ZoB
 N7+VTIHj+xKDzNtGKdQQUw7imwDkjW3uelJp+4ABrC/+SNGC+KGFODkgywApeqyQ8JkBlxJ
 BTKeBPUEb2lvEwDM/jsE33YUFK2inORS+GaXVDO1bwiQftaF6v69ZeTmILx56OF5P7y3YO0
 95nYWldjVp7wgcAhzlMH7POGkfF5IiZVseeW2esDnzWlI59mJPuZiATFVzKmurw59g5R1Ha
 ctpn3aumoEiB5F4qMqXUZTn3+vsgoAMBATQFpNvYoaKfl217v0ZNB1Mi7GRw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 48F11403C3
	for <nouveau@lists.freedesktop.org>; Tue, 10 Feb 2026 21:00:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EAC3310E556;
	Tue, 10 Feb 2026 21:10:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CDC043E5E;
	Tue, 10 Feb 2026 21:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5337C116C6;
	Tue, 10 Feb 2026 21:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770757814;
	bh=UWSb7wjpHsusRVvieXLpHdxv/4zDaCUkIgy7QUYN+Qw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=e3bgbA3BYcAKRl8iwbdJVkgrkS7A1nttqBdEge3iUnUgQ4wnLXe5M9C/gQST9Vazx
	 mTI9eXXs9l8hK1+3phBxmaosKEOsPCLxUv5EoIxnCTNTBXSuoHSTgXEX0nmjSSlBZX
	 etqvR3ijBk3JxLIBdOJr71PBelaIdS29Pmh3twzOnqsJQaHHOvHi5vSYlOe+9p0kul
	 amTGI376pQKDV+W8QZ05JdpeYMoYXT6yjUSFUxUT538ypdEgXgY3IbkeRQMh1ipnz5
	 4JBp6ySOVNWzst9QfT3XNGf2Nm6PjMXLJK3bbMV+LMDWQxjUetTaCqnbm7f9wN/NfH
	 NKHT6RpV1wiCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 22:10:02 +0100
Message-Id: <DGBL94I0E5UB.4LNH3JODOKPV@kernel.org>
Subject: Re: [PATCH -next v8 2/3] rust: gpu: Add GPU buddy allocator
 bindings
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-3-joelagnelf@nvidia.com>
 <DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org>
 <1770754015.1979311.8126@nvidia.com>
In-Reply-To: <1770754015.1979311.8126@nvidia.com>
Message-ID-Hash: 4D6MSOR7TLNSWT3INL6SP7CZM4PJICQW
X-Message-ID-Hash: 4D6MSOR7TLNSWT3INL6SP7CZM4PJICQW
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
 Vivi Rodrigo <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rui Huang <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4D6MSOR7TLNSWT3INL6SP7CZM4PJICQW/>
Archived-At: 
 <https://lore.freedesktop.org/DGBL94I0E5UB.4LNH3JODOKPV@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 9:09 PM CET, Joel Fernandes wrote:
>>> +impl GpuBuddyInner {
>>> +    /// Create a pin-initializer for the buddy allocator.
>>> +    fn new(params: &GpuBuddyParams) -> impl PinInit<Self, Error> {
>>=20
>> I think we can just pass them by value, they shouldn't be needed anymore=
 after
>> the GpuBuddy instance has been constructed.
>
> Dave Airlie specifically reviewed this in RFC v6 and recommended passing =
by
> reference rather than by value [2]:
>
>   "maybe we should pass them as non-mutable references, but I don't think
>    there is any point in passing them by value ever."
>
> The params are also reused in practice -- the doc examples show the same
> `GpuBuddyParams` being used repeatedly. References
> avoid unnecessary copies for this reuse pattern.

Well, that's for GpuBuddyAllocParams, those are indeed reused and shouldn't=
 be
copied all the time.

But my comment was about GpuBuddyParams, I don't see a reason those are reu=
sed
(neither are they in the example), so it makes more sense to pass them by v=
alue,
such that they are consumed. (I.e.  I'm not asking for adding Copy/Clone.)

>
> [2] https://lore.kernel.org/all/CAPM=3D9tyL_Cq3+qWc4A41p7eqnNDLS1APUEeUba=
QyJ46YDkipVw@mail.gmail.com/
>
>>> +    pub fn new(params: &GpuBuddyParams) -> Result<Self> {
>>=20
>> Same here, we should be able to take this by value.
>
> Same reasoning as above.
>
>>> +    pub fn alloc_blocks(&self, params: &GpuBuddyAllocParams) -> Result=
<Arc<AllocatedBlocks>> {
>>=20
>> Why do we force a reference count here? I think we should just return
>> impl PinInit<AllocatedBlocks, Error> and let the driver decide where to
>> initialize the object, no?
>>=20
>> I.e. what if the driver wants to store additional data in a driver priva=
te
>> structure? Then we'd need two allocations otherwise and another referenc=
e count
>> in the worst case.
>
> Good point. The reason I had `Arc` was to anticipate potential shared own=
ership
> use cases, but at the moment there is no such use case
> in nova-core -- each `AllocatedBlocks` has a single owner.

Sure, but drivers can always pass an impl PinInit to Arc::pin_init() themse=
lves.

> I'll change this to return `impl PinInit<AllocatedBlocks, Error>` in the =
next
> version. If a shared ownership use case arises later, we
> can always add an `Arc`-returning convenience wrapper.

I don't think we should, don't give drivers a reason to go for more allocat=
ions
they actually need for convinience.
