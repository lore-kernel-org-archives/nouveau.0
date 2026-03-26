Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5530C10A88D4
	for <nouveau@archiver.kernel.org>; Thu, 26 Mar 2026 16:16:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2D67810EB4F;
	Thu, 26 Mar 2026 16:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="KqQaRUgP";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Vr6S/+y2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DF7924530F;
	Thu, 26 Mar 2026 16:05:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774541135;
 b=Z7WAlC2SjHnPb0T2988B4uhLiGxZG8pUxHaaWsBW9d7zUZ4OE5kiDLe3eT3CNMJ0hPA4/
 +rcvw5ItgsXVE9RQML/7WTTvuasgB36sGuDZFPXdLH16XKhte81dDVF/QBM+zcpOeHWQ1Kc
 u7Vwydr8esJu8zgjnhVkpd84ZXJ28dv6iK3OUE/dwptfcEhJOm4xwyDx283Wl8AexFkYG6b
 6UCThW8LyeK4Y+ixtsDDEDwYhL8P1VKD79dteeX7UYucvHZGECyoSjSsQVXXi3tA+Vz0jea
 LuSBEaNu/UaFo3r65AQe/AJ9C0A93aEllI+SrVqrTbqYmOlzHBKPwCF8TgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774541135; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mqFX0ystC8G5bMrUA5MPL3IZ+yUM/PuDxgn6w4DVzlw=;
 b=MZ33gjXAA5/fsPmlpWJz+erWFzirsdJzcutZ+l1wGAJeVZqqX6qyOQX2XLE2rczTQj7h8
 3judPN0NmjQHBh+LiMlHOjszTwfSa3fLsgoFhHVY7ICqFDiTIZVEQINHjj2ShbD+Kdux8h/
 pS1jUxYkMKpE4zfuGwMlli/o4hSiFotJoyO1zrvHohV66604D65jktLbpMRFhEmLdbWekyV
 nv5y//KGdBcS2EXzrMYODBL4Q16OwlVOHiKxOfYE0AruJM3Zv9ohNNYbKpGSWVo6bTVMwIV
 58rx0XHzCdissv9iGHzXbb9k+/uqSC5QeorCIfoIaVd5c1Do0t/FbSWJqk4Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=jannau.net;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=jannau.net;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5F62841DBC
	for <nouveau@lists.freedesktop.org>; Thu, 26 Mar 2026 16:05:32 +0000 (UTC)
X-Greylist: delayed 346 seconds by postgrey-1.36 at gabe;
 Thu, 26 Mar 2026 16:16:40 UTC
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7566510EB4B
	for <nouveau@lists.freedesktop.org>; Thu, 26 Mar 2026 16:16:40 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 229A51D00244;
	Thu, 26 Mar 2026 12:10:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 26 Mar 2026 12:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774541452; x=1774627852; bh=mqFX0ystC8
	G5bMrUA5MPL3IZ+yUM/PuDxgn6w4DVzlw=; b=KqQaRUgPfTBr9XD3tkJsncTvcp
	HGOvGevyNLULt4Qw/8YnO4TB9KMxyIo1vDlsDkM9HNHdtj9XZwp2Mjm7mSBcKuKX
	h9bTtphz/2JhQROIWX8838iqNy0mswSx4rWMnRlXYbCKiSDf6Hz2kETu1KVLEfN/
	SvAiRy+gZPr0JQ0APGQaW0bzP/HgY17rsgdie/NEILDM6nGKsKtAll+woHSGKvQ9
	ZwPBus3gy2wLvRQgbucjk/0Rj9mtCDzVbv39CzL2bYny3bRT+csox54JNlEPz3h+
	jW4/GNoVjngIIoQsLfvXq1TH+Sh2UhHufARSCY5IHX0EFWyR/cdu6DAd8gVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774541452; x=1774627852; bh=mqFX0ystC8G5bMrUA5MPL3IZ+yUM/PuDxgn
	6w4DVzlw=; b=Vr6S/+y2nAS3lWxO4UPHlHLbjZMDaQDpyO84eIN0c5mha55M+MN
	hzbQeC7Knf17gm4diCyYS6d7VJdwuHud0YQE0W4TjoHh40S7YPfblk60pcocNp2o
	YL02ZRqKJsUC+x6J6my0pHjhH7cB2Pj/wFizK08X4rlvJM1JxzU/vGXHSXsszWrA
	XguZgEV6UZSC5MjelC79sgWnrWGUBs5Ww1eaHlQBvR0aopv1m7pgPNT9zB6kUnoU
	oKk95WGCOZPeni9aX/14Xx2765TwFIvxGTxo+p3k42Hx7k7xnL0LIsxENOtJ4xAt
	4kfANd0Lr+gOHL3/c/OF0edF/c6jyB9HSpA==
X-ME-Sender: <xms:jFrFaaeDwUi0xsJTlNox3RFX12oa04zZ7EkHP6rg7YYIloFrhaOt9w>
    <xme:jFrFadYhUlbE2Sv4y6w9HFl5pFQ9oMB0H6DK6cuSS4brF2t8fMANJ6J5RsxMqhJa1
    x58imbJ6a8rmB2qahJmyJQHDHrOqCtAMbU-hCZpND3FrO1ty6maUcb8>
X-ME-Received: 
 <xmr:jFrFaVqNVE6HLWpu8PL_B_Wa5tLoDn8VubBJoli9LPNLCZRFG1iBwXc7lgn2v0y1YLz6Ww8KGNrcqUPjSpt64xsK3oqJHjdZckQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdejkeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeegje
    duudfhleekveeghfevjeegtefgtdegfeekheduiedtleehgeeludejgfegieenucffohhm
    rghinhepfhhrvggvuggvshhkthhophdrohhrghdprhhushhtqdhfohhrqdhlihhnuhigrd
    gtohhmpdhmshhgihgurdhlihhnkhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepvd
    ekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprg
    hlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepnhhouhhvvggruheslhhishhtshdrfhhrvggvug
    gvshhkthhophdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdp
    rhgtphhtthhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomh
    dprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehmmhgruhhrvghrsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:jFrFaY1eGumb2lP-gwk4rMljcd1HrGMa5zu-LPOdbLOZTBQlCMG-rg>
    <xmx:jFrFaSra40WvK9wNoCUgNJSUuqdo_0b35aGx_LU_fljalYncxEVanw>
    <xmx:jFrFaaQjCX9DsR0XbhHIyFQcjeoUMao6md7MaNFcB9dDm_AGhVNURQ>
    <xmx:jFrFaarsfozIh98oVWs1QdcONAaGdvyDQce1808gf8WuNVG97FOoxA>
    <xmx:jFrFaRX0jlBXDO9RbIEeXvX9PjNX0YBrLIN1johPts8zF8Ewg4_85f56>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Mar 2026 12:10:51 -0400 (EDT)
Date: Thu, 26 Mar 2026 17:10:49 +0100
From: Janne Grunau <j@jannau.net>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: (subset) [PATCH v9 0/7] Rust bindings for gem shmem
Message-ID: <20260326161049.GA10417@robin.jannau.net>
References: <20260316211646.650074-1-lyude@redhat.com>
 <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DHCBEGGPWSVK.30MV8652PV4PY@kernel.org>
Message-ID-Hash: HXHJOADKVSVNSRJ26YGLJIJTR6IWRFZI
X-Message-ID-Hash: HXHJOADKVSVNSRJ26YGLJIJTR6IWRFZI
X-MailFrom: j@jannau.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Boqun Feng <boqun@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org,
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HXHJOADKVSVNSRJ26YGLJIJTR6IWRFZI/>
Archived-At: 
 <https://lore.freedesktop.org/20260326161049.GA10417@robin.jannau.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Mar 26, 2026 at 02:15:28AM +0100, Danilo Krummrich wrote:
> On Mon Mar 16, 2026 at 10:16 PM CET, Lyude Paul wrote:
> > Lyude Paul (5):
> >   rust: drm: Add gem::impl_aref_for_gem_obj!
> >   rust: gem: Introduce DriverObject::Args
> 
> Applied to drm-rust-next, thanks!
> 
> > Asahi Lina (2):
> >   rust: drm: gem: shmem: Add DRM shmem helper abstraction
> 
> I was about to pick this one up as well, but did run into quite some build
> errors and warnings. I fixed them all up, but I consider this too excessive to
> actually apply the patch. This is the changelog I came up with:
> 
>     [ * DRM_GEM_SHMEM_HELPER is a tristate; when a module driver selects it,
>         it becomes =m. The Rust kernel crate and its C helpers are always
>         built into vmlinux and can't reference symbols from a module,
>         causing link errors.
> 
>         Thus, add RUST_DRM_GEM_SHMEM_HELPER bool Kconfig that selects
>         DRM_GEM_SHMEM_HELPER, forcing it built-in when Rust drivers need it;
>         use cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER) for the shmem module.
> 
>       * Add cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused))
>         on pub(crate) use impl_aref_for_gem_obj and BaseObjectPrivate, so
>         that unused warnings are suppressed when shmem is not enabled.
> 
>       * Enable const_refs_to_static (stabilized in 1.83) to prevent build
>         errors with older compilers.
> 
>       * Use &raw const for bindings::drm_gem_shmem_vm_ops and add
>         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")].
> 
>       * Fix incorrect C Header path and minor spelling and formatting
>         issues.
> 
>       * Drop shmem::Object::sg_table() as the current implementation is
>         unsound.
> 
>         - Danilo ]
> 
> Please always consider [1] and [2].
> 
> [1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-rust.html#submit-checklist
> [2] https://rust-for-linux.com/contributing#submit-checklist-addendum
> 
> (@Deborah: I assume you were testing this with Tyr built-in?)
> 
> @Lyude, Alice, Miguel: Please have a look at what I came up with below.

Looks fine, asahi had the bool CONFIG_RUST_DRM_GEM_SHMEM_HELPER already
in the asahi Kconfig so I never noticed that's missing. Same for configs
which do not excercise gem shmem.

> commit 2dc69d77944dbd1494d2b10a4b134b7fead1c8e7
> Author: Asahi Lina <lina+kernel@asahilina.net>
> Date:   Mon Mar 16 17:16:13 2026 -0400
> 
>     rust: drm: gem: shmem: Add DRM shmem helper abstraction
> 
>     The DRM shmem helper includes common code useful for drivers which
>     allocate GEM objects as anonymous shmem. Add a Rust abstraction for
>     this. Drivers can choose the raw GEM implementation or the shmem layer,
>     depending on their needs.
> 
>     Signed-off-by: Asahi Lina <lina@asahilina.net>
>     Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>     Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>     Signed-off-by: Lyude Paul <lyude@redhat.com>
>     Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>
>     Link: https://patch.msgid.link/20260316211646.650074-6-lyude@redhat.com
>     [ * DRM_GEM_SHMEM_HELPER is a tristate; when a module driver selects it,
>         it becomes =m. The Rust kernel crate and its C helpers are always
>         built into vmlinux and can't reference symbols from a module,
>         causing link errors.
> 
>         Thus, add RUST_DRM_GEM_SHMEM_HELPER bool Kconfig that selects
>         DRM_GEM_SHMEM_HELPER, forcing it built-in when Rust drivers need it;
>         use cfg(CONFIG_RUST_DRM_GEM_SHMEM_HELPER) for the shmem module.
> 
>       * Add cfg_attr(not(CONFIG_RUST_DRM_GEM_SHMEM_HELPER), expect(unused))
>         on pub(crate) use impl_aref_for_gem_obj and BaseObjectPrivate, so
>         that unused warnings are suppressed when shmem is not enabled.
> 
>       * Enable const_refs_to_static (stabilized in 1.83) to prevent build
>         errors with older compilers.
> 
>       * Use &raw const for bindings::drm_gem_shmem_vm_ops and add
>         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")].
> 
>       * Fix incorrect C Header path and minor spelling and formatting
>         issues.
> 
>       * Drop shmem::Object::sg_table() as the current implementation is
>         unsound.
> 
>         - Danilo ]
>     Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Janne Grunau <j@jananu.net>

Janne
