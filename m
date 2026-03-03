Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3026CEDA693
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 16:23:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E3C4D10E86D;
	Tue,  3 Mar 2026 16:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CINpFcQG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C6DF244D9F;
	Tue,  3 Mar 2026 16:13:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772554398;
 b=g+SyDaLsqkLDFYMUxRm57MR8zgFwGyoHZa8xRbVKq8PGcHDCa37RN/JMBjeayY2PCA8jb
 dQEznfq+7hAemtLlLgN9R6O6mleN59fIApwe4YatEHqWGxvepZDFUVaCNLTcO3NNGcHDIbs
 J14aQkE4FFPHre6jlwH2qf6u2B2jMLEMne9gmBJFrPNf8tEoY6ZjcbkDqWo0LHD7rkrpCbR
 PiajoELgEAayS6EhNhUi/f0er5Y4FGHzZ91CMuwchwf9G4aGn0uyVnVI4sgrzDlTUjbjsBo
 9H2zCbBaXuMk1E0Vghd4IW7vS7TWXJhKAUOggvwGSbINeRUpYRgJHbYfq/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772554398; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DKJW9EcwUk4h+Xp9lw5JIzqourgMS7dvDNrB8XlM0ok=;
 b=r+RbEHccUWQv6EdY43Ff/0yrPX+cnd1Ohrl9Rv5IQlaYMXfurPD5iPsnq0tH1y+wixXqC
 D75LRzxHb6jSR/R7PtdojFb6Crr7EL9YUGckifPiY9B2MxDgHmPm87sAzxkX1iiU5kbO4sr
 4kDTqor8JW0S1uPQfAyd//IjyfsqnoU83vAzv9DzuGTvES+FjI79eTBeYyJ+AT593wuYJ55
 TDSe4kgUhQVQ5P6m006c4jH8pLwl/2LlzbeqVxxmkkobfm7101DzDizy+vOHTkrfru11pCv
 lrx+52g9xMibgbg3vvnA3HJtIzRC3ab8ZI2Li6jRa3Qir9BuDDIOeeQw6wRQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 13A3B44CD7
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 16:13:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EE36C10E865;
	Tue,  3 Mar 2026 16:23:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54BC060008;
	Tue,  3 Mar 2026 16:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E9FC19425;
	Tue,  3 Mar 2026 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555014;
	bh=2KpsdZwDEoGsFZo4mcehIAvYG9ASAGAxsst8MTspzNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CINpFcQGYvbR4YvZESh+564qUW9h1Drprf79ZT8AiYiKKCLinSv3zb9hMtDAicQ2v
	 sFwHmTkwr7S6S+1v729+qDlKvJsaobdCNbFbVjqHF5dLK4kEuWIQiZNpT9myRHpwbu
	 sulikvPjA7VlcMZwjqIDOdcbaammLmbO+RG0OTJjlGRzJsfA8bjLBKqugjzL26M363
	 nZCryzqnQQBG5YhZ/94KNoJ5Md3SGF3vr6GLPnuIG1SkOGWEtaDA3infQH9PAMjW1k
	 Zoukdz/1mCYfEiUIiU+HJZ1zz7F7uTVOr+V7NfXkOR7VFcZK/cnTA7Cj/n58Q5gL3D
	 USgcqQskKmQtA==
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
Subject: [PATCH 3/8] rust: dma: add zeroed constructor to `Coherent`
Date: Tue,  3 Mar 2026 17:22:54 +0100
Message-ID: <20260303162314.94363-4-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303162314.94363-1-dakr@kernel.org>
References: <20260303162314.94363-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4IAFPGRZ63QTM66COSWGOIIVC6XE4WWZ
X-Message-ID-Hash: 4IAFPGRZ63QTM66COSWGOIIVC6XE4WWZ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4IAFPGRZ63QTM66COSWGOIIVC6XE4WWZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260303162314.94363-4-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Gary Guo <gary@garyguo.net>

These constructors create a coherent container of a single object
instead of slice. They are named `zeroed` and `zeroed_with_attrs` to
emphasis that they are created initialized zeroed. It is intended that
there'll be new constructors that take `PinInit` instead of zeroing.

Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs       | 77 +++++++++++++++++++++++++++++++++++-----
 samples/rust/rust_dma.rs |  8 ++---
 2 files changed, 73 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 3a692ac76ba2..291fdea3b52b 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -47,7 +47,7 @@ pub trait Device: AsRef<device::Device<Core>> {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -64,7 +64,7 @@ unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -83,7 +83,7 @@ unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -102,7 +102,7 @@ unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
     /// # Safety
     ///
     /// This method must not be called concurrently with any DMA allocation or mapping primitives,
-    /// such as [`CoherentAllocation::alloc_attrs`].
+    /// such as [`Coherent::zeroed`].
     unsafe fn dma_set_max_seg_size(&self, size: u32) {
         // SAFETY:
         // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
@@ -202,12 +202,12 @@ pub const fn value(&self) -> u64 {
 ///
 /// ```
 /// # use kernel::device::{Bound, Device};
-/// use kernel::dma::{attrs::*, CoherentAllocation};
+/// use kernel::dma::{attrs::*, Coherent};
 ///
 /// # fn test(dev: &Device<Bound>) -> Result {
 /// let attribs = DMA_ATTR_FORCE_CONTIGUOUS | DMA_ATTR_NO_WARN;
-/// let c: CoherentAllocation<u64> =
-///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, attribs)?;
+/// let c: Coherent<[u64]> =
+///     Coherent::zeroed_slice_with_attrs(dev, 4, GFP_KERNEL, attribs)?;
 /// # Ok::<(), Error>(()) }
 /// ```
 #[derive(Clone, Copy, PartialEq)]
@@ -492,7 +492,6 @@ pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
 
 impl<T: AsBytes + FromBytes> Coherent<T> {
     /// Allocates a region of `T` of coherent memory.
-    #[expect(unused)]
     fn alloc_with_attrs(
         dev: &device::Device<Bound>,
         gfp_flags: kernel::alloc::Flags,
@@ -529,6 +528,33 @@ fn alloc_with_attrs(
         })
     }
 
+    /// Allocates a region of type `T` of coherent memory.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::device::{Bound, Device};
+    /// use kernel::dma::{attrs::*, Coherent};
+    ///
+    /// # fn test(dev: &Device<Bound>) -> Result {
+    /// let c: Coherent<[u64; 4]> =
+    ///     Coherent::zeroed_with_attrs(dev, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    pub fn zeroed_with_attrs(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Self> {
+        Self::alloc_with_attrs(dev, gfp_flags | __GFP_ZERO, dma_attrs)
+    }
+
+    /// Performs the same functionality as [`Coherent::zeroed_with_attrs`], except the
+    /// `dma_attrs` is 0 by default.
+    pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> Result<Self> {
+        Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
+    }
+
     /// Allocates a region of `[T; len]` of coherent memory.
     fn alloc_slice_with_attrs(
         dev: &device::Device<Bound>,
@@ -572,6 +598,41 @@ fn alloc_slice_with_attrs(
             dma_attrs,
         })
     }
+
+    /// Allocates a zeroed region of type `T` of coherent memory.
+    ///
+    /// Unlike `Coherent::<[T; N]>::zeroed_with_attrs`, `Coherent::<T>::zeored_slices` support
+    /// a runtime length.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::device::{Bound, Device};
+    /// use kernel::dma::{attrs::*, Coherent};
+    ///
+    /// # fn test(dev: &Device<Bound>) -> Result {
+    /// let c: Coherent<[u64]> =
+    ///     Coherent::zeroed_slice_with_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
+    /// # Ok::<(), Error>(()) }
+    /// ```
+    pub fn zeroed_slice_with_attrs(
+        dev: &device::Device<Bound>,
+        len: usize,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+    ) -> Result<Coherent<[T]>> {
+        Coherent::alloc_slice_with_attrs(dev, len, gfp_flags | __GFP_ZERO, dma_attrs)
+    }
+
+    /// Performs the same functionality as [`Coherent::zeroed_slice_with_attrs`], except the
+    /// `dma_attrs` is 0 by default.
+    pub fn zeroed_slice(
+        dev: &device::Device<Bound>,
+        len: usize,
+        gfp_flags: kernel::alloc::Flags,
+    ) -> Result<Coherent<[T]>> {
+        Self::zeroed_slice_with_attrs(dev, len, gfp_flags, Attrs(0))
+    }
 }
 
 impl<T: AsBytes + FromBytes> Coherent<[T]> {
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index ce39b5545097..314ef51cd86c 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -6,7 +6,7 @@
 
 use kernel::{
     device::Core,
-    dma::{CoherentAllocation, DataDirection, Device, DmaMask},
+    dma::{Coherent, DataDirection, Device, DmaMask},
     page, pci,
     prelude::*,
     scatterlist::{Owned, SGTable},
@@ -16,7 +16,7 @@
 #[pin_data(PinnedDrop)]
 struct DmaSampleDriver {
     pdev: ARef<pci::Device>,
-    ca: CoherentAllocation<MyStruct>,
+    ca: Coherent<[MyStruct]>,
     #[pin]
     sgt: SGTable<Owned<VVec<u8>>>,
 }
@@ -64,8 +64,8 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
             // SAFETY: There are no concurrent calls to DMA allocation and mapping primitives.
             unsafe { pdev.dma_set_mask_and_coherent(mask)? };
 
-            let ca: CoherentAllocation<MyStruct> =
-                CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
+            let ca: Coherent<[MyStruct]> =
+                Coherent::zeroed_slice(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
 
             for (i, value) in TEST_VALUES.into_iter().enumerate() {
                 kernel::dma_write!(ca, [i]?, MyStruct::new(value.0, value.1));
-- 
2.53.0

