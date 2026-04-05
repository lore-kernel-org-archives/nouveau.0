Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984E0E9D827
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:56:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 76EB810E1AA;
	Sun,  5 Apr 2026 23:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZaVpVUGO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 54591455E5;
	Sun,  5 Apr 2026 23:44:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432686;
 b=Zq3fJb+opV0OiscJ0SBrQWz7ITp604GAb+W4j6WELejE4nsV+/Gaakjx4lyhh1ycTW0cI
 KL6oQBuEgzilTHDcqa61qyed7KccjgRZvlXy+xsopwjQDUUumJshP9p2bCDoBk17e8P+8Jq
 HGkJWYN+rqxCXNaDnds9peViaj47ybtnvHYGqF7ZB2zQJZByf6f+YWZw3WumgzMsDUH+XJt
 DEGyZ1TVqMHUpBlBOELW3QEsdJmf3y4Zhrp9bBkJrJj8tXsTg+m+zs8/2lJ6qy9OJfb7T56
 nDSfRJ0HOZ4o4VXx9KcIEuNhj1Zx+PKlQ+EdjL7BAuuN1FmBBIJRnkm8sJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432686; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=x+7TAYOgTbawp+VUyk8RMZ3LzNgzoO9sNdptEQ5bi4A=;
 b=vhHlaEUBxdezRsNy3JzxnE235/Yg3fMIM0k19NtjxQX3pH85umB1CdeNEB1zvZLUBf46G
 FooU+jUKiZHn+E/OAsCkTOGtyOLlns9m35FZAUGr0lYVNR+RloYpvy92XvBtwySzLW76XXV
 xfiMOyFVMMHdxe1Y/8N5zme0HyvKMVSksczCIPN54iVuXPNN4y4JSoLSBoLmJ/MT/MlOdA1
 CqYs+ZX+jovrVi9XNgifzHFcqkgbF/9NDwXLt/WM9kHV/G/IXGVL3XyPoHaib2wF6SZyoOl
 LmTZYJitgKG0q0B6SfPH0k1uolqy8srWyHJAuN2AnhNIo9BY7cF/aBaLVMaA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 16F87448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:44:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 14E9C10E1A0;
	Sun,  5 Apr 2026 23:56:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE4F9417BD;
	Sun,  5 Apr 2026 23:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA99C116C6;
	Sun,  5 Apr 2026 23:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433375;
	bh=k9fgvKqzt3CcMjpByOnUKIVw60bYTXCQ8WCT/cyECdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZaVpVUGO29xolVVSHHDaY6zc64XoWTVURD4wmowEYx41c+Wyvxg2ZvbRUDBr5NSQM
	 qnQ7znq5xPGmdnTPdcYVaZC7vnG5CdMVAK8esq+ZQUqP5fhEE9eEYKap4bE1TE6jn4
	 tBmF/lQcMvqLIbmPK7hFkihBrJN3xVu01fVsz+MN4SzEjt8l16fIDNn69GQncl9Yl+
	 Iz0ORhzjuBLkOlJxT/Q92ItzFvNRq1IEAlPAFGwQoUdailI/ja4qppsGHHJ+cazKlw
	 zeuH4jXdUNlzyLPBG4DfcSUb8nvgueaNnyXHPAthjZQRgSoxFxQLDP6Ba6EFq9edcZ
	 rD1Bo7j0WdTjg==
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
Subject: [PATCH v2 15/33] rust: macros: simplify code using
 `feature(extract_if)`
Date: Mon,  6 Apr 2026 01:52:51 +0200
Message-ID: <20260405235309.418950-16-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ORHYOUU2J3KGA6JQ4GP3F3ADNBLIZ7UF
X-Message-ID-Hash: ORHYOUU2J3KGA6JQ4GP3F3ADNBLIZ7UF
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ORHYOUU2J3KGA6JQ4GP3F3ADNBLIZ7UF/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-16-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

`feature(extract_if)` [1] was stabilized in Rust 1.87.0 [2], and the last
significant change happened in Rust 1.85.0 [3] when the range parameter
was added.

That is, with our new minimum version, we can start using the feature.

Thus simplify the code using the feature and remove the TODO comment.

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net/
Link: https://github.com/rust-lang/rust/issues/43244 [1]
Link: https://github.com/rust-lang/rust/pull/137109 [2]
Link: https://github.com/rust-lang/rust/pull/133265 [3]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/macros/kunit.rs | 9 +++++----
 rust/macros/lib.rs   | 3 +++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/rust/macros/kunit.rs b/rust/macros/kunit.rs
index 6be880d634e2..ae20ed6768f1 100644
--- a/rust/macros/kunit.rs
+++ b/rust/macros/kunit.rs
@@ -87,10 +87,11 @@ pub(crate) fn kunit_tests(test_suite: Ident, mut module: ItemMod) -> Result<Toke
             continue;
         };
 
-        // TODO: Replace below with `extract_if` when MSRV is bumped above 1.85.
-        let before_len = f.attrs.len();
-        f.attrs.retain(|attr| !attr.path().is_ident("test"));
-        if f.attrs.len() == before_len {
+        if f.attrs
+            .extract_if(.., |attr| attr.path().is_ident("test"))
+            .count()
+            == 0
+        {
             processed_items.push(Item::Fn(f));
             continue;
         }
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 0c36194d9971..2cfd59e0f9e7 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -6,6 +6,9 @@
 // and thus add a dependency on `include/config/RUSTC_VERSION_TEXT`, which is
 // touched by Kconfig when the version string from the compiler changes.
 
+// Stable since Rust 1.87.0.
+#![feature(extract_if)]
+//
 // Stable since Rust 1.88.0 under a different name, `proc_macro_span_file`,
 // which was added in Rust 1.88.0. This is why `cfg_attr` is used here, i.e.
 // to avoid depending on the full `proc_macro_span` on Rust >= 1.88.0.
-- 
2.53.0

