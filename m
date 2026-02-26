Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8592FFD8FCE
	for <nouveau@archiver.kernel.org>; Thu, 26 Feb 2026 15:48:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 91EEE10E995;
	Thu, 26 Feb 2026 15:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KO2XXkEf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9081D44C8A;
	Thu, 26 Feb 2026 15:37:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772120273;
 b=TS84ma6irSKvV+wAAL+CzpJU7iOzTlIohDsjT0Su6pnuV7aOPp7lKt/jeI2+KPydiwGGr
 Q1xcvhRk+aq49UszmDhUHttabecqMPOTmssoz+K9fTyHQMHxDouMSrYg4V1qyclSZ5q4qw4
 TYUXWu+QMT6QROg3MwVEQ9dkNB3GEiZv3An9hqPbF9vmwtojQVLa2s3N6+QzPUPSHGyHFhb
 szFu8JrHNq5db97KfAp0uiV7rjrCaprC5+Xfu3sI6LyoP3z5TOXcRGfFfHdgJanhm5wPwSC
 8MykEW7E5/015YoRrEahtHDgYkTlnGagfOm/OSDZ2bU+EOt+6lANpbhB0f/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772120273; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mdgDHQWZuy/mYEzDbVuE6TL/tamLyNwfdM8VbAJu4w0=;
 b=hmvYjc5/DcWUCv3MHMo7f5f5vZimpl3ir/2O0CUFJmQAek06qR9qmMc7Q/PM254FkucA+
 FBuDKTu47ip4cY0GoJDRodsN4SE83OvFrraw4VektrWY1OBAygM0zhhzEox62wpaoMx1y+x
 qz1PdMOjM2NXS2t8CA8goA7YqArPAYY4OXE+7mSW/Id/fCyTBmoQMtqhYGWbZKdeepmriYS
 sP9vM92oWa9N4B6Qzbls6J1PpIZ/UU6PQyMoxP8aK5OCyZwhC3OM3wU3gDgqF6ecCFZ/D+M
 G27dxiwliOKxCG0fwjQd8eRuTJvKgBJjS3dHd6qUNEXHl9n+DwqQyOxiy/LQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 533F244C64
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 15:37:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCE910E98E;
	Thu, 26 Feb 2026 15:47:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77A48440E3;
	Thu, 26 Feb 2026 15:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5780C19423;
	Thu, 26 Feb 2026 15:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772120877;
	bh=S0Hfuvgw1f1fWJyBUEnC4qY6gqep6JwxreV/pS9o6tY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=KO2XXkEflQCwF+XCyu2lMFLIJHGYlx4KbAz85QTBHV76J9vlvpjsLkEjTF9JUp8uH
	 4QXRhLiPlHx89O2TC1JrPhBQlWbWgBcmW00NlSlMkwVgOc+uq4qUJJI8jnAOB0J7vR
	 LSrpsJZACk+uOsKmDusWZEQU83v9ZbXmW+1mCniCCZJ7VKL6CE9HBsyBK/TrVEEQqA
	 wQ9k7Lzrt6nImCinMSmknFsnkMNjqk/86W1jIJRFbAvYn+jnrHqx3OGBX6CAq8gUb8
	 P455rK2q9WtjSIYDzCQ/k8Eyp5i4v7l4/+eFFOMY1u20fD99Gb+ezq6M3/W0STfcz2
	 i4K6xq0WUjDeg==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 2/2] rust: dma: use pointer projection infra for
 `dma_{read,write}` macro
Date: Thu, 26 Feb 2026 15:46:54 +0000
Message-ID: <20260226154656.3241736-3-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260226154656.3241736-1-gary@kernel.org>
References: <20260226154656.3241736-1-gary@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OWFYHWPB2YXWZ6KC75A6YDKZY5XBGEU3
X-Message-ID-Hash: OWFYHWPB2YXWZ6KC75A6YDKZY5XBGEU3
X-MailFrom: gary@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Gary Guo <gary@garyguo.net>
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OWFYHWPB2YXWZ6KC75A6YDKZY5XBGEU3/>
Archived-At: 
 <https://lore.freedesktop.org/20260226154656.3241736-3-gary@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Gary Guo <gary@garyguo.net>

Current `dma_read!`, `dma_write!` macros also use a custom
`addr_of!()`-based implementation for projecting pointers, which has
soundness issue as it relies on absence of `Deref` implementation on types.
It also has a soundness issue where it does not protect against unaligned
fields (when `#[repr(packed)]` is used) so it can generate misaligned
accesses.

This commit migrates them to use the general pointer projection
infrastructure, which handles these cases correctly.

As part of migration, the macro is updated to have an improved surface
syntax. The current macro have

    dma_read!(a.b.c[d].e.f)

to mean `a.b.c` is a DMA coherent allocation and it should project into it
with `[d].e.f` and do a read, which is confusing as it makes the indexing
operator integral to the macro (so it will break if you have an array of
`CoherentAllocation`, for example).

This also is problematic as we would like to generalize
`CoherentAllocation` from just slices to arbitrary types.

Make the macro expects `dma_read!(path.to.dma, .path.inside.dma)` as the
canonical syntax. The index operator is no longer special and is just one
type of projection (in additional to field projection). Similarly, make
`dma_write!(path.to.dma, .path.inside.dma, value)` become the canonical
syntax for writing.

Another issue of the current macro is that it is always fallible. This
makes sense with existing design of `CoherentAllocation`, but once we
support fixed size arrays with `CoherentAllocation`, it is desirable to
have the ability to perform infallible indexing as well, e.g. doing a `[0]`
index of `[Foo; 2]` is okay and can be checked at build-time, so forcing
falliblity is non-ideal. To capture this, the macro is changed to use
`[idx]` as infallible projection and `[idx]?` as fallible index projection
(those syntax are part of the general projection infra). A benefit of this
is that while individual indexing operation may fail, the overall
read/write operation is not fallible.

Fixes: ad2907b4e308 ("rust: add dma coherent allocator abstraction")
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 drivers/gpu/nova-core/gsp.rs      |  14 ++--
 drivers/gpu/nova-core/gsp/boot.rs |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs |  10 ++-
 rust/kernel/dma.rs                | 114 +++++++++++++-----------------
 samples/rust/rust_dma.rs          |  30 ++++----
 5 files changed, 81 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b..25cd48514c77 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -143,14 +143,14 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                     // _kgspInitLibosLoggingStructures (allocates memory for buffers)
                     // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
                     dma_write!(
-                        libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0)
-                    )?;
+                        libos, [0]?, LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0)
+                    );
                     dma_write!(
-                        libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
-                    )?;
-                    dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
-                    dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
+                        libos, [1]?, LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
+                    );
+                    dma_write!(libos, [2]?, LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0));
+                    dma_write!(rmargs, [0]?.inner, fw::GspArgumentsCached::new(cmdq));
+                    dma_write!(libos, [3]?, LibosMemoryRegionInitArgument::new("RMARGS", rmargs));
                 },
             }))
         })
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index c56029f444cb..7f46fa5e9b50 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -157,7 +157,7 @@ pub(crate) fn boot(
 
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
+        dma_write!(wpr_meta, [0]?, GspFwWprMeta::new(&gsp_fw, &fb_layout));
 
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev))?;
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 87dbbd6d1be9..0056bfbf0a44 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -202,9 +202,13 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
 
         let gsp_mem =
             CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle())?)?;
-        dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES))?;
-        dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
+        dma_write!(gsp_mem, [0]?.ptes, PteArray::new(gsp_mem.dma_handle())?);
+        dma_write!(
+            gsp_mem,
+            [0]?.cpuq.tx,
+            MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES)
+        );
+        dma_write!(gsp_mem, [0]?.cpuq.rx, MsgqRxHeader::new());
 
         Ok(Self(gsp_mem))
     }
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 909d56fd5118..07fa4912ea78 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -461,6 +461,19 @@ pub fn size(&self) -> usize {
         self.count * core::mem::size_of::<T>()
     }
 
+    /// Returns the raw pointer to the allocated region in the CPU's virtual address space.
+    #[inline]
+    pub fn as_ptr(&self) -> *const [T] {
+        core::ptr::slice_from_raw_parts(self.cpu_addr.as_ptr(), self.count)
+    }
+
+    /// Returns the raw pointer to the allocated region in the CPU's virtual address space as
+    /// a mutable pointer.
+    #[inline]
+    pub fn as_mut_ptr(&self) -> *mut [T] {
+        core::ptr::slice_from_raw_parts_mut(self.cpu_addr.as_ptr(), self.count)
+    }
+
     /// Returns the base address to the allocated region in the CPU's virtual address space.
     pub fn start_ptr(&self) -> *const T {
         self.cpu_addr.as_ptr()
@@ -581,23 +594,6 @@ pub unsafe fn write(&mut self, src: &[T], offset: usize) -> Result {
         Ok(())
     }
 
-    /// Returns a pointer to an element from the region with bounds checking. `offset` is in
-    /// units of `T`, not the number of bytes.
-    ///
-    /// Public but hidden since it should only be used from [`dma_read`] and [`dma_write`] macros.
-    #[doc(hidden)]
-    pub fn item_from_index(&self, offset: usize) -> Result<*mut T> {
-        if offset >= self.count {
-            return Err(EINVAL);
-        }
-        // SAFETY:
-        // - The pointer is valid due to type invariant on `CoherentAllocation`
-        // and we've just checked that the range and index is within bounds.
-        // - `offset` can't overflow since it is smaller than `self.count` and we've checked
-        // that `self.count` won't overflow early in the constructor.
-        Ok(unsafe { self.cpu_addr.as_ptr().add(offset) })
-    }
-
     /// Reads the value of `field` and ensures that its type is [`FromBytes`].
     ///
     /// # Safety
@@ -670,6 +666,9 @@ unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
 
 /// Reads a field of an item from an allocated region of structs.
 ///
+/// The syntax is of form `kernel::dma_read!(dma, proj)` where `dma` is an expression to an
+/// [`CoherentAllocation`] and `proj` is a [projection specification](kernel::project_pointer!).
+///
 /// # Examples
 ///
 /// ```
@@ -684,36 +683,29 @@ unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
 /// unsafe impl kernel::transmute::AsBytes for MyStruct{};
 ///
 /// # fn test(alloc: &kernel::dma::CoherentAllocation<MyStruct>) -> Result {
-/// let whole = kernel::dma_read!(alloc[2]);
-/// let field = kernel::dma_read!(alloc[1].field);
+/// let whole = kernel::dma_read!(alloc, [2]?);
+/// let field = kernel::dma_read!(alloc, [1]?.field);
 /// # Ok::<(), Error>(()) }
 /// ```
 #[macro_export]
 macro_rules! dma_read {
-    ($dma:expr, $idx: expr, $($field:tt)*) => {{
-        (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-            // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
-            // dereferenced. The compiler also further validates the expression on whether `field`
-            // is a member of `item` when expanded by the macro.
-            unsafe {
-                let ptr_field = ::core::ptr::addr_of!((*item) $($field)*);
-                ::core::result::Result::Ok(
-                    $crate::dma::CoherentAllocation::field_read(&$dma, ptr_field)
-                )
-            }
-        })()
+    ($dma:expr, $($proj:tt)*) => {{
+        let dma = &$dma;
+        let ptr = $crate::project_pointer!(
+            $crate::dma::CoherentAllocation::as_ptr(dma), $($proj)*
+        );
+        // SAFETY: pointer created by projection is within DMA region.
+        unsafe { $crate::dma::CoherentAllocation::field_read(dma, ptr) }
     }};
-    ($dma:ident [ $idx:expr ] $($field:tt)* ) => {
-        $crate::dma_read!($dma, $idx, $($field)*)
-    };
-    ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {
-        $crate::dma_read!($($dma).*, $idx, $($field)*)
-    };
 }
 
 /// Writes to a field of an item from an allocated region of structs.
 ///
+/// The syntax is of form `kernel::dma_write!(dma, proj, val)` where `dma` is an expression to an
+/// [`CoherentAllocation`] and `proj` is a [projection specification](kernel::project_pointer!),
+/// and `val` is the value to be written to the projected location.
+///
+///
 /// # Examples
 ///
 /// ```
@@ -728,37 +720,31 @@ macro_rules! dma_read {
 /// unsafe impl kernel::transmute::AsBytes for MyStruct{};
 ///
 /// # fn test(alloc: &kernel::dma::CoherentAllocation<MyStruct>) -> Result {
-/// kernel::dma_write!(alloc[2].member = 0xf);
-/// kernel::dma_write!(alloc[1] = MyStruct { member: 0xf });
+/// kernel::dma_write!(alloc, [2]?.member, 0xf);
+/// kernel::dma_write!(alloc, [1]?, MyStruct { member: 0xf });
 /// # Ok::<(), Error>(()) }
 /// ```
 #[macro_export]
 macro_rules! dma_write {
-    ($dma:ident [ $idx:expr ] $($field:tt)*) => {{
-        $crate::dma_write!($dma, $idx, $($field)*)
-    }};
-    ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {{
-        $crate::dma_write!($($dma).*, $idx, $($field)*)
+    (@parse [$dma:expr] [$($proj:tt)*] [, $val:expr]) => {{
+        let dma = &$dma;
+        let ptr = $crate::project_pointer!(
+            mut $crate::dma::CoherentAllocation::as_mut_ptr(dma), $($proj)*
+        );
+        let val = $val;
+        // SAFETY: pointer created by projection is within DMA region.
+        unsafe { $crate::dma::CoherentAllocation::field_write(dma, ptr, val) }
     }};
-    ($dma:expr, $idx: expr, = $val:expr) => {
-        (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-            // SAFETY: `item_from_index` ensures that `item` is always a valid item.
-            unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, item, $val) }
-            ::core::result::Result::Ok(())
-        })()
+    (@parse [$dma:expr] [$($proj:tt)*] [.$field:tt $($rest:tt)*]) => {
+        $crate::dma_write!(@parse [$dma] [$($proj)* .$field] [$($rest)*])
+    };
+    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr]? $($rest:tt)*]) => {
+        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]?] [$($rest)*])
+    };
+    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr] $($rest:tt)*]) => {
+        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]] [$($rest)*])
     };
-    ($dma:expr, $idx: expr, $(.$field:ident)* = $val:expr) => {
-        (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-            // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
-            // dereferenced. The compiler also further validates the expression on whether `field`
-            // is a member of `item` when expanded by the macro.
-            unsafe {
-                let ptr_field = ::core::ptr::addr_of_mut!((*item) $(.$field)*);
-                $crate::dma::CoherentAllocation::field_write(&$dma, ptr_field, $val)
-            }
-            ::core::result::Result::Ok(())
-        })()
+    ($dma:expr, $($rest:tt)*) => {
+        $crate::dma_write!(@parse [$dma] [] [$($rest)*])
     };
 }
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 9c45851c876e..ce39b5545097 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -68,7 +68,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
                 CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
 
             for (i, value) in TEST_VALUES.into_iter().enumerate() {
-                kernel::dma_write!(ca[i] = MyStruct::new(value.0, value.1))?;
+                kernel::dma_write!(ca, [i]?, MyStruct::new(value.0, value.1));
             }
 
             let size = 4 * page::PAGE_SIZE;
@@ -85,24 +85,26 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
     }
 }
 
+impl DmaSampleDriver {
+    fn check_dma(&self) -> Result {
+        for (i, value) in TEST_VALUES.into_iter().enumerate() {
+            let val0 = kernel::dma_read!(self.ca, [i]?.h);
+            let val1 = kernel::dma_read!(self.ca, [i]?.b);
+
+            assert_eq!(val0, value.0);
+            assert_eq!(val1, value.1);
+        }
+
+        Ok(())
+    }
+}
+
 #[pinned_drop]
 impl PinnedDrop for DmaSampleDriver {
     fn drop(self: Pin<&mut Self>) {
         dev_info!(self.pdev, "Unload DMA test driver.\n");
 
-        for (i, value) in TEST_VALUES.into_iter().enumerate() {
-            let val0 = kernel::dma_read!(self.ca[i].h);
-            let val1 = kernel::dma_read!(self.ca[i].b);
-            assert!(val0.is_ok());
-            assert!(val1.is_ok());
-
-            if let Ok(val0) = val0 {
-                assert_eq!(val0, value.0);
-            }
-            if let Ok(val1) = val1 {
-                assert_eq!(val1, value.1);
-            }
-        }
+        assert!(self.check_dma().is_ok());
 
         for (i, entry) in self.sgt.iter().enumerate() {
             dev_info!(
-- 
2.51.2

