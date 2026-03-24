Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6676FF54ABA
	for <nouveau@archiver.kernel.org>; Tue, 24 Mar 2026 14:00:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5D58C10E6E6;
	Tue, 24 Mar 2026 14:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OlxVR12o";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B18294527C;
	Tue, 24 Mar 2026 13:49:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774360188;
 b=uf2Am5ykuWIY8qvyay/0zDNEY0YctD8vlbV8ZOrdtCy0kaWa3DQJ1nOlYukDXo73mKW9Z
 UV3FQq55jH4+p6PYBLCAlIKXWt+tw/lAmYaHZ6GcuYm99ftCy7lqC7ng45pSZz4U+zC7NZd
 1H1wBifak5ilNMZOa/UfTWq8ojXTb9OSzxnxAwabmxsgmWQ+HzUL6lBPWFKBQ/53PU2nqTL
 B3bNyHlZnziThPryKOwVe4ySoVjtRbF83n3N9ruqIZ96PKigLtVf20Y1YVHNzcjm1pH+zyQ
 rs0xzCTkeWmlHcoSc9p7g+TAV4pv7qA4OWcOWbS2S4CkmYMPt5hFaBnjxccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774360188; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cgfDpG2Rje6Z7iMsCSSkYudvgS6fAd/Eb2WPgPhusU4=;
 b=abs863vGM7zCFsHx9nLYhhMCEsmQxae2cub5debIZOz75uwxG5vNDq9vo+sgi9i6gCLkw
 HhjfbjUSQ0XGn2XvTjZplVmV6XpzJ2QWZ3sOYCi6+/IcLUJzRiDIcqphjblo3zVxyaM2ckh
 b/GpV1uracg/cUQU1ZeuDZBwN8ijvQeM7WB9uZ8tdsQV2RNaOFZXwmNGxlKLE+tsBVjiiW1
 3/9xHxZHqLizuOndk3FDe9RGoC2X/7Czpra+r2rsed6phF5X0oiUXzzcjqL8pnK9SpOPIt9
 2uyy2iMmE4AA3Ws+0N1qqn506QSFL0s5PSF5LU2fL4KslD4zqYTKdqnPb+6Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3DFD140218
	for <nouveau@lists.freedesktop.org>; Tue, 24 Mar 2026 13:49:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C02C89343;
	Tue, 24 Mar 2026 14:00:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B2F51600C4;
	Tue, 24 Mar 2026 14:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD2CC19424;
	Tue, 24 Mar 2026 14:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360848;
	bh=c9NFAllBfGAlx/FFc3N9mnr4Kiv07CkCPahF9j8WHzw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OlxVR12oL/BTtAOUzCP9vu1WlUnqcDXriXSDyGTfV4n87zTnVvAExFtGIIvowDd/m
	 zOEW5egUKzOahJ7/5wCpP6j88bE6760LMadtlzD/d8hnjU25KldG9nlYM+xO+a3Ykf
	 ywyzVhtyJWNTlEE/uLCnC2XFN9umt5d356KuUfXl5jrXjRg9uB9w9s8njzpcC7l3zg
	 z5Cy9vb4FutpeMYS65wWUriqKLaEYgh36dPFB+NYlvLXcwwoVhTiuhSF6sDCrVK1Vh
	 9MwnAOMySimEIbS6CayPYAljjpevcCZVq6lVuoF3+JW2D3N1jARYzm50iJQ+qyTZrD
	 1P3mmQylNIUUA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Subject: Re: [PATCH v2 4/8] rust: dma: introduce dma::CoherentBox for memory
 initialization
In-Reply-To: <20260320194626.36263-5-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <gL6L6Fep9fLly-cba79GEM8HZOGIkSWwerKYzGDnU_XryvpxJul4kyB2Hq8UaEi8PflcO7i_p7UMi7NCY26DGA==@protonmail.internalid>
 <20260320194626.36263-5-dakr@kernel.org>
Date: Tue, 24 Mar 2026 14:57:56 +0100
Message-ID: <871ph9qqhn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: YJYQXMORQA6XPORPRHF4IT6ZODKQ5NMQ
X-Message-ID-Hash: YJYQXMORQA6XPORPRHF4IT6ZODKQ5NMQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YJYQXMORQA6XPORPRHF4IT6ZODKQ5NMQ/>
Archived-At: <https://lore.freedesktop.org/871ph9qqhn.fsf@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Danilo Krummrich" <dakr@kernel.org> writes:

> Currently, dma::Coherent cannot safely provide (mutable) access to its
> underlying memory because the memory might be concurrently accessed by a
> DMA device. This makes it difficult to safely initialize the memory
> before handing it over to the hardware.
>
> Introduce dma::CoherentBox, a type that encapsulates a dma::Coherent
> before its DMA address is exposed to the device. dma::CoherentBox can
> guarantee exclusive access to the inner dma::Coherent and implement
> Deref and DerefMut.
>
> Once the memory is properly initialized, dma::CoherentBox can be
> converted into a regular dma::Coherent.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/dma.rs | 154 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 153 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index db645b01bdd0..cefb54f0424a 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -20,7 +20,13 @@
>          FromBytes, //
>      }, //
>  };
> -use core::ptr::NonNull;
> +use core::{
> +    ops::{
> +        Deref,
> +        DerefMut, //
> +    },
> +    ptr::NonNull, //
> +};
>
>  /// DMA address type.
>  ///
> @@ -352,6 +358,152 @@ fn from(direction: DataDirection) -> Self {
>      }
>  }
>
> +/// CPU-owned DMA allocation that can be converted into a device-shared [`Coherent`] object.
> +///
> +/// Unlike [`Coherent`], a [`CoherentBox`] is guaranteed to be fully owned by the CPU -- its DMA
> +/// address is not exposed and it cannot be accessed by a device. This means it can safely be used
> +/// like a normal boxed allocation (e.g. direct reads, writes, and mutable slices are all safe).
> +///
> +/// A typical use is to allocate a [`CoherentBox`], populate it with normal CPU access, and then
> +/// convert it into a [`Coherent`] object to share it with the device.
> +///
> +/// # Examples
> +///
> +/// `CoherentBox<T>`:
> +///
> +/// ```
> +/// # use kernel::device::{
> +/// #     Bound,
> +/// #     Device,
> +/// # };
> +/// use kernel::dma::{attrs::*,
> +///     Coherent,
> +///     CoherentBox,
> +/// };
> +///
> +/// # fn test(dev: &Device<Bound>) -> Result {
> +/// let mut dmem: CoherentBox<u64> = CoherentBox::zeroed(dev, GFP_KERNEL)?;
> +/// *dmem = 42;
> +/// let dmem: Coherent<u64> = dmem.into();
> +/// # Ok::<(), Error>(()) }
> +/// ```
> +///
> +/// `CoherentBox<[T]>`:
> +///
> +///
> +/// ```
> +/// # use kernel::device::{
> +/// #     Bound,
> +/// #     Device,
> +/// # };
> +/// use kernel::dma::{attrs::*,
> +///     Coherent,
> +///     CoherentBox,
> +/// };
> +///
> +/// # fn test(dev: &Device<Bound>) -> Result {
> +/// let mut dmem: CoherentBox<[u64]> = CoherentBox::zeroed_slice(dev, 4, GFP_KERNEL)?;
> +/// dmem.fill(42);
> +/// let dmem: Coherent<[u64]> = dmem.into();
> +/// # Ok::<(), Error>(()) }
> +/// ```
> +pub struct CoherentBox<T: AsBytes + FromBytes + KnownSize + ?Sized>(Coherent<T>);
> +
> +impl<T: AsBytes + FromBytes> CoherentBox<[T]> {
> +    /// [`CoherentBox`] variant of [`Coherent::zeroed_slice_with_attrs`].
> +    #[inline]
> +    pub fn zeroed_slice_with_attrs(
> +        dev: &device::Device<Bound>,
> +        count: usize,
> +        gfp_flags: kernel::alloc::Flags,
> +        dma_attrs: Attrs,
> +    ) -> Result<Self> {
> +        Coherent::zeroed_slice_with_attrs(dev, count, gfp_flags, dma_attrs).map(Self)
> +    }
> +
> +    /// Same as [CoherentBox::zeroed_slice_with_attrs], but with `dma::Attrs(0)`.
> +    #[inline]
> +    pub fn zeroed_slice(
> +        dev: &device::Device<Bound>,
> +        count: usize,
> +        gfp_flags: kernel::alloc::Flags,
> +    ) -> Result<Self> {
> +        Self::zeroed_slice_with_attrs(dev, count, gfp_flags, Attrs(0))
> +    }
> +
> +    /// Initializes the element at `i` using the given initializer.
> +    ///
> +    /// Returns `EINVAL` if `i` is out of bounds.

Could you add an example for this function?


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



