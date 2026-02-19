Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4EAE9A04C
	for <nouveau@archiver.kernel.org>; Thu, 19 Feb 2026 11:22:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C2B3510E6D3;
	Thu, 19 Feb 2026 11:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MEkI9X6e";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B91EA43421;
	Thu, 19 Feb 2026 11:12:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771499535;
 b=l8wEWxwPHgB9/l7NVVZcVmQpiqvzGg+vim23XYn1qudzV8FIH+wcqEW2Muz4O7aqScwRQ
 WV1HTpsNZjgkFp9qaTReWF1q18XTPSlwWFFsfKIJgilWdMKTVtVbDy4uD5PvsZM7dume4f5
 QqIrvZVBKit6zFXj3V4D8FxuiVANtOS25EGO9oI6MZiuNYW7AM+Zjq6dc3PBf1vvjd6A8h0
 Z+stc1LSrv52qaLIi1cApKeZYh5Wf0/YPjRBQTgB1wUn+QEfuhWJYyWSgXGUduES6WkPp1J
 xBSNRQQiUo5KmQMI/jdfd4rKw2buD5060EwT4SAVrmTKNi/z9+AuJXAQB9lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771499535; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NNSA4WG2Ike9pH1xs6SrBui/l5g3gJF3IpZ2f1/Np4E=;
 b=vOQe6GZgQI5ImXccqUsBqus4k8gSgvurVdmkq1zgPfKsK1PYatKvkeoIUAsPPto9i+9PJ
 +oPbwxjvD3llPlOmxd7AU/Os0loNxNVVyaGOa6QoT3mb6tWLeAPpBwmuzWCzeqjbZ22kF3R
 dX+i0O/bEitv3Pq+tCXbcK2zncKHDC3B/kOEPSKXRum9v9SU4mqalvL6dd9a5pOfuDEFWMz
 Fiw0IpjGXZ5Qt/hFWGqS/oJvkGxFJsKtd+tbQvvG+kEzQt3duZZyfNWh+bfUb7nE9xHUhr2
 jIhC9acsQvCyQAerOGoQ/npR7hdXneUR6c8SxNwrMBQjU3HDU9Wc9Rvaurig==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7AC3D430BD
	for <nouveau@lists.freedesktop.org>; Thu, 19 Feb 2026 11:12:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC7F10E2B5;
	Thu, 19 Feb 2026 11:22:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D35B44333;
	Thu, 19 Feb 2026 11:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74232C116C6;
	Thu, 19 Feb 2026 11:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771500122;
	bh=kT/PTGs5PXgI9XY72xXnAoqP7h+TJqjTMCwCp43BQgo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=MEkI9X6ehggLdzWXMb0DoW+LTUOH/r4UENshpgk2z/zbueGKw7cOovdTCInn3EqgI
	 AjoKC1NdS2k3crOhcQ/6atddxkatrkDX4jDG4emFKkhzIXX0c5YScrZDgS0JhpQZR7
	 GqXpGEy51AI41jZEFSFMTXEDDb8JvkZ0goVPo29sMRL9GGSXqzAx40pkmDVy5uRkBB
	 W3w/qEYPNBTEbWJFQ8t+odx5ak68BJsl/avrJwoSTn/VAWdOiqjjmv9Gvkd+KN/gxj
	 Kuazel23LTQOzbn//UeFBsvuDLiAlp5reS67OPZtTJwsistuGDIW0sYeijuYtSDVNb
	 LIQ0ZEs/t1Fbw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 12:21:56 +0100
Message-Id: <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-6-joelagnelf@nvidia.com>
Message-ID-Hash: ELOGZ43SLXA6XEJV4KOEH52BCDFEMQUG
X-Message-ID-Hash: ELOGZ43SLXA6XEJV4KOEH52BCDFEMQUG
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ELOGZ43SLXA6XEJV4KOEH52BCDFEMQUG/>
Archived-At: 
 <https://lore.freedesktop.org/DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
> +RUST TO C LIST INTERFACES

Maybe this should just be "RUST [FFI]" instead (in case Alex and you want t=
o
sign up for looking after FFI helper infrastructure in general)?

> +M:	Joel Fernandes <joelagnelf@nvidia.com>
> +M:	Alexandre Courbot <acourbot@nvidia.com>
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/kernel/ffi/clist.rs

<snip>

> diff --git a/rust/kernel/ffi/clist.rs b/rust/kernel/ffi/clist.rs
> new file mode 100644
> index 000000000000..a84f395875dc
> --- /dev/null
> +++ b/rust/kernel/ffi/clist.rs
> @@ -0,0 +1,327 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! FFI interface for C doubly circular intrusive linked lists.
> +//!
> +//! This module provides Rust abstractions for iterating over C `list_he=
ad`-based
> +//! linked lists. It is intended for FFI use-cases where a C subsystem m=
anages a
> +//! circular linked list that Rust code needs to read. This is generally=
 required
> +//! only for special cases and should be avoided by drivers.

Maybe generalize the statement a bit and say that this should only be used =
for
cases where C and Rust code share direct access to the same linked list thr=
ough
an FFI interface.

Additionally, add a separate note that this *must not* be used by Rust
components that just aim for a linked list primitive and instead refer to t=
he
Rust linked list implementation with an intra-doc link.

> +//!
> +//! # Examples
> +//!
> +//! ```
> +//! use kernel::{
> +//!     bindings,
> +//!     clist_create,
> +//!     types::Opaque, //

Examples don't necessarily need '//' at the end, as they are not automatica=
lly
formatted anyways.

(I hope that we will have a solution for import formatting before rustfmt
supports doc-comments. :)

> +//! };
> +//! # // Create test list with values (0, 10, 20) - normally done by C c=
ode but it is
> +//! # // emulated here for doctests using the C bindings.
> +//! # use core::mem::MaybeUninit;
> +//! #
> +//! # /// C struct with embedded `list_head` (typically will be allocate=
d by C code).
> +//! # #[repr(C)]
> +//! # pub struct SampleItemC {
> +//! #     pub value: i32,
> +//! #     pub link: bindings::list_head,
> +//! # }
> +//! #
> +//! # let mut head =3D MaybeUninit::<bindings::list_head>::uninit();
> +//! #
> +//! # let head =3D head.as_mut_ptr();
> +//! # // SAFETY: head and all the items are test objects allocated in th=
is scope.
> +//! # unsafe { bindings::INIT_LIST_HEAD(head) };
> +//! #
> +//! # let mut items =3D [
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! # ];
> +//! #
> +//! # for (i, item) in items.iter_mut().enumerate() {
> +//! #     let ptr =3D item.as_mut_ptr();
> +//! #     // SAFETY: pointers are to allocated test objects with a list_=
head field.
> +//! #     unsafe {

I understand that this is just setup code for a doc-test, but I still think=
 we
should hold it to the same standards, i.e. let's separate the different uns=
afe
calls into their own unsafe blocks and add proper safety comments.

> +//! #         (*ptr).value =3D i as i32 * 10;
> +//! #         // &raw mut computes address of link directly as link is u=
ninitialized.
> +//! #         bindings::INIT_LIST_HEAD(&raw mut (*ptr).link);
> +//! #         bindings::list_add_tail(&mut (*ptr).link, head);
> +//! #     }
> +//! # }

<snip>

> +use pin_init::{
> +    pin_data,
> +    pin_init,
> +    PinInit //

Should be 'PinInit, //'.

> +};
> +
> +/// FFI wrapper for a C `list_head` object used in intrusive linked list=
s.
> +///
> +/// # Invariants
> +///
> +/// - [`CListHead`] represents an allocated and valid `list_head` struct=
ure.

What does "allocated" mean in this context? (Dynamic allocations, stack, .d=
ata
section of the binary, any of those?)

In case of the latter, I'd just remove "allocated".

> +#[pin_data]
> +#[repr(transparent)]
> +pub struct CListHead {
> +    #[pin]
> +    inner: Opaque<bindings::list_head>,
> +}
> +
> +impl CListHead {
> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized =
`list_head` structure.

Same here, what exactly is meant by "allocated"?

> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list and all linked `list_head` nodes must not be modified=
 by non-Rust code
> +    ///   for the lifetime `'a`.

This is a bit vague I think, concurrent modifications of (other) Rust code =
are
not OK either.

> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Sel=
f {
> +        // SAFETY:
> +        // - [`CListHead`] has same layout as `list_head`.
> +        // - `ptr` is valid and unmodified for 'a per caller guarantees.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.inner.get()
> +    }
> +
> +    /// Get the next [`CListHead`] in the list.
> +    #[inline]
> +    pub fn next(&self) -> &Self {
> +        let raw =3D self.as_raw();
> +        // SAFETY:
> +        // - `self.as_raw()` is valid per type invariants.
> +        // - The `next` pointer is guaranteed to be non-NULL.

I'm not sure whether "valid" in the type invariant implies that the struct
list_head is initialized. From a language point of view it is also valid if=
 the
pointers are NULL.

So, I think the invariant (and the safety requirements of from_raw()) have =
to
ensure that the struct list_head is initialized in the sense of
INIT_LIST_HEAD().

> +        unsafe { Self::from_raw((*raw).next) }
> +    }

<snip>

> +/// A typed C linked list with a sentinel head intended for FFI use-case=
s where
> +/// C subsystem manages a linked list that Rust code needs to read. Gene=
rally
> +/// required only for special cases.
> +///
> +/// A sentinel head [`ClistHead`] represents the entire linked list and =
can be used
> +/// for iteration over items of type `T`, it is not associated with a sp=
ecific item.
> +///
> +/// The const generic `OFFSET` specifies the byte offset of the `list_he=
ad` field within
> +/// the struct that `T` wraps.
> +///
> +/// # Invariants
> +///
> +/// - The [`CListHead`] is an allocated and valid sentinel C `list_head`=
 structure.
> +/// - `OFFSET` is the byte offset of the `list_head` field within the st=
ruct that `T` wraps.
> +/// - All the list's `list_head` nodes are allocated and have valid next=
/prev pointers.
> +#[repr(transparent)]
> +pub struct CList<T, const OFFSET: usize>(CListHead, PhantomData<T>);
> +
> +impl<T, const OFFSET: usize> CList<T, OFFSET> {
> +    /// Create a typed [`CList`] reference from a raw sentinel `list_hea=
d` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized =
`list_head` structure
> +    ///   representing a list sentinel.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list must contain items where the `list_head` field is at =
byte offset `OFFSET`.
> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Sel=
f {
> +        // SAFETY:
> +        // - [`CList`] has same layout as [`CListHead`] due to repr(tran=
sparent).
> +        // - Caller guarantees `ptr` is a valid, sentinel `list_head` ob=
ject.
> +        unsafe { &*ptr.cast() }
> +    }

Comments from CListHead also apply here.

> +/// Create a C doubly-circular linked list interface `CList` from a raw =
`list_head` pointer.
> +///
> +/// This macro creates a `CList<T, OFFSET>` that can iterate over items =
of type `$rust_type`
> +/// linked via the `$field` field in the underlying C struct `$c_type`.
> +///
> +/// # Arguments
> +///
> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bin=
dings::list_head`).
> +/// - `$rust_type`: Each item's rust wrapper type.
> +/// - `$c_type`: Each item's C struct type that contains the embedded `l=
ist_head`.
> +/// - `$field`: The name of the `list_head` field within the C struct.
> +///
> +/// # Safety
> +///
> +/// This is an unsafe macro. The caller must ensure:

Given that, we should probably use the same (or a similar) trick as in [1].

[1] https://rust.docs.kernel.org/src/kernel/device.rs.html#665-688

> +///
> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a=
 list that remains
> +///   unmodified for the lifetime of the rust `CList`.
> +/// - The list contains items of type `$c_type` linked via an embedded `=
$field`.
> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compa=
tible layout.
> +///
> +/// # Examples
> +///
> +/// Refer to the examples in this module's documentation.
> +#[macro_export]
> +macro_rules! clist_create {
> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) =3D> {{
> +        // Compile-time check that field path is a list_head.
> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
=3D
> +            |p| &raw const (*p).$($field).+;
> +
> +        // Calculate offset and create `CList`.
> +        const OFFSET: usize =3D ::core::mem::offset_of!($c_type, $($fiel=
d).+);
> +        $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($head)
> +    }};
> +}
