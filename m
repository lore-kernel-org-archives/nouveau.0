Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AC8F46139
	for <nouveau@archiver.kernel.org>; Mon, 23 Mar 2026 15:39:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF6410E4A6;
	Mon, 23 Mar 2026 15:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eoKtV26P";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 07B88433D6;
	Mon, 23 Mar 2026 15:27:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774279677;
 b=FjbY/dNtHkjk+4rpuTWi1jW2M5nPna+Yw5HdwM6NlLJY3ooTVCHbSYkm9IVT9TJsvhTeS
 bwFtVDzxrkxDBB9CO5LbUNXE6XyyYZYr6YshD3eT3SA732Xgu2em7mUt8jR23DYH2VjcBsO
 hBh5O3J8tYHXhp+g+xgo2Zm0Op/3SYAnM9PBH7llVbSKhNa5fAFZzIOuSetV9Ny8ZykYdno
 10fdzfASFptP6f2VdklLbgQqliZTedNDoIjzkCbjROejZgkLsfgoDNxxRzJh+aFjMIXAgTm
 mufRR8N3oc5yh3jtbagG29dDlQqZVjU6Vv47AVcP2XeDCft6j0ArtbIr3J1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774279677; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bO1AqGsi2F0jm/TItjVkM6KWJIGR0s/nFbujO6ld7CI=;
 b=L5OECSOWvIgysn78IFJPCSaJd5ddSasHE0tfOMduQeCwsbg+bdPVfLJcSgC2KnbDdwXhp
 638oWmOkhTaBZEvy74NXigr321M2cuRsq5F0PQZSZEPvw976o7dJexkhO4yn058+8/RJtte
 hHMDlAucB+xrfxfd9wFZVtkFKX9U1WdJlL953+O4hCut/3fyw8kRlJFutS5HZhRXVpzzNjJ
 B63MLDQHapxlAyL0k22fpUYaDQYQBX8gQjViQfx7lHzHFM8FO5j3TLy3Ij1rPEyZPTUqfZI
 PqK3e2ZjRSJsI9mFCAHW1+cJ6f7OEVe/VvGPsNadDwow8jbzxqZt/4QyExxQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B9983400CD
	for <nouveau@lists.freedesktop.org>; Mon, 23 Mar 2026 15:27:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2247F10E120;
	Mon, 23 Mar 2026 15:38:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFF00439DD;
	Mon, 23 Mar 2026 15:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B13C2BCB0;
	Mon, 23 Mar 2026 15:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774280337;
	bh=desyfNLHzA6AKyqGMozECHI2OOE4898yTWW5+XlQjCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=eoKtV26P5iM7EBwGI2picY27TfgJL44MFE7+bRDpS08pHpFy2dHp2XSMyUwDbL4HR
	 H8cck8RRVohmPoTo9NuRVL90H3ouRxOb8I/UUHz/3DLSobTGGBo1uazEGw3R586dVg
	 HqXKn4DALNZIlDUna5k5dGWbq0j1cuB0MmCBtawr6WypdPzF7dlMR/UMF6m0nXhDF0
	 QdAtF2RFpGFjRuozR01Ga63YdxkBfvJsb0UfK/lSrqwEjCqeruQdiJGCBk6lFC9WJa
	 p77GZ7oa53N2Omb9p4PPKX3TFjt7h2xO7HPYfciqRD1fRDWQD/QHjTx/d/vuB6lX73
	 WW3EttSopxiwA==
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
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 7/8] gpu: nova-core: use I/O projection for cleaner
 encapsulation
Date: Mon, 23 Mar 2026 15:37:59 +0000
Message-ID: <20260323153807.1360705-8-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260323153807.1360705-1-gary@kernel.org>
References: <20260323153807.1360705-1-gary@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WEQE262I4OIPS7Q4DXPIH6JZH7TIK72Y
X-Message-ID-Hash: WEQE262I4OIPS7Q4DXPIH6JZH7TIK72Y
X-MailFrom: gary@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Gary Guo <gary@garyguo.net>
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WEQE262I4OIPS7Q4DXPIH6JZH7TIK72Y/>
Archived-At: 
 <https://lore.freedesktop.org/20260323153807.1360705-8-gary@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Gary Guo <gary@garyguo.net>

Use `io_project!` for PTE array and message queues to remove the
break off encapsulation.

The remaining `dma_read!` and `dma_write!` is now only acting on
primitives; thus replace by `io_read!` and `io_write!`.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 drivers/gpu/nova-core/gsp.rs      | 42 +++++++++-------
 drivers/gpu/nova-core/gsp/cmdq.rs | 69 ++++++++++++++-----------
 drivers/gpu/nova-core/gsp/fw.rs   | 84 ++++++++++++-------------------
 3 files changed, 96 insertions(+), 99 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a045c4189989..e675b0227872 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -9,8 +9,13 @@
         CoherentBox,
         DmaAddress, //
     },
+    io::{
+        self,
+        io_project, //
+    },
     pci,
     prelude::*,
+    ptr::KnownSize,
     transmute::{
         AsBytes,
         FromBytes, //
@@ -53,12 +58,20 @@ unsafe impl<const NUM_ENTRIES: usize> FromBytes for PteArray<NUM_ENTRIES> {}
 unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
 
 impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
-    /// Returns the page table entry for `index`, for a mapping starting at `start`.
-    // TODO: Replace with `IoView` projection once available.
-    fn entry(start: DmaAddress, index: usize) -> Result<u64> {
-        start
-            .checked_add(num::usize_as_u64(index) << GSP_PAGE_SHIFT)
-            .ok_or(EOVERFLOW)
+    /// Initialize a new page table array mapping `NUM_PAGES` GSP pages starting at address `start`.
+    fn init<T: FromBytes + AsBytes + KnownSize + ?Sized>(
+        view: io::View<'_, Coherent<T>, Self>,
+        start: DmaAddress,
+    ) -> Result<()> {
+        for i in 0..NUM_PAGES {
+            io_project!(view, .0[i]).write_val(
+                start
+                    .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
+                    .ok_or(EOVERFLOW)?,
+            );
+        }
+
+        Ok(())
     }
 }
 
@@ -90,17 +103,12 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         )?);
 
         let start_addr = obj.0.dma_handle();
-
-        // SAFETY: `obj` has just been created and we are its sole user.
-        let pte_region =
-            unsafe { &mut obj.0.as_mut()[size_of::<u64>()..][..NUM_PAGES * size_of::<u64>()] };
-
-        // Write values one by one to avoid an on-stack instance of `PteArray`.
-        for (i, chunk) in pte_region.chunks_exact_mut(size_of::<u64>()).enumerate() {
-            let pte_value = PteArray::<0>::entry(start_addr, i)?;
-
-            chunk.copy_from_slice(&pte_value.to_ne_bytes());
-        }
+        let pte_view = io_project!(
+            obj.0,
+            [size_of::<u64>()..]?[..NUM_PAGES * size_of::<u64>()]?
+        )
+        .try_cast::<PteArray<NUM_PAGES>>()?;
+        PteArray::init(pte_view, start_addr)?;
 
         Ok(obj)
     }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f38790601a0f..191b648e2ede 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -2,16 +2,25 @@
 
 mod continuation;
 
-use core::mem;
+use core::{
+    mem,
+    sync::atomic::{
+        fence,
+        Ordering, //
+    },
+};
 
 use kernel::{
     device,
     dma::{
         Coherent,
+        CoherentBox,
         DmaAddress, //
     },
-    dma_write,
-    io::poll::read_poll_timeout,
+    io::{
+        io_project,
+        poll::read_poll_timeout, //
+    },
     new_mutex,
     prelude::*,
     sync::{
@@ -165,20 +174,18 @@ struct MsgqData {
 #[repr(C)]
 // There is no struct defined for this in the open-gpu-kernel-source headers.
 // Instead it is defined by code in `GspMsgQueuesInit()`.
-// TODO: Revert to private once `IoView` projections replace the `gsp_mem` module.
-pub(super) struct Msgq {
+struct Msgq {
     /// Header for sending messages, including the write pointer.
-    pub(super) tx: MsgqTxHeader,
+    tx: MsgqTxHeader,
     /// Header for receiving messages, including the read pointer.
-    pub(super) rx: MsgqRxHeader,
+    rx: MsgqRxHeader,
     /// The message queue proper.
     msgq: MsgqData,
 }
 
 /// Structure shared between the driver and the GSP and containing the command and message queues.
 #[repr(C)]
-// TODO: Revert to private once `IoView` projections replace the `gsp_mem` module.
-pub(super) struct GspMem {
+struct GspMem {
     /// Self-mapping page table entries.
     ptes: PteArray<{ Self::PTE_ARRAY_SIZE }>,
     /// CPU queue: the driver writes commands here, and the GSP reads them. It also contains the
@@ -186,13 +193,13 @@ pub(super) struct GspMem {
     /// index into the GSP queue.
     ///
     /// This member is read-only for the GSP.
-    pub(super) cpuq: Msgq,
+    cpuq: Msgq,
     /// GSP queue: the GSP writes messages here, and the driver reads them. It also contains the
     /// write and read pointers that the GSP updates. This means that the read pointer here is an
     /// index into the CPU queue.
     ///
     /// This member is read-only for the driver.
-    pub(super) gspq: Msgq,
+    gspq: Msgq,
 }
 
 impl GspMem {
@@ -226,20 +233,13 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         const MSGQ_SIZE: u32 = num::usize_into_u32::<{ size_of::<Msgq>() }>();
         const RX_HDR_OFF: u32 = num::usize_into_u32::<{ mem::offset_of!(Msgq, rx) }>();
 
-        let gsp_mem = Coherent::<GspMem>::zeroed(dev, GFP_KERNEL)?;
+        let mut gsp_mem = CoherentBox::<GspMem>::zeroed(dev, GFP_KERNEL)?;
+        gsp_mem.cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES);
+        gsp_mem.cpuq.rx = MsgqRxHeader::new();
 
+        let gsp_mem: Coherent<_> = gsp_mem.into();
         let start = gsp_mem.dma_handle();
-        // Write values one by one to avoid an on-stack instance of `PteArray`.
-        for i in 0..GspMem::PTE_ARRAY_SIZE {
-            dma_write!(gsp_mem, .ptes.0[i], PteArray::<0>::entry(start, i)?);
-        }
-
-        dma_write!(
-            gsp_mem,
-            .cpuq.tx,
-            MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES)
-        );
-        dma_write!(gsp_mem, .cpuq.rx, MsgqRxHeader::new());
+        PteArray::init(io_project!(gsp_mem, .ptes), start)?;
 
         Ok(Self(gsp_mem))
     }
@@ -380,7 +380,7 @@ fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_write_ptr(&self) -> u32 {
-        super::fw::gsp_mem::gsp_write_ptr(&self.0)
+        MsgqTxHeader::write_ptr(io_project!(self.0, .gspq.tx)) % MSGQ_NUM_PAGES
     }
 
     // Returns the index of the memory page the GSP will read the next command from.
@@ -389,7 +389,7 @@ fn gsp_write_ptr(&self) -> u32 {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn gsp_read_ptr(&self) -> u32 {
-        super::fw::gsp_mem::gsp_read_ptr(&self.0)
+        MsgqRxHeader::read_ptr(io_project!(self.0, .gspq.rx)) % MSGQ_NUM_PAGES
     }
 
     // Returns the index of the memory page the CPU can read the next message from.
@@ -398,12 +398,18 @@ fn gsp_read_ptr(&self) -> u32 {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_read_ptr(&self) -> u32 {
-        super::fw::gsp_mem::cpu_read_ptr(&self.0)
+        MsgqRxHeader::read_ptr(io_project!(self.0, .cpuq.rx)) % MSGQ_NUM_PAGES
     }
 
     // Informs the GSP that it can send `elem_count` new pages into the message queue.
     fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
-        super::fw::gsp_mem::advance_cpu_read_ptr(&self.0, elem_count)
+        let rx = io_project!(self.0, .cpuq.rx);
+        let rptr = MsgqRxHeader::read_ptr(rx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
+
+        // Ensure read pointer is properly ordered.
+        fence(Ordering::SeqCst);
+
+        MsgqRxHeader::set_read_ptr(rx, rptr)
     }
 
     // Returns the index of the memory page the CPU can write the next command to.
@@ -412,12 +418,17 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
     //
     // - The returned value is within `0..MSGQ_NUM_PAGES`.
     fn cpu_write_ptr(&self) -> u32 {
-        super::fw::gsp_mem::cpu_write_ptr(&self.0)
+        MsgqTxHeader::write_ptr(io_project!(self.0, .cpuq.tx)) % MSGQ_NUM_PAGES
     }
 
     // Informs the GSP that it can process `elem_count` new pages from the command queue.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
-        super::fw::gsp_mem::advance_cpu_write_ptr(&self.0, elem_count)
+        let tx = io_project!(self.0, .cpuq.tx);
+        let wptr = MsgqTxHeader::write_ptr(tx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
+        MsgqTxHeader::set_write_ptr(tx, wptr);
+
+        // Ensure all command data is visible before triggering the GSP read.
+        fence(Ordering::SeqCst);
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 847b5eb215d4..fbac382e1969 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -10,6 +10,11 @@
 
 use kernel::{
     dma::Coherent,
+    io::{
+        self,
+        io_read,
+        io_write, //
+    },
     prelude::*,
     ptr::{
         Alignable,
@@ -40,59 +45,6 @@
     },
 };
 
-// TODO: Replace with `IoView` projections once available.
-pub(super) mod gsp_mem {
-    use core::sync::atomic::{
-        fence,
-        Ordering, //
-    };
-
-    use kernel::{
-        dma::Coherent,
-        dma_read,
-        dma_write, //
-    };
-
-    use crate::gsp::cmdq::{
-        GspMem,
-        MSGQ_NUM_PAGES, //
-    };
-
-    pub(in crate::gsp) fn gsp_write_ptr(qs: &Coherent<GspMem>) -> u32 {
-        dma_read!(qs, .gspq.tx.0.writePtr) % MSGQ_NUM_PAGES
-    }
-
-    pub(in crate::gsp) fn gsp_read_ptr(qs: &Coherent<GspMem>) -> u32 {
-        dma_read!(qs, .gspq.rx.0.readPtr) % MSGQ_NUM_PAGES
-    }
-
-    pub(in crate::gsp) fn cpu_read_ptr(qs: &Coherent<GspMem>) -> u32 {
-        dma_read!(qs, .cpuq.rx.0.readPtr) % MSGQ_NUM_PAGES
-    }
-
-    pub(in crate::gsp) fn advance_cpu_read_ptr(qs: &Coherent<GspMem>, count: u32) {
-        let rptr = cpu_read_ptr(qs).wrapping_add(count) % MSGQ_NUM_PAGES;
-
-        // Ensure read pointer is properly ordered.
-        fence(Ordering::SeqCst);
-
-        dma_write!(qs, .cpuq.rx.0.readPtr, rptr);
-    }
-
-    pub(in crate::gsp) fn cpu_write_ptr(qs: &Coherent<GspMem>) -> u32 {
-        dma_read!(qs, .cpuq.tx.0.writePtr) % MSGQ_NUM_PAGES
-    }
-
-    pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &Coherent<GspMem>, count: u32) {
-        let wptr = cpu_write_ptr(qs).wrapping_add(count) % MSGQ_NUM_PAGES;
-
-        dma_write!(qs, .cpuq.tx.0.writePtr, wptr);
-
-        // Ensure all command data is visible before triggering the GSP read.
-        fence(Ordering::SeqCst);
-    }
-}
-
 /// Maximum size of a single GSP message queue element in bytes.
 pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
     num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
@@ -706,6 +658,19 @@ pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32, msg_count: u32) -> Self {
             entryOff: num::usize_into_u32::<GSP_PAGE_SIZE>(),
         })
     }
+
+    /// Returns the value of the write pointer for this queue.
+    pub(crate) fn write_ptr<T: KnownSize + ?Sized>(this: io::View<'_, Coherent<T>, Self>) -> u32 {
+        io_read!(this, .0.writePtr)
+    }
+
+    /// Sets the value of the write pointer for this queue.
+    pub(crate) fn set_write_ptr<T: KnownSize + ?Sized>(
+        this: io::View<'_, Coherent<T>, Self>,
+        val: u32,
+    ) {
+        io_write!(this, .0.writePtr, val)
+    }
 }
 
 // SAFETY: Padding is explicit and does not contain uninitialized data.
@@ -721,6 +686,19 @@ impl MsgqRxHeader {
     pub(crate) fn new() -> Self {
         Self(Default::default())
     }
+
+    /// Returns the value of the read pointer for this queue.
+    pub(crate) fn read_ptr<T: KnownSize + ?Sized>(this: io::View<'_, Coherent<T>, Self>) -> u32 {
+        io_read!(this, .0.readPtr)
+    }
+
+    /// Sets the value of the read pointer for this queue.
+    pub(crate) fn set_read_ptr<T: KnownSize + ?Sized>(
+        this: io::View<'_, Coherent<T>, Self>,
+        val: u32,
+    ) {
+        io_write!(this, .0.readPtr, val)
+    }
 }
 
 // SAFETY: Padding is explicit and does not contain uninitialized data.
-- 
2.51.2

