Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80994D3517A
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:46:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5570210F06B;
	Wed,  1 Apr 2026 11:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CndxmCi7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 35F924534C;
	Wed,  1 Apr 2026 11:35:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043332;
 b=kp/p8KQUXb8u9Dk5HHIkcBNRf/zBn2OiW11iWYCAtpGSOyFqZirlE6yIhGMj34TqhzQZO
 lCu2Ga+QiFV+Zc1w03DJ70lkGEVakB+/vn4ltojx3YqkXrARYX744U1H3XXD62JZGeSNmSR
 A6aPR1EQVABJi3JPZlEM/uG5Zjf1wRlUapbOb1jY81ygahoQkH6QOVjrjzLS5CilNGMmJ6g
 m0p0omuZ6MtaI4B/Ursr9EhKNG8krssWU0SnEM1ydn4lr2y5ntRMrDnvuvgZE1MZshNcFKY
 bPpGDK/GXJO0//9WpC5xNIgetb4/SbeclzWMTv68OcyaI1DluxXfsbTtNibg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043332; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Nw7FrKxFb3RYbAypZR9CtUIQu/LteWiHv4UDz6aggpE=;
 b=DTJNuvUvmUwRJsnk3zERVNJdVkMqL3iHtmO+T5hp0TPYqC0VHL5qGyUrLGCuiPHUuJDTn
 aezEyyyqI7ZS+wQGW0RvxlEMSYVOqVAYjx8vJ/vpT+j0S2AVSBI+nhQUgPSfgCMYQZVo0AZ
 a1+KWW56wrXEjTrjjfhILKv4VDtW32m/ekn7+animTkvl/cWYJVo38v8sUFC8HwuHG7ZuYj
 eIhdZM0CBEad8wV3bEavhT+kpfHbkwjd4Qhn4JNFoUOvMnCoj6sRlUyx/lCEmCLcx6L85/c
 b9eMBsyzkg8UpD5QDGeIM7Gp0i+EqNwfoN1V53ZLlTmj6VGgy0OdNEovdQFA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 340E140545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:35:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 32D6C10EFB9;
	Wed,  1 Apr 2026 11:46:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 100A340910;
	Wed,  1 Apr 2026 11:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E848C4AF0C;
	Wed,  1 Apr 2026 11:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044010;
	bh=e8DhGnWyulpeNMl4zQDOtzs8M6k0lQwkocXJf8Znql4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CndxmCi7THhrnhCFzhqy6KvbAgEkGaA5pYgccV/CQjuh3yuwhgtAGKi7YOptKJvyo
	 kqULk/HwSV6RulLc0BWsv4O79mDs8iMcZCf91sdFQFz50VKP0sjsIyfBh+0qQeCTdo
	 rCvPjk9C4McT1wKkvlhKcCB4WTzc75OK8oXNtoIsN5ZrjbB14gsu4pP4ZuffkXa6E+
	 GnVppQRnM/P0zARZDYa4UbsPlNPZHeWHpRT83O3pCygzfG7boiRlqXD0Fx8HTVqGdP
	 fptMVM7dF4BLILbhiF62wWFdnCWOMxzNVvxybKbvshYWAqQq96KPt5nO0sw2WFo9Bf
	 3EKqN9cfSKgzA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 04/33] rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and
 simplify code
Date: Wed,  1 Apr 2026 13:45:11 +0200
Message-ID: <20260401114540.30108-5-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VBTRMKX2IN2TX4VIABPJF7Q2F3FLFDPE
X-Message-ID-Hash: VBTRMKX2IN2TX4VIABPJF7Q2F3FLFDPE
X-MailFrom: ojeda@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VBTRMKX2IN2TX4VIABPJF7Q2F3FLFDPE/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-5-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

With the Rust version bump in place, the `RUSTC_HAS_SLICE_AS_FLATTENED`
Kconfig (automatic) option is always true.

Thus remove the option and simplify the code.

In particular, this includes removing the `slice` module which contained
the temporary slice helpers, i.e. the `AsFlattened` extension trait and
its `impl`s.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 init/Kconfig           |  3 ---
 rust/kernel/lib.rs     |  1 -
 rust/kernel/prelude.rs |  3 ---
 rust/kernel/slice.rs   | 49 ------------------------------------------
 4 files changed, 56 deletions(-)
 delete mode 100644 rust/kernel/slice.rs

diff --git a/init/Kconfig b/init/Kconfig
index b8a1ab0d49d4..c38f49228157 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -178,9 +178,6 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000
 
-config RUSTC_HAS_SLICE_AS_FLATTENED
-	def_bool RUSTC_VERSION >= 108000
-
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 138d846f798d..621cae75030c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -140,7 +140,6 @@
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
-pub mod slice;
 #[cfg(CONFIG_SOC_BUS)]
 pub mod soc;
 #[doc(hidden)]
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 6a54597fa0a2..1cf051b83394 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -53,6 +53,3 @@
 pub use super::current;
 
 pub use super::uaccess::UserPtr;
-
-#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
-pub use super::slice::AsFlattened;
diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
deleted file mode 100644
index ca2cde135061..000000000000
--- a/rust/kernel/slice.rs
+++ /dev/null
@@ -1,49 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! Additional (and temporary) slice helpers.
-
-/// Extension trait providing a portable version of [`as_flattened`] and
-/// [`as_flattened_mut`].
-///
-/// In Rust 1.80, the previously unstable `slice::flatten` family of methods
-/// have been stabilized and renamed from `flatten` to `as_flattened`.
-///
-/// This creates an issue for as long as the MSRV is < 1.80, as the same functionality is provided
-/// by different methods depending on the compiler version.
-///
-/// This extension trait solves this by abstracting `as_flatten` and calling the correct method
-/// depending on the Rust version.
-///
-/// This trait can be removed once the MSRV passes 1.80.
-///
-/// [`as_flattened`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened
-/// [`as_flattened_mut`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened_mut
-#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
-pub trait AsFlattened<T> {
-    /// Takes a `&[[T; N]]` and flattens it to a `&[T]`.
-    ///
-    /// This is an portable layer on top of [`as_flattened`]; see its documentation for details.
-    ///
-    /// [`as_flattened`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened
-    fn as_flattened(&self) -> &[T];
-
-    /// Takes a `&mut [[T; N]]` and flattens it to a `&mut [T]`.
-    ///
-    /// This is an portable layer on top of [`as_flattened_mut`]; see its documentation for details.
-    ///
-    /// [`as_flattened_mut`]: https://doc.rust-lang.org/std/primitive.slice.html#method.as_flattened_mut
-    fn as_flattened_mut(&mut self) -> &mut [T];
-}
-
-#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
-impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
-    #[allow(clippy::incompatible_msrv)]
-    fn as_flattened(&self) -> &[T] {
-        self.flatten()
-    }
-
-    #[allow(clippy::incompatible_msrv)]
-    fn as_flattened_mut(&mut self) -> &mut [T] {
-        self.flatten_mut()
-    }
-}
-- 
2.53.0

