Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A33F54ABA
	for <nouveau@archiver.kernel.org>; Tue, 24 Mar 2026 13:46:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CEEA910E6DA;
	Tue, 24 Mar 2026 13:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ATF2wMf5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2B6DC4529B;
	Tue, 24 Mar 2026 13:35:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774359348;
 b=RgBcUbfiYbFGabvmh5ytui9Az0L3/2kH5HqRpG1WGhTL4d3HFDJNbvg3TaJPQGmzSSGFd
 rnsUuOR2GKSghnB3joEXROCNemn/6Sn3SWhgHjJUWdnf9v2eDJEhodhZ34+rlTCtsBszX4y
 s1VION3r8Pwsgnfe3XDtjJzjOS2TpRL3vd4Ju6JDEuU+z6JhNanANoLKviTkNeVxBW68lU1
 CJcj+VList01mMWWtXVdkS9PHbnGQnPzOY8zkCN/DH84EN2n3nBn0EDzAB/CUAN1YhAEchJ
 kltaX8ETuvCOu9b0U3fevycZxMUmSRP0VTiJ/S/ZqT/xC0wy40YUPJlwvYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774359348; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Uu5gG7jZHOTZmHrrwhkuGyjGIuGfN+6/fjJP+l1w6YI=;
 b=k8A+6lLM6puzkXDLETGXYFkFpRfFw03hN/FFc0iNmj1QgDqgPeVIO0FTi8cV8dYO8AsAa
 mFrSENoqHSBNlKmn4T4FUVsqdpSQ3ePoVK8z5PJtPiPgdJt+cyUuBigEEs9zvFx3So0uZE8
 dNg2t9lWD/1MFV3eA0qb9ptkXn3GC4eAELcNOfW4JqQDgjsANhbCvg4P6559gJtDDKo1vfQ
 yexKnN6QBHUb8qr3QunA2XjJK5Y3hbnta6CpnACOYsd88i/rE5v/62FW+mTGYyDaGMCZA+h
 TrotcyN4gVflObMIfgQ6xx/qfLrGD9gEzTN+NqZOc3PcmZPXs3oRkonjWUwQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7E627433BB
	for <nouveau@lists.freedesktop.org>; Tue, 24 Mar 2026 13:35:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C6A6010E6D6;
	Tue, 24 Mar 2026 13:46:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34CEA600AC;
	Tue, 24 Mar 2026 13:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB1CC19424;
	Tue, 24 Mar 2026 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360008;
	bh=h3w10dHofOpSr7tRLNN0/09dk5eHpyyKeNzs2he0Gmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ATF2wMf50dDbIWHCverU2iPOzffb3JJrxs/lgJGCecZImGQb34PhZiA31p9lIeJVC
	 i9hXg04xBtlAx4AAYW1VohpXfzxfH5XawxxbsPzYqK8r2qngB9ZQanTsvWwxHloR2h
	 iiz835YB8lQg2RZEgaYBQpvYXqe48BbDSkHg2jTk7G/VqVvbMuHq9qelnL9O6zopxf
	 RhmNJr161RGgonvdVJ+0uepC8HmiuLzrNYidHaB13RjIQgTNCD20LYk2I9XkjhC19J
	 H8hqr9ZJzYlYURY/hLwIPIf40DKF3FqPB+YJ3RU86MsCBSedMNyUVPykZBbnG+mPbc
	 gn2vI+oUDaECA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Subject: Re: [PATCH v2 3/8] rust: dma: add zeroed constructor to `Coherent`
In-Reply-To: <20260320194626.36263-4-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <RoXOmlVAeY7nQoQ-P4KIO9I-vuJBV9oDG-LUg4B5naE3EzdNAtBZhVLoyX3yUAATLPx3OCT6r6_P_TVNEf4dvQ==@protonmail.internalid>
 <20260320194626.36263-4-dakr@kernel.org>
Date: Tue, 24 Mar 2026 14:46:39 +0100
Message-ID: <874im5qr0g.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: O3CEDZ54HNUVDIWGT3PVADPKJJEBRDYI
X-Message-ID-Hash: O3CEDZ54HNUVDIWGT3PVADPKJJEBRDYI
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O3CEDZ54HNUVDIWGT3PVADPKJJEBRDYI/>
Archived-At: <https://lore.freedesktop.org/874im5qr0g.fsf@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Danilo Krummrich" <dakr@kernel.org> writes:

> From: Gary Guo <gary@garyguo.net>
>
> These constructors create a coherent container of a single object
> instead of slice. They are named `zeroed` and `zeroed_with_attrs` to
> emphasis that they are created initialized zeroed. It is intended that
> there'll be new constructors that take `PinInit` instead of zeroing.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/dma.rs       | 81 ++++++++++++++++++++++++++++++++++++----
>  samples/rust/rust_dma.rs |  8 ++--
>  2 files changed, 77 insertions(+), 12 deletions(-)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index ff3e147f1a23..db645b01bdd0 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -47,7 +47,7 @@ pub trait Device: AsRef<device::Device<Core>> {
>      /// # Safety
>      ///
>      /// This method must not be called concurrently with any DMA allocation or mapping primitives,
> -    /// such as [`CoherentAllocation::alloc_attrs`].
> +    /// such as [`Coherent::zeroed`].
>      unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
>          // SAFETY:
>          // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
> @@ -64,7 +64,7 @@ unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
>      /// # Safety
>      ///
>      /// This method must not be called concurrently with any DMA allocation or mapping primitives,
> -    /// such as [`CoherentAllocation::alloc_attrs`].
> +    /// such as [`Coherent::zeroed`].
>      unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
>          // SAFETY:
>          // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
> @@ -83,7 +83,7 @@ unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
>      /// # Safety
>      ///
>      /// This method must not be called concurrently with any DMA allocation or mapping primitives,
> -    /// such as [`CoherentAllocation::alloc_attrs`].
> +    /// such as [`Coherent::zeroed`].
>      unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
>          // SAFETY:
>          // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
> @@ -102,7 +102,7 @@ unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
>      /// # Safety
>      ///
>      /// This method must not be called concurrently with any DMA allocation or mapping primitives,
> -    /// such as [`CoherentAllocation::alloc_attrs`].
> +    /// such as [`Coherent::zeroed`].
>      unsafe fn dma_set_max_seg_size(&self, size: u32) {
>          // SAFETY:
>          // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
> @@ -202,12 +202,12 @@ pub const fn value(&self) -> u64 {
>  ///
>  /// ```
>  /// # use kernel::device::{Bound, Device};
> -/// use kernel::dma::{attrs::*, CoherentAllocation};
> +/// use kernel::dma::{attrs::*, Coherent};
>  ///
>  /// # fn test(dev: &Device<Bound>) -> Result {
>  /// let attribs = DMA_ATTR_FORCE_CONTIGUOUS | DMA_ATTR_NO_WARN;
> -/// let c: CoherentAllocation<u64> =
> -///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, attribs)?;
> +/// let c: Coherent<[u64]> =
> +///     Coherent::zeroed_slice_with_attrs(dev, 4, GFP_KERNEL, attribs)?;
>  /// # Ok::<(), Error>(()) }
>  /// ```
>  #[derive(Clone, Copy, PartialEq)]
> @@ -492,7 +492,6 @@ pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
>
>  impl<T: AsBytes + FromBytes> Coherent<T> {
>      /// Allocates a region of `T` of coherent memory.
> -    #[expect(unused)]
>      fn alloc_with_attrs(
>          dev: &device::Device<Bound>,
>          gfp_flags: kernel::alloc::Flags,
> @@ -529,6 +528,35 @@ fn alloc_with_attrs(
>          })
>      }
>
> +    /// Allocates a region of type `T` of coherent memory.

For consistency "Allocates a ZEROED region...".

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::device::{Bound, Device};
> +    /// use kernel::dma::{attrs::*, Coherent};
> +    ///
> +    /// # fn test(dev: &Device<Bound>) -> Result {
> +    /// let c: Coherent<[u64; 4]> =
> +    ///     Coherent::zeroed_with_attrs(dev, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
> +    /// # Ok::<(), Error>(()) }
> +    /// ```
> +    #[inline]
> +    pub fn zeroed_with_attrs(
> +        dev: &device::Device<Bound>,
> +        gfp_flags: kernel::alloc::Flags,
> +        dma_attrs: Attrs,
> +    ) -> Result<Self> {
> +        Self::alloc_with_attrs(dev, gfp_flags | __GFP_ZERO, dma_attrs)
> +    }
> +
> +    /// Performs the same functionality as [`Coherent::zeroed_with_attrs`], except the
> +    /// `dma_attrs` is 0 by default.
> +    #[inline]
> +    pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> Result<Self> {
> +        Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
> +    }
> +
>      /// Allocates a region of `[T; len]` of coherent memory.
>      fn alloc_slice_with_attrs(
>          dev: &device::Device<Bound>,
> @@ -572,6 +600,43 @@ fn alloc_slice_with_attrs(
>              dma_attrs,
>          })
>      }
> +
> +    /// Allocates a zeroed region of type `T` of coherent memory.

Should it be "of type `[T]`"?


Best regards,
Andreas Hindborg

