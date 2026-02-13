Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FB1EF99D0
	for <nouveau@archiver.kernel.org>; Fri, 13 Feb 2026 19:41:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D87210E843;
	Fri, 13 Feb 2026 19:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OfC5wtKz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CE5DB41E84;
	Fri, 13 Feb 2026 19:31:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771011116;
 b=o4s7gAKzYrZ/z+fqh56nrqofXmSn+V77N/KXJzHHs8EXlf3aXHcdLXU/DoIDwb9c00OUH
 c0C8MVR21C3wNXu8NsD5eeJNl5XDtbfgZ7kAg7zq79xA5Ifl9c3KwBI17RDiGsNQGM3XiWy
 H41JzVPduvZ4LyNVYZstq6368bHjNoP9m2B5EK4IhI1l1aSKmnPrZkSQKQMInr3/RcsKSCD
 eX5ygXIFUdQ2XShW2UoFJgTmZk5wrUrce2140AyouBi5eRBqhzjTMXK6LHCJ2wE2r4T188k
 muQ6HBO2Emhjtc0CoJR1vfm5oXJFH/uPmcQ93/ye2WXKFTRjZa94/VbcIbiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771011116; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JTuZVdyTXLpk6gMwzk15mWnbWjpsaEZl+pvStoMa2Yw=;
 b=JB9qdsdTui/v5XfLcdY1/VOJ7Fj7YxeYaG+biCk4vXF8powCd4KehOrw9eNX5M8uZPxzA
 M1H6oZ3Hu62DXUAoSq+99lyEUJ/OHlmsw4JOtrYdeDPAXqPqCc4Uz7OGvoSO08ypGZ91O3Q
 N5jP8blPb+RmPakJHydXryOphjcL/2v/PhCwq+dT5nKiEe6ElWMaLref9M+k9VoF6nBH3/b
 A/ycGlkSdSUMsaG4oEX1r5rm6KRZcEweAOz9JXLHcks/p7lmekLU3aeMvJK92krDeFMh5iX
 XIAjqpiHqTPpJbtszTydH2fHShd8D2YDFzG0Y9qUAG9b+oyvGvlc6HM1mCJQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7BE2140686
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 19:31:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 941B510E10D;
	Fri, 13 Feb 2026 19:41:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F98961337;
	Fri, 13 Feb 2026 19:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 284E1C19424;
	Fri, 13 Feb 2026 19:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771011690;
	bh=npawl3Sh8CB9l+1ZY62uo+ipDHKFXtD/V7TZlj5J+kE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=OfC5wtKzDjjRTMyYDLfYtHcRXqV6U0vmPI2AWkLm7EB7Z/T1v0l2abeRgzhIjaq58
	 Z6mXUTghHGpMEJjGZqbxnUxJF/dISX+OblcR09PaWXsct7GP+lZ/WGhM61zFVZyZvJ
	 ezgUSifRI4TocQxH7uuzPA29NB6qSsXL9rjlOscWyTxleT5wdzhWwW3O5otlF5rb9J
	 2YKoA3hcYhfFQdQo+4Bm0KBsyTKSD2wNZYHFxA9+XYiVpAe156iAJxrwUb8AvWdFWx
	 c4/XK2w6SNRQtN0F3WrKjQ3Wh9Vj3BkIafCdUHHajvPr+aXIG8LGqNTYuBj87TzIiK
	 BIkMyutGBksBA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4CEEF99D7;
	Fri, 13 Feb 2026 19:41:30 +0000 (UTC)
From: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>
Date: Fri, 13 Feb 2026 14:40:13 -0500
Subject: [PATCH v2] gpu: nova-core: fix stack overflow in GSP memory
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ7CIBCF4as0s3YMjFrFlfcwXRQZLYtCM2BT0
 3B3sXuX/0vet0Ji8Zzg2qwgPPvkY6hBuwYeQx9ejN7VBlLUKtKETkaUd8oYeMlo2RrqmY07n6B
 +JuGnXzbv3tUefMpRPhs/69/6T5o1ajwqczAXq4lbfZsk5hj2I0NXSvkCJpNJDqoAAAA=
X-Change-ID: 20260212-drm-rust-next-beb92aee9d75
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771011689; l=6183;
 i=tim.kovalenko@proton.me; s=20260212; h=from:subject:message-id;
 bh=TbEzlnu4V85B1wrxC0sGqgddAbgVIVV2UDPzTnjjCng=;
 b=1765X0vwFeNKmn7aEyMFKc6c5HTP2IxuQE8XcwSTcwhN9KrHAJ9dpgfoy/Ysb4YaVm3UM3IJh
 JbUXKzKcDEtDsz7mFSr+uHD5WK5p5zrFsDtx/d7Af6EsHRCj0EHcXNO
X-Developer-Key: i=tim.kovalenko@proton.me; a=ed25519;
 pk=/+OiulEpgeZifgP4mDE4e5YlV6nMeY+frze/lY/xiHI=
X-Endpoint-Received: by B4 Relay for tim.kovalenko@proton.me/20260212 with
 auth_id=635
X-Original-From: Tim Kovalenko <tim.kovalenko@proton.me>
Message-ID-Hash: YF5ZYAYJVQIDI2Z5NRV5QRQURDT4OMLB
X-Message-ID-Hash: YF5ZYAYJVQIDI2Z5NRV5QRQURDT4OMLB
X-MailFrom: devnull+tim.kovalenko.proton.me@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Tim Kovalenko <tim.kovalenko@proton.me>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: tim.kovalenko@proton.me
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YF5ZYAYJVQIDI2Z5NRV5QRQURDT4OMLB/>
Archived-At: 
 <https://lore.freedesktop.org/20260213-drm-rust-next-v2-1-aa094f78721a@proton.me/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Tim Kovalenko <tim.kovalenko@proton.me>

The `Cmdq::new` function was allocating a `PteArray` struct on the stack
and was causing a stack overflow with 8216 bytes.

Remove the `PteArray` and instead calculate and write the Page Table
Entries directly into the coherent DMA buffer one-by-one. This reduces
the stack usage quite a lot.

Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>
---
Changes in v2:
- Missed a code formatting issue.
- Link to v1: https://lore.kernel.org/r/20260212-drm-rust-next-v1-1-409398b12e61@proton.me
---
 drivers/gpu/nova-core/gsp.rs      | 50 ++++++++++++++-------------------------
 drivers/gpu/nova-core/gsp/cmdq.rs | 27 ++++++++++++++++++---
 2 files changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b9269cf35286dec3acc4d60918904..316eeaf87ec5ae67422a34426eefa747c9b6502b 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,16 +2,14 @@
 
 mod boot;
 
+use core::iter::Iterator;
+
 use kernel::{
     device,
-    dma::{
-        CoherentAllocation,
-        DmaAddress, //
-    },
+    dma::CoherentAllocation,
     dma_write,
     pci,
-    prelude::*,
-    transmute::AsBytes, //
+    prelude::*, //
 };
 
 pub(crate) mod cmdq;
@@ -39,27 +37,6 @@
 /// Number of GSP pages to use in a RM log buffer.
 const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
 
-/// Array of page table entries, as understood by the GSP bootloader.
-#[repr(C)]
-struct PteArray<const NUM_ENTRIES: usize>([u64; NUM_ENTRIES]);
-
-/// SAFETY: arrays of `u64` implement `AsBytes` and we are but a wrapper around one.
-unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
-
-impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
-    /// Creates a new page table array mapping `NUM_PAGES` GSP pages starting at address `start`.
-    fn new(start: DmaAddress) -> Result<Self> {
-        let mut ptes = [0u64; NUM_PAGES];
-        for (i, pte) in ptes.iter_mut().enumerate() {
-            *pte = start
-                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
-                .ok_or(EOVERFLOW)?;
-        }
-
-        Ok(Self(ptes))
-    }
-}
-
 /// The logging buffers are byte queues that contain encoded printf-like
 /// messages from GSP-RM.  They need to be decoded by a special application
 /// that can parse the buffers.
@@ -86,16 +63,25 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
             NUM_PAGES * GSP_PAGE_SIZE,
             GFP_KERNEL | __GFP_ZERO,
         )?);
-        let ptes = PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
+
+        let start_addr = obj.0.dma_handle();
 
         // SAFETY: `obj` has just been created and we are its sole user.
-        unsafe {
-            // Copy the self-mapping PTE at the expected location.
+        let pte_region = unsafe {
             obj.0
-                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
-                .copy_from_slice(ptes.as_bytes())
+                .as_slice_mut(size_of::<u64>(), NUM_PAGES * size_of::<u64>())?
         };
 
+        // As in [`DmaGspMem`], this is a  one by one GSP Page write to the memory
+        // to avoid stack overflow when allocating the whole array at once.
+        for (i, chunk) in pte_region.chunks_exact_mut(size_of::<u64>()).enumerate() {
+            let pte_value = start_addr
+                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
+                .ok_or(EOVERFLOW)?;
+
+            chunk.copy_from_slice(&pte_value.to_ne_bytes());
+        }
+
         Ok(obj)
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 46819a82a51adc58423502d9d45730923b843656..7a6cb261f4e62ac6210a80f9ecb61213cdb91b15 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -35,7 +35,6 @@
             MsgqRxHeader,
             MsgqTxHeader, //
         },
-        PteArray,
         GSP_PAGE_SHIFT,
         GSP_PAGE_SIZE, //
     },
@@ -159,7 +158,7 @@ struct Msgq {
 #[repr(C)]
 struct GspMem {
     /// Self-mapping page table entries.
-    ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
+    ptes: [u64; GSP_PAGE_SIZE / size_of::<u64>()],
     /// CPU queue: the driver writes commands here, and the GSP reads them. It also contains the
     /// write and read pointers that the CPU updates.
     ///
@@ -201,7 +200,29 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
 
         let gsp_mem =
             CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle())?)?;
+        const NUM_PAGES: usize = GSP_PAGE_SIZE / size_of::<u64>();
+
+        // One by one GSP Page write to the memory to avoid stack overflow when allocating
+        // the whole array at once.
+        let item = gsp_mem.item_from_index(0)?;
+        for i in 0..NUM_PAGES {
+            let pte_value = gsp_mem
+                .dma_handle()
+                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
+                .ok_or(EOVERFLOW)?;
+
+            // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
+            // dereferenced. The compiler also further validates the expression on whether `field`
+            // is a member of `item` when expanded by the macro.
+            //
+            // Further, this is dma_write! macro expanded and modified to allow for individual
+            // page write.
+            unsafe {
+                let ptr_field = core::ptr::addr_of_mut!((*item).ptes[i]);
+                gsp_mem.field_write(ptr_field, pte_value);
+            }
+        }
+
         dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES))?;
         dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
 

---
base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
change-id: 20260212-drm-rust-next-beb92aee9d75

Best regards,
-- 
Tim Kovalenko <tim.kovalenko@proton.me>


