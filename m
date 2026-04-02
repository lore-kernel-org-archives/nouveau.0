Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841BACC6B3E
	for <nouveau@archiver.kernel.org>; Thu,  2 Apr 2026 15:25:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 045C910F2C8;
	Thu,  2 Apr 2026 15:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WWFy+j0h";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 523D845528;
	Thu,  2 Apr 2026 15:14:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775142860;
 b=XlBIew4dnEvueE5PGqNG7rXbEGzsChWZc2bhIrlETOGJJB57yvaaMAKzeQCl0HJgQ3nKm
 acWb/NJY4lqgQ/yIf7G52hC3OESah5J8Qr1uPdhqm0RDM8iOAg1lTMnhdkA2T1W9j73xScg
 hX8Gum4GmiqtrsAQrMf7aIrt1j3MVjJvmejPTii6RP7kHJw/WJ9wd1cuKu5mOV6X7ZR7eee
 dHTdJCqsQ8j3so24lPEfDAweQkrIUlk5vdp0+EllvxAgt18bfyLXwM8UT6FiCtRFDEQzSlS
 rHbwHazcrpRVciqBGKRfxBZCvRiA5uGj/GfcyDeY4liW1q2082Y7e+LukoWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775142860; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PSjKvVwbVDDtiCwFIfE4ZTPdZ1Vl8700F3Zw1O4JS1Q=;
 b=ITfFQ3NnkQxbxrU6/PpyVHOoIlwEuc2HFWWMCdFWc+r7ikFXTFuifqreDbTt2/0Immd5S
 0E+dOy0HB8nA6hWzF9eDhqnHIQ9sHZsLoP40nc9G5/1biRbO5sJzMM0gK1Z/YjipIh7JnzV
 bpOx7LH14j3OkV8wfCxISI7xcnRndJGNfqr0exjYxkz1hNDEyvw8Ymu5zJyxXsxN99mcZ6f
 EG3Q2gjFzAuMnxJ0LWymFLlPj5cGoYofRO/dne94Tkk+SlQ8TC8ZiHQ3AF/8Go2Db9yr1FC
 +ADaxoj3LfO0F8kUU5CLOUyxD+anwIpU7n9hhfjDR4Z8MxluuBQyTffE7Vuw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CD16C45534
	for <nouveau@lists.freedesktop.org>; Thu,  2 Apr 2026 15:14:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 49A7F10F2BD;
	Thu,  2 Apr 2026 15:25:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E73843ABE;
	Thu,  2 Apr 2026 15:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3369C116C6;
	Thu,  2 Apr 2026 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775143541;
	bh=H/ah7c8QblLITP8uZx6rQ0un/4q3xoSn//XPdWvMKg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=WWFy+j0hRa4F4bO2EyJSlQJHcjpjpFFyjoTGDTtQjbjJzxTkfZTuhsSiTyyWfX0O6
	 g8vteUT5Rt/P+nSlO8IOZsb+5RgeXoASrPj02F/QUpNaVWyonQeoCTK9x4dhl1XXbs
	 jfZ5iC7mVVQxOEJ7Oxyyam5pxByJzK8iKhMs07MX/0bItN4OcZZPImdZqt6HGC7kk6
	 k1DslyAQTlkKWRLMW/s0H9WLkaxQtKFuZ2+GXcIanu5Y7IzXiD3HdRl/3lW8+iDFO8
	 eYEYAdmUgrqDX7WspZto8eIeJbVIsour5bzkBTq/QAEZZOebr9ozUc6D3ldNaWNAzo
	 GYbFhHKTSAcFw==
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
Subject: [PATCH 3/3] gpu: nova-core: fix wrong use of barriers in GSP code
Date: Thu,  2 Apr 2026 16:24:36 +0100
Message-ID: <20260402152443.1059634-5-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260402152443.1059634-2-gary@kernel.org>
References: <20260402152443.1059634-2-gary@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7PY6SWQWTKDYV7EBB2TIRSQI7SDST7DB
X-Message-ID-Hash: 7PY6SWQWTKDYV7EBB2TIRSQI7SDST7DB
X-MailFrom: gary@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alan Stern <stern@rowland.harvard.edu>,
 Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>,
 David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>,
 Luc Maranget <luc.maranget@inria.fr>,
 "Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>,
 Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 lkmm@lists.linux.dev, dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Gary Guo <gary@garyguo.net>
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7PY6SWQWTKDYV7EBB2TIRSQI7SDST7DB/>
Archived-At: 
 <https://lore.freedesktop.org/20260402152443.1059634-5-gary@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Gary Guo <gary@garyguo.net>

Currently, in the GSP->CPU messaging path, the current code misses a read
barrier before data read. The barrier after read is updated to a DMA
barrier (with release ordering desired), instead of the existing (Rust)
SeqCst SMP barrier; the location of barrier is also moved to the beginning
of function, because the barrier is needed to synchronizing between data
and ring-buffer pointer, the RMW operation does not internally need a
barrier (nor it has to be atomic, as CPU pointers are updated by CPU only).

In the CPU->GSP messaging path, the current code misses a write barrier
after data write and before updating the CPU write pointer. Barrier is not
needed before data write due to control dependency, this fact is documented
explicitly. This could be replaced with an acquire barrier if needed.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 19 +++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs   | 12 ------------
 2 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 2224896ccc89..7e4315b13984 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -19,6 +19,12 @@
     prelude::*,
     sync::{
         aref::ARef,
+        barrier::{
+            dma_mb,
+            Read,
+            Release,
+            Write, //
+        },
         Mutex, //
     },
     time::Delta,
@@ -258,6 +264,9 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         let tx = self.cpu_write_ptr() as usize;
         let rx = self.gsp_read_ptr() as usize;
 
+        // ORDERING: control dependency provides necessary LOAD->STORE ordering.
+        // `dma_mb(Acquire)` may be used here if we don't want to rely on control dependency.
+
         // SAFETY:
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
@@ -311,6 +320,9 @@ fn driver_write_area_size(&self) -> usize {
         let tx = self.gsp_write_ptr() as usize;
         let rx = self.cpu_read_ptr() as usize;
 
+        // ORDERING: Ensure data load is ordered after load of GSP write pointer.
+        dma_mb(Read);
+
         // SAFETY:
         // - We will only access the driver-owned part of the shared memory.
         // - Per the safety statement of the function, no concurrent access will be performed.
@@ -408,6 +420,10 @@ fn cpu_read_ptr(&self) -> u32 {
 
     // Informs the GSP that it can send `elem_count` new pages into the message queue.
     fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
+        // ORDERING: Ensure read pointer is properly ordered.
+        //
+        dma_mb(Release);
+
         super::fw::gsp_mem::advance_cpu_read_ptr(&self.0, elem_count)
     }
 
@@ -422,6 +438,9 @@ fn cpu_write_ptr(&self) -> u32 {
 
     // Informs the GSP that it can process `elem_count` new pages from the command queue.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
+        // ORDERING: Ensure all command data is visible before updateing ring buffer pointer.
+        dma_mb(Write);
+
         super::fw::gsp_mem::advance_cpu_write_ptr(&self.0, elem_count)
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0c8a74f0e8ac..62c2cf1b030c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -42,11 +42,6 @@
 
 // TODO: Replace with `IoView` projections once available.
 pub(super) mod gsp_mem {
-    use core::sync::atomic::{
-        fence,
-        Ordering, //
-    };
-
     use kernel::{
         dma::Coherent,
         dma_read,
@@ -72,10 +67,6 @@ pub(in crate::gsp) fn cpu_read_ptr(qs: &Coherent<GspMem>) -> u32 {
 
     pub(in crate::gsp) fn advance_cpu_read_ptr(qs: &Coherent<GspMem>, count: u32) {
         let rptr = cpu_read_ptr(qs).wrapping_add(count) % MSGQ_NUM_PAGES;
-
-        // Ensure read pointer is properly ordered.
-        fence(Ordering::SeqCst);
-
         dma_write!(qs, .cpuq.rx.0.readPtr, rptr);
     }
 
@@ -87,9 +78,6 @@ pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &Coherent<GspMem>, count: u32) {
         let wptr = cpu_write_ptr(qs).wrapping_add(count) % MSGQ_NUM_PAGES;
 
         dma_write!(qs, .cpuq.tx.0.writePtr, wptr);
-
-        // Ensure all command data is visible before triggering the GSP read.
-        fence(Ordering::SeqCst);
     }
 }
 
-- 
2.51.2

