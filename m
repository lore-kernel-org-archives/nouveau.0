Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A93FCA19E
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 22:54:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 893BE10E5EB;
	Mon,  9 Mar 2026 22:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QrFe7FnZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6626C44FE1;
	Mon,  9 Mar 2026 22:43:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773096225;
 b=xIN5nC2BY0R03eZYSgm4waue8P9bYEHbPoFKBLvNXMen8UWUV5Qp6BXmCyve7zRfHDTNx
 5AfkfYJiQ5rtCfoh5PtbAw1bO/5B6CySbSJfqMhYMn9Ae4uxqk4i9EeGk3Nobb3d+ZbOk8I
 f+wOzUuk5c2vd5xwhA14dP6wvaUiJaGgRTU4W9mP1wjtM1e4NtG1Qv8qunQwxwN7hsq/+9o
 BNCNtogMgY+dNEdZngmo6DpbRlK1hw4JX/VIXN5L4Hgvg+QRrbZOcvYZ1/kwF9UKX0JcMv9
 F+9vQBEdXIbGUmHns4sUPAkwfJpF7F71QczLnREpwNBh/2nPU4rwobqIMbeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773096225; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GKRJ1SRfG0hoeR4GC3J/KRmXh9aRDUErvhtgeEZZTZo=;
 b=AF9Cm/cyV1PVdi3dq2IyiZFemiPO54+6QyDEanJeVUd5z/3pBCBRooFdj48w+BQUGlvgr
 BiWJp01sstqnePztpZCuJD2wW117G8VkMOTh1a0IgORxYlMemiOGOf2eHjl3iqLJoIeUDnn
 e/F4ZPYeMOfUmhRy2skQSaHjpAiDC11i6ToKynfudzlJ66qAtGgr2sHEZ6eqe3uDWuxZHar
 OaDCIYg1HKIC+H+t5vasVkcm6yxlK+roVZB9B2AIw2UogICIqNTEamuV8n4ZWQ7LUFcy/WH
 5sF/hKwjCgE30HAyv/wlaA1HDz/nTbvDTl7QY0dsCEqEVXptBmNjaSII+a4Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C4E0444FA1
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 22:43:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B3EF610E5E2;
	Mon,  9 Mar 2026 22:54:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 480294367B;
	Mon,  9 Mar 2026 22:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50469C4CEF7;
	Mon,  9 Mar 2026 22:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773096854;
	bh=CM+b09gantZoiEoPoLZ9ClvloNmdrwoMovABA/Vy84I=;
	h=From:To:Cc:Subject:Date:From;
	b=QrFe7FnZnPBFJA4RWGrT9BW0S/+Bx6F3E6Qj/A50DRYRfWqkSqNUEVyHJVHnxIaHW
	 i7nffCVtopE+zFsoRRksM9NSL7D8hh9KpbcLh/oiMc82+tQ+DfIi9y/msuF6ivZVvE
	 a4CdjrkECCUfSkx6sGZT8mB81RY/EXu/TumZCvut2vYGezEuJIdfpL+Mf3v87k7iJA
	 iEPmTrdlgXJAgyju8CgGqI0s84oLcK8h27J3JkVcOkENz2B5xodSIeHVV30pe1WJfa
	 OwFtoZxdb0YDzfEzNNylLeX7cDYNNaFg2UnzuISR39T3QLJhDwvrPVB9ZOkPT/U8x/
	 cJDhpigdaGLUg==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	aliceryhl@google.com
Subject: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer accessors
Date: Mon,  9 Mar 2026 23:53:24 +0100
Message-ID: <20260309225408.27714-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XTUOC655TIOIAIUEKD5LSO4QZTAENDZO
X-Message-ID-Hash: XTUOC655TIOIAIUEKD5LSO4QZTAENDZO
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XTUOC655TIOIAIUEKD5LSO4QZTAENDZO/>
Archived-At: 
 <https://lore.freedesktop.org/20260309225408.27714-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The DmaGspMem pointer accessor methods (gsp_write_ptr, gsp_read_ptr,
cpu_read_ptr, cpu_write_ptr, advance_cpu_read_ptr,
advance_cpu_write_ptr) dereference a raw pointer to DMA memory, creating
an intermediate reference before calling volatile read/write methods.

This is undefined behavior since DMA memory can be concurrently modified
by the device.

Fix this by moving the implementations into a gsp_mem module in fw.rs
that uses the dma_read!() / dma_write!() macros, making the original
methods on DmaGspMem thin forwarding wrappers.

An alternative approach would have been to wrap the shared memory in
Opaque, but that would have required even more unsafe code.

Since the gsp_mem module lives in fw.rs (to access firmware-specific
binding field names), GspMem, Msgq, DmaGspMem and their relevant fields
are temporarily widened to pub(in crate::gsp). This will be reverted
once IoView projections are available.

Cc: Gary Guo <gary@garyguo.net>
Closes: https://lore.kernel.org/nouveau/DGUT14ILG35P.1UMNRKU93JUM1@kernel.org/
Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings and handling")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gsp/cmdq.rs |  71 +++++----------------
 drivers/gpu/nova-core/gsp/fw.rs   | 101 ++++++++++++++++++++----------
 2 files changed, 84 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index ae54708c38eb..00a4062a47dc 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -2,11 +2,7 @@
 
 use core::{
     cmp,
-    mem,
-    sync::atomic::{
-        fence,
-        Ordering, //
-    }, //
+    mem, //
 };
 
 use kernel::{
@@ -146,30 +142,32 @@ struct MsgqData {
 #[repr(C)]
 // There is no struct defined for this in the open-gpu-kernel-source headers.
 // Instead it is defined by code in `GspMsgQueuesInit()`.
-struct Msgq {
+// TODO: Revert to private once `IoView` projections replace the `gsp_mem` module.
+pub(in crate::gsp) struct Msgq {
     /// Header for sending messages, including the write pointer.
-    tx: MsgqTxHeader,
+    pub(in crate::gsp) tx: MsgqTxHeader,
     /// Header for receiving messages, including the read pointer.
-    rx: MsgqRxHeader,
+    pub(in crate::gsp) rx: MsgqRxHeader,
     /// The message queue proper.
     msgq: MsgqData,
 }
 
 /// Structure shared between the driver and the GSP and containing the command and message queues.
 #[repr(C)]
-struct GspMem {
+// TODO: Revert to private once `IoView` projections replace the `gsp_mem` module.
+pub(in crate::gsp) struct GspMem {
     /// Self-mapping page table entries.
     ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
     /// CPU queue: the driver writes commands here, and the GSP reads them. It also contains the
     /// write and read pointers that the CPU updates.
     ///
     /// This member is read-only for the GSP.
-    cpuq: Msgq,
+    pub(in crate::gsp) cpuq: Msgq,
     /// GSP queue: the GSP writes messages here, and the driver reads them. It also contains the
     /// write and read pointers that the GSP updates.
     ///
     /// This member is read-only for the driver.
-    gspq: Msgq,
+    pub(in crate::gsp) gspq: Msgq,
 }
 
 // SAFETY: These structs don't meet the no-padding requirements of AsBytes but
@@ -321,12 +319,7 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
     //
     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
     fn gsp_write_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
-
-        // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
-        (unsafe { (*gsp_mem).gspq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+        super::fw::gsp_mem::gsp_write_ptr(&self.0)
     }
 
     // Returns the index of the memory page the GSP will read the next command from.
@@ -335,12 +328,7 @@ fn gsp_write_ptr(&self) -> u32 {
     //
     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
     fn gsp_read_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
-
-        // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
-        (unsafe { (*gsp_mem).gspq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+        super::fw::gsp_mem::gsp_read_ptr(&self.0)
     }
 
     // Returns the index of the memory page the CPU can read the next message from.
@@ -349,27 +337,12 @@ fn gsp_read_ptr(&self) -> u32 {
     //
     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
     fn cpu_read_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
-
-        // SAFETY:
-        //  - The ['CoherentAllocation'] contains at least one object.
-        //  - By the invariants of CoherentAllocation the pointer is valid.
-        (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+        super::fw::gsp_mem::cpu_read_ptr(&self.0)
     }
 
     // Informs the GSP that it can send `elem_count` new pages into the message queue.
     fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
-        let rptr = self.cpu_read_ptr().wrapping_add(elem_count) % MSGQ_NUM_PAGES;
-
-        // Ensure read pointer is properly ordered.
-        fence(Ordering::SeqCst);
-
-        let gsp_mem = self.0.start_ptr_mut();
-
-        // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
-        unsafe { (*gsp_mem).cpuq.rx.set_read_ptr(rptr) };
+        super::fw::gsp_mem::advance_cpu_read_ptr(&self.0, elem_count)
     }
 
     // Returns the index of the memory page the CPU can write the next command to.
@@ -378,26 +351,12 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
     //
     // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
     fn cpu_write_ptr(&self) -> u32 {
-        let gsp_mem = self.0.start_ptr();
-
-        // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
-        (unsafe { (*gsp_mem).cpuq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+        super::fw::gsp_mem::cpu_write_ptr(&self.0)
     }
 
     // Informs the GSP that it can process `elem_count` new pages from the command queue.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
-        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) & MSGQ_NUM_PAGES;
-        let gsp_mem = self.0.start_ptr_mut();
-
-        // SAFETY:
-        //  - The 'CoherentAllocation' contains at least one object.
-        //  - By the invariants of `CoherentAllocation` the pointer is valid.
-        unsafe { (*gsp_mem).cpuq.tx.set_write_ptr(wptr) };
-
-        // Ensure all command data is visible before triggering the GSP read.
-        fence(Ordering::SeqCst);
+        super::fw::gsp_mem::advance_cpu_write_ptr(&self.0, elem_count)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 83ff91614e36..ca03d497246d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -40,6 +40,75 @@
     },
 };
 
+// TODO: Replace with `IoView` projections once available; the `unwrap()` calls go away once we
+// switch to the new `dma::Coherent` API.
+pub(in crate::gsp) mod gsp_mem {
+    use core::sync::atomic::{
+        fence,
+        Ordering, //
+    };
+
+    use kernel::{
+        dma::CoherentAllocation,
+        dma_read,
+        dma_write,
+        prelude::*, //
+    };
+
+    use crate::gsp::cmdq::{
+        GspMem,
+        MSGQ_NUM_PAGES, //
+    };
+
+    pub(in crate::gsp) fn gsp_write_ptr(qs: &CoherentAllocation<GspMem>) -> u32 {
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.tx.0.writePtr) % MSGQ_NUM_PAGES) }().unwrap()
+    }
+
+    pub(in crate::gsp) fn gsp_read_ptr(qs: &CoherentAllocation<GspMem>) -> u32 {
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result<u32> { Ok(dma_read!(qs, [0]?.gspq.rx.0.readPtr) % MSGQ_NUM_PAGES) }().unwrap()
+    }
+
+    pub(in crate::gsp) fn cpu_read_ptr(qs: &CoherentAllocation<GspMem>) -> u32 {
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result<u32> { Ok(dma_read!(qs, [0]?.cpuq.rx.0.readPtr) % MSGQ_NUM_PAGES) }().unwrap()
+    }
+
+    pub(in crate::gsp) fn advance_cpu_read_ptr(qs: &CoherentAllocation<GspMem>, count: u32) {
+        let rptr = cpu_read_ptr(qs).wrapping_add(count) % MSGQ_NUM_PAGES;
+
+        // Ensure read pointer is properly ordered.
+        fence(Ordering::SeqCst);
+
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result {
+            dma_write!(qs, [0]?.cpuq.rx.0.readPtr, rptr);
+            Ok(())
+        }()
+        .unwrap()
+    }
+
+    pub(in crate::gsp) fn cpu_write_ptr(qs: &CoherentAllocation<GspMem>) -> u32 {
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result<u32> { Ok(dma_read!(qs, [0]?.cpuq.tx.0.writePtr) % MSGQ_NUM_PAGES) }().unwrap()
+    }
+
+    pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &CoherentAllocation<GspMem>, count: u32) {
+        let wptr = cpu_write_ptr(qs).wrapping_add(count) & MSGQ_NUM_PAGES;
+
+        // PANIC: A `dma::CoherentAllocation` always contains at least one element.
+        || -> Result {
+            dma_write!(qs, [0]?.cpuq.tx.0.writePtr, wptr);
+            Ok(())
+        }()
+        .unwrap();
+
+        // Ensure all command data is visible before triggering the GSP read.
+        fence(Ordering::SeqCst);
+    }
+}
+
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
 
@@ -708,22 +777,6 @@ pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32, msg_count: u32) -> Self {
             entryOff: num::usize_into_u32::<GSP_PAGE_SIZE>(),
         })
     }
-
-    /// Returns the value of the write pointer for this queue.
-    pub(crate) fn write_ptr(&self) -> u32 {
-        let ptr = core::ptr::from_ref(&self.0.writePtr);
-
-        // SAFETY: `ptr` is a valid pointer to a `u32`.
-        unsafe { ptr.read_volatile() }
-    }
-
-    /// Sets the value of the write pointer for this queue.
-    pub(crate) fn set_write_ptr(&mut self, val: u32) {
-        let ptr = core::ptr::from_mut(&mut self.0.writePtr);
-
-        // SAFETY: `ptr` is a valid pointer to a `u32`.
-        unsafe { ptr.write_volatile(val) }
-    }
 }
 
 // SAFETY: Padding is explicit and does not contain uninitialized data.
@@ -739,22 +792,6 @@ impl MsgqRxHeader {
     pub(crate) fn new() -> Self {
         Self(Default::default())
     }
-
-    /// Returns the value of the read pointer for this queue.
-    pub(crate) fn read_ptr(&self) -> u32 {
-        let ptr = core::ptr::from_ref(&self.0.readPtr);
-
-        // SAFETY: `ptr` is a valid pointer to a `u32`.
-        unsafe { ptr.read_volatile() }
-    }
-
-    /// Sets the value of the read pointer for this queue.
-    pub(crate) fn set_read_ptr(&mut self, val: u32) {
-        let ptr = core::ptr::from_mut(&mut self.0.readPtr);
-
-        // SAFETY: `ptr` is a valid pointer to a `u32`.
-        unsafe { ptr.write_volatile(val) }
-    }
 }
 
 // SAFETY: Padding is explicit and does not contain uninitialized data.

base-commit: 4da879a0d3fd170a70994b73baa554c6913918b5
-- 
2.53.0

