Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494C01099B37
	for <nouveau@archiver.kernel.org>; Fri, 20 Mar 2026 19:47:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 28BCE10EC08;
	Fri, 20 Mar 2026 19:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YDSa3Qr6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E263A45245;
	Fri, 20 Mar 2026 19:36:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774035369;
 b=QB7Dm1x85HzWxg7BlAr1RYR04UoXos041DyksMuLTvBsSkhQd4kDEkXLiDHmw4SuSjst1
 bNGb+CpZMpGuibnBSBYnqp1ygZDeAuRK1n9k/BuR3zXO3rsLn9mmpSa8ntuEODJbk1hCRNO
 0cmGOA9iM5rRbh8IK1+kvFMu97yiBZWGiR1XAl5pl/qR9kAG8xlzYaxUCRSCw3LxvKY884A
 /xrhwa7e47VYcOXPwxjpvHdQpZoA/cPfVQtzkNCuubMFUD+0bZ+h15ED8Cs1fyhouhjU+TC
 ifQf2yMFVcxZs6LQkTVf+S823FBFA6gp+3NNKEosJTzKWmDpNjNXC/r8lGsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774035369; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JA4JiX+LiqgOKLlJ1viv2/wUHpKnX6UPfpwe/0XOQcQ=;
 b=ApLSUPChIVQtjSemw8RwZ6jZgMf+duyGgtumYy0QpZWxeMac6ZgZd2ch7sRl19NHbyhxZ
 wtGZIN6K/Zur0pjk4z3qYNRu1BhVhU+19acR70pUhHpio67kdrq2oP1iYCeijyD6lv+MqeU
 jx3YE5+O2ltsv6Ttvv7LixzKomp6LKFvNt2DlB2f6E0I0bGBQSbvhbeECRqlKWjxz/DdieJ
 2x/fT2AnUC7LtnmI6Qf6Ax032tnionCV0SS9jUkL3559vCiLhDfiv3ViOmAmCGo6K7BfDYK
 ZdJjE2XoXJRShO6xHBPDqUHuZa9XfhW7y6J93Hkf9EZAxaVaETFAL96Sa3bw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 13AC944C8D
	for <nouveau@lists.freedesktop.org>; Fri, 20 Mar 2026 19:36:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 141BE10EBF3;
	Fri, 20 Mar 2026 19:47:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CC2D60141;
	Fri, 20 Mar 2026 19:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C74C2BC87;
	Fri, 20 Mar 2026 19:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774036022;
	bh=ju9WyBxPqyhdguAHgPK1Hx/Tksq0dRThuffsKQ3jlpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YDSa3Qr6JFZRqqZLQfMA9a0TfK0uoNtJcg4U8dI8QYEkz2CP7v7g1K0IFpZj9yLlI
	 dXPS94g4ZCX7jFUhgMeh7cVBfYF8zmqMWmcod2/fWEsugYVFtM6ENu5znrCin3nqbC
	 L5sm9dQ3VQOPiO2UnvKphnuwXH03tB6GpKICe3tPbEBy020QkUKW0fmGc3LqhkNh+z
	 /HPdt35vQTisvSGbtXMO5tWL5zu8frMsB2kmcbqBlM7wH2oACBL/R5DFIu/m0gHtap
	 PU3UhYo/FntqaZcuQZx56wdknXiKMglFIvM4CCYzHvrfKOf+cnp3atWhAwtYkCv+CU
	 MEw+MB2D3beTg==
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
Subject: [PATCH v2 5/8] rust: dma: add Coherent:init() and
 Coherent::init_with_attrs()
Date: Fri, 20 Mar 2026 20:45:40 +0100
Message-ID: <20260320194626.36263-6-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320194626.36263-1-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6WPCRPMZ63A4SDO53XLFVMVCAV4JBW7O
X-Message-ID-Hash: 6WPCRPMZ63A4SDO53XLFVMVCAV4JBW7O
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6WPCRPMZ63A4SDO53XLFVMVCAV4JBW7O/>
Archived-At: 
 <https://lore.freedesktop.org/20260320194626.36263-6-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Analogous to Coherent::zeroed() and Coherent::zeroed_with_attrs(), add
Coherent:init() and Coherent::init_with_attrs() which both take an impl
Init<T, E> argument initializing the DMA coherent memory.

Compared to CoherentInit, Coherent::init() is a one-shot constructor
that runs an Init closure and immediately exposes the DMA handle,
whereas CoherentInit is a multi-stage initializer that provides safe
&mut T access by withholding the DMA address until converted to
Coherent.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index cefb54f0424a..6d2bec52806b 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -709,6 +709,44 @@ pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> R
         Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
     }
 
+    /// Same as [`Coherent::zeroed_with_attrs`], but instead of a zero-initialization the memory is
+    /// initialized with `init`.
+    pub fn init_with_attrs<E>(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+        init: impl Init<T, E>,
+    ) -> Result<Self>
+    where
+        Error: From<E>,
+    {
+        let dmem = Self::alloc_with_attrs(dev, gfp_flags, dma_attrs)?;
+        let ptr = dmem.as_mut_ptr();
+
+        // SAFETY:
+        // - `ptr` is valid, properly aligned, and points to exclusively owned memory.
+        // - If `__init` fails, `self` is dropped, which safely frees the underlying `Coherent`'s
+        //   DMA memory. `T: AsBytes + FromBytes` ensures there are no complex `Drop` requirements
+        //   we are bypassing.
+        unsafe { init.__init(ptr)? };
+
+        Ok(dmem)
+    }
+
+    /// Same as [`Coherent::zeroed`], but instead of a zero-initialization the memory is initialized
+    /// with `init`.
+    #[inline]
+    pub fn init<E>(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        init: impl Init<T, E>,
+    ) -> Result<Self>
+    where
+        Error: From<E>,
+    {
+        Self::init_with_attrs(dev, gfp_flags, Attrs(0), init)
+    }
+
     /// Allocates a region of `[T; len]` of coherent memory.
     fn alloc_slice_with_attrs(
         dev: &device::Device<Bound>,
-- 
2.53.0

