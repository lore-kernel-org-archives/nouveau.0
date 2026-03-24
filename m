Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4E4F54AB8
	for <nouveau@archiver.kernel.org>; Tue, 24 Mar 2026 14:00:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB69010E6EC;
	Tue, 24 Mar 2026 14:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c+GG5n3k";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0C3404529D;
	Tue, 24 Mar 2026 13:49:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774360190;
 b=db1LCGAe0OajQ4iwCJ8sKyNI3v/FVF9Wfw2HXZsamYKKDciygiDhGqhjnjjlXXztcYj8J
 QDkQIKs0DLEKVcggqMuUdb2Z1jJxscKV+Dw6StTEuzS/o1ujS6g7eJ+kJAHgGuXK9cpy7oL
 O2kaL69EQm9jMe2InI60heL3JV/JuJ69TM0Pm8sSjMWyRT2KBTWA18lugWtSoU/WYwIUTd8
 IRO8oH/R28eQ/Ssge4r75cVgD5q2m+sCiX3artbO0l4FNTriYp4Byo5YlypOQ+RvTNrVlY3
 LGcxnZy6r1clBnq1XiLyHXZ4ESNDCouWcKTouvhMnXjfImWqdGnJ4od9hh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774360190; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MAI7pqew2kS+s6tDM3f2Jj8E2VfKhlt/6twb3zGRZ4U=;
 b=HEz9o/ZRknxyeG9IPU+JPM/YniUO5HaBhF75RXBOpBYf6HmXj1NnrZg7HLkqnRO32HW8U
 /9yXm2nn8PwOa60YQlhEp4c1L6BmUZIFGvqimbpw38SmZz/4g+YJ+yKp64GhnN75e5w8LMz
 zU78Gji6gdTKubliN09bUIxC5+WoMmBRuYZX9yFxbAy8aK3UxdDMYgemqCqgbIOb+jN+yri
 w2t9IRTKHCOPOSAKT8bI8tLm3KqHIfpw1MejOMVZKbD9TRKC9y1ZA30o91uFUsLi+vFOW9o
 //CCYriaxPcQdtZRC/+v/SO1gIH1jxfZG+OlpBf9DvCecxfBu7BP7z5aZifg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2DD3140218
	for <nouveau@lists.freedesktop.org>; Tue, 24 Mar 2026 13:49:49 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 81BF710E6E9;
	Tue, 24 Mar 2026 14:00:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01BF460120;
	Tue, 24 Mar 2026 14:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4D8C2BCB2;
	Tue, 24 Mar 2026 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360852;
	bh=nFDs461qGRQbZs3PvToXFNe9Yue8j0z6IlgIHuLx5a4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=c+GG5n3k/xxHG4snLQ1EG5kug4Nq1Cmfjoz9ogNaXvCvfIBd5iAXGuxp7qggPkxj5
	 AqyiHCNzem3YnkLqqsZnt7zkALfB6K2GMfiUcLDTGcHwva7ASJNqg8F1ZEWiVEDfb1
	 yDzgBpJmUTp3QhkPZQxPHMdrSJFRZFmvkVv1kgtETcfKmPxRoCO3mY3gNoG8HL70pY
	 UCgOUeIq4JlysINNVPNLQUHHFge1cemwUbsPNMM4TxE1rNcCmREQbR24j6dX/Cs10s
	 ywV8Hgqr3S5Av0TBfFEsZ5Ys+WeCNz33hZkE+S9bx3Z/0bh//ZcGpKuinGq1qTRvBV
	 GAKXlR2CxyDHQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Subject: Re: [PATCH v2 5/8] rust: dma: add Coherent:init() and
 Coherent::init_with_attrs()
In-Reply-To: <20260320194626.36263-6-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <4yknLBbwY93Ty2ltbpxjHgto-m99xkoTgDlKv8cJTK2tbFL0_V6eQDjwbbXI70M6uMKT6RLRxBoYR_XeymmnHA==@protonmail.internalid>
 <20260320194626.36263-6-dakr@kernel.org>
Date: Tue, 24 Mar 2026 15:00:38 +0100
Message-ID: <87y0jhpbsp.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: R66GYEHTWFE2M35RBKRADE75YS7F5QIC
X-Message-ID-Hash: R66GYEHTWFE2M35RBKRADE75YS7F5QIC
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/R66GYEHTWFE2M35RBKRADE75YS7F5QIC/>
Archived-At: <https://lore.freedesktop.org/87y0jhpbsp.fsf@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Danilo Krummrich" <dakr@kernel.org> writes:

> Analogous to Coherent::zeroed() and Coherent::zeroed_with_attrs(), add
> Coherent:init() and Coherent::init_with_attrs() which both take an impl
> Init<T, E> argument initializing the DMA coherent memory.
>
> Compared to CoherentInit, Coherent::init() is a one-shot constructor
> that runs an Init closure and immediately exposes the DMA handle,
> whereas CoherentInit is a multi-stage initializer that provides safe
> &mut T access by withholding the DMA address until converted to
> Coherent.

You forgot to update this to CoherentBox

>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/dma.rs | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index cefb54f0424a..6d2bec52806b 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -709,6 +709,44 @@ pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> R
>          Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
>      }
>
> +    /// Same as [`Coherent::zeroed_with_attrs`], but instead of a zero-initialization the memory is
> +    /// initialized with `init`.
> +    pub fn init_with_attrs<E>(
> +        dev: &device::Device<Bound>,
> +        gfp_flags: kernel::alloc::Flags,
> +        dma_attrs: Attrs,
> +        init: impl Init<T, E>,
> +    ) -> Result<Self>
> +    where
> +        Error: From<E>,
> +    {
> +        let dmem = Self::alloc_with_attrs(dev, gfp_flags, dma_attrs)?;
> +        let ptr = dmem.as_mut_ptr();
> +
> +        // SAFETY:
> +        // - `ptr` is valid, properly aligned, and points to exclusively owned memory.
> +        // - If `__init` fails, `self` is dropped, which safely frees the underlying `Coherent`'s
> +        //   DMA memory. `T: AsBytes + FromBytes` ensures there are no complex `Drop` requirements
> +        //   we are bypassing.
> +        unsafe { init.__init(ptr)? };
> +
> +        Ok(dmem)
> +    }
> +
> +    /// Same as [`Coherent::zeroed`], but instead of a zero-initialization the memory is initialized
> +    /// with `init`.
> +    #[inline]
> +    pub fn init<E>(
> +        dev: &device::Device<Bound>,
> +        gfp_flags: kernel::alloc::Flags,
> +        init: impl Init<T, E>,
> +    ) -> Result<Self>
> +    where
> +        Error: From<E>,
> +    {
> +        Self::init_with_attrs(dev, gfp_flags, Attrs(0), init)
> +    }
> +

I think we are missing an array initializer for `Coherent<[T]>`.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



