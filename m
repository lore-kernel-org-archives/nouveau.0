Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1931099B39
	for <nouveau@archiver.kernel.org>; Fri, 20 Mar 2026 19:47:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DDDCF10EBFC;
	Fri, 20 Mar 2026 19:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bd8RIXQ9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A7C0545241;
	Fri, 20 Mar 2026 19:36:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774035364;
 b=k7eaUE6Rss8PJLsxJvXg/WgU8fuP3Wccc9fSn9x+DmWyeKrgLMHUXP1FD6t+vpkKR3Rny
 Q182vP2IESnt0dVuUW3ofaC+UAfjetH4YjcgrBdLeJlcmtvWhdGmcquMjudFBQPaNOfaRaM
 9vxps+38Zb2wgrgsXABuCMVdpN3AEOKAn6L8v6y/keL7o+QzwlPTEv44AQ3hkY4tnmSOSgw
 zkEvZsWKVeZx6g6AUCM3SjPLC0TeaRN3y6EuGVQn1AFRz0qmMgdxwu4pu5UXTUH8XtBH2XB
 KXcqVjWmrddJx7D4kbdasmFa8lRg5794lx2QaZopaQTdjT/HVwN9sJvbnCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774035364; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nG6/dZvsZ5uFTY4Q/L1oeNH5p4QkDi0Ctu5fTm/rUqI=;
 b=AatkF0+E0xTKolNNHOpqEyUA7g4JgxYy/lEVJWRzFQdQy17D/PbRM2XAIpX1WR1Mov3e9
 az8/twdd79m7uo4c6zXSOpOgqFrXS0BN/gV+8FYeYXNL4aSpugAQ+eA6Onk7AmOfIlIGNps
 HubK53TTHaLbma5atkyQjPZ6GI1x2/VtmBlRZ5kSYhSDyv6vmzWp93ggWMmpuNIFqWaB1Os
 T4N0pc6W+Sd41YeKY9sURkUVN0j2kf1mQ/eT00E0LBd2kEH9TT0Rjue5lNn/D+7JVwEqBdx
 S0wph4cspaPWaIGiA7GY1kJggSdQXX8cRredJxlrk16kCTCuaMzFjmzcK2oA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 18E3C44C8D
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 19:36:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3154610EC15;
	Fri, 20 Mar 2026 19:46:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1390744032;
	Fri, 20 Mar 2026 19:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C21C19425;
	Fri, 20 Mar 2026 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774036018;
	bh=bJbrB0VL/Fq7E9V44DRCigpB+wY3S4NcLkRFRufFS7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bd8RIXQ9LDhCMlK/CuErA3v3cVa+frbm8fmS4zaPQQNfR0B/7wQYtMLD+cXZ4VB1x
	 jPPdkW3X7KthBuh9+efabxKGtI9bzkGOKZh5GlUVUA1olPdtqkb0+tv9z1PEoA2ltx
	 iLAIAv0XR06pKtI1x76Ft9Uz8PmLnfcrdNKmx64MrgxIxQjdPbEtIczXiED5v8++4V
	 m7l3vXWOVE++zHjPYoWxfLK7+PdX0Ue/ZFPhe4ODntd7+t6vZayBDwLAWGMBcINe6e
	 NB9R0x9e3GsEhPEHhbiCcH0KloJKWuj6P2tscbdOqoDuy2bG5I6DGHdanEGuPSUGUe
	 RMF0EGYCVupNg==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com
Subject: [PATCH v2 4/8] rust: dma: introduce dma::CoherentBox for memory
 initialization
Date: Fri, 20 Mar 2026 20:45:39 +0100
Message-ID: <20260320194626.36263-5-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320194626.36263-1-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M3NBOO6NM7C4ORK4DADILT4NFKSHYSGZ
X-Message-ID-Hash: M3NBOO6NM7C4ORK4DADILT4NFKSHYSGZ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M3NBOO6NM7C4ORK4DADILT4NFKSHYSGZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260320194626.36263-5-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Currently, dma::Coherent cannot safely provide (mutable) access to its
underlying memory because the memory might be concurrently accessed by a
DMA device. This makes it difficult to safely initialize the memory
before handing it over to the hardware.

Introduce dma::CoherentBox, a type that encapsulates a dma::Coherent
before its DMA address is exposed to the device. dma::CoherentBox can
guarantee exclusive access to the inner dma::Coherent and implement
Deref and DerefMut.

Once the memory is properly initialized, dma::CoherentBox can be
converted into a regular dma::Coherent.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 154 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 153 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index db645b01bdd0..cefb54f0424a 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -20,7 +20,13 @@
         FromBytes, //
     }, //
 };
-use core::ptr::NonNull;
+use core::{
+    ops::{
+        Deref,
+        DerefMut, //
+    },
+    ptr::NonNull, //
+};
 
 /// DMA address type.
 ///
@@ -352,6 +358,152 @@ fn from(direction: DataDirection) -> Self {
     }
 }
 
+/// CPU-owned DMA allocation that can be converted into a device-shared [`Coherent`] object.
+///
+/// Unlike [`Coherent`], a [`CoherentBox`] is guaranteed to be fully owned by the CPU -- its DMA
+/// address is not exposed and it cannot be accessed by a device. This means it can safely be used
+/// like a normal boxed allocation (e.g. direct reads, writes, and mutable slices are all safe).
+///
+/// A typical use is to allocate a [`CoherentBox`], populate it with normal CPU access, and then
+/// convert it into a [`Coherent`] object to share it with the device.
+///
+/// # Examples
+///
+/// `CoherentBox<T>`:
+///
+/// ```
+/// # use kernel::device::{
+/// #     Bound,
+/// #     Device,
+/// # };
+/// use kernel::dma::{attrs::*,
+///     Coherent,
+///     CoherentBox,
+/// };
+///
+/// # fn test(dev: &Device<Bound>) -> Result {
+/// let mut dmem: CoherentBox<u64> = CoherentBox::zeroed(dev, GFP_KERNEL)?;
+/// *dmem = 42;
+/// let dmem: Coherent<u64> = dmem.into();
+/// # Ok::<(), Error>(()) }
+/// ```
+///
+/// `CoherentBox<[T]>`:
+///
+///
+/// ```
+/// # use kernel::device::{
+/// #     Bound,
+/// #     Device,
+/// # };
+/// use kernel::dma::{attrs::*,
+///     Coherent,
+///     CoherentBox,
+/// };
+///
+/// # fn test(dev: &Device<Bound>) -> Result {
+/// let mut dmem: CoherentBox<[u64]> = CoherentBox::zeroed_slice(dev, 4, GFP_KERNEL)?;
+/// dmem.fill(42);
+/// let dmem: Coherent<[u64]> = dmem.into();
+/// # Ok::<(), Error>(()) }
+/// ```
+pub struct CoherentBox<T: AsBytes + FromBytes + KnownSize + ?Sized>(Coherent<T>);
+
+impl<T: AsBytes + FromBytes> CoherentBox<[T]> {
+    /// [`CoherentBox`] variant of [`Coherent::zeroed_slice_with_attrs`].
+    #[inline]
+    pub fn zeroed_slice_with_attrs(
+        dev: &device::Device<Bound>,
+        count: usize,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        Coherent::zeroed_slice_with_attrs(dev, count, gfp_flags, dma_attrs).map(Self)
+    }
+
+    /// Same as [CoherentBox::zeroed_slice_with_attrs], but with `dma::Attrs(0)`.
+    #[inline]
+    pub fn zeroed_slice(
+        dev: &device::Device<Bound>,
+        count: usize,
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<Self> {
+        Self::zeroed_slice_with_attrs(dev, count, gfp_flags, Attrs(0))
+    }
+
+    /// Initializes the element at `i` using the given initializer.
+    ///
+    /// Returns `EINVAL` if `i` is out of bounds.
+    pub fn init_at<E>(&mut self, i: usize, init: impl Init<T, E>) -> Result
+    where
+        Error: From<E>,
+    {
+        if i >= self.0.len() {
+            return Err(EINVAL);
+        }
+
+        let ptr = &raw mut self[i];
+
+        // SAFETY:
+        // - `ptr` is valid, properly aligned, and within this allocation.
+        // - `T: AsBytes + FromBytes` guarantees all bit patterns are valid, so partial writes on
+        //   error cannot leave the element in an invalid state.
+        // - The DMA address has not been exposed yet, so there is no concurrent device access.
+        unsafe { init.__init(ptr)? };
+
+        Ok(())
+    }
+}
+
+impl<T: AsBytes + FromBytes> CoherentBox<T> {
+    /// Same as [`CoherentBox::zeroed_slice_with_attrs`], but for a single element.
+    #[inline]
+    pub fn zeroed_with_attrs(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        Coherent::zeroed_with_attrs(dev, gfp_flags, dma_attrs).map(Self)
+    }
+
+    /// Same as [`CoherentBox::zeroed_slice`], but for a single element.
+    #[inline]
+    pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> Result<Self> {
+        Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
+    }
+}
+
+impl<T: AsBytes + FromBytes + KnownSize + ?Sized> Deref for CoherentBox<T> {
+    type Target = T;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        // SAFETY:
+        // - We have not exposed the DMA address yet, so there can't be any concurrent access by a
+        //   device.
+        // - We have exclusive access to `self.0`.
+        unsafe { self.0.as_ref() }
+    }
+}
+
+impl<T: AsBytes + FromBytes + KnownSize + ?Sized> DerefMut for CoherentBox<T> {
+    #[inline]
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY:
+        // - We have not exposed the DMA address yet, so there can't be any concurrent access by a
+        //   device.
+        // - We have exclusive access to `self.0`.
+        unsafe { self.0.as_mut() }
+    }
+}
+
+impl<T: AsBytes + FromBytes + KnownSize + ?Sized> From<CoherentBox<T>> for Coherent<T> {
+    #[inline]
+    fn from(value: CoherentBox<T>) -> Self {
+        value.0
+    }
+}
+
 /// An abstraction of the `dma_alloc_coherent` API.
 ///
 /// This is an abstraction around the `dma_alloc_coherent` API which is used to allocate and map
-- 
2.53.0

