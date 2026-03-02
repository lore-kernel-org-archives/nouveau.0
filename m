Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14541EA4E07
	for <nouveau@archiver.kernel.org>; Mon,  2 Mar 2026 14:42:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DB45710E52A;
	Mon,  2 Mar 2026 14:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bKskj/3G";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 173EB44D72;
	Mon,  2 Mar 2026 14:32:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772461961;
 b=XegIAd3J2n0gEl9BiT4C00/q0DzE3LpfgEFJDCtlSJoAW1NSNWKoTEwEZqgoT6lR1XgVM
 gwb4xapVA1kKTqyOtMDod2bPzZx7NKZCABUfYbrqDPFVsChA1HnJtOink3ty7G+JQqFgY/9
 iTh4QI3RztONVGBmaMn2OUQJSTJ4df8kTiql+HdnVXVPHP/04LI8M1WNstiZ0Z49UWLHCpM
 +uoeAwWK50TiEkLNbGT9NvjRos9UDyQCMsuW1+fSsXcm527k5I2FjLYthtPUmZYOPLN2Y2r
 2iXnY4jjVs5cn+zLvYIcM7IryWHA8d+5njg6SMeBwOwm5x9RxrtoXK/xHQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772461961; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=59K+KBcnscxQHVxGN5buETkNf/7aWIMm+7qF7PCAYh0=;
 b=ilBhcyeFbPMTyzF1XoEfkpZK5RQyRHLfoachnLPavl93KgHps5LW2Abf1ofHBi4RxMF1o
 mFaWEL2d8FpIsZy3boPnLlCj1tQrEU3FmTJN40dn3Sgf/6aFDhOTKZFC50EFJy1h8ET+Au/
 0U8LCb0Q89Un6459qZ/FYl7ilJWkXb0lkULb898Ndp5f2fIUPWXmkBQmzX7ajAyIRVXCkZS
 iVB9aWuAvrSEgzJ8D5vQZ8Q4hqNY0hgYwB0hzaosmkimA6n/2Z3uNgnKgUqgtu+PsN1PKP3
 gg45XxN09T8CZvSE9qkdwZY6JrbGnsnFG/0JUM5yRC1zo9IjSEWSeXJ1hDVg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2F9E04032A
	for <nouveau@lists.freedesktop.org>; Mon,  2 Mar 2026 14:32:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BDFFA10E51C;
	Mon,  2 Mar 2026 14:42:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7823643DA9;
	Mon,  2 Mar 2026 14:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711E4C19423;
	Mon,  2 Mar 2026 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772462573;
	bh=jdPZtaNXT3Ug5PAx8Lx74Slf+71lV1kNv1pKhVbsBH8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=bKskj/3Gmz/aaGAjDErolvdnSoFrXZr/GHrBzAv0dVtTHvrC6GzINql1X0+/9sOLb
	 Hx5Jg9colGJgyUAoym/D2ghGizsKSxKtmmXNrApbSLo8AFw1hMVFP39S0uYTXb/A94
	 iktb6VQx1SW5yZpCYelxEgCsuW9rRgK9JRQ+4Ko2VPfezIOMhwvtGg3Xwe+Ot2s+iZ
	 khx8gL/wWY5Qj9/0/mt5yqIeTQZKfGaRYCa/bL+5AulFtSYmD3s0RFnDjTU3RFNKKf
	 eWQYYPq9eK7HQxzGBcU0ZgdCx+zpM+HHnBpdxHHkMqUH2Lg3WrXx8F0pbxGmUg1GPO
	 4ODVUOhHiFA8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:42:47 +0100
Message-Id: <DGSDJIG8MASY.1LD0X1CDOWYCN@kernel.org>
Subject: Re: [PATCH v3 2/2] rust: dma: use pointer projection infra for
 `dma_{read, write}` macro
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>
X-Mailer: aerc 0.21.0
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-3-gary@kernel.org>
In-Reply-To: <20260302130223.134058-3-gary@kernel.org>
Message-ID-Hash: DYUYQ7RJCPTH3VMKZLWI6TTNE6JPO2YM
X-Message-ID-Hash: DYUYQ7RJCPTH3VMKZLWI6TTNE6JPO2YM
X-MailFrom: lossin@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DYUYQ7RJCPTH3VMKZLWI6TTNE6JPO2YM/>
Archived-At: 
 <https://lore.freedesktop.org/DGSDJIG8MASY.1LD0X1CDOWYCN@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 2, 2026 at 2:02 PM CET, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Current `dma_read!`, `dma_write!` macros also use a custom
> `addr_of!()`-based implementation for projecting pointers, which has
> soundness issue as it relies on absence of `Deref` implementation on type=
s.
> It also has a soundness issue where it does not protect against unaligned
> fields (when `#[repr(packed)]` is used) so it can generate misaligned
> accesses.
>
> This commit migrates them to use the general pointer projection
> infrastructure, which handles these cases correctly.
>
> As part of migration, the macro is updated to have an improved surface
> syntax. The current macro have
>
>     dma_read!(a.b.c[d].e.f)
>
> to mean `a.b.c` is a DMA coherent allocation and it should project into i=
t
> with `[d].e.f` and do a read, which is confusing as it makes the indexing
> operator integral to the macro (so it will break if you have an array of
> `CoherentAllocation`, for example).
>
> This also is problematic as we would like to generalize
> `CoherentAllocation` from just slices to arbitrary types.
>
> Make the macro expects `dma_read!(path.to.dma, .path.inside.dma)` as the
> canonical syntax. The index operator is no longer special and is just one
> type of projection (in additional to field projection). Similarly, make
> `dma_write!(path.to.dma, .path.inside.dma, value)` become the canonical
> syntax for writing.
>
> Another issue of the current macro is that it is always fallible. This
> makes sense with existing design of `CoherentAllocation`, but once we
> support fixed size arrays with `CoherentAllocation`, it is desirable to
> have the ability to perform infallible indexing as well, e.g. doing a `[0=
]`
> index of `[Foo; 2]` is okay and can be checked at build-time, so forcing
> falliblity is non-ideal. To capture this, the macro is changed to use
> `[idx]` as infallible projection and `[idx]?` as fallible index projectio=
n
> (those syntax are part of the general projection infra). A benefit of thi=
s
> is that while individual indexing operation may fail, the overall
> read/write operation is not fallible.
>
> Fixes: ad2907b4e308 ("rust: add dma coherent allocator abstraction")
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> ---
>  drivers/gpu/nova-core/gsp.rs      |  14 ++--
>  drivers/gpu/nova-core/gsp/boot.rs |   2 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs |  10 ++-
>  rust/kernel/dma.rs                | 114 +++++++++++++-----------------
>  samples/rust/rust_dma.rs          |  30 ++++----
>  5 files changed, 81 insertions(+), 89 deletions(-)
