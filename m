Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ED1D35162
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:49:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 42DB910EA9A;
	Wed,  1 Apr 2026 11:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V+OxZYCF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 20E7045388;
	Wed,  1 Apr 2026 11:38:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043485;
 b=MEd/UEUVmh68/WBDdaWjqJTuzA7wkaz0SX/Wghn1TO+ROQTu/VwMOP+pdhguY4DvxZCoI
 rnkHDM71IPpMpIIUq4cxWmx00+i7M3eirKEzaOqXrhGZ6yqxPLHJaiV0//hdUExLhYUVcfK
 evUL1AdwZrb2hgc26noTU5Txx+bTL3rh7RMv5qB5y6X6OW7JqqdIcdIu3ljOOLAQViIvqSG
 im8jfApKqU2X/TfCHMLnO5MsQGqzhLI3pRLfPmB9/WB5rDzz93hTxprSswc6UnZEPo5m7l0
 AmQlrJ8LWsrPYKLTxLfm8HG1vmMROQ2mb8nxmLKTgq+cUQ7e/mFyXNYGfeZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043485; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GVUhObsMIuARmw6rit5F0KuwYbrwJWJRugI2kGdJxPw=;
 b=fCB28eFjME7tKgJT2YIWg8koQCspdOpr+sSkwV0Gm8Z1hs5E14C+tTgibcODm36UMF8j9
 zBcVp1YT5LEOGkom6yFHVnoW5qtRwJxzpUVG74oiIlab+AIdjtnwSW4zqyuiEvnT4lM9Afl
 5J4qmai+OjfsYiQ+nWcJ32gDmaDYoC+d1uzuaqZUYFNu6INGGhjBHZnPWd9CROEJeVUijSH
 DV/jpR3SsJ9lFO9sNdbvRF4+qQRRNPCSfloDZYOwhtRaz57FuIgXZO/ANMxUT9k8sbWkrx/
 aa5di7KrNpqliF4I7qsTsWqPJzY/hQjddYjuDgtaZRPWykf6yabLfvScw1AA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5C95240545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:38:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4310F10E972;
	Wed,  1 Apr 2026 11:49:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6734E60142;
	Wed,  1 Apr 2026 11:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC956C4CEF7;
	Wed,  1 Apr 2026 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044164;
	bh=6xM/90y2+9K2QK1MXod17VOVsEz3ItyuSJ/mYMv3Drg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V+OxZYCFK/c+WvN/8/uOPoU8cAIkSEfrgXW012jcw/dHW9HOkQ6wsGFDWswV5/fG3
	 B0v0LpVBICRBJRwhLcK22UNCpDeTVTz+otKNFY+bq42zA8C8SUT8eSa1TFfGqDTxZB
	 nTODkVCQiBhlpeCieK0XT3k7C5zp8u0nP4rLD82LlBz9Y/xfcAU7TJG690uB/2PHds
	 RK8eWxpPbkIam179mN9OeSs4s+oG15cb5Q0wUo46IzCRVHLWdbbP/e1PSThZYL6/sj
	 B+l7o2/JFT40jMHsCpebNWLL1wHDkZfzANZ7s+SGh48/K8TUDw4qSBv5D/fytpVz03
	 jqBcyNZwn2UQA==
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
Subject: [PATCH 17/33] rust: kbuild: update `bindgen --rust-target` version
 and replace comment
Date: Wed,  1 Apr 2026 13:45:24 +0200
Message-ID: <20260401114540.30108-18-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SZVDQVPDXUKL2PELPVPNWU6KIWJBDIOU
X-Message-ID-Hash: SZVDQVPDXUKL2PELPVPNWU6KIWJBDIOU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SZVDQVPDXUKL2PELPVPNWU6KIWJBDIOU/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-18-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

As the comment in the `Makefile` explains, previously, we needed to
limit ourselves to the list of Rust versions known by `bindgen` for its
`--rust-target` option.

In other words, we needed to consult the versions known by the minimum
version of `bindgen` that we supported.

Now that we bumped the minimum version of `bindgen`, that limitation
does not apply anymore.

Thus replace the comment and simply write our minimum supported Rust
version there, which is much simpler.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 163d2258e93f..34f21b735993 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -446,22 +446,10 @@ endif
 # architecture instead of generating `usize`.
 bindgen_c_flags_final = $(bindgen_c_flags_lto) -fno-builtin -D__BINDGEN__
 
-# Each `bindgen` release may upgrade the list of Rust target versions. By
-# default, the highest stable release in their list is used. Thus we need to set
-# a `--rust-target` to avoid future `bindgen` releases emitting code that
-# `rustc` may not understand. On top of that, `bindgen` does not support passing
-# an unknown Rust target version.
-#
-# Therefore, the Rust target for `bindgen` can be only as high as the minimum
-# Rust version the kernel supports and only as high as the greatest stable Rust
-# target supported by the minimum `bindgen` version the kernel supports (that
-# is, if we do not test the actual `rustc`/`bindgen` versions running).
-#
-# Starting with `bindgen` 0.71.0, we will be able to set any future Rust version
-# instead, i.e. we will be able to set here our minimum supported Rust version.
+# `--rust-target` points to our minimum supported Rust version.
 quiet_cmd_bindgen = BINDGEN $@
       cmd_bindgen = \
-	$(BINDGEN) $< $(bindgen_target_flags) --rust-target 1.68 \
+	$(BINDGEN) $< $(bindgen_target_flags) --rust-target 1.85 \
 		--use-core --with-derive-default --ctypes-prefix ffi --no-layout-tests \
 		--no-debug '.*' --enable-function-attribute-detection \
 		-o $@ -- $(bindgen_c_flags_final) -DMODULE \
-- 
2.53.0

