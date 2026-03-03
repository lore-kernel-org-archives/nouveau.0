Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD62EDA693
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 16:23:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 70A0310E873;
	Tue,  3 Mar 2026 16:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bmk0Z2oM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4F26F44DA0;
	Tue,  3 Mar 2026 16:13:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772554407;
 b=yKK88/Bx2sVDpUANnCvNqFiYLvM6sRjAXoXT6OYwBsBCZmL9i1iurtLwmT0sJfkxITWrM
 vvmYHE/fEWMsKoQDV5xhah2GntRP5akJpotOndz/qbm07MKIRhIuALKEuO0CVyLlH4PurGX
 uIXcYSOcjjDwuI+43dtwmlgOy0JFumJ0MUAjVC5DSe/8EllwdP6uWdXem7t4/4XbdPrnVPn
 O7k69xKU7F6SWBI1rmasEloSv0sTCRvybCENh1d+BAqH0wRNQgXN3ju71aClvq6qsSG9SgH
 1RapcYBeQYgZm/+EfuUgvCUGxn2YSkzG4p6Nl/lk47BpDe10DoCaKJ1A2BiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772554407; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Th3PCPN7rkOhDZ93NSZd0ssI68JhgjnvX6eKD+DVm80=;
 b=WF1FfSDHTEJzk9OpQsSh4VXf45eMj4Sak4w9CglfnYQA2mTxnZvV+cZ5wQoD5LS3xAUwL
 mw9OA9DZ2E5ygmNQaqyPYrtDFjzzGTNnkxSSL8OVDOd6mPXNDOV2Ez4mM8Gi0MF8+4vgKrt
 Fvq9+gpA/Qlqub14Gql4HhQh3VTEctXcmvuZjwPYQjW4Vochm+sO1TBziBG/48oxjHFac4J
 NhUSV5CciYSTeI0TY1WREo+bbqPAGq7eR/+ZjfKho7y/os5gbo1W17NtSjTI0u15Eq7Tuyu
 HYe0lpRJqcwDY7R4icqZ75O2k5XnSVJZFwpb0UL4mJkUSIYg+VYEzbamk/JQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9E5A144CD7
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 16:13:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9D61110E86B;
	Tue,  3 Mar 2026 16:23:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8467541B5E;
	Tue,  3 Mar 2026 16:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADDDC116C6;
	Tue,  3 Mar 2026 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555022;
	bh=+liU4pQNiYF4RC3Z3F4oQnCGR+HREs2Sq3MMzyTGAOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bmk0Z2oMWzuq509fyO1v/aQOfoxTxOlzclkhD5GNbCyhMh2yu7FChr7EvI1YQFM37
	 Fx5Mp4iZ2DPDaE+dXPD5pHJ4jClMOez0HOTmtreERsarMbW/eVna6KcaUiexSp+Hjv
	 Jze0+p30dGCWoZXalXq1WaWwbtypMGwe5IPDaZSyirikkHoc6dx9Ee5JXE/8vTK4i0
	 DxBMAxlOHejyxts5d7/HXVI62feIhiQC6h//7SBUWvWUiNsr8Nb0sCvAVxXew1tuLK
	 4/c/3cEZ20EAZCdl4DInvPgBRsrOAjU0ohTE3xerRQKGN5oVMVR4FxemYsjIxAhnwn
	 AcNgedmkzliPg==
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
Subject: [PATCH 5/8] rust: dma: add Coherent:init() and
 Coherent::init_with_attrs()
Date: Tue,  3 Mar 2026 17:22:56 +0100
Message-ID: <20260303162314.94363-6-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303162314.94363-1-dakr@kernel.org>
References: <20260303162314.94363-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EONZZ4KCHZRYA4SQYAQPTZJTFAYNO3DR
X-Message-ID-Hash: EONZZ4KCHZRYA4SQYAQPTZJTFAYNO3DR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EONZZ4KCHZRYA4SQYAQPTZJTFAYNO3DR/>
Archived-At: 
 <https://lore.freedesktop.org/20260303162314.94363-6-dakr@kernel.org/>
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
 rust/kernel/dma.rs | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 79dd8717ac47..d77c1b6cb0c4 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -706,6 +706,43 @@ pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> R
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

