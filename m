Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87730F41810
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 16:35:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 594FA10E57A;
	Mon,  9 Mar 2026 16:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UyLYSwNI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D51C044F6F;
	Mon,  9 Mar 2026 16:24:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773073492;
 b=ejKxdARgpGtPDwC0UzSib7jCjSwZlZ7aQem8E5e6TOiw1pd+2KVuq2rM8v8C4oTd6FoAG
 BMWEvIXAb0TEYwEpjXbOfKRkWPv8Zj6vxAdcpTtsqZZ6pgTD2BHcoD6Icxg78+3puIsRmZ0
 dQViuPoW60+1YZvaUSeGDt2rVGezrWvWVqBFLCuDlyiAIciLVT2PSGHcBSUbIy29uqkjYmw
 kGZzy3gtbsdgzwTsZeiPRkxxH01k/9s4JyQPvOnnoX3qovwCAJR+/4SPmnu0Yz0PWHBGf4a
 BTbGvxARDBsEV9I5GBxUrCS7l4pwe5LIQIYQ0Z95jtEi0f9n3MZfImjSFxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773073492; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/19T1klJdsUosb1aukvwgKVCLSGo1Ich0gssDYLmWq0=;
 b=TwkU1bsMDVK8DmjxXZEmG0bKOn4HFHW6Ei+6X44Tm3amrwl1PCC384Y98NDOD/v/F1xho
 VHzVBigUBJrHA4h19Sz54L9dl+iPzc6sawD8752MPqedplxnu+vEWu1ODNPSHK/Pq5iMEjv
 F7YLHV7mpoR+Pl42kstxwcuVxB/D3T7xfwPmZFsINRv+ofIo13GMvSP/bGW13Tljx7EzGcL
 ld0kEz9oPH73Addt754FOxNK97PRdpjRdAOROItiDOgN1WzQDxRLUyt/XY8srC8G730Mzdf
 097cysjp3fzzWexkVSa9SyXsRzS1JwuMBW9GXNaxhkmmsNwj3D1szAOjYmjg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8415B4034D
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 16:24:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C542410E558;
	Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 144166011F;
	Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D450C2BCAF;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074118;
	bh=gvPoHfp4kILjun0x+PiFZTGPIwNfY5nP6rl8dO323WQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UyLYSwNI19v9fIU/UbWQcc5LMvSlHh2m1+TmiGF9bUNaACjOvtlccovTSWh9MZjOu
	 FRjSnf/V5MzFcFzJlOXhxossZXZYcvi2ULR2U0DcU7BvOSd5AQpdYQPftTVApp3LeC
	 DdaoRbnIqtjX4kzODRi7OISkxtYKvCjqe9aamimi8IykwcmXBq2K5mA2e11fF6XfOn
	 EEeJuwI3Ay0TEzU5vsUR9rWGgBJg7hT6fDYWpRsSC+GxxkGgxEvGNnAp+yZhvtLemF
	 NYfDCOQgK3qCxuv5q0owT3xbZkd9kfsFebgC6HOpEZN3r68PQgLWV5vsPmBJr3pMkD
	 rNvIeysjpvkKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F83BF41810;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
From: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>
Date: Mon, 09 Mar 2026 12:34:18 -0400
Subject: [PATCH v4 1/4] rust: ptr: add `KnownSize` trait to support DST
 size info extraction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-drm-rust-next-v4-1-4ef485b19a4c@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773074117; l=2158;
 i=tim.kovalenko@proton.me; s=20260212; h=from:subject:message-id;
 bh=FheLpAl87yI4UaHfqa3k20aJCUg9ixwJ8DWS/cDgRg4=;
 b=45N81LFvbnZxj7EBp15VjpGQhHombjwrqodP4FxEVsCd0JDjLKei5FWNCjy3jFam1BlfUrrI7
 tx8XLpQNe94AjeTcEcFGAGgbnHF9RBdYUogAKI4RUMXskNkIfccBCVr
X-Developer-Key: i=tim.kovalenko@proton.me; a=ed25519;
 pk=/+OiulEpgeZifgP4mDE4e5YlV6nMeY+frze/lY/xiHI=
X-Endpoint-Received: by B4 Relay for tim.kovalenko@proton.me/20260212 with
 auth_id=635
X-Original-From: Tim Kovalenko <tim.kovalenko@proton.me>
Message-ID-Hash: WFWE27KT7ZRJWQDG5DDTE2YZ3Y3NJJ75
X-Message-ID-Hash: WFWE27KT7ZRJWQDG5DDTE2YZ3Y3NJJ75
X-MailFrom: devnull+tim.kovalenko.proton.me@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, driver-core@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: tim.kovalenko@proton.me
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WFWE27KT7ZRJWQDG5DDTE2YZ3Y3NJJ75/>
Archived-At: 
 <https://lore.freedesktop.org/20260309-drm-rust-next-v4-1-4ef485b19a4c@proton.me/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Gary Guo <gary@garyguo.net>

Add a `KnownSize` trait which is used obtain a size from a raw pointer's
metadata. This makes it possible to obtain size information on a raw slice
pointer. This is similar to Rust `core::mem::size_of_val_raw` which is not
yet stable.

Signed-off-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/ptr.rs | 27 ++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4eed16335c3c251e6bff68dcf7e781e..510cc7fe496113f85c34f420b1c4be95596297ad 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -20,6 +20,7 @@
 #![feature(generic_nonzero)]
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
+#![feature(slice_ptr_len)]
 //
 // Stable since Rust 1.80.0.
 #![feature(slice_flatten)]
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 5b6a382637fef11e9c0ae9122906422a970d7fcd..cf980a103acf19ee3bd17bb1dfdbcadfe30467ae 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -2,7 +2,10 @@
 
 //! Types and functions to work with pointers and addresses.
 
-use core::mem::align_of;
+use core::mem::{
+    align_of,
+    size_of, //
+};
 use core::num::NonZero;
 
 /// Type representing an alignment, which is always a power of two.
@@ -225,3 +228,25 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
 }
 
 impl_alignable_uint!(u8, u16, u32, u64, usize);
+
+/// Trait to represent compile-time known size information.
+///
+/// This is a generalization of what [`size_of`] which works for dynamically sized types.
+pub trait KnownSize {
+    /// Get the size of an object of this type in bytes, with the metadata of the given pointer.
+    fn size(p: *const Self) -> usize;
+}
+
+impl<T> KnownSize for T {
+    #[inline(always)]
+    fn size(_: *const Self) -> usize {
+        size_of::<T>()
+    }
+}
+
+impl<T> KnownSize for [T] {
+    #[inline(always)]
+    fn size(p: *const Self) -> usize {
+        p.len() * size_of::<T>()
+    }
+}

-- 
2.53.0


