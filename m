Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F8ED3943A
	for <nouveau@archiver.kernel.org>; Thu,  2 Apr 2026 15:25:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7792A10F2CA;
	Thu,  2 Apr 2026 15:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dT7bUylh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C327145528;
	Thu,  2 Apr 2026 15:14:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775142856;
 b=Ar42WjZcSLYgUHENR2GzRZEu0rXXDIWM57A4fZi36bj1+hgBX6PUvk9FBetLWBUOIhmvJ
 kHou6GJVBLVSp59nTS5TE+PZPMZr4Wo3EB+zmwUISFuF2EVHZUqJ8Yk1YLhKnivXCtdAhQs
 /1N3TnWKpez5hJl11Ony9BsYy/Vfmq+/lsx9aCdSeFHbL/UExlZl9qUJBcAqkk1ZAvCxXiy
 iqmNHGYauvq+sskMhsi0E44nvB/hOq4mr544OdCeZvkz3ezQim3NTZTDrg22ApIjrMIqlXb
 o1Rgv1IVdDTnwyAE/fSxfSnp3stXekkOGXbBE6id/IMHNdSPN1f8LzrC7EJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775142856; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jsZqXMOA6+08+1e/1wfJ3sIL2/JkhHAN1KgfUmJrvNo=;
 b=l1Bx8xT+FzlMAKAiMe5+CLtnCtW1yiK5WURTY6b3dze1nhUBbhU7mT4aOHgnbP/GiVGe0
 5w+n8ntuTcUtYUR/3kyoIhJyFHVhCLWH4kofuxNInku5SyaCqx8nDBLn8Q+km0NiNRsg+Gd
 Il4XLVNLo7C2/bPPq6itE3Ez+8VnB5k+hyH+jefTvtaE7szRp05N0o5p60xY4MAOo5P+uq5
 H+OfPmphfQOSg5a2fdSs009cjWbivupSR/Jm3o8F/FvG1sMwh1eOtGeiEKMJ+mmqrv9ok2X
 e5mp45I/hYs0xJl1gJIB9ddKZV1PmjfjWqSK7IZhve0jfbSf0npK/VJDjtgQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 908D744FE2
	for <nouveau@lists.freedesktop.org>; Thu,  2 Apr 2026 15:14:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C2E1B10F2BB
	for <nouveau@lists.freedesktop.org>; Thu,  2 Apr 2026 15:25:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46CB660121;
	Thu,  2 Apr 2026 15:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64591C2BC9E;
	Thu,  2 Apr 2026 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775143535;
	bh=66uKRPN7TVakVzjWrjwY/JAdlsLoFP/ckXmV7Ra6ork=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=dT7bUylhcLGIhM0cbOLbGLRV8WWLhBG1Ar1m29AbnL6B+dCXpAeh6ozZZ99KhHU1Q
	 uuw6vC6DfppBVs8KZ50/VjuREnYlS51X/brvUBc/GWHLETsJQQNIY6n0H1Z56df6bk
	 3cvw9BTVEGe8h9B/ofqM70svhn1f3SCT1ySHQ7gA2Q66ejQDrk+KBeAk9mYmibbS56
	 ePrEp2egISOrZ3ow5V5e8IVP9JViwnHKg9SZfmUzXt1PvFwcSBN/pVQv0++HhqtD80
	 +sMc/4isBdYqxL1ZISpX9duGpNtzc6/rsUqov12j6pmFzacQOdunhXXYownnoNP5Cw
	 RmYsJ9QcbRgHA==
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
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/3] rust: sync: generic memory barriers
Date: Thu,  2 Apr 2026 16:24:35 +0100
Message-ID: <20260402152443.1059634-4-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260402152443.1059634-2-gary@kernel.org>
References: <20260402152443.1059634-2-gary@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BZTFNQ5YUOW3MW7VLMKRP3XSDAUHL2XS
X-Message-ID-Hash: BZTFNQ5YUOW3MW7VLMKRP3XSDAUHL2XS
X-MailFrom: gary@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alan Stern <stern@rowland.harvard.edu>,
 Andrea Parri <parri.andrea@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>,
 Luc Maranget <luc.maranget@inria.fr>,
 "Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>,
 Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 lkmm@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Gary Guo <gary@garyguo.net>
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BZTFNQ5YUOW3MW7VLMKRP3XSDAUHL2XS/>
Archived-At: 
 <https://lore.freedesktop.org/20260402152443.1059634-4-gary@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Gary Guo <gary@garyguo.net>

Implement a generic interface for memory barriers (full system/DMA/SMP).
The interface uses a parameter to force user to specify their intent with
barriers.

It provides `Read`, `Write`, `Full` orderings which map to the existing
`rmb()`, `wmb()` and `mb()`, but also `Acquire` and `Release` which is
documented to have `LOAD->{LOAD,STORE}` ordering and `{LOAD,STORE}->WRITE`
ordering, although for now they're still mapped to a full `mb()`. But in
the future it could be mapped to a more efficient form depending on the
architecture. I included them as many users do not need the STORE->LOAD
ordering, and having them use `Acquire`/`Release` is more clear on their
intent in what reordering is to be prevented.

Generic is used here instead of providing individual standalone functions
to reduce code duplication. For example, the `Acquire` -> `Full` upgrade
here is uniformly implemented for all three types. The `CONFIG_SMP` check
in `smp_mb` is uniformly implemented for all SMP barriers. This could
extend to `virt_mb`'s if they're introduced in the future.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/sync/atomic/ordering.rs |   2 +-
 rust/kernel/sync/barrier.rs         | 194 ++++++++++++++++++++++++----
 2 files changed, 168 insertions(+), 28 deletions(-)

diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
index 3f103aa8db99..c4e732e7212f 100644
--- a/rust/kernel/sync/atomic/ordering.rs
+++ b/rust/kernel/sync/atomic/ordering.rs
@@ -15,7 +15,7 @@
 //!   - It provides ordering between the annotated operation and all the following memory accesses.
 //!   - It provides ordering between all the preceding memory accesses and all the following memory
 //!     accesses.
-//!   - All the orderings are the same strength as a full memory barrier (i.e. `smp_mb()`).
+//!   - All the orderings are the same strength as a full memory barrier (i.e. `smp_mb(Full)`).
 //! - [`Relaxed`] provides no ordering except the dependency orderings. Dependency orderings are
 //!   described in "DEPENDENCY RELATIONS" in [`LKMM`]'s [`explanation`].
 //!
diff --git a/rust/kernel/sync/barrier.rs b/rust/kernel/sync/barrier.rs
index 8f2d435fcd94..0331bb353a76 100644
--- a/rust/kernel/sync/barrier.rs
+++ b/rust/kernel/sync/barrier.rs
@@ -7,6 +7,23 @@
 //!
 //! [`LKMM`]: srctree/tools/memory-model/
 
+#![expect(private_bounds, reason = "sealed implementation")]
+
+pub use super::atomic::ordering::{
+    Acquire,
+    Full,
+    Release, //
+};
+
+/// The annotation type for read operations.
+pub struct Read;
+
+/// The annotation type for write operations.
+pub struct Write;
+
+struct Smp;
+struct Dma;
+
 /// A compiler barrier.
 ///
 /// A barrier that prevents compiler from reordering memory accesses across the barrier.
@@ -19,43 +36,166 @@ pub(crate) fn barrier() {
     unsafe { core::arch::asm!("") };
 }
 
-/// A full memory barrier.
-///
-/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
-#[inline(always)]
-pub fn smp_mb() {
-    if cfg!(CONFIG_SMP) {
-        // SAFETY: `smp_mb()` is safe to call.
-        unsafe { bindings::smp_mb() };
-    } else {
-        barrier();
+trait MemoryBarrier<Flavour = ()> {
+    fn run();
+}
+
+// Currently kernel only support `rmb`, `wmb` and full `mb`.
+// Upgrade `Acquire`/`Release` barriers to full barriers.
+
+impl<F> MemoryBarrier<F> for Acquire
+where
+    Full: MemoryBarrier<F>,
+{
+    #[inline]
+    fn run() {
+        Full::run();
     }
 }
 
-/// A write-write memory barrier.
-///
-/// A barrier that prevents compiler and CPU from reordering memory write accesses across the
-/// barrier.
-#[inline(always)]
-pub fn smp_wmb() {
-    if cfg!(CONFIG_SMP) {
+impl<F> MemoryBarrier<F> for Release
+where
+    Full: MemoryBarrier<F>,
+{
+    #[inline]
+    fn run() {
+        Full::run();
+    }
+}
+
+// Specific barrier implementations.
+
+impl MemoryBarrier for Read {
+    #[inline]
+    fn run() {
+        // SAFETY: `rmb()` is safe to call.
+        unsafe { bindings::rmb() };
+    }
+}
+
+impl MemoryBarrier for Write {
+    #[inline]
+    fn run() {
+        // SAFETY: `wmb()` is safe to call.
+        unsafe { bindings::wmb() };
+    }
+}
+
+impl MemoryBarrier for Full {
+    #[inline]
+    fn run() {
+        // SAFETY: `mb()` is safe to call.
+        unsafe { bindings::mb() };
+    }
+}
+
+impl MemoryBarrier<Dma> for Read {
+    #[inline]
+    fn run() {
+        // SAFETY: `dma_rmb()` is safe to call.
+        unsafe { bindings::dma_rmb() };
+    }
+}
+
+impl MemoryBarrier<Dma> for Write {
+    #[inline]
+    fn run() {
+        // SAFETY: `dma_wmb()` is safe to call.
+        unsafe { bindings::dma_wmb() };
+    }
+}
+
+impl MemoryBarrier<Dma> for Full {
+    #[inline]
+    fn run() {
+        // SAFETY: `dma_mb()` is safe to call.
+        unsafe { bindings::dma_mb() };
+    }
+}
+
+impl MemoryBarrier<Smp> for Read {
+    #[inline]
+    fn run() {
+        // SAFETY: `smp_rmb()` is safe to call.
+        unsafe { bindings::smp_rmb() };
+    }
+}
+
+impl MemoryBarrier<Smp> for Write {
+    #[inline]
+    fn run() {
         // SAFETY: `smp_wmb()` is safe to call.
         unsafe { bindings::smp_wmb() };
-    } else {
-        barrier();
     }
 }
 
-/// A read-read memory barrier.
+impl MemoryBarrier<Smp> for Full {
+    #[inline]
+    fn run() {
+        // SAFETY: `smp_mb()` is safe to call.
+        unsafe { bindings::smp_mb() };
+    }
+}
+
+/// Memory barrier.
 ///
-/// A barrier that prevents compiler and CPU from reordering memory read accesses across the
-/// barrier.
-#[inline(always)]
-pub fn smp_rmb() {
+/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
+///
+/// The specific forms of reordering can be specified using the parameter.
+/// - `mb(Read)` provides a read-read barrier.
+/// - `mb(Write)` provides a write-write barrier.
+/// - `mb(Full)` provides a full barrier.
+/// - `mb(Acquire)` prevents preceding read from being ordered against succeeding memory
+///    operations.
+/// - `mb(Release)` prevents preceding memory operations from being ordered against succeeding
+///    writes.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::sync::barrier::*;
+/// mb(Read);
+/// mb(Write);
+/// mb(Acquire);
+/// mb(Release);
+/// mb(Full);
+/// ```
+#[inline]
+#[doc(alias = "rmb")]
+#[doc(alias = "wmb")]
+pub fn mb<T: MemoryBarrier>(_: T) {
+    T::run()
+}
+
+/// Memory barrier between CPUs.
+///
+/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
+/// Does not prevent re-ordering with respect to other bus-mastering devices.
+///
+/// Prefer using `Acquire` [loads](super::atomic::Atomic::load) to `Acquire` barriers, and `Release`
+/// [stores](super::atomic::Atomic::store) to `Release` barriers.
+///
+/// See [`mb`] for usage.
+#[inline]
+#[doc(alias = "smp_rmb")]
+#[doc(alias = "smp_wmb")]
+pub fn smp_mb<T: MemoryBarrier<Smp>>(_: T) {
     if cfg!(CONFIG_SMP) {
-        // SAFETY: `smp_rmb()` is safe to call.
-        unsafe { bindings::smp_rmb() };
+        T::run()
     } else {
-        barrier();
+        barrier()
     }
 }
+
+/// Memory barrier between local CPU and bus-mastering devices.
+///
+/// A barrier that prevents compiler and CPU from reordering memory accesses across the barrier.
+/// Does not prevent re-ordering with respect to other CPUs.
+///
+/// See [`mb`] for usage.
+#[inline]
+#[doc(alias = "dma_rmb")]
+#[doc(alias = "dma_wmb")]
+pub fn dma_mb<T: MemoryBarrier<Dma>>(_: T) {
+    T::run()
+}
-- 
2.51.2

