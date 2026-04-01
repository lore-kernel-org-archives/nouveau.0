Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2F0D3517A
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:47:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E1C0110F02C;
	Wed,  1 Apr 2026 11:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ht/pJf8b";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BD8EF4534E;
	Wed,  1 Apr 2026 11:35:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043356;
 b=BJQ4T+3D242pKc0lQOxiei0dwDfnd17NqzivWa4q5WoeyfLlkd05ZosmRv3J9zsZIZFuH
 YbHRGrdM5lIfrLX8weaY6UeWtWDYsVn/U2c5PZwL/ssf+dEEJO4kji2PT5BrV5yVdxrqshW
 dWa5K3iKWFVPn8ViYwF9+WO7kQuzo75NP7YPz++uX+yg0nwnriujeZFWm7+eBRGVcpcL71U
 L4YSeBZc1MYOCP4QBMKWZHO8k3gamN1uzEOJvRmReOYzZwlf7eYqFQ2P4DJYBy42HD/0rhS
 ys5K8ro830zLkg+JeBiljI/lA8aV3Oiv8iLAJchljEBBzup/2yb6+DzzPEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043356; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JUc5PgEsOu2wBoY2axOQZUDM+mPR0xknbziR5iYRFDo=;
 b=HLMM3v3r5tcsbhyYV/dVhZvG5obf+hAYM1JTJ+urHHFuangFk3I2Oaoefr9luFUVA5tu4
 zbbcTPVAl2gR/sdVN0Z1FEqTisBa659lcEhoEv6yrs/Wh/mWIs9zieGSKd8zYvkdTHrOSaS
 EA2NT6OYeS+xevBZ4LkmEB6OW20mNctcfGE+hB7J5FpgGyVyNLqimmrED6bYqDOcZAYbCTp
 VHhw7PiwgivXpssh81g68Zco3q7BvKQKDD6adlyO32Cd+C4buHLmY5PYYqQsp+1ZRiT4F7D
 WJWOmKKLjRcrjou+g8yFl87eTBrmcXH/kxIehcb6EcnY3zMwSfTq5NhxVlww==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6451540545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:35:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D16D10EFF9;
	Wed,  1 Apr 2026 11:47:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4DB160142;
	Wed,  1 Apr 2026 11:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439C6C4CEF7;
	Wed,  1 Apr 2026 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044034;
	bh=4gM8Ng4dI5voGspd2MW/G8qAzYExygP7OS8buaoRZDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ht/pJf8bo8MwxgismJjbcH0DxRn7Lj//fl6ay0HnlmCjRYtIgG8EVgO1pndmfJvmX
	 knXYuXYh9VlrrWlM4STAZn3sQOBumFGD85l8NUcLqK6B4M8x67BxO2fXILzhN4B2BU
	 awW9tkXIImmGo6T6kf3CMLsydwKRFrCShSbshmJZdMTwdZlS8hx070+c6T0k/sjoJA
	 qrli+3YzdEjOuYYWmi7/eX+fS3nR0X9qLxqa7lkA0sqbxR7ZpQRP16hFBijOa7+Glw
	 UKfSOaXg7JBTS7dRCgMgcJxLilLRa8EraZkF2TMfGDuB2LngUIWnuMKHmQ5S0tMkkv
	 QSVzdTlSUbKJw==
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
Subject: [PATCH 06/33] rust: kbuild: remove skipping of
 `-Wrustdoc::unescaped_backticks`
Date: Wed,  1 Apr 2026 13:45:13 +0200
Message-ID: <20260401114540.30108-7-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XW3OCXIWNRNXEF27H4YOXJAEHZQGYPD3
X-Message-ID-Hash: XW3OCXIWNRNXEF27H4YOXJAEHZQGYPD3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XW3OCXIWNRNXEF27H4YOXJAEHZQGYPD3/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-7-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Back in Rust 1.82.0, I cleaned the `rustdoc::unescaped_backticks` lint in
upstream Rust and added tests so that hopefully it would not regress [1].

Thus we can remove it from our side given the Rust minimum version bump.

Link: https://github.com/rust-lang/rust/pull/128307 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5eca6a817966..212759b5eb7d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -75,8 +75,7 @@ core-edition := $(if $(call rustc-min-version,108700),2024,2021)
 
 core-skip_flags := \
     --edition=2021 \
-    -Wunreachable_pub \
-    -Wrustdoc::unescaped_backticks
+    -Wunreachable_pub
 
 core-flags := \
     --edition=$(core-edition) \
@@ -213,8 +212,6 @@ rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 \
     rustdoc-quote rustdoc-syn FORCE
 	+$(call if_changed,rustdoc)
 
-# Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
-# not be needed -- see https://github.com/rust-lang/rust/pull/128307.
 rustdoc-core: private skip_flags = $(core-skip_flags)
 rustdoc-core: private rustc_target_flags = $(core-flags)
 rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs rustdoc-clean FORCE
-- 
2.53.0

