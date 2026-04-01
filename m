Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1EED35177
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:47:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBBA10F04C;
	Wed,  1 Apr 2026 11:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sflZSueu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 695C245353;
	Wed,  1 Apr 2026 11:36:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043379;
 b=eCmvb61zzkGCqFaTbvXl/Buvc3hOi/Bkkf/CdfPMa8pcuvv2S9ISvbgE/I/U1gzAlYYTV
 fX4peI/VUHbsULufup9JG8eq3yIwsHSDkSAHPOklSDkKXQAIxUR9Wf/FCgpWXq2RMj7qf2y
 VObUVQ5GJljiB6Iy4HgpyaAbAf34nUhtU9w79/0yqZPb6QXypKQIsSCNykTk4+pOQOxcAfV
 14XlDZeRQWkKrNAeVmAUWlP9AQlVIXF+yt/fvGwqjCCkOD3umbB4muDLPB89LeyhQu9z8Ho
 LJ50fBHg1X1zmgUBV9Qn551ulZlpuNtbPg/clVxQeo6lDKvcdlSlhlvlqS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043379; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yTeSXJIV15+YIzApGV5p2ZZ/rLaORlv+t31tOaQLP1Q=;
 b=oM/LX0gIS1hFDINwShgX7e23oX+u+b+42ZxlEJhJQd6etZoa4UHkA7vziANrRC95KBOQ5
 Dtw1e6XXJqPO0Gfk9/24azb5VcylL2Q8TfMeSZLgB/NwvoQa4y9i/9xEYxQvIOQPzdSJauU
 JaPLQdG/yE7eu28/DViU1hjxHKAP1Vvtw8jZ/S7Bo4FMNM4kREFvSmEQ6nwu9FyHlWgc2p7
 BFF0xpyRXpj/WSblqgE81RmZb2Kax4FpN0WcqiX+Pey80zQqTJ6km1l4Simt0lBuxATERyi
 PzNGALSTw2979Qu5N+v6oHPPsqUEzrSNneUzgGcH2XIKIWn5ewQoJbgrkBkQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F13FE40545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:36:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D6D9A10F00A;
	Wed,  1 Apr 2026 11:47:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BB2860154;
	Wed,  1 Apr 2026 11:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0309C4CEF7;
	Wed,  1 Apr 2026 11:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044058;
	bh=ry8aHALQKoUAVgl8vkVGGnGKhW3biqQ3zE20M4qwJgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sflZSueuLuu1bWL2KEvq3OCBI7g2AOgQPjJLOPksg31c1MoUcPjU3PoOhqsrY78NL
	 qLTZ5oOs5TEYly4ggal/VwhAsfF451NsyaNr6GAdAbOY/JzOwZeaDZ9elT0AfNQS7D
	 mARg0SQMYwQv2vNVOe3YsrTYDZEK2B9QqRmx5l0suW3yJQKno/WpxtQkmgksvMwzck
	 Ma796ZKDd5Ou4YuvDUAv86QHFr3dqOr1gMbbh0EOfUXAbhTkB6IantJJ9aOIrNopN8
	 GeHT6XQFerRjV/gPrSVDV7wN8GmQU1oXsIBd7ARAcLgUwzDJtoq//xQFaYbBbif1av
	 AKvnVswAymJZg==
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
Subject: [PATCH 08/33] rust: kbuild: simplify `--remap-path-prefix` workaround
Date: Wed,  1 Apr 2026 13:45:15 +0200
Message-ID: <20260401114540.30108-9-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 26UND253MRTYIBUTNC3XNNY3FNRFASBA
X-Message-ID-Hash: 26UND253MRTYIBUTNC3XNNY3FNRFASBA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/26UND253MRTYIBUTNC3XNNY3FNRFASBA/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-9-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

With the minimum version bump in place, `rustdoc` now always recognizes
the `--remap-path-prefix` flag.

In addition, the Internal Compiler Error that the comment mentions [1]
was fixed in Rust 1.87.0 [2], so we still need to skip the flag for
the normal `rustdoc` case, but not for `--test` since the ICE does not
reproduce there -- please see commit 2c8725c1dca3 ("rust: kbuild: skip
`--remap-path-prefix` for `rustdoc`").

Thus update the comment and remove the skipping of the flag for the
`--test` case.

Note that commit dda135077ecc ("rust: build: remap path to avoid
absolute path") re-landed the `--remap-path-prefix` flag (together with
`--remap-path-scope`), so we keep the workaround, i.e. an alternative
could have been to simply delete the skip entirely, but since we still
have it and it will be needed when this gets merged, let's keep it.

Link: https://github.com/rust-lang/rust/issues/138520 [1]
Link: https://github.com/rust-lang/rust/pull/138556 [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 193cf06eea64..708530ee3613 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -142,10 +142,9 @@ rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-a
 # Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
 doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
 
-# `rustc` recognizes `--remap-path-prefix` since 1.26.0, but `rustdoc` only
-# since Rust 1.81.0. Moreover, `rustdoc` ICEs on out-of-tree builds since Rust
-# 1.82.0 (https://github.com/rust-lang/rust/issues/138520). Thus workaround both
-# issues skipping the flag. The former also applies to `RUSTDOC TK`.
+# `rustdoc` ICEs on out-of-tree builds in Rust < 1.87.0
+# (https://github.com/rust-lang/rust/issues/138520). Thus workaround the
+# issue skipping the flag.
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
 	OBJTREE=$(abspath $(objtree)) \
@@ -333,7 +332,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
 	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTDOC) --test $(filter-out --remap-path-prefix=%,$(rust_flags)) \
+	$(RUSTDOC) --test $(rust_flags) \
 		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
 		--extern kernel --extern build_error --extern macros \
 		--extern bindings --extern uapi \
-- 
2.53.0

