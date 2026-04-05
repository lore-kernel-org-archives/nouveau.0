Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B753E9D82C
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:55:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6696210E1A1;
	Sun,  5 Apr 2026 23:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k9uNPKIn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 35315455DC;
	Sun,  5 Apr 2026 23:44:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432653;
 b=MDZKv1TCWLQp9BL/OQ64r2zI97on9CuPfpTHkwwMoJCXb1pLcPooCZQF9pE3o1R3oZ46x
 sXOrNIZRF2nJRiUDSOtJXiLkBRkZtuaX7CPtf2lgcW0pYku/ZfDfWv1UjPK7Q+77GtlTlVe
 Ggrw0syVo7j4n1KC7hqc5GLLu2ku4zT6TZ58h+tM5lD6RtXx1XTfN0sy/J/xus1KHdVVBeK
 H8dCPQXUxIUs8yd/3AQiHoBI116fT9FWQL2CkBvj1iJybeQTzXufciKEfD2xEkpCCapMmGS
 FeMYtYaS5prPkzuw3XA1YK9bfaK4nL9kLWlhjtuuDm96l4l7EV9d626P3WPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432653; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GkhfMHL08KqZmqGqWLLFbbwwtTLsd5YDkNmaV9XwEPQ=;
 b=kjfoG+Ic9CzzqWhGrtjhqjWDi3LItOOJZ8eATUba+0Cnc2iWEszwJrjhiea3fyQdSxJ5T
 DkiOncTeHhuWecDv/c3TId0q76s+nco/ERT83S666yaWaGs4x8TOqE2oQc6V0XC3RfmIPxi
 NalDurB2+l+e/nwWBrB6tP8Jd2hF/b3A/P76fwxUxUd0NFIXPIE8DFFEhnDrFOI4QW5OvHC
 H747et9KepmaCTkCFKLOsu9pxBXqaFT91qO+gRg1JrM3wjOYFpe4B+K6o2/nKi3JthZtLHq
 pvmYb9scqbMrzTL+p1q1qdTLSd2jwn2GGyfERD41pQnJYqfwtjDdNH6pezuw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 73511448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:44:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 59F0B10E167;
	Sun,  5 Apr 2026 23:55:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4F4D60103;
	Sun,  5 Apr 2026 23:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C13C19425;
	Sun,  5 Apr 2026 23:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433342;
	bh=rhX3GqYQx8Jl+4tNpW2dKwQfeZlDw97dCDSWyN1kX4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k9uNPKIn7BIlbZBmyZCrn8YA4s8vt211ZS4DryUsRUPtxc5Ce8n1gRoz4IJwAZAOM
	 Dqp6WAkHoyNQ5zLX/rFldY3wmp5C0ZX9hMiMmyPCl23fRGYclj6I0liqouATnE4LD5
	 pcFG9FLiF8HJvJFDEPMbFqVuOs1Sev37pt+zIjJGlujkwagUUjAkqve/cRsglEd1ZT
	 YiS3IliuGDO6QuzIfUhTNpdbpp9ewjzWfepATKG30fXTF2uazRnxese4dQeQwSvagT
	 fgaN2tp5c1O58eBWINvTswa4V0NA7jTUtPANRuwj1H8I0rNnXGdb+lFXnGYIzYtfvK
	 caK/MHh2zv9WQ==
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
Subject: [PATCH v2 12/33] rust: kbuild: remove `feature(...)`s that are now
 stable
Date: Mon,  6 Apr 2026 01:52:48 +0200
Message-ID: <20260405235309.418950-13-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XBGENDKTKQUFZK3BYK35PJ3PCYEYOOR5
X-Message-ID-Hash: XBGENDKTKQUFZK3BYK35PJ3PCYEYOOR5
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
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Tamir Duberstein <tamird@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XBGENDKTKQUFZK3BYK35PJ3PCYEYOOR5/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-13-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Now that the Rust minimum version is 1.85.0, there is no need to enable
certain features that are stable.

Thus clean them up.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile          |  2 --
 rust/kernel/lib.rs     | 21 ---------------------
 scripts/Makefile.build |  6 +-----
 3 files changed, 1 insertion(+), 28 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5dc8b4cc89d1..54498cb5b851 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -86,10 +86,8 @@ proc_macro2-cfgs := \
     wrap_proc_macro \
     $(if $(call rustc-min-version,108800),proc_macro_span_file proc_macro_span_location)
 
-# Stable since Rust 1.79.0: `feature(proc_macro_byte_character,proc_macro_c_str_literals)`.
 proc_macro2-flags := \
     --cap-lints=allow \
-    -Zcrate-attr='feature(proc_macro_byte_character,proc_macro_c_str_literals)' \
     $(call cfgs-to-flags,$(proc_macro2-cfgs))
 
 quote-cfgs := \
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 66a09d77a2c4..b48221a5b4ec 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -16,27 +16,6 @@
 // Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 // the unstable features in use.
 //
-// Stable since Rust 1.79.0.
-#![feature(generic_nonzero)]
-#![feature(inline_const)]
-#![feature(pointer_is_aligned)]
-//
-// Stable since Rust 1.80.0.
-#![feature(slice_flatten)]
-//
-// Stable since Rust 1.81.0.
-#![feature(lint_reasons)]
-//
-// Stable since Rust 1.82.0.
-#![feature(raw_ref_op)]
-//
-// Stable since Rust 1.83.0.
-#![feature(const_maybe_uninit_as_mut_ptr)]
-#![feature(const_mut_refs)]
-#![feature(const_option)]
-#![feature(const_ptr_write)]
-#![feature(const_refs_to_cell)]
-//
 // Expected to become stable.
 #![feature(arbitrary_self_types)]
 #![feature(derive_coerce_pointee)]
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0b0245106d01..57cff77c2897 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -310,17 +310,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 
 # The features in this list are the ones allowed for non-`rust/` code.
 #
-#   - Stable since Rust 1.79.0: `feature(inline_const)`.
-#   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
-#   - Stable since Rust 1.82.0: `feature(asm_const)`,
-#     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
 #   - Expected to become stable: `feature(arbitrary_self_types)`.
 #   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,inline_const,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := arbitrary_self_types,asm_goto,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
-- 
2.53.0

