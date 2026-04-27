Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C296FF8868
	for <nouveau@archiver.kernel.org>; Mon, 27 Apr 2026 15:00:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0B210E7B0;
	Mon, 27 Apr 2026 15:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kYwUJNum";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E76A345C7B;
	Mon, 27 Apr 2026 14:48:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777301280;
 b=ZxshoRArOmnYK1P6H4k66lwEd2AREJ/Svo4/mrnpZQy410m3JjdGCr0Qt6B0/RzOwdMWo
 COLEJJPY2TkSJefuuVTnaRLzrY9hz5Eq2FZ6CL0WBUr4En6B/+BSEZR4KhVPLd9tzjXwgJc
 FC6xYn2caFcc9+0s47nhvsFzHeIxQ+h3bk51Skwq3E2BK4n7wbZ65BMXF2P4hhsFN283pfV
 7Ls6X89ToSU0xg7rsgP02KpyTbbssRCls76jAb7HTPSz+GWviB/1yF+lLWrLg2K0InrV8nP
 YkuwHGWX5XORtDtFHUcsZ6WH/qdggmJNpxOR2wDuCp5ge+IDRJ/pLfWQnKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777301280; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dFM/dyZTnVdZ8vhNrDd0wQw55smXLHUk/iNNYIN0rR0=;
 b=yldmWVatty9/dylsun/N1B/NV1TNpCRYMmL94HW7ix1CvcMb6ktPkdIaNLknwKdWC5aH+
 dX3Cu6G8U4O/vLpKqtTBE5IvLaHjolIytxHirNp2IQJz4kbikYIh1zFdKxL6uiByvZ+KrZt
 qkQIVy7HAwv+a4kszte8TwIcXmOPMPzGemL8oS4TNxOAc6wN5fWUnyvgb/gYt65wOyVFwaN
 KJyOipKfFaZGWdWivlJfF1Q8+ahb5+a3MTEA0u774GQdj8WZPU8O31zYXmJ6ZxpH8cnV2Z9
 4DkRAjbeYVeeRfQEdn6vsaHwW00ZFB4GEOuDEY4FvDrVg9y8uTI9Zm2HIfAw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9B7FA43E17
	for <nouveau@lists.freedesktop.org>; Mon, 27 Apr 2026 14:47:57 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8237010E2BA;
	Mon, 27 Apr 2026 15:00:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EFF416014C;
	Mon, 27 Apr 2026 15:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65621C2BCB4;
	Mon, 27 Apr 2026 15:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777302016;
	bh=enHPVof/9FLPu/a6Y6BKK7lLNOBS2sIllbJ+2p/YGYY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kYwUJNumsI10BCdeUQ8wvHhV9fq2guhy8YPscb5AoG2z69uSedSerCgEXFXiZNSNY
	 2bYowxvS/50I531O4zg7g4NCvMb385M2/EtoLDYNVDx4Jqr0T3jlAp0O44gbbjROQf
	 B62H45xiaTSf7ywsi3JD5BGVfwtQc3HyFFIgCRL1sa+qk46UtBTxITUv2bHggacINT
	 swaR+H/CiAz79GY20YleqnsUw/4rJh6AR7YaOfTT+KeTP5xBMoA2GbPqld3psbQTZi
	 Q68GnVmCF1qxdPj669F/wVfnhm7gIrJrbnsCE7ntqAENTb3DhdpkErPRZpdGVxQrlH
	 6xUQpD7+4wrKg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Daniel Almeida
 <daniel.almeida@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Abdiel
 Janulgue
 <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 03/11] rust: io: use pointer types instead of address
In-Reply-To: <20260421-io_projection-v2-3-4c251c692ef4@garyguo.net>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-3-4c251c692ef4@garyguo.net>
Date: Mon, 27 Apr 2026 16:20:54 +0200
Message-ID: <87cxzkqybd.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: K5WMXCFWKR5OO5TBXJZ3CXG7XSFDTEGN
X-Message-ID-Hash: K5WMXCFWKR5OO5TBXJZ3CXG7XSFDTEGN
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K5WMXCFWKR5OO5TBXJZ3CXG7XSFDTEGN/>
Archived-At: 
 <https://lore.freedesktop.org/87cxzkqybd.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gary Guo <gary@garyguo.net> writes:

> This carries the size information with the pointer type and metadata, makes
> it possible to use I/O projections and paves the way for IO view types.
>
> With this change, minimum size information becomes available through types;
> so `KnownSize::MIN_SIZE` can be used and `IoKnownSize` trait is no longer
> necessary. The trait is kept for compatibility and can be removed when
> users stop using it for bounds.
>
> PCI config space uses only offsets and not pointers like MMIO; for this
> null pointers (with proper size metadata) is used. This is okay as I/O
> trait impl and I/O projections can operate on invalid pointers, and for PCI
> config space we will only use address info and ignore the provenance.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/devres.rs |   2 +-
>  rust/kernel/io.rs     | 123 +++++++++++++++++++++-----------------------------
>  rust/kernel/io/mem.rs |   2 +-
>  rust/kernel/pci/io.rs |  74 ++++++++++++++++++------------
>  4 files changed, 99 insertions(+), 102 deletions(-)
>
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 3e22c63efb98..ea86e9c62cdf 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -101,7 +101,7 @@ struct Inner<T> {
>  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
>  ///     fn drop(&mut self) {
>  ///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapped by `Self::new`.
> -///         unsafe { bindings::iounmap(self.0.addr() as *mut c_void); };
> +///         unsafe { bindings::iounmap(self.0.as_ptr().cast()); };
>  ///     }
>  /// }
>  ///
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 0b9c97c0a1d7..1682f2a0d20d 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -105,8 +105,8 @@ pub fn new_region(addr: usize, size: usize) -> Result<Self> {
>  impl<T: ?Sized + KnownSize> MmioRaw<T> {
>      /// Returns the base address of the MMIO region.
>      #[inline]
> -    pub fn addr(&self) -> usize {
> -        self.addr.addr()
> +    pub fn as_ptr(&self) -> *mut T {
> +        self.addr
>      }
>  
>      /// Returns the size of the MMIO region.
> @@ -166,7 +166,7 @@ pub fn size(&self) -> usize {
>  /// impl<const SIZE: usize> Drop for IoMem<SIZE> {
>  ///     fn drop(&mut self) {
>  ///         // SAFETY: `self.0.addr()` is guaranteed to be properly mapped by `Self::new`.
> -///         unsafe { bindings::iounmap(self.0.addr() as *mut c_void); };
> +///         unsafe { bindings::iounmap(self.0.as_ptr().cast()); };
>  ///     }
>  /// }
>  ///
> @@ -217,14 +217,14 @@ pub trait IoCapable<T> {
>      /// # Safety
>      ///
>      /// The range `[address..address + size_of::<T>()]` must be within the bounds of `Self`.
> -    unsafe fn io_read(&self, address: usize) -> T;
> +    unsafe fn io_read(&self, address: *mut T) -> T;
>  
>      /// Performs an I/O write of `value` at `address`.
>      ///
>      /// # Safety
>      ///
>      /// The range `[address..address + size_of::<T>()]` must be within the bounds of `Self`.
> -    unsafe fn io_write(&self, value: T, address: usize);
> +    unsafe fn io_write(&self, value: T, address: *mut T);
>  }
>  

In v1 you had a requirement for `address` to be aligned. Why did you
drop that?


Best regards,
Andreas Hindborg


