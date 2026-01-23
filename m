Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1B1D7789E
	for <nouveau@archiver.kernel.org>; Fri, 23 Jan 2026 17:59:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA72310EB92;
	Fri, 23 Jan 2026 17:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BKqLz4fo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2621140564;
	Fri, 23 Jan 2026 17:50:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769190651;
 b=qeTV3VOSBiMPFmbW/pLwgMbeNtzviYN81x1U5Luce0ChZSNmzsm1C5ZIrE5n76abYo9mq
 1V0W+N55fuysu0tUA0TG5qFwoiHCStabPb9k3Vcod2fZGLCBv+4X9RqLH2KQSGE9HVALhZW
 QHuEPo/iAARwBIgvqbz3YJiv3yQWMn+feXaEMWDpbvdyg5wUM6y2glVeB5wI3ieT0WCgCnL
 4epwoj2XKHlGh+3C3Q3O/6jwpjw/jlvLMuryFrqxTCmaLlAV+4RvaqbMyRKpZCr8uozgpNc
 VyrVk70K2xYwZjrrCgvrJAIq6B/4DLekYzky2vHB4Rv8UNKr1RGn0r7FwBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769190651; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Wulo3LjU0yHBx6vkvZw+QU4Hm2G89h8IrdRJ+ollruI=;
 b=jIVXC3kgGRPgjuR3mPP19BIqjk9GAZSyYpTn/V/NLK0aEeujy6RbpvZwSm2qTCw81saOH
 NY9Yf7OhzUpI0Xuc16QB1C/b4xUGZiP0GFqYA5sUXr1VFVx1rH+6B8qRrvmJnioezKVL4Gm
 aq8idoN6RsZ0kvFQJ9cYYqK0bUIgzvzjzfXnJO2RBBxxyG55ygi1ivJnFSZKJmpvVFvv1kc
 xUG4LyOuuONkTZ3eER5lOXxGe3qtxf2+QiVG70/+08ZbSGq2XHExi2wH86Te6oCnGD6Ew1p
 xsaO/yTGiXif6aBFbMXcgZFpOoQGJ8Sz9lV3veV+Z1JH8TebaXi1EGIO4KlA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AD1284031A
	for <nouveau@lists.freedesktop.org>; Fri, 23 Jan 2026 17:50:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DDEDD10EB89;
	Fri, 23 Jan 2026 17:59:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1357660147;
	Fri, 23 Jan 2026 17:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B4AC19421;
	Fri, 23 Jan 2026 17:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769191177;
	bh=awIr1K1KTsidvoGcDEzmoe3Uym3Wj1XHUyBNXJs4cG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=BKqLz4foHtsAzkgUHGlowvwRamIK82kyFk3gzw0W4g9l2+sPMyQD01ItudtFyRzaR
	 REX3ukTUkyTa7X5BdoeA4FGeWolL6c14ApBQ2mRQ5c8z6Jlbxk3F/ubTvm4E8vqySq
	 q4D43w+bJT28SA4y5sClPVHs11qqYSNDXh8FCfXzoWsIdnZm23CFSGCakP4KVK44x8
	 m27XAltZIuAFE0VRYCwXHUNp9eJuNYBTB4WECHqh5BOm2INr3moKeiyEeytuZ1DEF7
	 sjvC+AvLUabF8rSQC5RGJZjdfxb9JiNOTxFKVIbjUhtWQXfG/i0B247DRQD5CAe5yI
	 2L/EfjLujdZlQ==
From: Gary Guo <gary@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 7/8] gpu: nova-core: remove redundant `.as_ref()` for
 `dev_*` print
Date: Fri, 23 Jan 2026 17:58:44 +0000
Message-ID: <20260123175854.176735-7-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260123175854.176735-1-gary@kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XEHDCP5EERY7J5E47NUZLTW2VRUMTVOI
X-Message-ID-Hash: XEHDCP5EERY7J5E47NUZLTW2VRUMTVOI
X-MailFrom: gary@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Gary Guo <gary@garyguo.net>
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XEHDCP5EERY7J5E47NUZLTW2VRUMTVOI/>
Archived-At: 
 <https://lore.freedesktop.org/20260123175854.176735-7-gary@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Gary Guo <gary@garyguo.net>

This is now handled by the macro itself.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 drivers/gpu/nova-core/driver.rs   |  2 +-
 drivers/gpu/nova-core/gpu.rs      |  4 ++--
 drivers/gpu/nova-core/gsp/boot.rs | 32 +++++++------------------------
 3 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5a4cc047bcfc..e39885c0d5ca 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -70,7 +70,7 @@ impl pci::Driver for NovaCore {
 
     fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
         pin_init::pin_init_scope(move || {
-            dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
+            dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
 
             pdev.enable_device_mem()?;
             pdev.set_master();
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9b042ef1a308..60c85fffaeaf 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -262,13 +262,13 @@ pub(crate) fn new<'a>(
     ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
             spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
+                dev_info!(pdev,"NVIDIA ({})\n", spec);
             })?,
 
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
                 gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete\n"))?;
+                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 581b412554dc..1582e1a65274 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -170,15 +170,10 @@ pub(crate) fn boot(
             Some(libos_handle as u32),
             Some((libos_handle >> 32) as u32),
         )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-            mbox0,
-            mbox1
-        );
+        dev_dbg!(pdev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
 
         dev_dbg!(
-            pdev.as_ref(),
+            pdev,
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
@@ -190,19 +185,10 @@ pub(crate) fn boot(
             Some(wpr_handle as u32),
             Some((wpr_handle >> 32) as u32),
         )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
-            mbox0,
-            mbox1
-        );
+        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
 
         if mbox0 != 0 {
-            dev_err!(
-                pdev.as_ref(),
-                "Booter-load failed with error {:#x}\n",
-                mbox0
-            );
+            dev_err!(pdev, "Booter-load failed with error {:#x}\n", mbox0);
             return Err(ENODEV);
         }
 
@@ -216,11 +202,7 @@ pub(crate) fn boot(
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(
-            pdev.as_ref(),
-            "RISC-V active? {}\n",
-            gsp_falcon.is_riscv_active(bar),
-        );
+        dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
 
         // Create and run the GSP sequencer.
         let seq_params = GspSequencerParams {
@@ -239,8 +221,8 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())
-- 
2.51.2

