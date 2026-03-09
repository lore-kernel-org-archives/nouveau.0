Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64457F4180E
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 16:35:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA96C10E56F;
	Mon,  9 Mar 2026 16:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nE9CPFES";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4AA5244F71;
	Mon,  9 Mar 2026 16:24:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773073491;
 b=KSnkE3gFVopjZqwFTbt1VXoKy7diJF+099XV/CEJqpjZHfV6ALo0s6vUtThCjpRUk3QFv
 xLoPkSY2bwurek962glhdv0s4uf/Y6x9n35Kb2ZYZjru5wZCf0X70uI7ABlKh9RA0DiYVmG
 WQuqVWfntlevr67+mHhppAzk6iW+uCy3KTf2aYGlMlnvOHICps1P9MHDMTw4HekOguQt75O
 dmQioHRnQwTSAvtkrFxBXoeZYQvQdSkoDIXaa/UwVzPvXmphhXlnS1DyAAmfwX6wUUFzexu
 xtoM/qCeEhMzOXwZgWfh91Ly1nq6gJ51JtCl8T4YdenmtkpNOGvPyBR9kHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773073491; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DrXMrL06zw+bWhwggFu//0L2trzL3RlgcDBTntO8i2g=;
 b=xUFOjXFJPkKOE94E8fVD+g1yHIZpB4iGSQFqs1bXi2X60rbLbTeRFvsNYw1g4PwO+iRZF
 c0aFxe0+YJCnnSVEDMWDwqbO6WlbsTwR7SNPbTV6EwCr4bnlBUbHB4xl0kgXdFAFwH/14uZ
 z+R6/uF7urMyk+AV/Rm5ypkueLNTi0CRWaQKHc0j2CkyWwqftcUUJCUV7mlCgRSO60lAuFP
 1w/T7p21Q/5wnLa40tESh9DbvyZ03qv5Qyy2KwGvmJ6t3vISxOKies8PbUxdwXatbO7TRjf
 HWoEQKgKpLf5jr8PP6dOMknsbgyfkgKb5rTLo5PaGdeYJAdghmpYatKcXLDA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EA9AE4034D
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 16:24:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5102010E558;
	Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3180644510;
	Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C224BC2BCB7;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074118;
	bh=fssZhaE39h8/ifGb5lyKDHlx9SyrHqGfVID8VjmY0ME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nE9CPFESeIElYpdFRVFYi/eDY9RoazP12jcTKXLiS3P7dRa9zphKtGh1pPAm0qMUf
	 Si1w3fT84m6mtNoKkiABeBnJPXnSSW1pcCw5+SieCJkAQsC0XZRTZbvXQhkysdgEm9
	 B56/DvoqOv6oxIeGkLvbO/i/fL6vA8SyOZbjKIf6Ub6oMWmKpiG3trmrmtJGoc+9ut
	 oISHSJI+QPG7Oi1wFCM0b/vDyzjppoceO75Z3Y3wZExWRhgsBxLQdEUmL3sEVDuhK9
	 Xmb/yGfDEC15+YoOym7ExlwwmTmLi825LE4F0VxIHZet28u3jXNL+ZEPYjOhdEi7rC
	 oLdNDkjd3nh2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1174F41812;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
From: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>
Date: Mon, 09 Mar 2026 12:34:21 -0400
Subject: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory
 allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
In-Reply-To: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773074117; l=3986;
 i=tim.kovalenko@proton.me; s=20260212; h=from:subject:message-id;
 bh=02lIiBKVUWPZgiHflont6ppBx+2QAZbO4PzXiivsIkE=;
 b=pE0ZKAo+0q+3X2PamEznSFPbbQiSdIw7Xy/EgQG+Zfy/iiwn0Rb6Om2UKZsCeEXyeudQjTtkF
 +jL/j8+uX6ICxdDQJsEfm++qZt+CwLBc7cGDTtVkdNtnXo/EFKH2KKd
X-Developer-Key: i=tim.kovalenko@proton.me; a=ed25519;
 pk=/+OiulEpgeZifgP4mDE4e5YlV6nMeY+frze/lY/xiHI=
X-Endpoint-Received: by B4 Relay for tim.kovalenko@proton.me/20260212 with
 auth_id=635
X-Original-From: Tim Kovalenko <tim.kovalenko@proton.me>
Message-ID-Hash: JEHWSJJ5NOFGVPSFI5YPKPYPNQ3T5BZY
X-Message-ID-Hash: JEHWSJJ5NOFGVPSFI5YPKPYPNQ3T5BZY
X-MailFrom: devnull+tim.kovalenko.proton.me@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, driver-core@lists.linux.dev,
 Tim Kovalenko <tim.kovalenko@proton.me>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: tim.kovalenko@proton.me
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JEHWSJJ5NOFGVPSFI5YPKPYPNQ3T5BZY/>
Archived-At: 
 <https://lore.freedesktop.org/20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me/>
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

Modify the `PteArray` to calculate and write the Page Table Entries
directly into the coherent DMA buffer one-by-one. This reduces the stack
usage quite a lot.

Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>
---
 drivers/gpu/nova-core/gsp.rs      | 34 +++++++++++++++++++---------------
 drivers/gpu/nova-core/gsp/cmdq.rs | 15 ++++++++++++++-
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 25cd48514c777cb405a2af0acf57196b2e2e7837..20170e483e04c476efce8997b3916b0ad829ed38 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -47,16 +47,11 @@
 unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
 
 impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
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
+    /// Returns the page table entry for `index`, for a mapping starting at `start` DmaAddress.
+    fn entry(start: DmaAddress, index: usize) -> Result<u64> {
+        start
+            .checked_add(num::usize_as_u64(index) << GSP_PAGE_SHIFT)
+            .ok_or(EOVERFLOW)
     }
 }
 
@@ -86,16 +81,25 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
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
 
+        // This is a  one by one GSP Page write to the memory
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
index 0056bfbf0a44cfbc5a0ca08d069f881b877e1edc..c8327d3098f73f9b880eee99038ad10a16e1e32d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -202,7 +202,20 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
 
         let gsp_mem =
             CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(gsp_mem, [0]?.ptes, PteArray::new(gsp_mem.dma_handle())?);
+
+        const NUM_PTES: usize = GSP_PAGE_SIZE / size_of::<u64>();
+
+        let start = gsp_mem.dma_handle();
+        // One by one GSP Page write to the memory to avoid stack overflow when allocating
+        // the whole array at once.
+        for i in 0..NUM_PTES {
+            dma_write!(
+                gsp_mem,
+                [0]?.ptes.0[i],
+                PteArray::<NUM_PTES>::entry(start, i)?
+            );
+        }
+
         dma_write!(
             gsp_mem,
             [0]?.cpuq.tx,

-- 
2.53.0


