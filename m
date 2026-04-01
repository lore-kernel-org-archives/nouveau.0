Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0665D35162
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:47:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D062110F055;
	Wed,  1 Apr 2026 11:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bw0XQFM9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AC33545357;
	Wed,  1 Apr 2026 11:36:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043391;
 b=lLK0vP68ffN3qBvtqhkrMGcgDL93SvUi5wHAluOmFgssRpmJGuhkYwW4x2nQITeN/jlC+
 ildtGikqxNoGbz9L1vYx+4ZX5GtV5UrJH2WqC8QguarCdREGiVkED2tyje+yU/kV2aekxJn
 cMrdDDZ3BjxeK/hruqnqYuiPT+8Fvr8byyEsjOM47cIxx6/4Bd+ljqgXMajJ7NJIZJtMcLE
 0Dgg1X+lm6TR9BEDVfB2jVoVBOSmrv3sgIHnrQTCD4kEJQtKtweEomiMotmuHpJuK88P51q
 lw0c11DlM+f0SlB0hQ3VJlksZxcLWbznaw78i/FMa/VIAwTPH+APBl00O3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043391; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=slHoneWmzovcsbVXKddjqYahErRjB0L+YAy9hgQnM2o=;
 b=R95SXexQMgyiTZ10xXMR6H3FqBn6ItH0v+Db9DWnPA1O/b8/FLrFcSutM8UaClYoJ1A4T
 a90pAq3z6Mws0yARsO/6WLMZIuTJdzOnYk6UqFE3azeK/EZB1+0qnpgHALpSQlL6U9fy+kj
 n7kLKVFkx0mP5/pyADwbu2WTQ/d9ob7zQ6AeQhxOmh4kQi+5G9dfbHZZK5H2QQNHDQSm9rq
 Py6z7IA7ikB8tuG5cFhMPH3HEVICzgJ0bMsPoIDR5Nu2hWKsJ9SkNbw4VGypyPCqc/LykwG
 xkg/hrFed1GQQaBkrkU2tfqcv7uTXUGDgWkrWFQIK5yJNmrwwry5qgXYzZHg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 164A540545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:36:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 172F710F031;
	Wed,  1 Apr 2026 11:47:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1C8B40912;
	Wed,  1 Apr 2026 11:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98766C116C6;
	Wed,  1 Apr 2026 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044069;
	bh=xsU9IffmhOUWeURxd1cBn+xx+oWcdYdxyuUvVgPmku0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bw0XQFM9BtXzltVVfX1cRyS5Ny7916Ny6Nrc3TLq9KJZYh0JtBh+ukTFEyx8Z85t8
	 /vt7Jbc/zq1y9bQ1shJhG3VR8TxOtBZF4NjJHMa7mU/xZAlefh37LD+NPTu+Ydfi49
	 JZ53a+OUpRjXBEozckaDoUhJgDDxIg+j6uv+ZggEvUq3It6rUqjdZ6bh+lQmBq+fnd
	 qgyPYo7kcXdNsMmw1yjq21a8J89cwAmGQvzQVu5nFumVK/lfkLoYnqg7V/B3EDnv2S
	 Uy6UH8O6mHui9UIcrilZWtiKbbK/WhNF71Bx912WmOVg7CuvV4vNq3M2vlDeu6Xlr9
	 RAOV3bDFHx0ZA==
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
Subject: [PATCH 09/33] rust: kbuild: make `--remap-path-prefix` workaround
 conditional
Date: Wed,  1 Apr 2026 13:45:16 +0200
Message-ID: <20260401114540.30108-10-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LGU6E5PENNCK6GJ7ZRD2DEJUI3KQHM4U
X-Message-ID-Hash: LGU6E5PENNCK6GJ7ZRD2DEJUI3KQHM4U
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LGU6E5PENNCK6GJ7ZRD2DEJUI3KQHM4U/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-10-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The Internal Compiler Error that the comment mentions [1] was fixed in
Rust 1.87.0 [2]. And, for other workarounds, we plan on limiting where
we apply them [3].

Thus limit the ICE one too.

This will help to make sure the workaround is not needed anymore on
newer versions.

Link: https://github.com/rust-lang/rust/issues/138520 [1]
Link: https://github.com/rust-lang/rust/pull/138556 [2]
Link: https://lore.kernel.org/rust-for-linux/20260205131815.2943152-2-mlksvender@gmail.com/ [3]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 708530ee3613..163d2258e93f 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -145,10 +145,12 @@ doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rust
 # `rustdoc` ICEs on out-of-tree builds in Rust < 1.87.0
 # (https://github.com/rust-lang/rust/issues/138520). Thus workaround the
 # issue skipping the flag.
+rustdoc_remap_workaround := $(if $(call rustc-min-version,108700),,--remap-path-prefix=%)
+
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=%,$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
+	$(RUSTDOC) $(filter-out $(skip_flags) $(rustdoc_remap_workaround),$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
 		$(rustc_target_flags) -L$(objtree)/$(obj) \
 		-Zunstable-options --generate-link-to-definition \
 		--output $(rustdoc_output) \
-- 
2.53.0

