Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6329DFF8861
	for <nouveau@archiver.kernel.org>; Mon, 27 Apr 2026 11:28:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E90B10E6DC;
	Mon, 27 Apr 2026 11:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kGUz3Bq8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6E68845C6F;
	Mon, 27 Apr 2026 11:16:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777288579;
 b=D+xxyL5ZR0dH2NfQ3LbqbyJ6wZrpJDU9XtOFvPwbkVJkJURQvDAhXy9OB9g0n2RNHdc9Y
 1Ntqjke8mM78QkCzrWqAxxbpvC9aT26eKj9vHAE382VrxsqUWuRw43kTFgMGPEn0l82tAYm
 DCvW4hb9hn+WSOISrThu6j8HgwZiCNQ4Y3JLgMVVO5RBcTsc1emC9sJMKvhCa7AyTW1LylQ
 vL+UqmLUBKLVsZHKR8qCZs89aY7IXbJTWX7f3Tl8A6RDkWjJq3amjIgzhVCmGgsOKItGDMQ
 Hb/4qHYNRYW6/koQfBjvL3/c8i4aLaCTHbHowe2i3fQkPVxJfwhvQ0v3xsXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777288579; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zcknCi1DhqtqCVlGc+4JOr7GSwLg2qi4tOGfMw8f7Qw=;
 b=y6F50Iq4pQUvuvvHpid9kL7TD9sF3L7/CwdcpG0y9o7N+T1pgRBU/EStlLFz7/zbuGWXK
 DwZJzJiYzMAYeDYOSyRPwhEP4Nt97VJvOvKxb6b9/nUmHYbrwPebVVbb3/u1Utut6PiTZKH
 EyzNiVU7KAN15boNPapESyvhdpc3j8dsPK0ny4kDKkvAjO6x/UV1hfY4RDhq9GysY0Aq5lQ
 YP4195DVytWRR29dp+PGciBHwSNC/VimAjAx32O0AQcZOnfCBEQoIRSpQQPSLy0LvZDOshi
 mYU5mpZQTBYSSNIdOlnchAY7AOgSNmVqAlXwPdGKTolksQbBFGEqKumI8aNA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CCF3440F62
	for <nouveau@lists.freedesktop.org>; Mon, 27 Apr 2026 11:16:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4296C10E6D0;
	Mon, 27 Apr 2026 11:28:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C939F43C85;
	Mon, 27 Apr 2026 11:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC46C2BCB6;
	Mon, 27 Apr 2026 11:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777289315;
	bh=StTYVLk4jF8kiFZCp6Zg56JlMDEype0lHVzFjl1p9pw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kGUz3Bq8lZnqL01QFqUD2Zaz97+RiBq1CBWRahxr54wRpgnDX2Yhlp7H3XrQDp5gz
	 RYTNZFBmg4fDKJpacKeoIdXZBvOhJSyDkA3eRGhmqSaxl0P+Q0+eCrrxn3s10FFgDb
	 tCARcnqJrWfST5JkA3zL651tsc8lPHj7JY/+Om0ev4uuZMZwL5o8hOEgzB4sSH41zI
	 hw4npR4tsNsc22M78O5Mds4rS7rJnBm2dZMJFUZvicwEpPKyGpshWbi0yIiVg4qQ6l
	 55+T5LkIxe5S88bO0XCTrFu5Bf7pvUSSNTQ62P5EAElAh4pZaXTTU1LQbTefFFjjQ+
	 dcV2HjhnU1GkQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Abdiel
 Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Alexandre
 Courbot <acourbot@nvidia.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 1/5] rust: ptr: add panicking index projection variant
In-Reply-To: <20260415-projection-syntax-rework-v1-1-450723cb3727@garyguo.net>
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
 <FW-izTUZJ5UeE_3CsMTwNT-XlxQHmovjhfdXQpTE9Eb5aInlYy8Tj1H94gLDiBEOXlVVwadom47wXriTOW0iQQ==@protonmail.internalid>
 <20260415-projection-syntax-rework-v1-1-450723cb3727@garyguo.net>
Date: Mon, 27 Apr 2026 13:24:13 +0200
Message-ID: <87qzo0r6hu.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: FSCAOBDBCHB4Y3SLDPAA33KOXYAFUECJ
X-Message-ID-Hash: FSCAOBDBCHB4Y3SLDPAA33KOXYAFUECJ
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FSCAOBDBCHB4Y3SLDPAA33KOXYAFUECJ/>
Archived-At: 
 <https://lore.freedesktop.org/87qzo0r6hu.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Gary Guo" <gary@garyguo.net> writes:

> There have been a few cases where the programmer knows that the indices are
> in bounds but compiler cannot deduce that. This is also
> compiler-version-dependent, so using build indexing here can be
> problematic. On the other hand, it is also not ideal to use the fallible
> variant, as it adds error handling path that is never hit.
>
> Add a new panicking index projection for this scenario. Like all panicking
> operations, this should be used carefully only in cases where the user
> knows the index is going to be in bounds, and panicking would indicate
> something is catastrophically wrong.
>
> To signify this, require users to explicitly denote the type of index being
> used. The existing two types of index projections also gain the keyworded
> version, which will be the recommended way going forward.
>
> The keyworded syntax also paves the way of perhaps adding more flavors in
> the future, e.g. `unsafe` index projection. However, unless the code is
> extremely performance sensitive and bounds checking cannot be tolerated,
> panicking variant is safer and should be preferred, so it will be left to
> future when demand arises.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/dma.rs            |  3 ++
>  rust/kernel/ptr/projection.rs | 98 +++++++++++++++++++++++++++++++++++--------
>  2 files changed, 84 insertions(+), 17 deletions(-)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 4995ee5dc689..3e4d44749aaf 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -1207,6 +1207,9 @@ macro_rules! dma_write {
>      (@parse [$dma:expr] [$($proj:tt)*] [.$field:tt $($rest:tt)*]) => {
>          $crate::dma_write!(@parse [$dma] [$($proj)* .$field] [$($rest)*])
>      };
> +    (@parse [$dma:expr] [$($proj:tt)*] [[$flavor:ident: $index:expr] $($rest:tt)*]) => {
> +        $crate::dma_write!(@parse [$dma] [$($proj)* [$flavor: $index]] [$($rest)*])
> +    };
>      (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr]? $($rest:tt)*]) => {
>          $crate::dma_write!(@parse [$dma] [$($proj)* [$index]?] [$($rest)*])
>      };
> diff --git a/rust/kernel/ptr/projection.rs b/rust/kernel/ptr/projection.rs
> index 140ea8e21617..845811795393 100644
> --- a/rust/kernel/ptr/projection.rs
> +++ b/rust/kernel/ptr/projection.rs
> @@ -26,14 +26,14 @@ fn from(_: OutOfBound) -> Self {
>  ///
>  /// # Safety
>  ///
> -/// The implementation of `index` and `get` (if [`Some`] is returned) must ensure that, if provided
> -/// input pointer `slice` and returned pointer `output`, then:
> +/// The implementation of `index`, `build_index` and `get` (if [`Some`] is returned) must ensure
> +/// that, if provided input pointer `slice` and returned pointer `output`, then:

Since you are changing these lines I would suggest to rephrase for
better parsing:

For return value `output`, the implementation of `index`, `build_index`
and `get` (if [`Some`] is returned) must ensure that:

>  /// - `output` has the same provenance as `slice`;
>  /// - `output.byte_offset_from(slice)` is between 0 to
>  ///   `KnownSize::size(slice) - KnownSize::size(output)`.
>  ///
> -/// This means that if the input pointer is valid, then pointer returned by `get` or `index` is
> -/// also valid.
> +/// This means that if the input pointer is valid, then pointer returned by `get`, `index` or
> +/// `build_index` is also valid.
>  #[diagnostic::on_unimplemented(message = "`{Self}` cannot be used to index `{T}`")]
>  #[doc(hidden)]
>  pub unsafe trait ProjectIndex<T: ?Sized>: Sized {
> @@ -42,9 +42,12 @@ pub unsafe trait ProjectIndex<T: ?Sized>: Sized {
>      /// Returns an index-projected pointer, if in bounds.
>      fn get(self, slice: *mut T) -> Option<*mut Self::Output>;
>
> +    /// Returns an index-projected pointer; panic if out of bounds.
> +    fn index(self, slice: *mut T) -> *mut Self::Output;
> +
>      /// Returns an index-projected pointer; fail the build if it cannot be proved to be in bounds.
>      #[inline(always)]
> -    fn index(self, slice: *mut T) -> *mut Self::Output {
> +    fn build_index(self, slice: *mut T) -> *mut Self::Output {
>          Self::get(self, slice).unwrap_or_else(|| build_error!())
>      }
>  }
> @@ -67,6 +70,11 @@ fn index(self, slice: *mut T) -> *mut Self::Output {
>      fn index(self, slice: *mut [T; N]) -> *mut Self::Output {
>          <I as ProjectIndex<[T]>>::index(self, slice)
>      }
> +
> +    #[inline(always)]
> +    fn build_index(self, slice: *mut [T; N]) -> *mut Self::Output {
> +        <I as ProjectIndex<[T]>>::build_index(self, slice)
> +    }
>  }
>
>  // SAFETY: `get`-returned pointer has the same provenance as `slice` and the offset is checked to
> @@ -82,6 +90,14 @@ fn get(self, slice: *mut [T]) -> Option<*mut T> {
>              Some(slice.cast::<T>().wrapping_add(self))
>          }
>      }
> +
> +    #[inline(always)]
> +    fn index(self, slice: *mut [T]) -> *mut T {
> +        // Leverage Rust built-in operators for bounds checking.
> +        // SAFETY: All non-null and aligned pointers are valid for ZST read.
> +        unsafe { core::slice::from_raw_parts::<()>(core::ptr::dangling(), slice.len())[self] };

I think this would be more readable if you move the indexing operation
out of the unsafe block:

        // SAFETY: All non-null and aligned pointers are valid for ZST read.
        let slice = unsafe { core::slice::from_raw_parts::<()>(core::ptr::dangling(), slice.len()) };
        // Leverage Rust built-in operators for bounds checking.
        slice[self];

> +        slice.cast::<T>().wrapping_add(self)
> +    }
>  }
>
>  // SAFETY: `get`-returned pointer has the same provenance as `slice` and the offset is checked to
> @@ -100,6 +116,18 @@ fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
>              new_len,
>          ))
>      }
> +
> +    #[inline(always)]
> +    fn index(self, slice: *mut [T]) -> *mut [T] {
> +        // Leverage Rust built-in operators for bounds checking.
> +        // SAFETY: All non-null and aligned pointers are valid for ZST read.
> +        unsafe {
> +            _ = core::slice::from_raw_parts::<()>(core::ptr::dangling(), slice.len())[self.clone()];

Same comment regarding moving indexing to next line.

Side question: Why do you need to explicitly discard the return value
here (`_ = ...`) and not above?


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


