Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA10CEDA693
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 16:23:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B63A310E86C;
	Tue,  3 Mar 2026 16:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AXJ+vRwp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 91FF444DA3;
	Tue,  3 Mar 2026 16:13:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772554412;
 b=vlDuSKhkmv+uto0tDqqSyyL9TxLbXN5eHBYEKR/Bvkd35OPYfliYl00vb0ZDShGc9G78x
 L+uQGLDDb4GvVZbIi4Irh50ceTjQVvtY4wUVxddW7ppEqMbd8bR2wiDkKGIzl3AwSBrmA4q
 dzby5tGNHAPor9K7hsFpTiCuFmw76agqBByMlfuNwa36cHTSUNOCtT9ZsCoIdOf9QJJRc36
 L6wp1Jc1AgYoAN2fFB/7Q7R6dSKO8eGoc8cJJoNfwhDcKfNjm8mrgFVrt9r67Fterr/iLog
 ZfRbZdNjde8+2wPKHkcp0xx5YHx9FLBlXJgryxTHYVMURK0sChZj7WFrybGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772554412; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=W1ITmfSNRdL/pzURtiHajVQ2loUvOtX7ELSrQt70raU=;
 b=fhaTRGcDG2Dwuc4Q3PeS4a/qTl5gPErJ7/DL+bwKtZ9sMUx+4BBP8dpy6Vp6uZ0YWk5li
 a+KKvQVxmhwNrM7XvXd3zeG+FHOUKA4XnODugpksldbITzNE9H2/YfjA1EvQNwjukZVPWDp
 q5a9q2xs7hZu/w+onHSPHyet2ZN9CYu/v6cg6Af+uIamXVbadBvDJ2UEkcVRM/5Smgq6yUx
 O6xLE74udJo3qTXhvmbfAvfc4KEQrHo7FveqxbHxE0Wj5qo3W2lC9tajjkce72vHHd+M/s6
 aJF+Z4IJKH/G4oaUypdsucpDQqSOmTQfn0qPvkr0KDBXNMIcQLtbQ1ugqpOw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 75ACF44CD7
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 16:13:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0E610E859;
	Tue,  3 Mar 2026 16:23:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CF8F160008;
	Tue,  3 Mar 2026 16:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77E6C19425;
	Tue,  3 Mar 2026 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555026;
	bh=RRwlxYxwMBwbZCAUZL3IuCb0Hwkrc8JPcDDRIvn48Qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AXJ+vRwpD+EC7R58rTnSZ/QZYMKFuXqSXO3N90797MlZ9vYi3KprMBIs8w+G2RZD+
	 2kN6PvgKj34HKMHJhIzKXtVaeylMgeF56kentZ9Z9C09Yg1O53lPcZYOVNxXr7gbi3
	 jINaPy0/1NcOm7jOt3Vh9vaMj3FWtgqTBZAhcgwyeOhi4Gbp5fRzxoJxG9C5pvGwSo
	 YXJSBpUDyzqSVWqFcWC8DvlGuWgBZTMkHljj0xCicQYs1BuGQTdLtBWf5gJCRyn+im
	 et4kuO34LXSpgiC2zi5PxvGiBDFsNw0H8/iNP6nKFYClKVa7pE27bJ9H2LB68qKy1s
	 ELA3SlfZZ+GNg==
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
Subject: [PATCH 6/8] gpu: nova-core: use Coherent::init to initialize
 GspFwWprMeta
Date: Tue,  3 Mar 2026 17:22:57 +0100
Message-ID: <20260303162314.94363-7-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303162314.94363-1-dakr@kernel.org>
References: <20260303162314.94363-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5OJFP4ZMUJAXWA6FNWSSSOTP2IIXSDNJ
X-Message-ID-Hash: 5OJFP4ZMUJAXWA6FNWSSSOTP2IIXSDNJ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5OJFP4ZMUJAXWA6FNWSSSOTP2IIXSDNJ/>
Archived-At: 
 <https://lore.freedesktop.org/20260303162314.94363-7-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Convert wpr_meta to use Coherent::init() and simplify the
initialization.  It also avoids a separate initialization of
GspFwWprMeta on the stack.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gsp/boot.rs |  7 ++-----
 drivers/gpu/nova-core/gsp/fw.rs   | 20 +++++++++++++++-----
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 7f46fa5e9b50..1a4d9ee4f256 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -2,8 +2,7 @@
 
 use kernel::{
     device,
-    dma::CoherentAllocation,
-    dma_write,
+    dma::Coherent,
     io::poll::read_poll_timeout,
     pci,
     prelude::*,
@@ -155,9 +154,7 @@ pub(crate) fn boot(
             bar,
         )?;
 
-        let wpr_meta =
-            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(wpr_meta, [0]?, GspFwWprMeta::new(&gsp_fw, &fb_layout));
+        let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev))?;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f1797e1f0d9d..751d5447214d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -131,7 +131,9 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 /// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
 /// addresses of the GSP bootloader and firmware.
 #[repr(transparent)]
-pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
+pub(crate) struct GspFwWprMeta {
+    inner: bindings::GspFwWprMeta,
+}
 
 // SAFETY: Padding is explicit and does not contain uninitialized data.
 unsafe impl AsBytes for GspFwWprMeta {}
@@ -144,10 +146,14 @@ unsafe impl FromBytes for GspFwWprMeta {}
 type GspFwWprMetaBootInfo = bindings::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
 
 impl GspFwWprMeta {
-    /// Fill in and return a `GspFwWprMeta` suitable for booting `gsp_firmware` using the
+    /// Returns an initializer for a `GspFwWprMeta` suitable for booting `gsp_firmware` using the
     /// `fb_layout` layout.
-    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
-        Self(bindings::GspFwWprMeta {
+    pub(crate) fn new<'a>(
+        gsp_firmware: &'a GspFirmware,
+        fb_layout: &'a FbLayout,
+    ) -> impl Init<Self> + 'a {
+        #[allow(non_snake_case)]
+        let init_inner = init!(bindings::GspFwWprMeta {
             // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC` unmodified.
             magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
             revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
@@ -182,7 +188,11 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
-            ..Default::default()
+            ..Zeroable::init_zeroed()
+        });
+
+        init!(GspFwWprMeta {
+            inner <- init_inner,
         })
     }
 }
-- 
2.53.0

