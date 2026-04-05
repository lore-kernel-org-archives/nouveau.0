Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC63E9D82D
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:59:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 96A6410E1D3;
	Sun,  5 Apr 2026 23:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QMqTAWOB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6FFFC45618;
	Sun,  5 Apr 2026 23:47:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432865;
 b=ie6WRAWakeKdcpxPNyrxLl0TXdiY34cwz4+5UrLrv6evcGBsjWaKCAVpFQ8dYGs1DWtWh
 H1Fb1t21v3FwVhZJARvxuZcMEqLvqn3MKajZM41tNsxMDBGX2sLUOAxIiTVI9zTgCD0bT5s
 kyLkzpP2gH8L9KILLAQLPCF/gmdYLhZD+6g8FFB+gj0/Dh3NEuugOYIJ3n5WQ9jddTxVcEg
 J7rwd+kcKE2Z8XnJ1aTIqxP1kbSqVSAy9ksg18JRnT4NiULHmr82a+dXLVqQ16KlA23fGVx
 d+ead56uvotlcJHY6R56OlDzg4kJb6Ddi0wMOoPnsp3QpjKP2W/UJiJVX/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432865; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FFO5J8U6wG6mpA4o/X8F1AcQgkVnGACWmkUiJK9H05I=;
 b=yzXmSq6OdW4fh2NTpGaYA6e7reheW1sqDUBu3TpglVRmjbJAEAWTtKhQZcsgMlsUwUR21
 kDhVuaR5VTmKNrfFgFr3qGOvF75F8V/ZQ9RRDEz0/KoC8kouaJTGbjZGZWGGYmndtZwrPl+
 IEdSRMdbMQILk1c4y/kS/9TW+4z0vYBsILQWQa3cspfE2fjRjfMaWirhN0RGEcE6WgeOI4f
 FeunSUC33cF/i156kL2mVmnqiyMUJPt+4/EaqZpy8+UQV+TCXN7boOE58XrqEERGMs0pgKN
 /zbKYhqvctcyfP+qF4Dxdsn73PbLicrc3ZBMl1atOoNHOd3WDWwlH5QXfwYQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 49A27455F3
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:47:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 477A910E1C6;
	Sun,  5 Apr 2026 23:59:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C210415F6;
	Sun,  5 Apr 2026 23:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9338AC116C6;
	Sun,  5 Apr 2026 23:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433554;
	bh=EC1VB1NES14FXvIITVND2HACtu2A9sWHbtpUrkEVsec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QMqTAWOBeSpPYcbAoAtCT6Zx9rr0Zx9H1IY1Pt9mwwKHjyRs3eukRIfpX6VkjAfJ+
	 9DaTqYsAz7K83VFtR9brQaez4p7KXMGM+tCAGzNZqIiZVOssFFFEzFIl7u9lCvYVF1
	 WaJgQ5+4XiiWhuqLGuIxVnqzu+8VY0MsmwISlvenX5mGXYAwjqBIAnUlbYj3Xef4+K
	 HhATQggifzX8UTvi6AEy18/qA7LNbp/34iGj/xCZTDjgAxMSHId++kvizUeyCvAxzs
	 IMNeKQNjRybFbCKNj2pVFN8dA6dFhOUZK/nNZEIkHfsefEqmE6kQ1zvrh/37qOKv0E
	 gk30P5Wea910g==
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
Subject: [PATCH v2 31/33] rust: declare cfi_encoding for lru_status
Date: Mon,  6 Apr 2026 01:53:07 +0200
Message-ID: <20260405235309.418950-32-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4JLNJXYS6GWQWC7XYGPUUOK46ZMIOAEQ
X-Message-ID-Hash: 4JLNJXYS6GWQWC7XYGPUUOK46ZMIOAEQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4JLNJXYS6GWQWC7XYGPUUOK46ZMIOAEQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-32-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Alice Ryhl <aliceryhl@google.com>

By default bindgen will convert 'enum lru_status' into a typedef for an
integer. For the most part, an integer of the same size as the enum
results in the correct ABI, but in the specific case of CFI, that is not
the case. The CFI encoding is supposed to be the same as a struct called
'lru_status' rather than the name of the underlying native integer type.

To fix this, tell bindgen to generate a newtype and set the CFI type
explicitly. Note that we need to set the CFI attribute explicitly as
bindgen is using repr(transparent), which is otherwise identical to the
inner type for ABI purposes.

This allows us to remove the page range helper C function in Binder
without risking a CFI failure when list_lru_walk calls the provided
function pointer.

The --with-attribute-custom-enum argument requires bindgen v0.71 or
greater.

[ In particular, the feature was added in 0.71.0 [1][2].

  In addition, `feature(cfi_encoding)` has been available since
  Rust 1.71.0 [3].

  Link: https://github.com/rust-lang/rust-bindgen/issues/2520 [1]
  Link: https://github.com/rust-lang/rust-bindgen/pull/2866 [2]
  Link: https://github.com/rust-lang/rust/pull/105452 [3]

    - Miguel ]

My testing procedure was to add this to the android17-6.18 branch and
verify that rust_shrink_free_page is successfully called without crash,
and verify that it does in fact crash when the cfi_encoding is set to
other values. Note that I couldn't test this on android16-6.12 as that
branch uses a bindgen version that is too old.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Link: https://patch.msgid.link/20260223-cfi-lru-status-v2-1-89c6448a63a4@google.com
Reviewed-by: Gary Guo <gary@garyguo.net>
[ Rebased on top of the minimum Rust version bump series which provide
  the required `bindgen` version. - Miguel ]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/android/binder/Makefile            |  3 +--
 drivers/android/binder/page_range.rs       |  6 +++---
 drivers/android/binder/page_range_helper.c | 24 ----------------------
 drivers/android/binder/page_range_helper.h | 15 --------------
 rust/bindgen_parameters                    |  4 ++++
 rust/bindings/bindings_helper.h            |  1 -
 rust/bindings/lib.rs                       |  1 +
 rust/uapi/lib.rs                           |  1 +
 8 files changed, 10 insertions(+), 45 deletions(-)
 delete mode 100644 drivers/android/binder/page_range_helper.c
 delete mode 100644 drivers/android/binder/page_range_helper.h

diff --git a/drivers/android/binder/Makefile b/drivers/android/binder/Makefile
index 09eabb527fa0..7e0cd9782a8b 100644
--- a/drivers/android/binder/Makefile
+++ b/drivers/android/binder/Makefile
@@ -5,5 +5,4 @@ obj-$(CONFIG_ANDROID_BINDER_IPC_RUST) += rust_binder.o
 rust_binder-y := \
 	rust_binder_main.o	\
 	rust_binderfs.o		\
-	rust_binder_events.o	\
-	page_range_helper.o
+	rust_binder_events.o
diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
index fdd97112ef5c..8e9f5c4819d0 100644
--- a/drivers/android/binder/page_range.rs
+++ b/drivers/android/binder/page_range.rs
@@ -642,15 +642,15 @@ fn drop(self: Pin<&mut Self>) {
     unsafe {
         bindings::list_lru_walk(
             list_lru,
-            Some(bindings::rust_shrink_free_page_wrap),
+            Some(rust_shrink_free_page),
             ptr::null_mut(),
             nr_to_scan,
         )
     }
 }
 
-const LRU_SKIP: bindings::lru_status = bindings::lru_status_LRU_SKIP;
-const LRU_REMOVED_ENTRY: bindings::lru_status = bindings::lru_status_LRU_REMOVED_RETRY;
+const LRU_SKIP: bindings::lru_status = bindings::lru_status::LRU_SKIP;
+const LRU_REMOVED_ENTRY: bindings::lru_status = bindings::lru_status::LRU_REMOVED_RETRY;
 
 /// # Safety
 /// Called by the shrinker.
diff --git a/drivers/android/binder/page_range_helper.c b/drivers/android/binder/page_range_helper.c
deleted file mode 100644
index 496887723ee0..000000000000
--- a/drivers/android/binder/page_range_helper.c
+++ /dev/null
@@ -1,24 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-/* C helper for page_range.rs to work around a CFI violation.
- *
- * Bindgen currently pretends that `enum lru_status` is the same as an integer.
- * This assumption is fine ABI-wise, but once you add CFI to the mix, it
- * triggers a CFI violation because `enum lru_status` gets a different CFI tag.
- *
- * This file contains a workaround until bindgen can be fixed.
- *
- * Copyright (C) 2025 Google LLC.
- */
-#include "page_range_helper.h"
-
-unsigned int rust_shrink_free_page(struct list_head *item,
-				   struct list_lru_one *list,
-				   void *cb_arg);
-
-enum lru_status
-rust_shrink_free_page_wrap(struct list_head *item, struct list_lru_one *list,
-			   void *cb_arg)
-{
-	return rust_shrink_free_page(item, list, cb_arg);
-}
diff --git a/drivers/android/binder/page_range_helper.h b/drivers/android/binder/page_range_helper.h
deleted file mode 100644
index 18dd2dd117b2..000000000000
--- a/drivers/android/binder/page_range_helper.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2025 Google, Inc.
- */
-
-#ifndef _LINUX_PAGE_RANGE_HELPER_H
-#define _LINUX_PAGE_RANGE_HELPER_H
-
-#include <linux/list_lru.h>
-
-enum lru_status
-rust_shrink_free_page_wrap(struct list_head *item, struct list_lru_one *list,
-			   void *cb_arg);
-
-#endif /* _LINUX_PAGE_RANGE_HELPER_H */
diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 112ec197ef0a..6f02d9720ad2 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -19,6 +19,10 @@
 # warning. We don't need to peek into it anyway.
 --opaque-type spinlock
 
+# enums that appear in indirect function calls should specify a cfi type
+--newtype-enum lru_status
+--with-attribute-custom-enum=lru_status='#[cfi_encoding="10lru_status"]'
+
 # `seccomp`'s comment gets understood as a doctest
 --no-doc-comments
 
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 083cc44aa952..faf3ee634ced 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -149,5 +149,4 @@ const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE = VM_NOHUGEPAGE;
 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
 #include "../../drivers/android/binder/rust_binder_events.h"
-#include "../../drivers/android/binder/page_range_helper.h"
 #endif
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index e18c160dad17..854e7c471434 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -19,6 +19,7 @@
     unreachable_pub,
     unsafe_op_in_unsafe_fn
 )]
+#![feature(cfi_encoding)]
 
 #[allow(dead_code)]
 #[allow(clippy::cast_lossless)]
diff --git a/rust/uapi/lib.rs b/rust/uapi/lib.rs
index 821e286e0daa..b8a515de31ca 100644
--- a/rust/uapi/lib.rs
+++ b/rust/uapi/lib.rs
@@ -24,6 +24,7 @@
     unsafe_op_in_unsafe_fn
 )]
 #![cfg_attr(CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES, allow(unnecessary_transmutes))]
+#![feature(cfi_encoding)]
 
 // Manual definition of blocklisted types.
 type __kernel_size_t = usize;
-- 
2.53.0

